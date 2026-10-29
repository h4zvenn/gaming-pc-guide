# 06. GPU Settings

> Configure the graphics driver per game/application profile. Do not change everything globally: one game may benefit while another gets bugs, image degradation, or instability.

## Core principle

1. First tune graphics, FPS limit, latency, and scaling **inside the game**.
2. Then create a game profile in NVIDIA, AMD, or Intel panel.
3. Change one setting at a time.
4. Validate FPS, 1% low, frametime, image quality, and stability.

> [!IMPORTANT]
> Driver panel does not create performance out of nowhere. It helps use available GPU power correctly, reduce latency in suitable scenarios, and avoid conflicting settings.

### Fast setup order (per game)

| Order | Action |
|---|---|
| 1 | Set in-game resolution/quality |
| 2 | Pick upscaler mode (Quality → Balanced → Performance) |
| 3 | Set FPS cap for stable frametime |
| 4 | Tune VRR/V-Sync behavior |
| 5 | Apply only one driver tweak at a time |

---

## 1. General settings for any GPU

### Resolution and render scale

- Native monitor resolution usually gives the sharpest image.
- Lowering resolution or render scale reduces GPU load and may increase FPS.
- If the game supports DLSS, FSR, or XeSS, compare `Quality`, `Balanced`, and `Performance` first.
- Do not pick the most aggressive scaling mode without need: FPS may rise, but image quality can noticeably drop.

### Textures and VRAM

Texture settings are often limited by VRAM capacity.

- If VRAM is nearly full and stutter appears, reduce textures.
- Do not use heavy texture packs beyond your GPU capability.
- High textures do not always reduce FPS heavily, but can cause issues when VRAM is insufficient.

### Most GPU-heavy settings

When GPU-bound, test these first:

- Ray tracing
- Path tracing
- Resolution / render scale
- Shadows
- Reflections
- Volumetric lighting / fog
- Ambient occlusion
- Draw distance
- Hair, grass, particle, and water quality

You do not have to set everything to Low. Find balance: reduce options with large FPS cost and small visible quality difference.

---

## 2. FPS limit

Frame limiting can improve frametime consistency and reduce heat, noise, and power usage.

### Where to cap FPS

Typical priority:

1. In-game FPS limiter.
2. GPU driver limiter.
3. RTSS, if you need precise external limiting and understand its behavior.

### How to choose a value

- If FPS is unstable, cap to a value the system can sustain in heavy scenes.
- If using VRR, tune cap after VRR and V-Sync are configured for your monitor.
- Do not set cap above CPU/GPU capability only for bigger overlay numbers.

Example:

```text
System outputs 180–260 FPS but often drops to 165 FPS.
A 165 or 170 FPS cap may provide smoother frametime than uncapped fluctuation.
```

> [!NOTE]
> There is no universal “perfect FPS cap.” It depends on monitor refresh rate, VRR, game behavior, system performance, and personal feel.

---

## 3. V-Sync, VRR, G-SYNC, and FreeSync

### What is V-Sync

V-Sync synchronizes frame output with monitor refresh rate and can remove tearing. In some scenarios it also increases latency and limits FPS.

### What is VRR

VRR means variable refresh rate. It may be branded as:

- NVIDIA G-SYNC / G-SYNC Compatible
- AMD FreeSync
- Adaptive-Sync

It helps smooth motion when FPS varies within monitor VRR range.

### Correct approach

- Verify VRR is enabled in monitor OSD.
- Verify settings in driver panel.
- Test game with V-Sync on and off.
- With VRR, tune FPS cap + V-Sync for your use case instead of copying random settings.

> [!WARNING]
> V-Sync/VRR/FPS-cap settings affect smoothness, tearing, and latency at the same time. There is no single best mode for every monitor and every game.

---

## 4. NVIDIA

Configure settings in NVIDIA App or NVIDIA Control Panel per game.

### Power management mode

Globally, keep default in most cases.

For a specific game with clock/power-saving behavior issues, you can test:

```text
Power management mode → Prefer maximum performance
```

Possible effects:

- GPU holds higher clocks more aggressively in-game;
- power/temperature/noise may increase;
- some games may show no difference.

### NVIDIA Reflex

If the game supports NVIDIA Reflex, enable Reflex **inside the game**.

Reflex lets the game manage render queue for lower system latency. This is usually preferable to forcing Low Latency Mode in driver.

### Low Latency Mode

If a game does not have Reflex, test Low Latency Mode in the driver profile.

Modes can differ by driver version, but generally:

- `Off` — default queue behavior;
- `On` — limits pre-rendered frames;
- `Ultra` — more aggressive queue minimization.

Do not enable Low Latency Mode globally for all apps. Test per game.

### Texture filtering - Quality

In game profile, test texture filtering quality mode.

- `Quality` — reasonable default.
- Performance-priority mode can give a small gain on weak GPUs, but may degrade image quality.

Do not change this without comparing image and FPS.

### What not to force-enable

Without a specific reason, do not force via driver:

- anti-aliasing overriding game settings;
- DSR/DLDSR;
- scaling and sharpening;
- global V-Sync for all programs;
- global maximum performance mode;
- global Low Latency Mode.

---

## 5. AMD Radeon

Tune per-game profile in AMD Software: Adrenalin Edition.

### Radeon Anti-Lag

Can reduce latency in suitable scenarios. Enable per game and test result.

If game has its own latency-reduction tech, try in-game option first.

### Radeon Chill

Chill can cap FPS and reduce power usage. Useful for quieter operation or efficiency, but not always ideal for maximum responsiveness.

### Enhanced Sync

Enhanced Sync can reduce tearing in some scenarios, but behavior differs by game. Test together with VRR and FPS cap.

### Radeon Super Resolution and scaling

Use RSR/external scaling when a game lacks built-in FSR/DLSS/XeSS or when external method gives acceptable image quality.

Prefer built-in game upscaler when possible: it usually handles rendering/UI specifics better.

### Do not enable everything at once

Do not activate Anti-Lag, Chill, Enhanced Sync, external scaling, and frame limiters all at once. Otherwise it is hard to understand what affects result and where conflict appears.

---

## 6. Intel Arc and integrated Intel Graphics

Use Intel Graphics Software and create per-game profile.

### Recommendations

- Keep driver on a current stable version.
- For each game, start with its own scaling/latency settings.
- If a specific game has issues, check driver known issues and test game API options: DirectX 11, DirectX 12, or Vulkan (if available).
- On laptops, consider hybrid graphics settings in Windows and vendor utility.

---

## 7. Upscalers and Frame Generation

### DLSS, FSR, and XeSS

These upscaling technologies can increase FPS by rendering internally at lower resolution.

Recommended test order:

1. Native resolution.
2. `Quality`.
3. `Balanced`.
4. `Performance` if FPS is still insufficient.

Compare:

- FPS and 1% low;
- fine-detail sharpness;
- motion quality;
- artifacts on thin objects, foliage, hair, and UI.

### Frame Generation

Frame generation can increase displayed FPS, but it does not replace sufficient base FPS and can change latency feel.

Before enabling:

- achieve solid native/base FPS;
- enable available in-game latency reduction;
- evaluate image quality and responsiveness personally;
- do not judge only by FPS overlay number.

> [!IMPORTANT]
> Frame Generation is mainly useful for visual smoothness in compatible games. It does not fix CPU limit, stutter, overheating, or instability.

---

## 8. GPU issue diagnostics

If you have stutter, crashes, or clock drops, check:

- GPU temperature;
- GPU hotspot and memory temperature (if sensors available);
- clock behavior and power limit;
- VRAM usage;
- driver version;
- overclock/undervolt status;
- GPU power delivery;
- overlays, recording, browser video;
- stability in another game/benchmark.

For artifacts, black screens, and crashes, return GPU to stock settings first. Do not try to fix unstable undervolt with new Windows tweaks.

---

## Checklist

- [ ] Graphics are tuned in-game first.
- [ ] Driver profile is used per specific application.
- [ ] Reasonable FPS cap is selected.
- [ ] VRR/V-Sync tested on specific monitor and game.
- [ ] Reflex is enabled in-game when NVIDIA Reflex support exists.
- [ ] AMD features are enabled one by one and validated.
- [ ] Textures match VRAM capacity.
- [ ] Upscaler is chosen by FPS/quality balance, not peak number only.
- [ ] Frame Generation is not used as substitute for solid baseline performance.
- [ ] No unstable overclock, overheating, or conflicting overlays.

---

## Summary

Best GPU settings are not maximum number of enabled features, but a clear per-game profile. First determine whether system is GPU-bound or CPU-bound, then tune resolution, heavy effects, FPS cap, VRR/V-Sync, and upscaling technologies. Evaluate not only average FPS, but also frametime, 1% low, image quality, and latency.

Next step: [Background apps and startup](07-background-apps.md).
