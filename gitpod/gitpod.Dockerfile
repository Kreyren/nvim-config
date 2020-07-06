FROM gitpod/workspace-full:latest

USER gitpod

# Get dependencies
## neovim - To test the configuration in gitpod
## vim - To test vim configuration
## docker - To test the configuration in docker
## ranger - To test ranger in NeoVim
RUN true "" \
	&& sudo apt-get update -q \
	&& sudo apt-get install -qy \
		neovim \
		vim \
		docker.io \
		ranger \
		tor \
	&& sudo apt-get autoremove -qy \
	&& rm -rf /var/lib/apt/lists/*