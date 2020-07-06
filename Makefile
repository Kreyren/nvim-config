###! Backend to install desired configuration on target system
###! This is expected to be cross-platform and posix compatible
###! Make the output to be understandable by 10yo

SHELL := /bin/sh

# Ignore our targets
.PHONY: build install-nvim clean

# FIXME(Krey): Build cross-platform (currently depends on shell)
# FIXME(Krey): Use whatever is available -> Don't use wget if it's not available, use i.e curl
build:
	@ $(info Fetching plug.vim from upstream which is required for plugin management)
	@ torsocks wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -O autoload/plug.vim
	@ $(info Configuration has been sucessfully built)


# NOTICE(Krey): We always have to return true for the shell to not fail thus reasoning for `false || command`
# FIXME(Krey): Install cross-platform (currently depends on shell)
install-nvim: build
	@ export nvimConfigDir="$HOME/.config/nvim"
	@ printf 'CONFIRMATION: %s\n' "Installing NeoVim configuration to "
	@ $(info Install NeoVim configuration to '$$HOME/.config/nvim' ? \(y/n\))
	@ $(error Work in progress)
	@ exit 38
	@ [ -d "$HOME" ] || mkdir "$HOME"
	@ [ -d "$HOME/.config" ] || mkdir "$HOME/.config"
	@ [ ! -d "$HOME/.config/nvim" ] || printf 'FATAL: %s\n' "Directory '$HOME/.config/nvim' already exists, exitting for safety to avoid overwriting, remove or backup the directory to continue" && exit 1
	@ [ -d "$HOME/.config/nvim" ] || mkdir "$HOME/.config/nvim"
	@ [ ! -e "$HOME/.config/nvim/init.vim" ] || cp init.vim "$HOME/.config/nvim/init.vim"

# FIXME(Krey): Clean cross-platform (currently depends on shell)
clean:
	@ $(info Cleaning autoload/plug.vim which is fetched from upstream without git tracking)
	@ [ -e autoload/plug.vim ] || rm autoload/plug.vim
