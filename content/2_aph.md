---
title: Spectral phytoplankton absorption coefficients (aph)
author: Ryan Vandermeulen
---

## What is it?

These absorption coefficients specifically define how light is absorbed by phytoplankton in the
water column. This product partitions and isolates the phytoplankton component from the other
absorbing materials in the water, like CDOM and other non-living components.

## How does it impact Aquaculture/Fisheries?

The absorption of light by phytoplankton can vary by a factor of 4 or more at a constant
chlorophyll-a value, so this parameter more accurately describes how much light has been utilized
by living phytoplankton cells. This has implications for how much of this light energy will eventually be turned into biomass, and it is a central component of more advanced absorption-
based primary productivity algorithms. As a standalone product, it partially helps mitigate the obscuring impact of other absorbing materials in the water, though not entirely.

## What are the limitations/caveats?

While the magnitude of absorption is dynamic, the absolute shape of spectral absorption is
currently based on a global average, and thus offer no real insights to differentiating
phytoplankton pigment absorption and should not be used for this purpose. Keep in mind that
not all absorbed light is allocated to photosynthetic processes (i.e. some absorbed energy is lost
to heat and fluorescence). The performance of this product can vary, and does not perform well
in highly-scattering, or very high CDOM water-types.

## Does HYPERSPECTRAL directly improve/enable this product?

It does, in that it offers a full suite of aph coefficients across the visible spectrum. PACE Science
and Applications Team members are working to improve this product using new approaches to
radiative transfer as well as machine learning techniques. 