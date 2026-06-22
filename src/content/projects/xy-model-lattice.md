---
title: "Characterising the XY Model on the Lattice"
description: "Final-year capstone project on critical exponents, finite-size effects, and topological phase transitions in the XY model."
pubDate: "2025-09-01"
tags: ["Computational Physics", "C++", "Lattice Models"]
---

## Overview

This was my final-year capstone project at Trinity College Dublin, School of Mathematics, supervised by Prof. Patrick Fritzsch. The project studied the classical XY model on finite lattices, using numerical simulation to characterise its phase structure, estimate critical behaviour, and examine how finite-size effects affect measured observables.

The XY model describes planar spins $\theta_i \in [0, 2\pi)$ on a lattice, with Hamiltonian

$$
H = -J \sum_{\langle i,j \rangle} \cos(\theta_i - \theta_j),
$$

where $J$ is the coupling and the sum runs over nearest-neighbour lattice sites. At temperature $T$, configurations are sampled with Boltzmann weight

$$
P(\{\theta_i\}) \propto e^{-H / T}.
$$

## Research Focus

I implemented lattice simulations in C++ for 2D and 3D systems, measuring observables across temperatures and lattice sizes. The work focused on extracting critical exponents, identifying finite-size trends, and analysing the phase transition through quantities such as the magnetisation

$$
M = \frac{1}{N}\left|\sum_i e^{i\theta_i}\right|,
$$

the susceptibility

$$
\chi = \frac{N}{T}\left(\langle M^2\rangle - \langle M\rangle^2\right),
$$

and finite-size scaling near the critical temperature,

$$
M(L, T_c) \sim L^{-\beta / \nu}.
$$

<!-- ## Simulation Viewer -->
<!---->
<!-- Use the controls below to browse simulation GIFs by lattice size and temperature. Add files to `public/xy-model-gifs/` using names such as `L16_T0.5.gif`, `L32_T1.0.gif`, or `L64_T1.5.gif`. -->
<!---->
<!-- <div class="xy-viewer" data-temps="0.5,0.7,0.9,1.1,1.3,1.5,1.7,1.9,2.1" data-sizes="16,32,64,128"> -->
<!--   <div class="xy-controls"> -->
<!--     <label> -->
<!--       Temperature: <span data-temperature-label>0.5</span> -->
<!--       <input data-temperature-slider type="range" min="0" max="8" value="0" step="1" /> -->
<!--     </label> -->
<!--     <label> -->
<!--       Lattice size: <span data-size-label>16</span> -->
<!--       <input data-size-slider type="range" min="0" max="3" value="0" step="1" /> -->
<!--     </label> -->
<!--   </div> -->
<!--   <img data-simulation-image src="/xy-model-gifs/L16_T0.5.gif" alt="XY model simulation for L=16 and T=0.5" /> -->
<!--   <p data-simulation-path>/xy-model-gifs/L16_T0.5.gif</p> -->
<!-- </div> -->
<!---->
<!-- <script> -->
<!--   document.querySelectorAll(".xy-viewer").forEach((viewer) => { -->
<!--     const temps = viewer.dataset.temps.split(","); -->
<!--     const sizes = viewer.dataset.sizes.split(","); -->
<!--     const tempSlider = viewer.querySelector("[data-temperature-slider]"); -->
<!--     const sizeSlider = viewer.querySelector("[data-size-slider]"); -->
<!--     const tempLabel = viewer.querySelector("[data-temperature-label]"); -->
<!--     const sizeLabel = viewer.querySelector("[data-size-label]"); -->
<!--     const image = viewer.querySelector("[data-simulation-image]"); -->
<!--     const path = viewer.querySelector("[data-simulation-path]"); -->
<!---->
<!--     const updateImage = () => { -->
<!--       const temp = temps[tempSlider.value]; -->
<!--       const size = sizes[sizeSlider.value]; -->
<!--       const src = `/xy-model-gifs/L${size}_T${temp}.gif`; -->
<!---->
<!--       tempLabel.textContent = temp; -->
<!--       sizeLabel.textContent = size; -->
<!--       image.src = src; -->
<!--       image.alt = `XY model simulation for L=${size} and T=${temp}`; -->
<!--       path.textContent = src; -->
<!--     }; -->
<!---->
<!--     tempSlider.addEventListener("input", updateImage); -->
<!--     sizeSlider.addEventListener("input", updateImage); -->
<!--     updateImage(); -->
<!--   }); -->
<!-- </script> -->
<!---->
<!-- <style> -->
<!--   .xy-viewer { -->
<!--     border: 1px solid var(--border-color); -->
<!--     padding: 1rem; -->
<!--     margin: 1.5rem 0; -->
<!--   } -->
<!---->
<!--   .xy-controls { -->
<!--     display: grid; -->
<!--     gap: 1rem; -->
<!--     margin-bottom: 1rem; -->
<!--   } -->
<!---->
<!--   .xy-controls label { -->
<!--     display: grid; -->
<!--     gap: 0.25rem; -->
<!--   } -->
<!---->
<!--   .xy-viewer img { -->
<!--     display: block; -->
<!--     width: 100%; -->
<!--     min-height: 16rem; -->
<!--     object-fit: contain; -->
<!--     border: 1px solid var(--border-color); -->
<!--   } -->
<!---->
<!--   .xy-viewer p { -->
<!--     margin: 0.75rem 0 0; -->
<!--     font-family: monospace; -->
<!--     font-size: 0.9rem; -->
<!--     opacity: 0.75; -->
<!--   } -->
<!-- </style> -->

## Technical Work

The project involved implementing lattice update routines, extracting observables, comparing behaviour across system sizes, and analysing simulation output for signatures of critical behaviour. The main numerical challenge was separating physical scaling behaviour from finite-size artefacts, especially close to the transition region where correlation lengths become large.

## Links

- [Project PDF](/capstone_report.pdf)
- [github repo](https://github.com/alvarorc19/capstone-code)
