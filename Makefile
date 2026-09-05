COMMON := fish git ghostty mise nvim scripts starship yazi
MACOS  := aerospace brew sketchybar
OPTIONAL := helix kitty zellij vim tmux

common:
	stow $(COMMON)

mac:
	stow $(COMMON) $(MACOS)

unstow:
	stow -D $(COMMON) $(MACOS) $(OPTIONAL)

restow:
	stow -R $(COMMON)
