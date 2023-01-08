function JUNO_plot_orbit(starttime,stoptime)

global epochB doy Bx By Bz x y z;

%--- Plot subinterval?
if nargin>1
    starttime = irf_time(starttime);
    stoptime = irf_time(stoptime);
    tint = [starttime stoptime];
else
    tint = [epochB(1) epochB(end)];
end;

%--- Calculate rho
RJ = 69911;
rho = sqrt(y.^2+z.^2);

subplot(2,2,1);
plot(x/RJ,y/RJ,'k');
axis equal;
xlabel('X (R_J)');
ylabel('Y (R_J)');

subplot(2,2,2);
plot(x/RJ,z/RJ,'k');
axis equal;
xlabel('X (R_J)');
ylabel('Z (R_J)');

subplot(2,2,3);
plot(y/RJ,z/RJ,'k');
axis equal;
xlabel('Y (R_J)');
ylabel('Z (R_J)');

subplot(2,2,4);
plot(x/RJ,rho/RJ,'k');
axis equal;
xlabel('X (R_J)');
ylabel('rho (R_J)');

return;