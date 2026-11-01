---
layout: default
title: "Windows 11 Gaming PC Optimization Guide"
description: "Safe, practical Windows 11 gaming PC guidance for finding performance problems and verifying changes."
lang: en
translation_key: home
permalink: /
---

<section class="home-hero">
  <div class="home-hero-text">
    <p class="hero-eyebrow">Windows 11 gaming PC guide</p>
    <h1>Find the cause. Change one thing. Measure the result.</h1>
    <p class="hero-subtitle">Practical diagnostics for PC gamers: no risky tweaks, no guaranteed-FPS promises, every change verified with a repeatable test.</p>
    <div class="hero-actions">
      <a class="button button-primary" href="{{ '/docs/start-here.html' | relative_url }}">Start with your problem</a>
      <a class="button button-secondary" href="{{ '/docs/' | relative_url }}">Browse all guides</a>
    </div>
  </div>
  <ol class="home-method">
    <li><strong>Record</strong><span>Game, scene, settings, FPS, frame time, temperatures.</span></li>
    <li><strong>Change one thing</strong><span>Only a setting tied to the observed problem.</span></li>
    <li><strong>Repeat the test</strong><span>Keep the change only if the result is measurable.</span></li>
  </ol>
</section>

<h2 class="home-heading">What is your problem?</h2>

<div class="tile-grid">
  <a class="tile" href="{{ '/docs/02-find-the-bottleneck.html' | relative_url }}"><strong>Low FPS</strong><span>Find out whether the CPU, GPU, memory or disk is the limit.</span></a>
  <a class="tile" href="{{ '/docs/02-find-the-bottleneck.html' | relative_url }}"><strong>Stutters</strong><span>Separate frame-time spikes from background load.</span></a>
  <a class="tile" href="{{ '/docs/10-temperatures-stability.html' | relative_url }}"><strong>High temperatures</strong><span>Check throttling, cooling and safe limits.</span></a>
  <a class="tile" href="{{ '/docs/15-troubleshooting-decision-trees.html' | relative_url }}"><strong>Crashes and freezes</strong><span>Follow a decision path from symptom to fix.</span></a>
  <a class="tile" href="{{ '/docs/06-gpu-settings.html' | relative_url }}"><strong>Input lag</strong><span>Review GPU and display settings that affect latency.</span></a>
  <a class="tile" href="{{ '/docs/01-before-you-start.html' | relative_url }}"><strong>Not sure where to start</strong><span>Prepare a restore point and a baseline first.</span></a>
</div>

<div class="home-columns">
  <section>
    <h2>Windows guides</h2>
    <ul class="link-list">
      <li><a href="{{ '/docs/start-here.html' | relative_url }}">Start here</a><span>Choose a route by symptom</span></li>
      <li><a href="{{ '/docs/03-bios-and-hardware.html' | relative_url }}">BIOS &amp; hardware</a><span>Platform-wide checks</span></li>
      <li><a href="{{ '/docs/04-drivers-and-updates.html' | relative_url }}">Drivers &amp; updates</a><span>Install and roll back safely</span></li>
      <li><a href="{{ '/docs/16-benchmark-templates.html' | relative_url }}">Benchmark templates</a><span>Repeatable testing protocol</span></li>
      <li><a href="{{ '/docs/' | relative_url }}">All Windows guides</a><span>Full index</span></li>
    </ul>
  </section>
  <section>
    <h2>Games</h2>
    <ul class="link-list">
      <li><a href="{{ '/docs/games/cs2.html' | relative_url }}">Counter-Strike 2</a><span>Settings, latency, testing</span></li>
      <li><a href="{{ '/docs/games/valorant.html' | relative_url }}">Valorant</a><span>Anti-cheat aware guidance</span></li>
      <li><a href="{{ '/docs/games/pubg.html' | relative_url }}">PUBG</a><span>Large-map performance</span></li>
      <li><a href="{{ '/docs/games/minecraft-java.html' | relative_url }}">Minecraft Java</a><span>Java, memory and render distance</span></li>
      <li><a href="{{ '/docs/games/world-of-tanks.html' | relative_url }}">World of Tanks</a><span>Client and network settings</span></li>
    </ul>
  </section>
</div>

<p class="home-note">This site favors documented settings and measurable tests over “FPS boost” scripts, mass service disabling, registry hacks, or claims of guaranteed gains.</p>
