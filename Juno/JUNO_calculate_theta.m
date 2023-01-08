function [theta, n] = JUNO_coplanetary_theta(starttime, direction, interval)

global Bx By Bz;
  
t = starttime(4) * 3600 + starttime(5) * 60 + starttime(6)+1;

%--- Take average over an iterval of seconds
if t-interval < 0
  t_pre = 0;
else
  t_pre = t - interval - 15;
end
if t+interval >= 24*3600
    t_next = 2*3600-1;
else    
    t_next = t + interval + 15;
end

%--- Determine upstream and downstream magnetic fields by direction
if direction==1
    b_up = [mean(Bx(t_pre:t-15)) mean(By(t_pre:t-15)) mean(Bz(t_pre:t-15))];
    b_down = [mean(Bx(t+15:t_next)) mean(By(t+15:t_next)) mean(Bz(t+15:t_next))];
elseif direction==0
    b_down = [mean(Bx(t_pre:t-15)) mean(By(t_pre:t-15)) mean(Bz(t_pre:t-15))];
    b_up = [mean(Bx(t+15:t_next)) mean(By(t+15:t_next)) mean(Bz(t+15:t_next))];
else
    disp("Direction is incorrect")
    return 
end

%--- Calculate Normal and the angle between upstream solarwind and normal
v1 = cross(b_up, b_down);
v2 = b_up - b_down;

N = cross(v1, v2);
n = N / norm(N);
theta = acosd(dot(n, b_up) / (norm(n) * norm(b_up)));

disp("Normal is: ")
disp(n)
disp("Angle between normal and solarwind is: " + theta)
return
