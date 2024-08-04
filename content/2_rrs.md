---
title: Remote sensing reflectance (Rrs)
author: Ryan Vandermeulen
---

## What is it?

The remote sensing reflectance is the base unit by which most ocean color algorithms are built
on. It is a direct measure of the water-leaving reflectance, after the atmosphere and surface
reflectance effects have been removed. Each wavelength of color has its own reflectance value.

## How does it impact Aquaculture/Fisheries?

These products may be preferred for advanced users who want to customize or build their own
products for a regional/local application. This raw color information removes any the elements of
uncertainty introduced by assumptions made during “product” development. If there are subtle
features in the color reflectance spectrum that are unique to a phytoplankton species, this is
currently the only set of products that will retain this information, though it is (currently) up to
the user to determine what those features are. Some published algorithms for Harmful Algal
Blooms can be reconstructed using the reflectance channels (see section 3).

## What are the limitations/caveats?

The remote sensing reflectance is subject to uncertainties introduced in the removal of the
atmospheric signal. These products may underperform, or be expressed as negative values,
especially in areas with complex aerosol loadings (near urban areas), or in near-coastal regions.

## Does HYPERSPECTRAL directly improve/enable this product?

For context, relative to MODIS (10 color bands) or VIIRS (5 color bands), PACE offers 120 visible
color bands (+ additional UV bands) by which to develop algorithms from. PACE Science and
Applications Team members are working to improve the removal of the atmosphere, and thus
improve the reflectance product.