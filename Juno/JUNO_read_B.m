function  JUNO_read_B(startdate,stopdate)

global epochBprel doyprel Bxprel Byprel Bzprel xprel yprel zprel;
global epochB doy Bx By Bz x y z;


%--- Initialize
path = 'C:\Users\steff\Documents\KTH\Project\Juno\Data\';

% Initialize data
epochB = [];
Bx = [];
By = [];
Bz = [];
x = [];
y = [];
z = [];

%--- Convert dates to datenum
startdatenum = datenum(startdate(1),startdate(2),startdate(3));
stopdatenum = datenum(stopdate(1),stopdate(2),stopdate(3));

%--- Loop over dates
for datenumber = startdatenum:stopdatenum
    % Get day of year (doy)
    doy = day(datetime(datenumber,'ConvertFrom','datenum'),'dayofyear'); 
    
    % Construct filename
    doyformat = '%03d';
    dirres = dir([path 'fgm_jno_l3_' num2str(startdate(1)) num2str(doy,doyformat) 'ss_r1s_*.sts']);
    file = [dirres.folder '\' dirres.name];
    disp(['Reading file ' file]);

    % Read data from this doy
    JUNO_read_B_prel(file);
    
    % Append data
    epochB = [epochB epochBprel'];
    Bx = [Bx Bxprel'];
    By = [By Byprel'];
    Bz = [Bz Bzprel'];
    x = [x xprel'];
    y = [y yprel'];
    z = [z zprel'];
    
end;

return;