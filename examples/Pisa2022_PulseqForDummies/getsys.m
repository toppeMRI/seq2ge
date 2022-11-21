sysGE = toppe.systemspecs('maxSlew', 20, 'slewUnit', 'Gauss/cm/ms', ...
    'maxGrad', 5, 'gradUnit', 'Gauss/cm', ...
    'myrfdel', 152, ...                          % psd_rf_wait (gradient/rf delay, us)
    'daqdel', 152, ...                           % psd_grd_wait (gradient/acquisition delay, us)
    'gradient', 'xrm');                          % xrm: MR750; hrmb: UHP; hrmw: Premier

% set system limits
sys = mr.opts('MaxGrad', 50, 'GradUnit', 'mT/m', ...
    'MaxSlew', 200, 'SlewUnit', 'T/m/s', ... 
    'rfRingdownTime', 20e-6, 'rfDeadTime', 100e-6, 'adcDeadTime', 10e-6);
