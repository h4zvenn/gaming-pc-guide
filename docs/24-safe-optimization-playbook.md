---
layout: doc
title: "Safe Optimization Playbook"
description: "A practical catalog of manual PC gaming changes with compatibility, risk, rollback, and repeatable validation steps."
lang: en
translation_key: safe-optimization-playbook
permalink: /docs/24-safe-optimization-playbook.html
---

Use this playbook to make one deliberate change at a time. These are manual procedures, not scripts or presets. A change is useful only if it addresses an observed problem and improves a repeatable test without causing instability or unwanted side effects.

## How to read a procedure card

Each card states:

- **Goal:** the specific problem the change may address.
- **Applies to:** the platform or situation where the procedure makes sense.
- **Risk:** likely side effects and what not to change.
- **Steps:** one reversible action at a time.
- **Validate:** how to compare the same workload before and after.
- **Rollback:** how to restore the previous behavior.

Compatibility labels describe where a procedure may be relevant; they are not a guarantee of better performance. “Low risk” means the change is easy to reverse and does not weaken Windows security. It does not mean every system will benefit.

## Card: reduce unnecessary startup load

**Goal:** Reduce unwanted background activity after signing in, especially when memory or CPU resources are limited.

**Applies to:** Windows 10 and Windows 11 PCs with applications that do not need to start automatically.

**Risk:** An app may stop syncing, showing notifications, or applying device profiles until opened. Do not disable security software, drivers, audio/network components, or laptop hotkey and power utilities.

**Steps:**

1. Open `Task Manager → Startup apps`.
2. Review an application's name and publisher; look it up before changing an unfamiliar entry.
3. Disable one known, nonessential app.
4. Restart Windows and confirm the app still works when opened manually.

**Validate:** Compare idle CPU, memory, and disk activity after sign-in, then repeat the same game test. Startup changes may improve responsiveness without changing in-game FPS.

**Rollback:** Re-enable the entry in `Task Manager → Startup apps`. See [Background Apps](07-background-apps.html) for details.

## Card: isolate an overlay-related stutter

**Goal:** Find out whether a particular overlay is associated with stutter, a crash, or a launch problem.

**Applies to:** Any supported Windows PC where an overlay is active and the symptom occurs in a repeatable game scenario.

**Risk:** Disabling an overlay removes its features, such as chat, capture controls, or an FPS display. Do not disable anti-cheat or security features.

**Steps:**

1. Record the game, scene, graphics settings, frame-time behavior, and active overlays.
2. Disable one overlay in that application's own settings.
3. Restart the game and repeat the same scenario.
4. Restore the overlay if the symptom is unchanged; test another overlay separately if needed.

**Validate:** Compare repeated runs of the same scene. Do not conclude that an overlay caused the problem from one run or a different workload.

**Rollback:** Re-enable the overlay in the application that owns it. See [Background Apps](07-background-apps.html) and [Benchmark Templates](16-benchmark-templates.html).

## Card: prevent downloads from competing with a game

**Goal:** Check whether active downloads or synchronization coincide with ping spikes, disk activity, or stutter.

**Applies to:** Systems where a game launcher, cloud-sync client, backup, or other device is actively using the connection or storage.

**Risk:** Pausing a transfer delays it. Do not stop Windows Update, security updates, or system services as a workaround.

**Steps:**

1. Check the game launcher, cloud-sync client, and Task Manager for active network or disk use.
2. Pause one nonessential download or sync task using its normal interface.
3. Repeat the same game scenario and observe ping, packet loss, frame times, and disk activity.
4. Resume the task after the test.

**Validate:** Keep network and local performance separate: a lower ping does not prove higher FPS, and smoother frame times do not prove a network fix. See [Network and Wi-Fi](20-network-and-wifi.html).

**Rollback:** Resume the transfer in its application. No system configuration should need restoration.

## Record a change

Before keeping any adjustment, write down:

| Field | Record |
| --- | --- |
| Symptom and game scenario | What was wrong, and where it happens |
| System context | Windows version, hardware, driver, power mode, and relevant app versions |
| Change | Exactly one setting changed and its previous value |
| Test method | Same scene, duration, game settings, and measurement tool |
| Result | Repeated FPS/frame-time, temperature, stability, or network observations |
| Decision | Keep, revert, or gather more evidence |

Use [Benchmark Templates](16-benchmark-templates.html) for repeatable measurements. If a change causes crashes, instability, unexpected device behavior, or a security warning, revert it and follow [Troubleshooting Decision Trees](15-troubleshooting-decision-trees.html).

## Safety boundaries

- Prefer application settings and Windows interfaces over registry edits or shell scripts.
- Do not apply a procedure just because it appears in a list; first confirm it matches the symptom.
- Do not disable Defender, Firewall, Windows Update, anti-cheat, or unknown services for gaming performance.
- Do not batch changes. Isolate one variable so the result can be interpreted and reversed.
- Treat checksums as a way to detect file changes, not proof that a file or procedure is safe.

For hardware-specific tuning, use [Overclocking and Undervolting](23-overclocking-and-undervolting.html) and retain a tested rollback path.
