Nx = [];
Ny = [];
angles = [];
for i = 1:length(Data)
    date = [Data(i, 1) Data(i, 2) Data(i, 3)];
    JUNO_read_B(date, date)
    starttime = [Data(i, 1) Data(i, 2) Data(i, 3) Data(i, 4) Data(i, 5) Data(i, 6)];
    direction = Data(i, 10);  
    [angle, n, b_up] = JUNO_parabola_theta(starttime, direction, 0.006, Data(i, 8), Data(i, 9));
    Nx(i) = n(1);
    Ny(i) = n(2);
    angles(i) = angle;
    disp(i)
end

X = Data(:, 7);
Y = Data(:, 8);
Z = Data(:, 9);

b = [0.006, 0.005, 0.004, 0.0035];
fact = 50;

y_p = -200:1:200;
a = mean(X + b(1)*(Y.^2+Z.^2));
x_p = a-b(1).*(y_p.^2 + mean(Z));
figure(1);
plot(x_p,y_p)
axis equal
hold on;
    
quiver(X, Y, Nx', Ny', 10, AutoScale="off")

figure(2);
edges = 0:10:90;
histogram(angles, edges)
