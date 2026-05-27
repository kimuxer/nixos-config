{ ... }: {
  programs.nixvim.keymaps =[
    { key = "<C-s>"; action = ":w<CR>"; }
    { key = "<esc>"; action = ":noh<CR>"; options.silent = true; }
    { key = "<leader>k"; action = "<cmd>bdelete<cr>"; }
    
    # Telescope
    { key = "<leader>f"; action = "<cmd>Telescope find_files<cr>"; }
    { key = "<leader>g"; action = "<cmd>Telescope live_grep<cr>"; }
    { key = "<leader>b"; action = "<cmd>Telescope buffers<cr>"; }
    { key = "<leader>t"; action = "<cmd>Telescope help_tags<cr>"; }
    
    # Neo-tree
    { key = "<leader>nn"; action = "<cmd>Neotree<cr>"; }
    { key = "<leader>nb"; action = "<cmd>Neotree buffers<cr>"; }
    { key = "<leader>ng"; action = "<cmd>Neotree float git_status<cr>"; }
    { key = "<leader>nc"; action = "<cmd>Neotree close<cr>"; }
    
    # SnipRun
    { key = "<leader>sr"; action = "<cmd>SnipRun<cr>"; }
    { key = "<leader>ss"; action = "<cmd>'<,'>SnipRun<cr>"; }
    { key = "<leader>sd"; action = "<cmd>SnipReset<cr>"; }
    { key = "<leader>sc"; action = "<cmd>SnipClose<cr>"; }
  ];
}
