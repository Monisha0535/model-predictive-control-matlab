%% create MPC controller object with sample time
system = ss(A_ego,-B_ego,eye(2),[0;0]);
mpc2 = mpc(system, 0.01);
%% specify prediction horizon
mpc2.PredictionHorizon = 100;
%% specify control horizon
mpc2.ControlHorizon = 30;

%% specify scale factors for inputs and outputs
mpc2.MV(1).Min=-3*(1/B_ego(2));
mpc2.MV(1).Max=3*(1/B_ego(2));
mpc2.MV(1).ScaleFactor = 2*mpc2.ManipulatedVariables(1).Max;
mpc2.OV(1).ScaleFactor = 1;
mpc2.OV(2).ScaleFactor = 1;

%% specify simulation options
options = mpcsimopt();
options.RefLookAhead = 'off';
options.MDLookAhead = 'off';
options.Constraints = 'on';
options.OpenLoop = 'off';
%% run simulation
% sim(mpc1, 1001, mpc1_RefSignal, mpc1_MDSignal, options);
