---
title: "Reservoir Computing with Active Matter"
description: "DAAD RISE research project comparing delayed-input reservoir computing with physical active-matter response."
pubDate: "2025-05-01"
tags: ["Reservoir Computing", "HOOMD", "Python"]
---

## Overview

This research was carried out at the Stuttgart Center for Simulation Science (SimTech), University of Stuttgart, through a DAAD RISE Scholarship from May to August 2025.

The work was supervised by PhD student Mario Gaimann as part of ResoBee, following his work on robustly optimal active-matter reservoir dynamics [<a href="#ref-1">1</a>] and information injection mechanisms in active matter reservoir computing [<a href="#ref-2">2</a>]. It was done with Mario Gaimann and Miriam Klopotek.

## Research Focus

The paper in progress compares reservoir computing with non-physical delayed input against a physical active-matter response. The aim is to understand how robust the simulation and readout layer are when the reservoir is grounded in physical many-body dynamics.

## Technical Work

I developed many-body simulations on a high-performance workstation using HOOMD in Python, and wrote tests with pytest to verify the simulation behaviour and readout-layer robustness.

## References

<ol>
  <li id="ref-1">
    [1] Mario U. Gaimann and Miriam Klopotek,
    "Robustly optimal dynamics for active matter reservoir computing",
    arXiv:2505.05420 [nlin.AO], 2025.
    <a href="https://doi.org/10.48550/arXiv.2505.05420">https://doi.org/10.48550/arXiv.2505.05420</a>
  </li>
  <li id="ref-2">
    [2] Mario U. Gaimann and Miriam Klopotek,
    "Optimal information injection and transfer mechanisms for active matter reservoir computing",
    arXiv:2509.01799 [nlin.AO], 2025.
    <a href="https://doi.org/10.48550/arXiv.2509.01799">https://doi.org/10.48550/arXiv.2509.01799</a>
  </li>
</ol>
