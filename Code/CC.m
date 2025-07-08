function vdot = CC(t, v)

global u_in;

CC_param;

vdot = -(b/m) * v + (1/m) * u_in;

end