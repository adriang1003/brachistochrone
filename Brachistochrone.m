%{ 
File: Brachistochrone.m
Author: Adrian Garcia
Purpose: Solves the Brachistochrone problem for a vertically varying point A
and a horizontally fixed point B. NOTE: This problem was solved
analytically; thus y_A, c_1, and theta_B were hard coded.
%}
close all; clear; clc;
% Variable declaration
y_A = [0.1, 0.2, 0.3, 0.4, 1, 7, 8, 9, 10];
x_B = 1;
g = 9.8;
theta = linspace(-2*pi,0,1000);
c_1 = [0.331239, 0.357932, 0.397142, 0.449746, 1.14583, 156.661, 232.37, 329.413, 450.456];
theta_B = [-5.11977, -4.59459, -4.17628, -3.81967, -2.41201, -0.425978, -0.373258, -0.332108, -0.299105];
% Travel time
T = -sqrt(c_1/(2*g)).*theta_B;
for i = 1:length(y_A)
    fprintf('(0, %2.1f) T = %1.3f\n', y_A(i), T(i))
end
% Brachistochrone curve
x = -(c_1(5)/2)*(theta - sin(theta));
y = y_A(5) - (c_1(5)/2)*(1 - cos(theta));
% Plot 1
figure()
plot(x,y,'-g')
% Plot config 1
title('Optimal Curve', 'Fontsize', 18, 'Interpreter', 'latex')
subtitle('From $(0,1)$ to $(1,0)$', 'Fontsize', 12, 'Interpreter', 'latex')
xlabel('$x$', 'Fontsize', 18, 'Interpreter', 'latex')
ylabel('$y$', 'Fontsize', 18, 'Interpreter', 'latex')
legend('optimal curve $T = 0.583$ sec', 'Fontsize', 10, 'Interpreter', 'latex')
grid on
grid minor
xlim([0, x_B])
ylim([0, y_A(5)])
% saveas(gcf,"fig_1",'jpg')
% Plot 2
figure()
hold on
fplot(@(x) -x+1)
fplot(@(x) (x-1).^2)
plot(x,y,'-g')
fplot(@(x) -(1-(x-1).^2).^(1/2)+1)
hold off
% Plot config 2
title('Optimal Curve Comparison', 'Fontsize', 18, 'Interpreter', 'latex')
subtitle('From $(0,1)$ to $(1,0)$', 'Fontsize', 12, 'Interpreter', 'latex')
xlabel('$x$', 'Fontsize', 18, 'Interpreter', 'latex')
ylabel('$y$', 'Fontsize', 18, 'Interpreter', 'latex')
legend('straight line $T = 0.639$ sec', 'parabola $T = 0.595$ sec', 'optimal curve $T = 0.583$ sec', ...
    'circle $T = 0.592$ sec', 'Fontsize', 10, 'Interpreter', 'latex')
grid on
grid minor
xlim([0, x_B])
ylim([0, y_A(5)])
% saveas(gcf,"fig_2",'jpg')
% Plot 3_1
figure()
hold on
for i = 1:length(c_1) - 5
    x = -(c_1(i) / 2)*(theta - sin(theta));
    y = y_A(i) - (c_1(i) / 2)*(1 - cos(theta));
    if y_A(i) == 1
        plot(x, y, '-g')
    else
        plot(x, y)
    end
end
% Plot config 3
title('Optimal Curve', 'Fontsize', 18, 'Interpreter', 'latex')
subtitle('From $(0,0.1$ to $0.4)$ to $(1,0)$', 'Fontsize', 12, 'Interpreter', 'latex')
xlabel('$x$', 'Fontsize', 18, 'Interpreter', 'latex')
ylabel('$y$', 'Fontsize', 18, 'Interpreter', 'latex')
legend('optimal curve: (0, 0.1)', 'optimal curve: (0, 0.2)', 'optimal curve: (0, 0.3)', ...
    'optimal curve: (0, 0.4)', 'Fontsize', 10, 'Interpreter', 'latex')
grid on
grid minor
xlim([0, x_B])
ylim([-0.25, y_A(4)])
hold off
% saveas(gcf,"fig_3_1",'jpg')
% Plot 3_2
figure()
hold on
for i = 6:length(c_1)
    x = -(c_1(i) / 2)*(theta - sin(theta));
    y = y_A(i) - (c_1(i) / 2)*(1 - cos(theta));
    if y_A(i) == 1
        plot(x, y, '-g')
    else
        plot(x, y)
    end
end
% Plot config 3_2
title('Optimal Curve', 'Fontsize', 18, 'Interpreter', 'latex')
subtitle('From $(0,7$ to $10)$ to $(1,0)$', 'Fontsize', 12, 'Interpreter', 'latex')
xlabel('$x$', 'Fontsize', 18, 'Interpreter', 'latex')
ylabel('$y$', 'Fontsize', 18, 'Interpreter', 'latex')
legend('optimal curve: (0, 7)', 'optimal curve: (0, 8)', 'optimal curve: (0, 9)', ...
    'optimal curve: (0, 10)', 'Fontsize', 10, 'Interpreter', 'latex')
grid on
grid minor
xlim([0, x_B])
ylim([0, y_A(end)])
hold off
% saveas(gcf,"fig_3_2",'jpg')