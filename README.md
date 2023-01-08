# SpaceProject

Welcome to my repository for the Juno spacedata bow shock normal calculations. Thid project was done for the course EF1110 for the KTH in Stockholm.

To be able to run these functions you need to download the Matlab space data analysis package irfu-matlab from here: 
- https://github.com/irfu/irfu-matlab


For the files you also need to download some data files to read from the Juno spacecraft. For example from:
- https://pds-ppi.igpp.ucla.edu/search/view/?f=yes&id=pds://PPI/JNO-J-3-FGM-CAL-V1.0/DATA/JUPITER/SS


To read in some data you can use the following function in this repository:
```JUNO_read_b([startdate, enddate])```
The startdate and enddate need to be in formate of [Year, Month, Day, Hour, Minute, Second]

If you got the correct date loaded in you can use one of these methods: 
1. JUNO_coplanarity_theta(startdate, direction, interval)
2. JUNO_minvar_theta(startdate, direction)
3. JUNO_parabola(startdate, direction, b, YSC, ZSC)

In each of this files there is a small description on how to use these functions.

The data I used and the results of those data can be found in the excel files also in this repository.
