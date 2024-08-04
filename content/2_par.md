---
title: Spectral particle backscattering coefficients (bbp)
author: Ryan Vandermeulen
---

## What is it?

PAR is defined as the quantum energy flux from the Sun in the 400 - 700 nm range. There are
several data products available in PACE data files. Scalar irradiance is derived by taking the sum
of light from all angles onto a point on the ocean - how much light is hitting the ocean. Planar
irradiance scalesthe amount of light based on the cosine of the direction it comes from, and likely
won’t be used for fisheries/aquaculture applications. There are above water products (how much
hits the surface), and below water product which take into account the index of refraction as you
cross the surface of the ocean’s water (i.e. how much of that is actually getting to the contents of
the water). In most cases, user would likely want to use the par_day_scalar_below product.

## How does it impact Aquaculture/Fisheries?

PAR directly impacts the quantum yield of photosynthesis, which is essentially a measure of how
many photons of light are absorbed v. how much of that is actually fixed into carbon, i.e.
photosynthetic efficiency. Too much PAR can cause photo-inhibition of many cultured seaweeds.
While not the most significant factor, one study showed that PAR contributed to variability in
Catch per Unit Effort more than SST and fishing hour.

## What are the limitations/caveats?

In spite of the visible artifact in the image below (be patient, PACE is still coming online), PAR is a
fairly robust product. Implementation of this algorithm is contingent on the availability of
observed top-of-atmosphere radiances in the visible spectral regime that do not saturate over
clouds, which is probably not a problem for PACE.

## Does HYPERSPECTRAL directly improve/enable this product?

The scalar/planar above/below water products are new to PACE.