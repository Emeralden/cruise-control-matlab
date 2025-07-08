% Parameters
m = 1000;
b = 50;

%% Root Locus for Varying Ki (Kp fixed)
Kp = 1800;

% G_pseudo_Ki(s) = 1 / (s * (m*s + b + Kp))
num1 = 1;
den1 = conv([1 0], [m (b + Kp)]); % s * (m*s + b + Kp)

G_Ki = tf(num1, den1);

figure;
rlocus(G_Ki);
title('Varying Ki');
grid on;

%% Root Locus for Varying Kp (Ki fixed)
Ki = 80;

% G_pseudo_Kp(s) = s / (m*s^2 + b*s + Ki)
num2 = [1 0]; % s
den2 = [m b Ki];

G_Kp = tf(num2, den2);

figure;
rlocus(G_Kp);
title('Varying Kp');
grid on;
