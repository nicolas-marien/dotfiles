#!/bin/bash

if command -v stow >/dev/null 2>&1; then
	stow -t ~ neovim
	stow -t ~ wezterm
	stow -t ~ zsh
	stow -t ~ tmux
	stow -t ~ git
	stow -t ~ alacritty
	stow -t ~ prompt
else
	echo "stow is not installed"
	process exit 1
fi
