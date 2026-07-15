# Cortex

**The command center for everything you're building.**

Cortex is where your projects get built, not just tracked. Define what you want done, and agents pick up the tasks and work them in parallel - while you watch progress, preview the results, and stay focused on deciding what's next.

- **Describe the task, not the steps.** Write down what you want - a feature, a fix, a refactor - and hand it off. Agents do the implementation work.
- **Parallel by default.** Agents work multiple tasks at once across your projects. Your throughput is no longer one-thing-at-a-time.
- **Preview features in isolation.** Every piece of work gets its own isolated preview, so you can see and test a change on its own before it touches anything else.
- **Your whole stack, one view.** Projects, features, dependencies, and the technologies underneath - visible in one place, so you always know what exists and what's in flight.

👉 **[Download the latest release](https://github.com/go-cortex/Cortex/releases/latest)**

---

## Get Cortex

| Platform | Download |
|---|---|
| 🍎 macOS - Apple silicon | [Download `.dmg`](https://github.com/go-cortex/Cortex/releases/latest/download/Cortex-macos-arm64.dmg) |
| 🪟 Windows - x64 | [Download `.exe`](https://github.com/go-cortex/Cortex/releases/latest/download/Cortex-windows-x64.exe) |
| 🪟 Windows - ARM64 | [Download `.exe`](https://github.com/go-cortex/Cortex/releases/latest/download/Cortex-windows-arm64.exe) |

**Runs on:** macOS (Apple silicon, M1 or newer) · Windows x64 · Windows ARM64
**Not there yet:** Intel Macs and Linux. Want one of these? [Tell us](https://github.com/go-cortex/Cortex/issues/new) - demand is how we prioritize.

---

## Installing

### macOS

1. Download the `.dmg` above.
2. Open it and drag Cortex into **Applications**.
3. Launch it from there.

Cortex isn't Apple-notarized yet, so macOS may balk at the first launch. To get through:

1. Control-click the Cortex app and choose **Open**.
2. Click **Open** again to confirm.
3. Still blocked? **System Settings → Privacy & Security → Open Anyway**.

Only do this for installers downloaded from this repository - never for files from anywhere else.

### Windows

1. Download the installer for your architecture.
2. Run the `.exe` and follow the setup wizard.

Our builds aren't code-signed yet, so Microsoft Defender SmartScreen may raise an eyebrow. If the installer came from this repo, click **More info → Run anyway**.

---

## Staying up to date

Every new build lands on the [Releases page](https://github.com/go-cortex/Cortex/releases), with notes on what changed. Cortex doesn't auto-update yet - grab the newest release and install it over your current version. Your data stays put.

---

## Found a bug?

We want to know. [Open an issue](https://github.com/go-cortex/Cortex/issues/new) with:

- Your OS and architecture (e.g. macOS, Apple silicon)
- The Cortex version you're on
- What you expected, and what happened instead
- Screenshots or error messages if you've got them

One favor: strip passwords, tokens, and private project details out of logs and screenshots before posting.

---

## About this repository

This is Cortex's public releases repo - release notes and compiled installers, nothing else. The source code lives in a separate private repository.

Heads up: GitHub auto-attaches **Source code** zip/tarball links to every release. Those only contain this repo's files, not the Cortex application source.
