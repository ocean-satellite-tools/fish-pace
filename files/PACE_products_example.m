%%% Well howdy there friend. 
%%% This script was made to help you do the following:
%%%
%%% 1) Ingest a PACE netcdf file
%%% 2) Map a product of choice.
%%% 3) If you're willing to suffer through some funky code,
%%%    we'll make a cool spectral plot.

%%% Make sure your "current folder" contains your L2 PACE file
%%% *L2.OC_AOP* files contain remote sensing reflectance and avw
%%% *L2.OC_IOP* files contain absorption and backscatter products
%%% *L2_OC_BGC* files contain chlorophyll and carbon products
fname1 = 'PACE_OCI.20240513T171853.L2.OC_AOP.V1_0_0.NRT.nc';

%%% I/Oooooooo :-) 
Lat = ncread(fname1,'/navigation_data/latitude');
Lon = ncread(fname1,'/navigation_data/longitude');
wavelengths = ncread(fname1,'/sensor_band_parameters/wavelength_3d');
[m,n] = size(Lat);

%%% Read in all the Remote Sensing Reflectance data as 3D array
prod1 = ncread(fname1,'/geophysical_data/Rrs');

%%% Not all products are 3D arrays, and can be read in one at a time
%%% Here we read in the Apparent Visible Wavelength product
prod2 = ncread(fname1,'/geophysical_data/avw');

%%% If you want to map a single Rrs wavelength, specify that below
%%% 315 nm - 703 nm are avaialble
Rrs_wave = 550;
[wave_match,wave_index] = min(abs(wavelengths-Rrs_wave));
wave_string = num2str(wavelengths(wave_index));
prod1_2d = squeeze(prod1(wave_index,:,:));

%%% Plotting Rrs map
figure(1)
latlim=[min(Lat,[],'all'),max(Lat,[],'all')];
lonlim=[min(Lon,[],'all'),max(Lon,[],'all')];
%%% Or...
%%% If you want to zoom into a specific area, specify the bounding box
latlim=[38.0,42.5];
lonlim=[-75.5,-69.0];
worldmap(latlim,lonlim);
colormap jet;
plot1 = pcolorm(Lat,Lon,prod1_2d);hold on;
xlabel('Longitude','fontsize',18,'fontweight','bold');
ylabel('Latitude','fontsize',18,'fontweight','bold');
%%% Set to log scale for most BGC and IOP products, but not AOPs
%set(gca,'ColorScale','log');
cbar = colorbar;
clim([0 0.005]);
ylabel(cbar,['Rrs ' wave_string ' (sr^{-1})'],'fontsize',16,'fontweight','bold');
hold off


%%% Plotting AVW map
figure(2)
latlim=[min(Lat,[],'all'),max(Lat,[],'all')];
lonlim=[min(Lon,[],'all'),max(Lon,[],'all')];
%%% Or... 
%%% If you want to zoom into a specific area, specify the bounding box
latlim=[38.0,42.5];
lonlim=[-75.5,-69.0];
worldmap(latlim,lonlim);
colormap jet;
plot2 = pcolorm(Lat,Lon,prod2);hold on;
xlabel('Longitude','fontsize',18,'fontweight','bold');
ylabel('Latitude','fontsize',18,'fontweight','bold');
%%% Set to log scale for most BGC and IOP products, but not AOPs
%set(gca,'ColorScale','log');
cbar = colorbar;
clim([445 585]);
ylabel(cbar,'Apparent Visible Wavelength (nm)','fontsize',16,'fontweight','bold');
hold off

%%% Lastly, let's take a random sampling of 1,000 spectra, and average
%%% them as a function of AVW values. This creates an example of what 
%%% spectra look like corresponding to the AVW colormap in Fig 2.

%%% First, we manually define the visible range of wavelenghts.
%%% You can change the min/max if you want to see more wavelengths.
%%% Note: AVW doesn't use the UV/NIR in the calculation. Only 400 - 700 nm.
min_wave = 400;
max_wave = 700;
[min_match,min_index] = min(abs(wavelengths-min_wave));
[max_match,max_index] = min(abs(wavelengths-max_wave));

%%% Let's jsut pull out the wavelengths of interest.
wave_vis = wavelengths(min_index:max_index);
Rrs_vis = prod1(min_index:max_index,:,:);

%%% Setting up for a severely inefficient loop because that's how I roll.
spectra_arr = zeros(141,length(wave_vis));
flag = zeros(m,n);

%%% This is super convuluted, but we're goign to flag all spectra within a
%%% narrow AVW range (1 nm), average 1,000 randomly sampled spectra meeting
%%% that criteria, and then step through the other AVW values incrementally.
%%% It's ugly. I know its ugly. This is not my proudest coding moment but I
%%% really don't have the bandwidth to clean this up right now. 
 for i = 445:1:585
    j = i+0.9999;
    istr = num2str(i);
    flag = prod2>i & prod2<j;
    [row,col] = find(flag>0);
%%% This truncates the dataset a bit if one of the conditions 
%%% has a lot of data, it saves time, but can be removed
%%% to be more inclusive. But it takes forever sometimes...
    if length(row)>1000;
        nelements = numel(row);
        SampleSize = 1000;
        randices = randperm(nelements, SampleSize);
        row = row(randices);
        col = col(randices);
    else
        x = 0;
    end
    if length(row)>1
    tempa = zeros(length(row),length(wave_vis));
    for k = 1:length(row)
    tempb = Rrs_vis(:,row(k),col(k));
    tempa(k,:)=tempb(:);
    tempc = mean(tempa,'omitnan');
    end
    else
    tempc = NaN;    
    end 
nancheck = isnan(tempc);
if sum(nancheck)==1, tempc = zeros(1,length(wave_vis));end
spectra_arr(i-444,:) = tempc;
 end

%%% Oof, alright, we're through that. Let's make a pretty plot.
figure(3)
for i=445:1:585
    newDefaultColors = jet(141);
    set(gca, 'ColorOrder',newDefaultColors);
    newColorOrder=get(gca,'ColorOrder');
    RRS_plot2 = spectra_arr(i-444,:)./trapz(wave_vis,spectra_arr(i-444,:));
    plot2 = plot(wave_vis,RRS_plot2,'-','LineWidth',0.1);hold on;
    xlabel('Wavelength (nm)','FontSize',16);
    ylabel('Normalized R_{rs} (nm^{-1})','FontSize',16);
    xlim([400 700]);
    ylim([-0.005 0.015]); 
    yline(0,'--k','LineWidth',2);
end
    colormap jet;
    clim([445 585]);
    cbar = colorbar;
    ylabel(cbar,'Apparent Visible Wavelength (nm)','fontsize',16,'fontweight','bold');
hold off;


