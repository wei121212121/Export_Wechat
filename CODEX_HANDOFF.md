# ExportWeChat public handoff

This repository documents an offline Windows test build workflow.

The public repository excludes chat exports, account data, passwords, authorization tokens, local caches, speech models, executables, and split archives. Release artifacts should be distributed separately and reviewed before sharing.

The available build is a reproducible patch workflow for an existing Windows executable, not the original Rust/Tauri source project. The release folder should contain the executable, launcher scripts, and a sibling models directory. The large speech model is intentionally not committed to Git.

Use a backup copy of important WeChat data. Do not run real exports as automated tests. The executable is unsigned and Windows may display a security warning.