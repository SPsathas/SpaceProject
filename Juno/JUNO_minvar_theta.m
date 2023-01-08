function [theta, n] = JUNO_minvar_theta(starttime, direction)

% To use this function, first the correct data has to be read in using
% JUNO_read_b() using the correct date
% The starttime is the time of the bow shock crossing in format
% [Year Month Day Hour Minute Second]
% The direction is binary so 1 is crossing from outside to inside the
% bowshock and 0 is the other way around

global Bx By Bz;

t = starttime(4) * 3600 + starttime(5) * 60 + starttime(6)+1;
inp = [Bx(t-60:t+60); By(t-60:t+60); Bz(t-60:t+60)];

%--- Use the minvar function to find the eigenvalue and eigenvector
%--- representing the normal
[out,l,v] = irf_minvar(inp, '<Bn>=0');

[C, I] = min(l);
n = v(I,:);
%--- Determine upstream magnetic field by direction
if direction==1
    b_up = [mean(Bx(t-45:t-15)) mean(By(t-45:t-15)) mean(Bz(t-45:t-15))];
elseif direction==0
    b_up = [mean(Bx(t+15:t+45)) mean(By(t+15:t+45)) mean(Bz(t+15:t+45))];
else
    disp("Direction is incorrect")
    return 
end

if n(1) < 0
    n = -1 * n;
end
%--- Calculate Normal and the angle between upstream solarwind and normal
theta = acosd(dot(n, b_up) / (norm(n) * norm(b_up)));
if theta > 90
    theta = 180 - theta;
end

disp("Normal is: ")
disp(n)
disp("Angle between normal and solarwind is: " + theta)
return