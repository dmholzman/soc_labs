%% Lab4A - Dirk Holzman
% System-on-a-Chip Design
% Due: 3/8/23
% This code makes a tone, and runs it through a filter object in the xilinx
% fir compiler bit accurate model, then plots the input and output data
% together, as well as the power spectrum.

close all;
ila_filename='filter25khz.csv';

% create an input signal that is a tone in the passband of this filter
fs = 125e6;
signal_freq = [25000]; % 2000, [2000, 30000], [2000 25000]
signal_amplitude = 2^14;
numpoints = 2621440;
n = linspace(1,numpoints,numpoints);
if length(signal_freq) == 1
   din = signal_amplitude*sin(2*pi*n*signal_freq/fs);
else
   din = signal_amplitude*sin(2*pi*n*signal_freq(1)/fs) + signal_amplitude*sin(2*pi*n*signal_freq(2)/fs);
end

% construct filter
% create filter coefficients with FDATool
h1 = filter1();
h2 = filter2();
fir1_coeff = h1.Numerator;
fir2_coeff = h2.Numerator;

% write coefficients to coe files
write2COE(fir1_coeff, 'filter1');
write2COE(fir2_coeff, 'filter2');

% setup configuration for both filters
fir1     = fir_compiler_v7_2_bitacc(); 
config_1 = get_configuration(fir1); 
config_1.filter_type       = 2; % #define XIP_FIR_DECIMATION    2
config_1.decim_rate        = 40;
config_1.coeff             = fir1_coeff;
config_1.num_coeffs        = length(fir1_coeff);
config_1.coeff_width       = 18;
config_1.coeff_fract_width = 15;
config_1.output_width      = 16;
fir1 = fir_compiler_v7_2_bitacc(config_1); 

config_2 = config_1;
config_2.coeff       = fir2_coeff;
% config_2.coeff_fract_width = 3;
config_2.num_coeffs  = length(fir2_coeff);
config_2.decim_rate  = 64;
fir2 = fir_compiler_v7_2_bitacc(config_2); 

% now, run the input data through the filter
data_int = filter(fir1, din);
data_out = filter(fir2, data_int);

% plot the two signals for a nice visual 
subplot(3,1,1);
plot(din); title('Input data');
subplot(3,1,2);
plot(int16(data_int)); title('Output data - fir1');
subplot(3,1,3);
plot(int16(data_out)); % title('Output data - fir2');
if length(signal_freq) == 1
   if signal_freq <= 18000
      title(sprintf('Response to signal in passband - Frequency (kHz): %d', signal_freq/1000));
   elseif signal_freq <= 30000
      title(sprintf('Response to signal in transition band - Frequency (kHz): %d', signal_freq/1000));
   else
      title(sprintf('Response to signal in stopband - Frequency (kHz): %d', signal_freq/1000));
   end
else
   if signal_freq(2) > 18000 && signal_freq(2) <= 30000
      title(sprintf('Transition band experiment - Freqs (kHz): %d & %d', signal_freq(1)/1000, signal_freq(2)/1000));
   else
      title(sprintf('Response to two-tone input - Freqs (kHz): %d & %d', signal_freq(1)/1000, signal_freq(2)/1000));
   end
end

% plot power spectrum
figure;
periodogram(data_out,[],'onesided',512,48.828e3);
if length(signal_freq) == 1
   title(sprintf('Power spectrum for freq (kHz): %d ', signal_freq/1000));
else
   title(sprintf('Power spectrum for freqs (kHz): %d & %d', signal_freq(1)/1e3, signal_freq(2)/1000));
end

% filter visualization
% fvtool(h1);
% fvtool(h2);
% freqz(H2,512,3.125e6)

% gain checkout
% gain = mag2db(sum(fir1_coeffs));

%% Plot ILA Data vs. Sim
% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 12);

% Specify range and delimiter
opts.DataLines = [3, Inf];
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["SampleInBuffer", "SampleInWindow", "TRIGGER", "net_slot_0_axis_tdata150", "net_slot_0_axis_tvalid", "net_slot_0_axis_tlast", "net_slot_1_axis_tdata150", "net_slot_1_axis_tvalid", "net_slot_1_axis_tready", "net_slot_1_axis_tlast", "Interface_i1s0_axis_broadcaster_0_M01_AXIS20", "T_Channel_i1s0_axis_broadcaster_0_M01_AXIS20"];
opts.VariableTypes = ["double", "double", "double", "string", "double", "double", "double", "double", "double", "double", "categorical", "categorical"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, "net_slot_0_axis_tdata150", "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["net_slot_0_axis_tdata150", "Interface_i1s0_axis_broadcaster_0_M01_AXIS20", "T_Channel_i1s0_axis_broadcaster_0_M01_AXIS20"], "EmptyFieldRule", "auto");

% Import the data
ilaFilter = readtable(ila_filename, opts);

% Clear temporary variables
clear opts

sig = ilaFilter;
sample_buff = table2array(ilaFilter(:,1));
sample_win  = table2array(ilaFilter(:,2));
trigger = table2array(ilaFilter(:,3));
recorded_sig_gen = double(table2array(ilaFilter(:,7)));

% Plot versus simulated
figure();
hold on
plot(recorded_sig_gen(1:1024));
plot(int16(data_out));
hold off
legend('actual','simulated');
title(sprintf('Simulated vs. Actual %d kHz Filtered Signal', signal_freq/1000));

%% Functions
% Function to write to coe file
function write2COE(coeffs, file)
fid = fopen([file '.coe'],'w');
fprintf(fid, 'radix=10;\ncoefdata=\n');
fprintf(fid, '%5.15f,\n', coeffs);
fclose(fid);
end