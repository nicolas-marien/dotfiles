#!/bin/bash

if command -v stow >/dev/null 2>&1; then
	stow neovim
	stow wezterm
	stow zsh
	stow tmux
	stow git
	stow alacritty
	stow prompt
else
	echo "stow is not installed"
	process exit 1
fi
