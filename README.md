# Ultimate PC Gaming Optimization Guide 2026

An evidence-based guide to optimizing gaming PCs with measurable, reversible changes.

<p align="center">
  <a href="https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/ultimate-pc-gaming-guide-2026.html"><img src="https://img.shields.io/badge/📖_Main_guide-2563eb?style=for-the-badge" alt="Main guide"></a>
  <a href="https://discord.gg/U7uGQzK48F"><img src="https://img.shields.io/badge/💬_Discord-5865f2?style=for-the-badge" alt="Discord"></a>
  <a href="https://github.com/h4zvenn/gaming-pc-optimization-guide/issues"><img src="https://img.shields.io/badge/🐛_Issues-dc2626?style=for-the-badge" alt="Report an issue"></a>
</p>

## The method

1. **Change** one setting at a time.
2. **Benchmark** before and after.
3. **Keep** changes that help.
4. **Roll back** changes that do not.

> [!IMPORTANT]
> No "FPS boost" scripts. No mass service disabling. No universal BIOS presets.

## 🚀 Quick start

| Step | What to do | Guide |
| :--- | :--- | :--- |
| **1 · Prepare** | Create a restore point and record your baseline. | [Before You Start →](https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/01-before-you-start.html) |
| **2 · Diagnose** | Find the component or setting causing the problem. | [Find the Bottleneck →](https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/02-find-the-bottleneck.html) |
| **3 · Choose** | Pick the guide for the issue you diagnosed. | [Quick-Start Presets →](https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/14-quick-start-presets.html) |
| **4 · Verify** | Benchmark the result. Keep or revert the change. | [Benchmark Templates →](https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/16-benchmark-templates.html) |

> [!TIP]
> **Rule:** If you cannot measure it, you cannot confidently say it helped.

## Explore the guide

- [Start Here](https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/start-here.html)
- [Windows 11 Gaming Settings](https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/05-windows-11.html)
- [GPU Settings](https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/06-gpu-settings.html)
- [Benchmark Templates](https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/16-benchmark-templates.html)

## 🎯 Game guides

[Per-game guides](https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/games/)  
Existing guides: Counter-Strike 2, VALORANT, PUBG, Minecraft Java, World of Tanks.

## 🛠️ Diagnostics tool

A read-only Windows diagnostics script is available in the `tools` folder. It is attached to each release as a zip with a checksum.

### What it does

- Never changes any settings.
- Lets you export selected sections to a local report after reviewing the data notice and confirming.

> [!WARNING]
> Before sharing a report, check it for device names, network details, usernames, startup commands, and file paths.

### Verify the download

```powershell
Get-FileHash .\gaming-diagnostics.zip -Algorithm SHA256
```

Compare the result with the checksum published in the release notes.

## 📁 Repository structure

```text
gaming-pc-optimization-guide/
├── docs/             # English guides (Jekyll pages)
│   ├── games/        # Per-game guides
│   ├── hardware/     # Vendor hardware guides
│   └── ...
├── ru/               # Russian translation
├── tools/            # Read-only diagnostics scripts
├── search/           # Site search page
├── assets/           # Site assets
├── downloads/        # Downloadable files
├── LICENSE           # MIT License
└── README.md         # You are here
```

## 🌍 Languages

| Language | Status | Link |
| :--- | :--- | :--- |
| **English** | ✅ Source version | [Read](https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/ultimate-pc-gaming-guide-2026.html) |
| **Russian** | 🚧 Translation in progress | [Прочитать](https://h4zvenn.github.io/gaming-pc-optimization-guide/ru/) |

## 🤝 Contributing

Contributions are welcome: fixes, new game guides, translations, and benchmark data.

Read the [Contributing guidelines](CONTRIBUTING.md).

Found a mistake? [Open an issue](https://github.com/h4zvenn/gaming-pc-optimization-guide/issues).

## Community and Support

Join our [Discord community](https://discord.gg/U7uGQzK48F) for general discussion, gaming PC questions, and troubleshooting help.

Use [GitHub Issues](https://github.com/h4zvenn/gaming-pc-optimization-guide/issues) for documentation errors, project bugs, and actionable improvement requests. Please follow our [Code of Conduct](CODE_OF_CONDUCT.md).

## ⚠️ Disclaimer

> [!WARNING]
> This guide is provided as-is. You apply changes at your own risk. Always back up important data and create a restore point before modifying system settings, drivers, or BIOS options.

## 📄 License

Released under the [MIT License](LICENSE).
