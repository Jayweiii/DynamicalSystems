% Parameters 
r = 0.1;  % growth rate
K = 100;  % carrying capacity

% Initial conditions and time range of integration
initial_conditions = [1, 5, 10, 25, 50, 75, 125, 150, 175];
T = 125;  % maximum time
dt = 0.1;  % time step
times = 0:dt:T;  % array of time values

% Create the figure
figure('Position', [100, 100, 800, 400]);

% Numerically solve the ODE and plot solution
for i = 1:length(initial_conditions)
    x0 = initial_conditions(i);
    [t, solution] = ode45(@(t, x) LogisticEquation(t, x, r, K), times, x0);
    plot(t, solution, 'DisplayName', ['Initial condition: ', num2str(x0)]);
    hold on;
end

title('Solution to the Logistic Equation'); 
xlabel('Time'); ylabel('Population Size');
legend; grid on; xlim([0, 120]); ylim([0, 180]);

% Save to PDF
print('logistic-equation', '-dpdf', '-bestfit');