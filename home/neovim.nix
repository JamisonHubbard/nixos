{
    pkgs,
    ...
}: let
	treesitterWithGrammars = (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
	    p.bash
	    p.c
	    p.cpp
	    p.css
	    p.csv
	    p.diff
	    p.dockerfile
	    p.go
	    p.html
	    p.java
	    p.javascript
	    p.jq
	    p.jsdoc
	    p.json
	    p.json5
	    p.lua
	    p.markdown
	    p.nix
	    p.python
	    p.regex
	    p.rust
	    p.scss
	    p.sql
	    p.tmux
	    p.toml
	    p.typescript
	    p.vim
	    p.vimdoc
	    p.xml
	    p.yaml
	]));

	treesitter-parsers = pkgs.symlinkJoin {
	    name = "treesitter-parsers";
	    paths = treesitterWithGrammars.dependencies;
	};
in {
	home.packages = with pkgs; [
	    lua-language-server
	    rust-analyzer-unwrapped
	];

	programs.neovim = {
	    enable = true;
	    vimAlias = true;
      defaultEditor = true;
      withNodeJs = true;

	    plugins = [
            treesitterWithGrammars
	    ];
	};

	home.file."./.config/nvim/lua/parsers.lua".text = ''
	    vim.opt.runtimepath:append("${treesitter-parsers}")
	'';

	home.file."./.local/share/nvim/nix/nvim-treesitter/" = {
	    recursive = true;
	    source = treesitterWithGrammars;
	};
}
