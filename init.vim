" This file is always ran on every start of neovim

" WARNING: vim functions return '1' for true and '0' for false!
" Reference: ':h usr_41' for variables

" Determine config path
if has('nvim')
	let configDir = '~/.config/nvim'
endif

" Load plugins
" FIXME: Use value of 'configDir' variable
call plug#begin('~/.config/nvim/plugged')
	" Specify a directory for plugins
	"stdpath('data') . '/plugged'

	" File browser
	Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

	" auto-completions
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	" Linting
	Plug 'dense-analysis/ale'

	" Ranger
	Plug 'francoiscabrol/ranger.vim'
	if has('nvim')
		" Ranger has bclose dependency on NeoVim
		Plug 'rbgrouleff/bclose.vim'
	endif

	" Colorizer (https://github.com/norcalli/nvim-colorizer.lua)
	Plug 'norcalli/nvim-colorizer.lua'
call plug#end()

# ALE configuration
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'


" Configuration for regular NeoVim
if has('nvim')

" Configuration for NeoVim in vscode
else if exists('g:vscode')
	true " FIXME

endif