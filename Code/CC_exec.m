clc;
clear variables;
% close all;

global u_in;

%% Time interval details and initial conditions
t_final = 40;
t_interval = 0.05;
init_val = 0;

cnt_f = round(t_final / t_interval);
T2 = zeros(1, 1+cnt_f);
init_val_M = zeros(1, 1 + cnt_f);

%% Controls
Kp = 1800;
Ki = 80;

e_ = 0;
ref_ = 25;

%% Simulation
for i = 0:t_interval:t_final
    cnt_ = round(i / t_interval) + 1;
    v0 = init_val(1);

    e = ref_ - v0;
    e_ = e_ + e * t_interval;
    u_in = Kp * e + Ki * e_;

    [t, Y] = ode45(@CC, [i, i + t_interval], init_val);

    T2(cnt_) = i; 
    init_val = Y(end, :);
    init_val_M(cnt_) = init_val(1);

end

v_M = init_val_M;

%% Plots
lw_ = 2; ax_lw = 1.5;
fs_1 = 16; fs_3 = 18;

figure_v = figure('Position', [50, 50, 600, 450]);
plot(T2, v_M, 'k', 'LineWidth', lw_);

grid on
set(gca, 'GridLineStyle', '-')

                            hold on
                            plot([T2(1) T2(end)], [ref_ ref_], 'r--', 'LineWidth', 1.5);
                            hold off

ax1 = gca;
ax1.FontSize = fs_1;
ax1.XColor = 'black';
ax1.YColor = 'black';
set(ax1, 'linewidth', ax_lw)

xlabel('Time (s)', 'Interpreter', 'none', 'Fontsize', fs_3)
ylabel('Velocity (m/s)', 'Interpreter', 'none', 'Fontsize', fs_3)