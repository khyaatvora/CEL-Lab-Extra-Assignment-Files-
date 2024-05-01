% Constants 
g = 9.81; % Acceleration due to gravity (m/s^2) 
% Initial conditions 
v0 = 30; % Initial velocity (m/s) 
launch_angle = deg2rad(60); % Launch angle in radians 
delta_t = 0.01; % Time step (s) 
% Initialize arrays 
t = 0:delta_t:10; % Time array 
x = zeros(size(t)); % Horizontal position 
y = zeros(size(t)); % Vertical position 
vx = zeros(size(t)); % Horizontal velocity 
vy = zeros(size(t)); % Vertical velocity 
% Initial conditions 
x(1) = 0; 
y(1) = 0; 
vx(1) = v0 * cos(launch_angle); 
vy(1) = v0 * sin(launch_angle); 
% Simulation using Finite Difference Method 
for i = 2:length(t) 
% Update velocities 
vx(i) = vx(i-1); 
vy(i) = vy(i-1) - g * delta_t; 
% Update positions 
x(i) = x(i-1) + vx(i) * delta_t; 
y(i) = max(0, y(i-1) + vy(i) * delta_t); % Ensure the ball doesn't go below 
ground level 
% If the ball hits the ground, break the loop 
if y(i) == 0 
break; 
end 
end 
% Calculate distance and velocity when the ball hits the ground 
distance_traveled = x(i); 
horizontal_velocity = vx(i); 
% Plot trajectory 
plot(x(1:i), y(1:i), 'b-', 'LineWidth', 1.5); 
hold on; 
plot(x(i), y(i), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r'); 
xlabel('Horizontal Distance (m)'); 
ylabel('Vertical Distance (m)'); 
title('Trajectory of Cricket Ball'); 
grid on; 
legend('Trajectory', 'Ball Hits Ground', 'Location', 'northwest'); 
% Display results 
fprintf('Distance Traveled: %.2f meters\n', distance_traveled); 
fprintf('Horizontal Velocity at Ground: %.2f m/s\n', horizontal_velocity);