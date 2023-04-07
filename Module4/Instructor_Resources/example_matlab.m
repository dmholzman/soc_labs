% example code to help with lab4a.  This code makes a tone, and runs it
% through a filter object in the xilinx fir compiler bit accurate model,
% then plots the input and output data together

% create an input signal that is a tone in the passband of this filter
fs = 125e6;
signal_freq = 2000;
signal_amplitude = 8000;
numpoints= 2000000;
n = linspace(1,numpoints,numpoints);
din = signal_amplitude*sin(2*pi*n*signal_freq/fs);

% construct your filter here, this example creates the default filter and
% changes one parameter so you can see one of the ways that this can be
% done.  consult ...bitacc_cmodel.h for help with some of the settings

fir_1    = fir_compiler_v7_2_bitacc(); 
config_1 = get_configuration(fir_1); 
config_1.filter_type = 2; % #define XIP_FIR_DECIMATION    2
config_1.decim_rate=16;
fir_1 = fir_compiler_v7_2_bitacc(config_1); 

% now, run the input data through the filter
data_out = filter(fir_1,din);

% plot the two signals for a nice visual 
subplot(2,1,1);
plot(din); title('input data');
subplot(2,1,2);
plot(data_out); title('output data');
