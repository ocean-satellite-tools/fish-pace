---
title: Which satellite(s) do I want to use?
author: Ryan Vandermeulen
---

The ocean is a relatively dark target as viewed from space, making up only 4-10% of the light signal seen
from a satellite’s perspective above the atmospheric layers. As such, ocean color satellite sensors need to
be very sensitive in order to collect a usable signal, but not so sensitive that the radiance (light) signal
saturates the optics. There are various trade-offs to consider when designing a satellite, and these impact
the potential usability of data products. Different satellite missions may exhibit variations in the spatial
resolution (size of the ‘pixel’), temporal resolution (how often a satellite passes the same area), and
spectral resolution (how many discrete colors are sampled), making some satellites better suited for
certain applications over others. A satellite with relatively high spatial resolution (e.g. Landsat - 30 meter
pixels) would be useful to resolve very near-shore, estuarine, and freshwater environments, but as these
satellites have to zoom in closer, it takes longer periods of time to revisit the same location (up to 16
days), so the applications may be best suited for e.g. habitat characterization. A satellite with a larger
spatial footprint (e.g. MODIS, PACE - 1 km pixels) can cover the entire globe daily, and be used for more
operational purposes, but will not sufficiently resolve small-scale ocean features or many lakes.
Sometimes a pair or constellation of sensors can be combined to help increase revisit time and increase
spatial resolution (e.g. Sentinel-3A and Sentinel-3B OLCI sensors – 300 meter pixels, 2-3 day revisit time).
In the future, NOAA (GeoXO – launching 2032) and NASA (GLIMR – launching ~2028) plan to launch
geostationary satellites, which can ‘stare’ at locations longer, and revisit a location multiple times per day,
creating a sequence of images to mitigate cloud cover, as well as examine biological rates, fluxes, particle
trajectories, and more. The tradeoff with a geostationary orbit is that it can only view a particular portion
of the globe over a mission lifetime. The table below provides a quick user guide to a several relevant
ocean color platforms (past, present, and future), and their specifications. For long-term consistent time
series (1997 – present), the current recommendation is to utilize the Ocean Colour Climate Change
Initiative (OC-CCI) dataset, which merges multiple satellite data records and bias corrects sensor
differences. This dataset is updated quarterly, and does not yet provide a near real time product.