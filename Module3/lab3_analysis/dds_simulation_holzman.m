close all
clear all

sim_filename='sig_sim_53687.txt';
ila_filename='ila_50kHz_53687.csv';
read_and_plot_ila_data = true;

% the number of points to calculate and plot
num_points = 8192;

% set your own phase increment below, the idea here is that whatever phase
% increment you decide you need, you will simulate with it in your
% testbench, and model it here.
phase_increment = 53687;

% creating DDS with Streaming Phase increment, in Hardware Parameter mode
% (so we can specify the parameters like phase width, output width..etc.)
% you will need to change more of course
dds_inst     = dds_compiler_v6_0_bitacc('Phase_Increment',3, 'ParameterEntry',1,'Output_Width',16, 'Noise_Shaping', 2,...
   'Output_Selection', 1, 'Phase_Width', 27, 'Frequency_Resolution', 0.93132257, 'Spurious_Free_Dynamic_Range', 90,...
   'DDS_Clock_Rate', 125, 'Has_ARESETn', 1);

config  = get_configuration(dds_inst)

% creates an input vector of numpoints length, all are the fixed phase
% increment
data_in = [ones(1,num_points)*phase_increment];

% run the DDS model, which produces the outputs of the DDS
data_out = run(dds_inst,num_points,data_in);

% plot the results
dout_sin = data_out(:,1,2);
plot(dout_sin(1:num_points),'r.');

% load the file from simulation and then plot it on top
simulated_sig_gen = load(sim_filename); %creates simulated_sig_gen
simulated_sig_gen = simulated_sig_gen(1:num_points);

hold on;
plot(simulated_sig_gen,'g*');
title('DDS Comparison');
legend('sig_model','sig_sim');
% this section is relevant to Lab3B only, and won't be run until you
% change the value of "read_and_plot_ila_data" to true
% this part is just showing me parsing the CSV file which I captured
% from my ILA.  The columns in the CSV file, and where the first sample is
% will depend on how you setup your trigger of course, but this is a good
% starting point!  My format is as below...
%Sample in Buffer,Sample in Window,TRIGGER,axi_stream_data_from_dds[15:0],dds_valid,iic_sda_i,iic_sda_o,iic_sda_t,iic_scl_i,iic_scl_o,iic_scl_t
%Radix - UNSIGNED,UNSIGNED,UNSIGNED,SIGNED,HEX,HEX,HEX,HEX,HEX,HEX,HEX
% Dirk's Format
%Sample in Buffer	Sample in Window	TRIGGER	net_slot_0_axis_tdata[31:0]	net_slot_0_axis_tvalid	net_slot_0_axis_tready	net_slot_0_axis_tlast	net_slot_1_axis_tdata[15:0]	net_slot_1_axis_tvalid	net_slot_1_axis_tlast
%Radix - UNSIGNED	UNSIGNED	UNSIGNED	HEX	HEX	HEX	HEX	SIGNED	HEX	HEX
if (read_and_plot_ila_data)
   % Set up the Import Options and import the data
   opts = delimitedTextImportOptions("NumVariables", 10);
   % Specify range and delimiter
   opts.DataLines = [3, Inf];
   opts.Delimiter = ",";
   % Specify column names and types
   opts.VariableNames = ["SampleInBuffer", "SampleInWindow", "TRIGGER", "net_slot_0_axis_tdata310", "net_slot_0_axis_tvalid", "net_slot_0_axis_tready", "net_slot_0_axis_tlast", "net_slot_1_axis_tdata150", "net_slot_1_axis_tvalid", "net_slot_1_axis_tlast"];
   opts.VariableTypes = ["double", "double", "double", "categorical", "double", "double", "double", "double", "double", "double"];
   % Specify file level properties
   opts.ExtraColumnsRule = "ignore";
   opts.EmptyLineRule = "read";
   % Specify variable properties
   opts = setvaropts(opts, "net_slot_0_axis_tdata310", "EmptyFieldRule", "auto");
   % Import the data
   ila50kHz53687 = readtable("ila_50kHz_53687.csv", opts);
   % Clear temporary variables
   clear opts
   sig = ila50kHz53687;
   sample_buff = table2array(ila50kHz53687(:,1));
   sample_win  = table2array(ila50kHz53687(:,2));
   trigger = table2array(ila50kHz53687(:,3));
   recorded_sig_gen = double(table2array(ila50kHz53687(:,8)));
   plot(recorded_sig_gen(1:num_points),'-o');
   legend('modelled','simulated','recorded');
end



% now, plot the difference between the two.  We are striving for 0 here of
% course, but since I didn't simulate the same thing that I modelled, the
% result is not so good.  Note - if you want to make your model match what
% the example simulation file is, it was done with a 27 bit phase
% accumulator, in unit circle amplitude mode, and the phase increment was
% 107374, which is freq = 107374*125MHz/2^27 = pretty close to 100kHz

figure();
plot(simulated_sig_gen - dout_sin);
title('Difference between SIM data and Model Data');

figure();
plot(simulated_sig_gen - recorded_sig_gen);
title('Difference between SIM data and ILA Data');

figure();
plot(dout_sin - recorded_sig_gen);
title('Difference between Model Data and ILA Data');



% at this point, I have a signal "dout_sin" which is the output from my bit
% accurate model, and I have "simulated_sig_gen" which is the simulated
% signal that I got from my VHDL testbench, and I have "recorded_sig_gen"
% which is what I captured from the ILA.  All 3 should match perfectly!
% in this case, since I haven't constructed the bit accurate model
% properly, the recorded and the simulated match each other, but not the
% bit accurate model.




  