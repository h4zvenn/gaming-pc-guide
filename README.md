<div align="center">
🎮 Ultimate PC Gaming Optimization Guide 2026

A universal, evidence-based guide to optimizing gaming PCs across hardware and games.

Find the real bottleneck. Change one setting. Measure the result.

<br>

<a href="https://jekyllrb.com/"><img src="https://img.shields.io/badge/Jekyll-4.x-CC0000?style=flat-square&logo=jekyll&logoColor=white" alt="Jekyll"></a> <a href="https://h4zvenn.github.io/gaming-pc-optimization-guide/"><img src="https://img.shields.io/badge/GitHub%20Pages-Live-181717?style=flat-square&logo=github&logoColor=white" alt="GitHub Pages"></a> <a href="LICENSE"><img src="https://img.shields.io/badge/License-MIT-2ea44f?style=flat-square" alt="License: MIT"></a> <a href="https://github.com/h4zvenn/gaming-pc-optimization-guide/pulls"><img src="https://img.shields.io/badge/PRs-welcome-ff6b35?style=flat-square" alt="PRs Welcome"></a> <a href="https://discord.gg/jPYsHSapHx"><img src="https://img.shields.io/badge/Discord-Join-5865F2?style=flat-square&logo=discord&logoColor=white" alt="Discord"></a>

<br><br>

<a href="https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/ultimate-pc-gaming-guide-2026.html"><b>📖 Main guide</b></a>  •  <a href="https://h4zvenn.github.io/gaming-pc-optimization-guide/"><b>🏠 Website</b></a>  •  <a href="https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/games/"><b>🎯 Game guides</b></a>  •  <a href="https://h4zvenn.github.io/gaming-pc-optimization-guide/search/"><b>🔎 Search</b></a>  •  <a href="https://github.com/h4zvenn/gaming-pc-optimization-guide/releases"><b>📦 Releases</b></a>  •  <a href="https://github.com/h4zvenn/gaming-pc-optimization-guide/issues"><b>🐞 Report an issue</b></a>

</div>
✨ What is this?

Gaming optimization advice ranges from measured fixes to one-size-fits-all tweaks. This project focuses on changes you can test across desktops and gaming laptops, CPU/GPU vendors, and different game workloads.

The method is simple:

Find the actual bottleneck.
Change one setting at a time.
Benchmark before and after.
Keep changes that help.
Roll back changes that do not.

No “FPS boost” scripts. No mass service disabling. No universal BIOS presets.

Windows 11 is the primary operating system covered. Windows 10 is treated as a legacy platform because Microsoft ended standard support on October 14, 2025. OS-, vendor-, and game-specific advice is clearly labeled instead of being presented as universal.

🚀 Quick start
<div align="center"> <table> <tr> <td align="center" valign="top" width="25%"> <a href="https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/01-before-you-start.html"><img src="https://img.shields.io/badge/01-Prepare-ff6b35?style=for-the-badge" alt="01 Prepare"></a> <br><br> Create a restore point and record your baseline. </td> <td align="center" valign="top" width="25%"> <a href="https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/02-find-the-bottleneck.html"><img src="https://img.shields.io/badge/02-Diagnose-e63946?style=for-the-badge" alt="02 Diagnose"></a> <br><br> Find the component or setting causing the problem. </td> <td align="center" valign="top" width="25%"> <a href="https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/"><img src="https://img.shields.io/badge/03-Choose-f4a300?style=for-the-badge" alt="03 Choose"></a> <br><br> Pick the guide for the issue you diagnosed. </td> <td align="center" valign="top" width="25%"> <a href="https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/16-benchmark-templates.html"><img src="https://img.shields.io/badge/04-Verify-2ea44f?style=for-the-badge" alt="04 Verify"></a> <br><br> Benchmark the result. Keep or revert the change. </td> </tr> </table> </div>

Rule: if you cannot measure it, you cannot confidently say it helped.

🧭 What’s inside
Area What you get
🩺 Diagnostics CPU, GPU, RAM, storage, temperatures, background load
⚙️ Windows & hardware Windows 11 guidance, Windows 10 legacy notes, BIOS and component settings
🎨 GPU settings NVIDIA, AMD, VRR, latency and graphics options
🧪 Benchmarking Repeatable FPS, frame-time and stability testing
🎮 Game guides CS2, VALORANT, PUBG, Minecraft Java, World of Tanks
🛡️ Safety Rollback paths, security basics and what not to do
🧰 Tools Read-only Windows diagnostics menu (never changes settings)
🎮 Game guides
<div align="center">

<a href="https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/games/cs2.html"><img src="https://img.shields.io/badge/Counter--Strike%202-Guide-f4a300?style=for-the-badge&logo=steam&logoColor=white" alt="Counter-Strike 2"></a> <a href="https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/games/valorant.html"><img src="https://img.shields.io/badge/VALORANT-Guide-ff4655?style=for-the-badge" alt="VALORANT"></a> <a href="https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/games/pubg.html"><img src="https://img.shields.io/badge/PUBG-Guide-e68a00?style=for-the-badge&logo=steam&logoColor=white" alt="PUBG"></a> <a href="https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/games/minecraft-java.html"><img src="https://img.shields.io/badge/Minecraft%20Java-Guide-2ea44f?style=for-the-badge&logo=minecraft&logoColor=white" alt="Minecraft Java"></a> <a href="https://h4zvenn.github.io/gaming-pc-optimization-guide/docs/games/world-of-tanks.html"><img src="https://img.shields.io/badge/World%20of%20Tanks-Guide-8a8f3c?style=for-the-badge" alt="World of Tanks"></a>

</div>

Want a guide for another game? Open a request or read the contributing section.

🛠️ Diagnostics tool

A read-only Windows diagnostics menu is available in the tools folder. It is also attached as a zip with a checksum to each release.

✅ Never changes any settings.
✅ Lets you export selected sections to a local report after you review the data notice and confirm.
✅ Reports are not uploaded anywhere.
⚠️ Before sharing a report, check it for device names, network details, usernames, startup commands, and file paths.

How to verify the download:

powershell
Get-FileHash .\gaming-diagnostics.zip -Algorithm SHA256

Compare the result with the checksum published in the release notes.

<details> <summary><b>📚 Guide library (click to expand)</b></summary> <br>
Universal workflow
Ultimate PC Gaming Optimization Guide 2026
Windows 10 Legacy Notes
Preparation and diagnostics
01 · Before You Start
02 · Find the Bottleneck
09 · PowerShell Diagnostics
10 · Temperatures & Stability
15 · Troubleshooting Trees
Windows, hardware and graphics
03 · BIOS & Hardware
04 · Drivers & Updates
05 · Windows 11 Gaming Settings
06 · GPU Settings
07 · Background Apps
08 · Services & Security
Reference and starting points
11 · What Not To Do
12 · FAQ
13 · Security Hardening
14 · Quick-Start Presets
Testing, tools and cleanup
16 · Benchmark Templates
17 · Common Builds
18 · Optimization Tools
19 · Disk Cleanup
</details>
📁 Repository structure
text
gaming-pc-optimization-guide/
├── docs/                 # English guides (Jekyll pages)
│   ├── games/            # Per-game guides
│   └── ...
├── ru/                   # Russian translation
├── tools/                # Read-only diagnostics scripts
├── search/               # Site search page
├── LICENSE
└── README.md

Adjust this tree to match your actual folders.

🌍 Languages
Language Status
🇬🇧 English Source version
🇷🇺 Russian Most core guides translated; 8 pages remain stubs

👉 Read in Russian

❓ FAQ
<details> <summary><b>Will this void my warranty or break my PC?</b></summary> <br>

The guide focuses on reversible changes and always describes a rollback path. Still, create a restore point first (see Before You Start).

</details> <details> <summary><b>Do I need to follow every step?</b></summary> <br>

No. Diagnose first, then apply only what matches your bottleneck.

</details> <details> <summary><b>Is Windows 10 supported?</b></summary> <br>

Only as a legacy platform. See Windows 10 Legacy Notes.

</details>
🤝 Contributing

Contributions are welcome: fixes, new game guides, translations, and benchmark data.

Fork the repository.
Create a branch: git checkout -b feature/my-change
Make your changes and include evidence (benchmarks, sources, screenshots).
Open a pull request.

Guidelines

One claim, one source or one measurement.
Label vendor-, OS-, and game-specific advice.
No “magic” tweaks without before/after results.

Found a mistake? Open an issue.

🗺️ Roadmap
 Finish the remaining Russian stub pages
 More game guides
 More benchmark templates and common build cards
 Linux gaming notes
⚠️ Disclaimer

This guide is provided as-is. You apply changes at your own risk. Always back up important data and create a restore point before modifying system settings, drivers, or BIOS options.

📄 License

Released under the MIT License.

<div align="center">
💬 Have questions, ideas, or just want to chat? Join us!
<a href="https://discord.gg/jPYsHSapHx"> <img src="https://img.shields.io/badge/Join%20Community-Discord-5865F2?style=for-the-badge&logo=discord&logoColor=white" alt="Join Community Discord"> </a>

<br><br>

Find the bottleneck. Change one setting. Measure the result.

</div>
