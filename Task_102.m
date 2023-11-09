% Define the function you want to find the root of (e.g., x^3 - 2x^2 - 4)
f = @(x) x^3 - 2*x^2 - 4;

% Define the interval [a, b] where you expect the root to be
a = 0;
b = 3;

% Specify the desired tolerance (accuracy) for the root
tolerance = 1e-6;

% Initialize variables for storing roots and iterations
roots = [];
iterations = [];

% Start the Bisection method
while (b - a) >= tolerance
    c = (a + b) / 2;  % Calculate the midpoint
    roots = [roots; c];  % Store the root of this iteration
    iterations = [iterations; length(roots)];  % Store the iteration number
    
    if f(c) == 0
        break;  % The root is found
    elseif f(a) * f(c) < 0
        b = c;  % Update the interval [a, b]
    else
        a = c;  % Update the interval [a, b]
    end
end

% Display the final root and number of iterations
fprintf('Approximate root: %.6f\n', c);
fprintf('Number of iterations: %d\n', length(roots));

% Create a vector of x values for plotting
x = linspace(-1, 4, 100);  % Adjust the range as needed

% Evaluate the function values at the x values
y = arrayfun(f, x);

% Plot the equation and the roots
figure;
plot(x, y, 'b-', 'LineWidth', 2);
hold on;
plot(roots, zeros(size(roots)), 'ro', 'MarkerSize', 8);
title('Bisection Method for Root Finding');
xlabel('x');
ylabel('f(x)');
legend('f(x)', 'Roots');
grid on;

