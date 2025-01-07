# dotfiles

This repository contains the configuration files for the tools I use day-to-day.

<img width="1192" alt="2bfc75d143d56951bcada77947553cacbda8c16267be92e92dfcff2e0a158707" src="https://github.com/user-attachments/assets/b2be9f12-0457-41a4-9336-a810655b8d0a">
<img width="1192" alt="567c0d0fa1219e4f2ab5f2b2164558ce14f6e05dee02ce613471173515b5ebdd" src="https://github.com/user-attachments/assets/30f03079-fd05-479e-8251-f0d3b68d623d">
<img width="1728" alt="bf6900f9c9992cf4acd8b71ccb1867557555fc957a5f2f2934252c78193725d0" src="https://github.com/user-attachments/assets/735b6e12-f10e-41ec-a4b6-73cbe94b0ed1">

**Note**: these dotfiles are for the [fish shell][fish] only.
These configurations are designed to work out-of-the-box on both MacOS and Arch
Linux, but can be easily adapted to other distributions.

## Installation

I use a simple tool called [yadm][yadm] to manage my dotfiles, but it's not
required! However if you're interested in using yadm it's as simple as:

```sh
yadm clone https://github.com/sijan2/dotfiles.git
yadm status
yadm bootstrap
```

Otherwise you can copy over individual files and directories as needed.

## Tools

- [bat][bat] - A `cat(1)` clone with wings.
- [fd][fd] - A simple, fast, and user-friendly alternative to 'find'.
- [Fish][fish] - The user-friendly command line shell.
- [fzf][fzf] - 🌸 A command-line fuzzy finder.
- [glow][glow] - Render markdown on the CLI, with pizzazz! 💅🏻
- [jq][jq] - Command-line JSON processor.
- [scrcpy][scrcpy] - Android mirroring similar to iPhone mirroring but advanced and better!
- [iTerm2][iTerm2] - A terminal emulator for macOS that does amazing things.
- [zoxide][zoxide] - A smarter `cd` command that learns your most frequently visited directories, allowing rapid navigation with minimal keystrokes.
- [eza][eza] - A modern replacement for `ls`, offering improved formatting, syntax highlighting, and Git integration for a more informative directory listing.
- [Arc Browser][arc-browser] - A reimagined web browser designed for enhanced productivity, featuring a sidebar for organized tabs, built-in ad blocking, and AI-powered tools for efficient web navigation.

I use the [FiraCode Nerd Font][fira-code] which is a beautiful font designed for developers. It has all sorts of fun features, ligatures, and powerline symbols.

[bat]: https://github.com/sharkdp/bat
[fd]: https://github.com/sharkdp/fd
[fish]: https://fishshell.com/
[fzf]: https://github.com/junegunn/fzf
[glow]: https://github.com/charmbracelet/glow
[jq]: https://github.com/stedolan/jq
[scrcpy]: https://github.com/Genymobile/scrcpy
[iTerm2]: https://iterm2.com
[zoxide]: https://github.com/ajeetdsouza/zoxide
[eza]: https://github.com/eza-community/eza
[arc-browser]: https://arc.net/
[fira-code]: https://www.nerdfonts.com/font-downloads
[yadm]:https://github.com/yadm-dev/yadm
