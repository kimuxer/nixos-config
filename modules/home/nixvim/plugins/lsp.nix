{ ... }: {
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        bashls.enable = true;
        html.enable = true;
        nil_ls.enable = true;
        pyright.enable = true;
        rust_analyzer = {
	  enable = true;
	  installCargo = true;
  	  installRustc = true;
	};
      };
    };

    cmp = {
      enable = true;
      settings.sources =[ 
        { name = "nvim_lsp"; } 
        { name = "path"; } 
        { name = "buffer"; } 
        { name = "rg"; } 
      ];
    };
    cmp-nvim-lsp.enable = true;
    cmp-path.enable = true;
    cmp-buffer.enable = true;
    cmp-rg.enable = true;
  };
}
