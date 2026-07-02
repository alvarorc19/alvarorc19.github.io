---
title: "Characterising the XY Model on the Lattice"
description: "Final-year capstone project on critical exponents, finite-size effects, and topological phase transitions in the XY model."
pubDate: "2026-07-01"
tags: ["Computational Physics", "C++", "Lattice Models"]
---

## Overview

This was my final-year capstone project at Trinity College Dublin, School of Mathematics, supervised by Prof. Patrick Fritzsch. The project studied the classical XY model on finite lattices, using numerical simulation to characterise its phase structure, estimate critical behaviour, and examine how finite-size effects affect measured observables.

The XY model describes 2D spins $\theta_i \in [0, 2\pi)$ on a lattice, with Hamiltonian

$$
H = -J \sum_{\langle i,j \rangle} \cos(\theta_i - \theta_j),
$$

where $J$ is the coupling and the sum runs over nearest-neighbour lattice sites. At temperature $T$, configurations are sampled with Boltzmann weight

$$
P(\{\theta_i\}) \propto e^{-H / kT}.
$$

You can see how this system behaves [further down](#simulation-viewer). You can also find links to the full report and the github repo at the [end](#links). The abstract of the thesis is presented below.

## Abstract
The XY model is the simplest example of the Berezinskii-Kosterlitz-Thouless (BKT) phase transition, a topological phase transition. The BKT transition is characterised by the appearance of topological defects, such as vortices, instead of a discontinuity in the free energy derivative. It has led to major advancements in solid state and condensed matter physics.
In this project we developed a framework to analyse this system and explore the properties of this phase transition, which takes place in the XY model for 2 dimensions.
To simulate the system we used the Markov Chain Monte Carlo Wolff cluster algorithm since it greatly reduced the critical slowing down characteristic of stochastic methods close to the critical transition. 
We were able to see this phase transition explicitly by looking at snapshots of the lattice generated over a range of temperatures. The critical temperature at which the transition takes place was studied using renormalisation group approaches. We obtained an estimate of $k_B T_{BKT} = 0.895(7)$. This result matches the estimates obtained in the literature.
We also studied the critical behaviour of the model at 3 dimensions, which exhibits a second-order phase transition. In this case we used finite-size effects to obtain estimates for the critical temperature and critical exponents using the 4$^{\textrm{th}}$ order Binder Cumulant and scaling arguments. We obtained a critical temperature of $k_B T_{c} = 2.201(5)$, which is a value consistent with the literature. The critical exponents obtained here were computed using heuristic methods and were not as exact as the critical temperature. These estimates also suffered from noise due to small lattice sizes. We obtained $\nu = 0.7601(2)$, $\gamma = 1.327(4)$ and $\beta = 0.351(5)$ using this approach and $\alpha =~ -0.010(2)$ from hyperscaling relations. This last value in particular matches the measurements done experimentally in superfluid helium.

## Simulation Viewer

Here is a simulation of the cluster algorithm working if you click `Play`. You can see all the clusters flipping for different temperatures and lattice sizes and how the correlation length changes with the temperature. Beware there are a lot of flashing colours, especially for the low temperatures. Changing between 

<div class="xy-viewer" data-temps="0.1,0.3,0.5,0.7,0.9,1.1,1.3,1.5,1.7,1.9,2.1" data-sizes="16,32,64,128" data-mode="smooth">
  <div class="xy-controls">
    <label>
      Temperature: <span data-temperature-label>0.1</span>
      <input data-temperature-slider type="range" min="0" max="10" value="0" step="1" />
    </label>
    <label>
      Lattice size: <span data-size-label>16</span>
      <input data-size-slider type="range" min="0" max="3" value="0" step="1" />
    </label>
    <div class="xy-mode" aria-label="Plot style">
      <button type="button" data-mode-option="smooth" aria-pressed="true">Colorgrid</button>
      <button type="button" data-mode-option="arrow" aria-pressed="false">Arrow</button>
    </div>
    <button type="button" data-play-toggle aria-pressed="false">Play</button>
  </div>
  <img data-simulation-image src="/xy-model-gifs/L16_T0.1_smooth.gif" alt="Smooth XY model simulation for L=16 and T=0.1" hidden />
  <canvas data-still-frame></canvas>
  <p data-simulation-path>/xy-model-gifs/L16_T0.1_smooth.gif</p>
</div>

<script>
  document.querySelectorAll(".xy-viewer").forEach((viewer) => {
    const temps = viewer.dataset.temps.split(",");
    const sizes = viewer.dataset.sizes.split(",");
    const tempSlider = viewer.querySelector("[data-temperature-slider]");
    const sizeSlider = viewer.querySelector("[data-size-slider]");
    const tempLabel = viewer.querySelector("[data-temperature-label]");
    const sizeLabel = viewer.querySelector("[data-size-label]");
    const image = viewer.querySelector("[data-simulation-image]");
    const canvas = viewer.querySelector("[data-still-frame]");
    const context = canvas.getContext("2d");
    const path = viewer.querySelector("[data-simulation-path]");
    const modeButtons = viewer.querySelectorAll("[data-mode-option]");
    const playToggle = viewer.querySelector("[data-play-toggle]");
    let isPlaying = false;

    const drawStill = () => {
      if (!image.complete || !image.naturalWidth) return;
      canvas.width = image.naturalWidth;
      canvas.height = image.naturalHeight;
      context.drawImage(image, 0, 0);
    };

    const setPlaying = (playing) => {
      isPlaying = playing;
      image.hidden = !playing;
      canvas.hidden = playing;
      playToggle.textContent = playing ? "Stop" : "Play";
      playToggle.setAttribute("aria-pressed", String(playing));

      if (playing) {
        image.src = image.dataset.src;
        return;
      }

      drawStill();
    };

    const updateImage = () => {
      const temp = temps[tempSlider.value];
      const size = sizes[sizeSlider.value];
      const mode = viewer.dataset.mode;
      const src = `/xy-model-gifs/L${size}_T${temp}_${mode}.gif`;

      tempLabel.textContent = temp;
      sizeLabel.textContent = size;
      image.dataset.src = src;
      image.src = src;
      image.alt = `${mode} XY model simulation for L=${size} and T=${temp}`;
      path.textContent = src;
      setPlaying(isPlaying);
    };

    modeButtons.forEach((button) => {
      button.addEventListener("click", () => {
        viewer.dataset.mode = button.dataset.modeOption;
        modeButtons.forEach((option) => {
          option.setAttribute("aria-pressed", String(option === button));
        });
        updateImage();
      });
    });
    image.addEventListener("load", () => {
      if (!isPlaying) drawStill();
    });
    playToggle.addEventListener("click", () => setPlaying(!isPlaying));
    tempSlider.addEventListener("input", updateImage);
    sizeSlider.addEventListener("input", updateImage);
    updateImage();
  });
</script>

<style>
  .xy-viewer {
    border: 1px solid var(--border-color);
    padding: 1rem;
    margin: 1.5rem 0;
  }

  .xy-controls {
    display: grid;
    gap: 1rem;
    margin-bottom: 1rem;
  }

  .xy-controls label {
    display: grid;
    gap: 0.25rem;
  }

  .xy-mode {
    display: flex;
    gap: 0.5rem;
  }

  .xy-mode button {
    border: 1px solid var(--border-color);
    padding: 0.35rem 0.75rem;
    background: transparent;
    color: inherit;
    cursor: pointer;
  }

  .xy-controls > button {
    width: fit-content;
    border: 1px solid var(--border-color);
    padding: 0.35rem 0.75rem;
    background: transparent;
    color: inherit;
    cursor: pointer;
  }

  .xy-mode button[aria-pressed="true"] {
    background: var(--text-color);
    color: var(--bg-color);
  }

  .xy-viewer img,
  .xy-viewer canvas {
    display: block;
    width: 100%;
    min-height: 16rem;
    object-fit: contain;
    border: 1px solid var(--border-color);
  }

  .xy-viewer [hidden] {
    display: none;
  }

  .xy-viewer p {
    margin: 0.75rem 0 0;
    font-family: monospace;
    font-size: 0.9rem;
    opacity: 0.75;
    display:none;
  }

  .project-links {
    list-style: disc;
    padding-left: 1.25rem;
  }
</style>

## Technical Work

The project involved implementing lattice update routines, extracting observables, comparing behaviour across system sizes, and analysing simulation output for signatures of critical behaviour. The main numerical challenge was separating physical scaling behaviour from finite-size artefacts, especially close to the transition region where correlation lengths become large.

## Links

<ul class="project-links">
  <li>Full report: <a href="/capstone_report.pdf">Project PDF</a></li>
  <li>Source code: <a href="https://github.com/alvarorc19/capstone-code">GitHub repo</a></li>
</ul>
