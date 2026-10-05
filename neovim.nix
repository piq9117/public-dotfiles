final: prev: 
let
  nvimConfigPath = "/home/piq9117/dotfiles/overlays/nvim";
in {
  neovim = prev.neovim.override { 
    viAlias = true;
    vimAlias = true;
    configure = {
      customRC = ''
        set mouse=
	source ${nvimConfigPath}/themes.lua
	source ${nvimConfigPath}/mappings.lua
        source ${nvimConfigPath}/gitsigns.lua
	source ${nvimConfigPath}/lualine.lua
	source ${nvimConfigPath}/lspconfig.lua
	source ${nvimConfigPath}/comment.lua
	source ${nvimConfigPath}/diagnostic.lua
	source ${nvimConfigPath}/lspconfig.lua
	source ${nvimConfigPath}/which-key.lua
	source ${nvimConfigPath}/treesitter.lua
	source ${nvimConfigPath}/neodev.lua
	source ${nvimConfigPath}/telescope.lua
	source ${nvimConfigPath}/blankline.lua
	source ${nvimConfigPath}/oil.lua
	source ${nvimConfigPath}/toggleterm.lua
	source ${nvimConfigPath}/greeter.lua
	source ${nvimConfigPath}/hop.lua
      '';

      packages.main.start = with final.vimPlugins; [
        cmp-nvim-lsp
	cmp-path
	cmp_luasnip
	comment-nvim
	fidget-nvim
	friendly-snippets
	gitsigns-nvim
	indent-blankline-nvim
	lsp-zero-nvim
	lualine-nvim
	luasnip
	neodev-nvim
	nvim-cmp
	nvim-lspconfig
	nvim-treesitter
	nvim-treesitter-textobjects
	plenary-nvim
	telescope-file-browser-nvim
	telescope-fzf-native-nvim
	telescope-nvim
	vim-fugitive
	vim-rhubarb
	vim-sleuth
	which-key-nvim
	oil-nvim
	toggleterm-nvim
	alpha-nvim
        mkdnflow-nvim
	vim-jinja
	hop-nvim

	# themes
	onedark-nvim
	catppuccin-nvim
	monokai-pro-nvim
	nightfox-nvim
	vscode-nvim

	(nvim-treesitter.withPlugins (p: 
	[
	  p.haskell
	  p.terraform
	  p.go
	  p.purescript
	  p.sql
	  p.lua 
	  p.typescript 
	  p.tsx 
	  p.javascript 
	  p.vimdoc 
	  p.vim 
	  p.bash
	  p.thrift
	  p.c
	  p.vue
	]))
      ];
    };
  };
}

