function JUNO_plot_B(starttime,stoptime)

global epochB doy Bx By Bz x y z;

if nargin>1
    starttime = irf_time(starttime);
    stoptime = irf_time(stoptime);
    tint = [starttime stoptime];
else
    tint = [epochB(1) epochB(end)];
end;

%--- Calculate Babs
Babs = sqrt(Bx.^2+By.^2+Bz.^2);

%--- Plot
n = 4;
h = irf_plot(n);

hca = irf_panel('Babs');
irf_plot(hca,[epochB' Babs']);
ylabel(hca,'|B| (nT)','Interpreter','tex');
grid(hca,'off');

hca = irf_panel('Bx');
irf_plot(hca,[epochB' Bx']);
ylabel(hca,'B_x (nT)','Interpreter','tex');
grid(hca,'off');

hca = irf_panel('By');
irf_plot(hca,[epochB' By']);
ylabel(hca,'B_y (nT)','Interpreter','tex');
grid(hca,'off');

hca = irf_panel('Bz');
irf_plot(hca,[epochB' Bz']);
ylabel(hca,'B_z (nT)','Interpreter','tex');
grid(hca,'off');


% changes to all figure
irf_plot_axis_align;
irf_zoom(h,'x',tint);
irf_zoom(h,'y');
%irf_plot_axis_align(h(1:n))
%irf_zoom(h(1 : 3),'x',tint);
irf_timeaxis(h);
cur = gca;
cur.FontSize = 16;


%--- Set figure size
x0=10;
y0=50;
width=750;
height=width*0.85;
set(gcf,'position',[x0,y0,width,height]);



return;