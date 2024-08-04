---
title: Accessing data
author: Ryan Vandermeulen
---

There are some terms that may be useful to be familiar with when looking for satellite data. The
processing ‘level’ of data describes how much the original data has been manipulated. These levels
generally range from L0 – L4, with L3/L4 being the most processed. Below is a breakdown of what each
processing level entails:

* Level 0: Raw digital counts. Note, you generally should not need to interact with L0 – L1b files.
* Level1a: Level 0 files with various ancillary information attached (e.g. geolocation).
* Level1b: Level1a data with instrument calibrations applied.
* Level2: Derived geophysical values (e.g. chlorophyll-a), at the native (highest) resolution of the sensor.
These files will look warped because they are from the view of a satellite looking down at a round Earth.
Since they retain the spatial resolution, these files would be used for data ‘matchups’.
* Level3: These data have been spatially and temporally aggregated and projected to a consistent,
mapped grid. Here, the shape of e.g. the East Coast will look as it looks on maps. These are the easiest to
interact with, however, the resolution is generally coarser (4 km) because it takes in data from all
satellite viewing angles. These are best for analyzing long term trends, and are available at various time
steps (1 day, 8 day average, monthly, annual, climatology).
* Level4: Model output or results from analyses of lower level data (e.g., variables derived from multiple
measurements). Primary productivity would be an example of Level 4 data product.

## Where do you find this data? 

In this online resource, we will focus on accessing PACE data via NASA earthdata search. However there are many other ways to access ocean color data.

NOAA provides a value added service known as CoastWatch that serves up
satellite data, user tools, a Graphical User Interface data viewing portal, data analyses software, in
addition to training modules, and more. You can also opt to use NOAA’s ERDDAP data server, which gives
you a simple, consistent way to download subsets of scientific datasets (Level 3 and above) in common
file formats and make graphs and maps on the spot. Here, you can specify a square set of coordinates and
derive time-series data, or make maps of data products within your browser, and export the results in a
custom format. ERDDAP is useful for integrating with programming languages for automated downloads
and more advanced analyses. The aforementioned OC-CCI dataset can also be found through NOAA’s
ERDDAP, but some missions (such as MODIS or SeaWiFS) are not included. NASA’s OBDAAC does archive
all the datasets listed in Table 1 (except Landsat 8/9 and Sentinel-2 data, which is accessible through the
USGS EarthExplorer tool), and may be accessed through a browser tool. NASA also provides a Graphical
User Interface data analysis tool called SeaDAS, which enables data processing from L0 – L4, and data
visualization/analysis. More heavy data processing can be performed and automated at the command
line using the OCSSW system. The active Earthdata forum can help you with any issues you have, from
installation to data processing. Sometimes, you may just want to browse through data products quickly,
in which case, the most user friendly mechanism is through NOAA STAR’s OCView. Scroll through daily or
averaged global files with a click of a button, and toggle a range of options (e.g. true color, ocean color,
temporally averaged files, anomalies, L2 granule locations and name, and more). NASA’s Giovanni and
Copernicus’ MyOcean viewer also offer different flavors of similar capabilities, each with strengths and
weaknesses.