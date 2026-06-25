vim.opt.runtimepath:append({"/nix/store/36f315krgicjg5nlbsl7i7pydk1j02ql-treesitter-queries"})




-- SECTION: filetype
vim.filetype.add({["extension"] = {["mdx"] = "markdown"}})


-- SECTION: globalsScript
vim.g.editorconfig = true
vim.g.mapleader = " "
vim.g.maplocalleader = ","


-- SECTION: basic
vim.cmd("syntax on")








vim.o.smartcase = false
vim.o.ignorecase = false



-- SECTION: optionsScript
vim.opt.autoindent = true
vim.opt.backup = false
vim.opt.clipboard = ""
vim.opt.cmdheight = 1
vim.opt.cursorlineopt = "line"
vim.opt.encoding = "utf-8"
vim.opt.errorbells = false
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.mouse = "a"
vim.opt.mousemoveevent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 0
vim.opt.signcolumn = "yes"
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.tm = 500
vim.opt.updatetime = 300
vim.opt.visualbell = false
vim.opt.wrap = true
vim.opt.writebackup = false


-- SECTION: lazyConfigs
require('lz.n').load({{"cheatsheet-nvim",
["after"] = function()
  
  require("cheatsheet").setup({})
  
end
,
["before"] = function()
  require('lz.n').trigger_load('telescope')
end
,
["cmd"] = {"Cheatsheet",
"CheatsheetEdit"}},
{"cmp-buffer",
["after"] = function()
  
  
  local path = vim.fn.globpath(vim.o.packpath, 'pack/*/opt/cmp-buffer')
require("rtp_nvim").source_after_plugin_dir(path)

end
,
["lazy"] = true},
{"cmp-luasnip",
["after"] = function()
  
  
  local path = vim.fn.globpath(vim.o.packpath, 'pack/*/opt/cmp-luasnip')
require("rtp_nvim").source_after_plugin_dir(path)

end
,
["lazy"] = true},
{"cmp-path",
["after"] = function()
  
  
  local path = vim.fn.globpath(vim.o.packpath, 'pack/*/opt/cmp-path')
require("rtp_nvim").source_after_plugin_dir(path)

end
,
["lazy"] = true},
{"cmp-treesitter",
["after"] = function()
  
  
  local path = vim.fn.globpath(vim.o.packpath, 'pack/*/opt/cmp-treesitter')
require("rtp_nvim").source_after_plugin_dir(path)

end
,
["lazy"] = true},
{"comment-nvim",
["after"] = function()
  
  require("Comment").setup({["mappings"] = {["basic"] = false,
["extra"] = false}})
  
end
,
["keys"] = {{"gc",
"<Plug>(comment_toggle_linewise)",
["desc"] = "Toggle line comment",
["expr"] = false,
["mode"] = "n",
["noremap"] = true,
["nowait"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false},
{"gb",
"<Plug>(comment_toggle_blockwise)",
["desc"] = "Toggle block comment",
["expr"] = false,
["mode"] = "n",
["noremap"] = true,
["nowait"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false},
{"gcc",
function()
  return vim.api.nvim_get_vvar('count') == 0 and '<Plug>(comment_toggle_linewise_current)'
          or '<Plug>(comment_toggle_linewise_count)'
end
,
["desc"] = "Toggle current line comment",
["expr"] = true,
["mode"] = "n",
["noremap"] = true,
["nowait"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false},
{"gbc",
function()
  return vim.api.nvim_get_vvar('count') == 0 and '<Plug>(comment_toggle_blockwise_current)'
          or '<Plug>(comment_toggle_blockwise_count)'
end
,
["desc"] = "Toggle current block comment",
["expr"] = true,
["mode"] = {"n"},
["noremap"] = true,
["nowait"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false},
{"gc",
"<Plug>(comment_toggle_linewise_visual)",
["desc"] = "Toggle selected comment",
["expr"] = false,
["mode"] = "x",
["noremap"] = true,
["nowait"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false},
{"gb",
"<Plug>(comment_toggle_blockwise_visual)",
["desc"] = "Toggle selected block",
["expr"] = false,
["mode"] = "x",
["noremap"] = true,
["nowait"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false}}},
{"luasnip",
["after"] = function()
  
  require("luasnip").setup({["enable_autosnippets"] = false})
  
require('luasnip.loaders.from_vscode').lazy_load()

end
,
["lazy"] = true},
{"neo-tree-nvim",
["after"] = function()
  
  require("neo-tree").setup({["add_blank_line_at_top"] = true,
["auto_clean_after_session_restore"] = true,
["default_source"] = "filesystem",
["enable_cursor_hijack"] = false,
["enable_diagnostics"] = true,
["enable_git_status"] = true,
["enable_modified_markers"] = true,
["enable_opened_markers"] = true,
["enable_refresh_on_write"] = true,
["filesystem"] = {["hijack_netrw_behavior"] = "open_default"},
["git_status_async"] = true,
["hide_root_node"] = false,
["log_level"] = "info",
["log_to_file"] = false,
["open_files_do_not_replace_types"] = {"terminal",
"Trouble",
"qf",
"edgy"},
["open_files_in_last_window"] = true,
["retain_hidden_root_indent"] = false})
  
end
,
["cmd"] = {"Neotree"}},
{"noice-nvim",
["after"] = function()
  
  require("noice").setup({["format"] = {["cmdline"] = {["icon"] = "",
["lang"] = "vim",
["pattern"] = "^:"},
["filter"] = {["icon"] = "",
["lang"] = "bash",
["pattern"] = "^:%s*!"},
["help"] = {["icon"] = "󰋖",
["pattern"] = "^:%s*he?l?p?%s+"},
["lua"] = {["icon"] = "",
["lang"] = "lua",
["pattern"] = "^:%s*lua%s+"},
["search_down"] = {["icon"] = " ",
["kind"] = "search",
["lang"] = "regex",
["pattern"] = "^/"},
["search_up"] = {["icon"] = " ",
["kind"] = "search",
["lang"] = "regex",
["pattern"] = "^%?"}},
["lsp"] = {["override"] = {["cmp.entry.get_documentation"] = true,
["vim.lsp.util.convert_input_to_markdown_lines"] = true,
["vim.lsp.util.stylize_markdown"] = true},
["signature"] = {["enabled"] = false}},
["presets"] = {["bottom_search"] = true,
["command_palette"] = true,
["inc_rename"] = false,
["long_message_to_split"] = true,
["lsp_doc_border"] = false},
["routes"] = {{["filter"] = {["event"] = "msg_show",
["find"] = "written",
["kind"] = ""},
["opts"] = {["skip"] = true}}}})
  
end
,
["event"] = {"DeferredUIEnter"}},
{"nvim-autopairs",
["after"] = function()
  
  require("nvim-autopairs").setup({})
  
end
,
["event"] = {"InsertEnter"}},
{"nvim-cmp",
["after"] = function()
  
  
  local luasnip = require('luasnip')
local cmp = require("cmp")

local kinds = require("cmp.types").lsp.CompletionItemKind
local deprio = function(kind)
  return function(e1, e2)
    if e1:get_kind() == kind then
      return false
    end
    if e2:get_kind() == kind then
      return true
    end
    return nil
  end
end

cmp.setup({["completion"] = {["completeopt"] = "menu,menuone,noinsert"},
["formatting"] = {["format"] = function(entry, vim_item)
  vim_item.menu = ({["luasnip"] = "[LuaSnip]",
["treesitter"] = "[Treesitter]"})[entry.source.name]
  return vim_item
end
},
["mapping"] = {["<C-Space>"] = cmp.mapping.complete(),
["<C-d>"] = cmp.mapping.scroll_docs(-4),
["<C-e>"] = cmp.mapping.abort(),
["<C-f>"] = cmp.mapping.scroll_docs(4),
["<CR>"] = cmp.mapping.confirm({ select = true }),
["<S-Tab>"] = cmp.mapping(function(fallback)
  if cmp.visible() then
    cmp.select_prev_item()
    elseif luasnip.locally_jumpable(-1) then
  luasnip.jump(-1)

  else
    fallback()
  end
end)
,
["<Tab>"] = cmp.mapping(function(fallback)
  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  if cmp.visible() then
    cmp.select_next_item()
    elseif luasnip.locally_jumpable(1) then
  luasnip.jump(1)

  elseif has_words_before() then
    cmp.complete()
  else
    fallback()
  end
end)
},
["sorting"] = {["comparators"] = {deprio(kinds.Text),
deprio(kinds.Snippet),
cmp.config.compare.offset,
cmp.config.compare.exact,
cmp.config.compare.score,
cmp.config.compare.kind,
cmp.config.compare.length,
cmp.config.compare.sort_text}},
["sources"] = {{["name"] = "luasnip"},
{["name"] = "treesitter"}}})

require('lz.n').trigger_load("cmp-luasnip")
require('lz.n').trigger_load("cmp-buffer")
require('lz.n').trigger_load("cmp-path")
require('lz.n').trigger_load("cmp-treesitter")

end
,
["event"] = {"InsertEnter",
"CmdlineEnter"}},
{"nvim-web-devicons",
["after"] = function()
  
  require("nvim-web-devicons").setup({["color_icons"] = true,
["override"] = {}})
  
end
,
["event"] = {"DeferredUIEnter"}},
{"telescope",
["after"] = function()
  
  require("telescope").setup({["defaults"] = {["color_devicons"] = false,
["entry_prefix"] = "  ",
["extensions"] = {["fzf"] = {["case_mode"] = "smart_case",
["fuzzy"] = true,
["override_file_sorter"] = true,
["override_generic_sorter"] = true}},
["file_ignore_patterns"] = {"node_modules",
"%.git/",
"dist/",
"build/",
"target/",
"result/"},
["initial_mode"] = "insert",
["layout_config"] = {["height"] = 0.800000,
["horizontal"] = {["preview_width"] = 0.550000,
["prompt_position"] = "top"},
["preview_cutoff"] = 120,
["vertical"] = {["mirror"] = false},
["width"] = 0.800000},
["layout_strategy"] = "horizontal",
["path_display"] = {"absolute"},
["pickers"] = {["find_command"] = {"/nix/store/wci2b3l9gs8nq3alx6czffsq55bg44cv-fd-10.4.2/bin/fd"}},
["prompt_prefix"] = "     ",
["selection_caret"] = "  ",
["selection_strategy"] = "reset",
["set_env"] = {["COLORTERM"] = "truecolor"},
["sorting_strategy"] = "ascending",
["vimgrep_arguments"] = {"/nix/store/gxcm97c2a4sdnnabigp8mns7y1g5llnd-ripgrep-15.1.0/bin/rg",
"--color=never",
"--no-heading",
"--with-filename",
"--line-number",
"--column",
"--smart-case",
"--hidden",
"--no-ignore"},
["winblend"] = 0},
["pickers"] = {["find_files"] = {["find_command"] = {"/nix/store/wci2b3l9gs8nq3alx6czffsq55bg44cv-fd-10.4.2/bin/fd",
"--type=file"}}}})
  local telescope = require("telescope")
telescope.load_extension('noice')


telescope.load_extension('fzf')

end
,
["before"] = function()
  vim.g.loaded_telescope = nil

end
,
["cmd"] = {"Telescope"},
["keys"] = {{"<leader>ff",
"<cmd>Telescope find_files<CR>",
["desc"] = "Find files [Telescope]",
["expr"] = false,
["mode"] = "n",
["noremap"] = true,
["nowait"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false},
{"<leader>fg",
"<cmd>Telescope live_grep<CR>",
["desc"] = "Live grep [Telescope]",
["expr"] = false,
["mode"] = "n",
["noremap"] = true,
["nowait"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false},
{"<leader>fb",
"<cmd>Telescope buffers<CR>",
["desc"] = "Buffers [Telescope]",
["expr"] = false,
["mode"] = "n",
["noremap"] = true,
["nowait"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false},
{"<leader>fh",
"<cmd>Telescope help_tags<CR>",
["desc"] = "Help tags [Telescope]",
["expr"] = false,
["mode"] = "n",
["noremap"] = true,
["nowait"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false},
{"<leader>ft",
"<cmd>Telescope<CR>",
["desc"] = "Open [Telescope]",
["expr"] = false,
["mode"] = "n",
["noremap"] = true,
["nowait"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false},
{"<leader>fr",
"<cmd>Telescope resume<CR>",
["desc"] = "Resume (previous search) [Telescope]",
["expr"] = false,
["mode"] = "n",
["noremap"] = true,
["nowait"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false},
{"<leader>fvf",
"<cmd>Telescope git_files<CR>",
["desc"] = "Git files [Telescope]",
["expr"] = false,
["mode"] = "n",
["noremap"] = true,
["nowait"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false},
{"<leader>fvcw",
"<cmd>Telescope git_commits<CR>",
["desc"] = "Git commits [Telescope]",
["expr"] = false,
["mode"] = "n",
["noremap"] = true,
["nowait"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false},
{"<leader>fvcb",
"<cmd>Telescope git_bcommits<CR>",
["desc"] = "Git buffer commits [Telescope]",
["expr"] = false,
["mode"] = "n",
["noremap"] = true,
["nowait"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false},
{"<leader>fvb",
"<cmd>Telescope git_branches<CR>",
["desc"] = "Git branches [Telescope]",
["expr"] = false,
["mode"] = "n",
["noremap"] = true,
["nowait"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false},
{"<leader>fvs",
"<cmd>Telescope git_status<CR>",
["desc"] = "Git status [Telescope]",
["expr"] = false,
["mode"] = "n",
["noremap"] = true,
["nowait"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false},
{"<leader>fvx",
"<cmd>Telescope git_stash<CR>",
["desc"] = "Git stash [Telescope]",
["expr"] = false,
["mode"] = "n",
["noremap"] = true,
["nowait"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false},
{"<leader>fs",
"<cmd>Telescope treesitter<CR>",
["desc"] = "Treesitter [Telescope]",
["expr"] = false,
["mode"] = "n",
["noremap"] = true,
["nowait"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false}}}})
require('lzn-auto-require').enable()


-- SECTION: pluginConfigs
-- SECTION: alpha
require('alpha').setup(require'alpha.themes.theta'.config)


-- SECTION: conform-nvim
require("conform").setup({["default_format_opts"] = {["lsp_format"] = "fallback"},
["format_after_save"] = function()
  if not vim.g.formatsave or vim.b.disableFormatSave then
    return
  else
    return {["lsp_format"] = "fallback"}
  end
end
,
["format_on_save"] = function()
  if not vim.g.formatsave or vim.b.disableFormatSave then
    return
  else
    return {lsp_format = "fallback", timeout_ms = 500}
  end
end
,
["formatters"] = {["alejandra"] = {["command"] = "/nix/store/bzjds5493dg6wkv102wl8h5s4z8c2ibk-alejandra-4.0.0/bin/alejandra"},
["deno_fmt"] = {["command"] = "/nix/store/xw4ba4i58gcghzpxpx3f5ylxdv94hj07-deno-2.8.3/bin/deno"},
["fish_indent"] = {["command"] = "/nix/store/gdlvizwr80wwccx2v39h2as02rs0d1nb-fish-4.7.1/bin/fish_indent"},
["stylua"] = {["command"] = "/nix/store/6c08xajka26kkm70rranmd2y8aq46vdj-stylua-2.5.2/bin/stylua"},
["taplo"] = {["args"] = {"format",
"--stdin-filepath",
"$FILENAME",
"-"},
["command"] = "/nix/store/xs72i2n3d7b7s6vvjwck7m7l1cgxypiq-taplo-0.10.0/bin/taplo"}},
["formatters_by_ft"] = {["fish"] = {"fish_indent"},
["lua"] = {"stylua"},
["markdown"] = {"deno_fmt"},
["nix"] = {"alejandra"},
["toml"] = {"taplo"}}})


-- SECTION: gitsigns
require('gitsigns').setup({})


-- SECTION: indent-blankline
require("ibl").setup({["debounce"] = 200,
["indent"] = {["char"] = "│",
["priority"] = 1,
["repeat_linebreak"] = true,
["smart_indent_cap"] = true},
["scope"] = {["char"] = "│",
["enabled"] = true,
["exclude"] = {["language"] = {},
["node_type"] = {["*"] = {"source_file",
"program"},
["lua"] = {"chunk"},
["python"] = {"module"}}},
["include"] = {["node_type"] = {}},
["injected_languages"] = true,
["priority"] = 1024,
["show_end"] = false,
["show_exact_scope"] = false,
["show_start"] = false},
["viewport_buffer"] = {["max"] = 500,
["min"] = 30},
["whitespace"] = {["remove_blankline_trail"] = true}})


-- SECTION: lualine
local lualine = require('lualine')
lualine.setup {["extensions"] = {"neo-tree"},
["inactive_sections"] = {["lualine_a"] = {},
["lualine_b"] = {},
["lualine_c"] = {'filename'},
["lualine_x"] = {'location'},
["lualine_y"] = {},
["lualine_z"] = {}},
["options"] = {["always_divide_middle"] = true,
["component_separators"] = {["left"] = "",
["right"] = ""},
["disabled_filetypes"] = {["statusline"] = {"alpha"},
["winbar"] = {}},
["globalstatus"] = true,
["icons_enabled"] = true,
["ignore_focus"] = {"NvimTree"},
["refresh"] = {["statusline"] = 1000,
["tabline"] = 1000,
["winbar"] = 1000},
["section_separators"] = {["left"] = "",
["right"] = ""},
["theme"] = "auto"},
["sections"] = {["lualine_a"] = {{
  "mode",
  icons_enabled = true,
  separator = {
    left = '▎',
    right = ''
  },
}
,
{
  "",
  draw_empty = true,
  separator = { left = '', right = '' }
}
},
["lualine_b"] = {{
  "filetype",
  colored = true,
  icon_only = true,
  icon = { align = 'left' }
}
,
{
  "filename",
  symbols = {modified = ' ', readonly = ' '},
  separator = {right = ''}
}
,
{
  "",
  draw_empty = true,
  separator = { left = '', right = '' }
}
},
["lualine_c"] = {{
  "diff",
  colored = false,
  diff_color = {
    -- Same color values as the general color option can be used here.
    added    = 'DiffAdd',    -- Changes the diff's added color
    modified = 'DiffChange', -- Changes the diff's modified color
    removed  = 'DiffDelete', -- Changes the diff's removed color you
  },
  symbols = {added = '+', modified = '~', removed = '-'}, -- Changes the diff symbols
  separator = {right = ''}
}
},
["lualine_x"] = {{
  -- Lsp server name
  function()
    local buf_ft = vim.bo.filetype
    local excluded_buf_ft = { toggleterm = true, NvimTree = true, ["neo-tree"] = true, TelescopePrompt = true }

    if excluded_buf_ft[buf_ft] then
      return ""
      end

    local bufnr = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients({ bufnr = bufnr })

    if vim.tbl_isempty(clients) then
      return "No Active LSP"
    end

    local active_clients = {}
    for _, client in ipairs(clients) do
      table.insert(active_clients, client.name)
    end

    return table.concat(active_clients, ", ")
  end,
  icon = ' ',
  separator = {left = ''},
}
,
{
  "diagnostics",
  sources = {'nvim_lsp', 'nvim_diagnostic', 'nvim_diagnostic', 'vim_lsp', 'coc'},
  symbols = {error = '󰅙  ', warn = '  ', info = '  ', hint = '󰌵 '},
  colored = true,
  update_in_insert = false,
  always_visible = false,
  diagnostics_color = {
    color_error = { fg = 'red' },
    color_warn = { fg = 'yellow' },
    color_info = { fg = 'cyan' },
  },
}
},
["lualine_y"] = {{
  "",
  draw_empty = true,
  separator = { left = '', right = '' }
}
,
{
  'searchcount',
  maxcount = 999,
  timeout = 120,
  separator = {left = ''}
}
,
{
  "branch",
  icon = ' •',
  separator = {left = ''}
}
},
["lualine_z"] = {{
  "",
  draw_empty = true,
  separator = { left = '', right = '' }
}
,
{
  "progress",
  separator = {left = ''}
}
,
{"location"}
,
{
  "fileformat",
  color = {fg='black'},
  symbols = {
    unix = '', -- e712
    dos = '',  -- e70f
    mac = '',  -- e711
  }
}
}}}


-- SECTION: mini-icons
require("mini.icons").setup({})


-- SECTION: neo-tree
vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("load_neo_tree", {}),
  desc = "Loads neo-tree when opening a directory",
  callback = function(args)
    local stats = vim.uv.fs_stat(args.file)

    if not stats or stats.type ~= "directory" then
      return
    end

    require("lz.n").trigger_load("neo-tree-nvim")

    return true
  end,
})


-- SECTION: nvim-cursorline
require("nvim-cursorline").setup({["cursorline"] = {["enable"] = false,
["number"] = false,
["timeout"] = 1000},
["cursorword"] = {["enable"] = false,
["hl"] = {["underline"] = true},
["min_length"] = 3,
["timeout"] = 1000}})


-- SECTION: nvimBufferline
require("bufferline").setup({["highlights"] = {},
["options"] = {["always_show_bufferline"] = true,
["auto_toggle_bufferline"] = true,
["buffer_close_icon"] = " 󰅖 ",
["close_command"] = function(bufnum)
  require("bufdelete").bufdelete(bufnum, false)
end
,
["close_icon"] = "  ",
["color_icons"] = true,
["diagnostics"] = "nvim_lsp",
["diagnostics_indicator"] = function(count, level, diagnostics_dict, context)
  local s = " "
    for e, n in pairs(diagnostics_dict) do
      local sym = e == "error" and "   "
        or (e == "warning" and "   " or "  " )
      s = s .. n .. sym
    end
  return s
end
,
["diagnostics_update_in_insert"] = false,
["duplicates_across_groups"] = true,
["enforce_regular_tabs"] = false,
["hover"] = {["delay"] = 200,
["enabled"] = true,
["reveal"] = {"close"}},
["indicator"] = {["style"] = "underline"},
["left_mouse_command"] = "buffer %d",
["left_trunc_marker"] = "",
["max_name_length"] = 18,
["max_prefix_length"] = 15,
["mode"] = "buffers",
["modified_icon"] = "● ",
["move_wraps_at_ends"] = false,
["numbers"] = function(opts)
  return string.format('%s·%s', opts.raise(opts.id), opts.lower(opts.ordinal))
end
,
["offsets"] = {{["filetype"] = "NvimTree",
["highlight"] = "Directory",
["separator"] = true,
["text"] = "File Explorer"},
{["filetype"] = "neo-tree",
["highlight"] = "Directory",
["separator"] = true,
["text"] = "File Explorer"},
{["filetype"] = "snacks_layout_box",
["highlight"] = "Directory",
["separator"] = true,
["text"] = "File Explorer"}},
["persist_buffer_sort"] = true,
["right_mouse_command"] = "vertical sbuffer %d",
["right_trunc_marker"] = "",
["separator_style"] = "thin",
["show_buffer_close_icons"] = true,
["show_buffer_icons"] = true,
["show_close_icon"] = true,
["show_duplicate_prefix"] = true,
["show_tab_indicators"] = true,
["sort_by"] = "extension",
["style_preset"] = require('bufferline').style_preset.default,
["tab_size"] = 18,
["themable"] = true,
["truncate_names"] = true}})


-- SECTION: treesitter-autocommands
vim.api.nvim_create_augroup("nvf_treesitter", { clear = true })

-- Enable treesitter highlighting for all filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = "nvf_treesitter",
  pattern = "*",
  callback = function()
    pcall(vim.treesitter.start)
  end,
})







-- SECTION: treesitter-filetype-mappings
for lang, ft in pairs({}) do
  vim.treesitter.language.register(lang, ft)
end


-- SECTION: whichkey
local wk = require("which-key")
wk.setup ({["notify"] = true,
["preset"] = "modern",
["replace"] = {["<cr>"] = "RETURN",
["<leader>"] = "SPACE",
["<space>"] = "SPACE",
["<tab>"] = "TAB"},
["win"] = {["border"] = "rounded"}})
wk.add({{{ '<leader>b', desc = '+Buffer' }},
{{ '<leader>bm', desc = 'BufferLineMove' }},
{{ '<leader>bs', desc = 'BufferLineSort' }},
{{ '<leader>bsi', desc = 'BufferLineSortById' }},
{{ '<leader>f', desc = '+Telescope' }},
{{ '<leader>fl', desc = 'Telescope LSP' }},
{{ '<leader>fm', desc = 'Cellular Automaton' }},
{{ '<leader>fv', desc = 'Telescope Git' }},
{{ '<leader>fvc', desc = 'Commits' }},
{{ '<leader>h', desc = '+Gitsigns' }}})




-- SECTION: augroups
local nvf_autogroups = {}
for _, group in ipairs({{["clear"] = true,
["enable"] = true,
["name"] = "nvf_lazy_file_hooks"}}) do
  if group.name then
    nvf_autogroups[group.name] = { clear = group.clear }
  end
end

for group_name, options in pairs(nvf_autogroups) do
  vim.api.nvim_create_augroup(group_name, options)
end


-- SECTION: autocmds
local nvf_autocommands = {{["command"] = "doautocmd User LazyFile",
["enable"] = true,
["event"] = {"BufReadPost",
"BufNewFile",
"BufWritePre"},
["group"] = "nvf_lazy_file_hooks",
["nested"] = false,
["once"] = true},
{["callback"] = 
          function()
            vim.keymap.set("n", "c", function()
              vim.cmd("edit /home/kim/nixos-config/modules/home/neovim/default.nix")
            end, { buffer = true })
          end
,
["desc"] = "Edit nvf config",
["enable"] = true,
["event"] = {"FileType"},
["nested"] = false,
["once"] = false,
["pattern"] = {"alpha"}},
{["callback"] = 
          function()
            local mark = vim.api.nvim_buf_get_mark(0, '"')
            local lcount = vim.api.nvim_buf_line_count(0)
            if mark[1] > 0 and mark[1] <= lcount then
              pcall(vim.api.nvim_win_set_cursor, 0, mark)
            end
          end
,
["enable"] = true,
["event"] = {"BufReadPost"},
["nested"] = false,
["once"] = false,
["pattern"] = {"*"}}}
for _, autocmd in ipairs(nvf_autocommands) do
  vim.api.nvim_create_autocmd(
    autocmd.event,
    {
      group     = autocmd.group,
      pattern   = autocmd.pattern,
      buffer    = autocmd.buffer,
      desc      = autocmd.desc,
      callback  = autocmd.callback,
      command   = autocmd.command,
      once      = autocmd.once,
      nested    = autocmd.nested
    }
  )
end



-- SECTION: lsp-util
-- Port of nvim-lspconfig util
local util = { path = {} }

util.default_config = {
  log_level = vim.lsp.protocol.MessageType.Warning,
  message_level = vim.lsp.protocol.MessageType.Warning,
  settings = vim.empty_dict(),
  init_options = vim.empty_dict(),
  handlers = {},
  autostart = true,
  capabilities = vim.lsp.protocol.make_client_capabilities(),
}

-- global on_setup hook
util.on_setup = nil

do
  local validate = vim.validate
  local api = vim.api
  local lsp = vim.lsp
  local nvim_eleven = vim.fn.has 'nvim-0.11' == 1

  local iswin = vim.uv.os_uname().version:match 'Windows'

  local function escape_wildcards(path)
    return path:gsub('([%[%]%?%*])', '\\%1')
  end

  local function is_fs_root(path)
    if iswin then
      return path:match '^%a:$'
    else
      return path == '/'
    end
  end

  local function traverse_parents(path, cb)
    path = vim.uv.fs_realpath(path)
    local dir = path
    -- Just in case our algo is buggy, don't infinite loop.
    for _ = 1, 100 do
      dir = vim.fs.dirname(dir)
      if not dir then
        return
      end
      -- If we can't ascend further, then stop looking.
      if cb(dir, path) then
        return dir, path
      end
      if is_fs_root(dir) then
        break
      end
    end
  end

  util.root_pattern = function(...)
    local patterns = util.tbl_flatten { ... }
    return function(startpath)
      startpath = util.strip_archive_subpath(startpath)
      for _, pattern in ipairs(patterns) do
        local match = util.search_ancestors(startpath, function(path)
          for _, p in ipairs(vim.fn.glob(table.concat({ escape_wildcards(path), pattern }, '/'), true, true)) do
            if vim.uv.fs_stat(p) then
              return path
            end
          end
        end)

        if match ~= nil then
          return match
        end
      end
    end
  end

  util.root_markers_with_field = function(root_files, new_names, field, fname)
    local path = vim.fn.fnamemodify(fname, ':h')
    local found = vim.fs.find(new_names, { path = path, upward = true })

    for _, f in ipairs(found or {}) do
      -- Match the given `field`.
      for line in io.lines(f) do
        if line:find(field) then
          root_files[#root_files + 1] = vim.fs.basename(f)
          break
        end
      end
    end

    return root_files
  end

  util.insert_package_json = function(root_files, field, fname)
    return util.root_markers_with_field(root_files, { 'package.json', 'package.json5' }, field, fname)
  end

  util.strip_archive_subpath = function(path)
    -- Matches regex from zip.vim / tar.vim
    path = vim.fn.substitute(path, 'zipfile://\\(.\\{-}\\)::[^\\\\].*$', '\\1', '')
    path = vim.fn.substitute(path, 'tarfile:\\(.\\{-}\\)::.*$', '\\1', '')
    return path
  end

  util.get_typescript_server_path = function(root_dir)
    local project_roots = vim.fs.find('node_modules', { path = root_dir, upward = true, limit = math.huge })
    for _, project_root in ipairs(project_roots) do
      local typescript_path = project_root .. '/typescript'
      local stat = vim.loop.fs_stat(typescript_path)
      if stat and stat.type == 'directory' then
        return typescript_path .. '/lib'
      end
    end
    return ''
  end

  util.search_ancestors = function(startpath, func)
    if nvim_eleven then
      validate('func', func, 'function')
    end
    if func(startpath) then
      return startpath
    end
    local guard = 100
    for path in vim.fs.parents(startpath) do
      -- Prevent infinite recursion if our algorithm breaks
      guard = guard - 1
      if guard == 0 then
        return
      end

      if func(path) then
        return path
      end
    end
  end

  util.path.is_descendant = function(root, path)
    if not path then
      return false
    end

    local function cb(dir, _)
      return dir == root
    end

    local dir, _ = traverse_parents(path, cb)

    return dir == root
  end

  util.tbl_flatten = function(t)
    --- @diagnostic disable-next-line:deprecated
    return nvim_eleven and vim.iter(t):flatten(math.huge):totable() or vim.tbl_flatten(t)
  end
end


-- SECTION: lsp-servers
-- Individual LSP configurations managed by nvf.
vim.lsp.config["*"] = {["capabilities"] = capabilities,
["enable"] = true}

vim.lsp.config["fish-lsp"] = {["cmd"] = {"/nix/store/pm3xs7bw38icvypkvsrr0fk15q4v9smq-fish-lsp-1.1.3/bin/fish-lsp",
"start"},
["enable"] = true,
["filetypes"] = {"fish"},
["root_markers"] = {"config.fish",
".git"}}

vim.lsp.config["lua-language-server"] = {["cmd"] = {"/nix/store/wawpsdpdr5mrcmmi9c9rq7rl5pyyz2j3-lua-language-server-3.18.1/bin/lua-language-server"},
["enable"] = true,
["filetypes"] = {"lua"},
["root_markers"] = {".luarc.json",
".luarc.jsonc",
".luacheckrc",
".stylua.toml",
"stylua.toml",
"selene.toml",
"selene.yml",
".git"}}

vim.lsp.config["marksman"] = {["cmd"] = {"/nix/store/n68hlxz0ywx2k84s4fnnhwba38i048iw-marksman-2026-02-08/bin/marksman",
"server"},
["enable"] = true,
["filetypes"] = {"markdown"},
["root_markers"] = {".git",
".marksman.toml"}}

vim.lsp.config["nixd"] = {["cmd"] = {"/nix/store/5zwl72j3iqx0k355y7rlx2w271rdyva5-nixd-2.9.1/bin/nixd"},
["enable"] = true,
["filetypes"] = {"nix"},
["root_markers"] = {"flake.nix",
".git"}}

vim.lsp.config["taplo"] = {["cmd"] = {"/nix/store/xs72i2n3d7b7s6vvjwck7m7l1cgxypiq-taplo-0.10.0/bin/taplo",
"lsp",
"stdio"},
["enable"] = true,
["filetypes"] = {"toml"},
["root_markers"] = {".git"}}



-- Enable configured LSPs explicitly
vim.lsp.enable({"fish-lsp",
"lua-language-server",
"marksman",
"nixd",
"taplo"})


-- SECTION: mappings
vim.keymap.set("n", "<leader>bn", ":BufferLineCycleNext<CR>", {["desc"] = "Next buffer",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>bn", ":BufferLineCycleNext<CR>", {["desc"] = "Next buffer",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>bp", ":BufferLineCyclePrev<CR>", {["desc"] = "Previous buffer",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>bc", ":BufferLinePick<CR>", {["desc"] = "Pick buffer",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>bse", ":BufferLineSortByExtension<CR>", {["desc"] = "Sort buffers by extension",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>bsd", ":BufferLineSortByDirectory<CR>", {["desc"] = "Sort buffers by directory",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>bsi", function() require('bufferline').sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end) end, {["desc"] = "Sort buffers by ID",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>bmn", ":BufferLineMoveNext<CR>", {["desc"] = "Move next buffer",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>bmp", ":BufferLineMovePrev<CR>", {["desc"] = "Move previous buffer",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "]c", function()
  if vim.wo.diff then return "]c" end

  vim.schedule(function() package.loaded.gitsigns.next_hunk() end)

  return '<Ignore>'
end
, {["desc"] = "Next hunk [Gitsigns]",
["expr"] = true,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "[c", function()
  if vim.wo.diff then return "[c" end

  vim.schedule(function() package.loaded.gitsigns.prev_hunk() end)

  return '<Ignore>'
end
, {["desc"] = "Previous hunk [Gitsigns]",
["expr"] = true,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>hs", package.loaded.gitsigns.stage_hunk, {["desc"] = "Stage hunk [Gitsigns]",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>hr", package.loaded.gitsigns.reset_hunk, {["desc"] = "Reset hunk [Gitsigns]",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>hu", package.loaded.gitsigns.undo_stage_hunk, {["desc"] = "Undo stage hunk [Gitsigns]",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>hS", package.loaded.gitsigns.stage_buffer, {["desc"] = "Stage buffer [Gitsigns]",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>hR", package.loaded.gitsigns.reset_buffer, {["desc"] = "Reset buffer [Gitsigns]",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>hP", package.loaded.gitsigns.preview_hunk, {["desc"] = "Preview hunk [Gitsigns]",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>hb", function() package.loaded.gitsigns.blame_line{full=true} end, {["desc"] = "Blame line [Gitsigns]",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>tb", package.loaded.gitsigns.toggle_current_line_blame, {["desc"] = "Toggle blame [Gitsigns]",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>hd", package.loaded.gitsigns.diffthis, {["desc"] = "Diff this [Gitsigns]",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>hD", function() package.loaded.gitsigns.diffthis('~') end, {["desc"] = "Diff project [Gitsigns]",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>td", package.loaded.gitsigns.toggle_deleted, {["desc"] = "Toggle deleted [Gitsigns]",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("v", "<leader>hs", function() package.loaded.gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {["desc"] = "Stage hunk [Gitsigns]",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("v", "<leader>hr", function() package.loaded.gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {["desc"] = "Reset hunk [Gitsigns]",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", {["desc"] = "Save File",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>W", "<cmd>wa<CR>", {["desc"] = "Save All",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>q", "<cmd>q!<CR>", {["desc"] = "Quit",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>Q", "<cmd>qa!<CR>", {["desc"] = "Quit All",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>s", "<nop>", {["desc"] = " Split Management",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>sh", "<cmd>split<CR>", {["desc"] = "Horizontal Split",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<CR>", {["desc"] = "Vertical Split",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>sc", "<cmd>close<CR>", {["desc"] = "Close Current",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>so", "<cmd>only<CR>", {["desc"] = "Close Others",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>m", "<nop>", {["desc"] = "󰖯 Movement & Resize",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>mh", "<C-w>h", {["desc"] = "Move Left",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>mj", "<C-w>j", {["desc"] = "Move Down",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>mk", "<C-w>k", {["desc"] = "Move Up",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>ml", "<C-w>l", {["desc"] = "Move Right",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>m<Up>", "<cmd>resize -2<CR>", {["desc"] = "Resize Up",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>m<Down>", "<cmd>resize +2<CR>", {["desc"] = "Resize Down",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>m<Left>", "<cmd>vertical resize -2<CR>", {["desc"] = "Resize Left",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>m<Right>", "<cmd>vertical resize +2<CR>", {["desc"] = "Resize Right",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set({"n",
"v"}, "<leader>y", "\"+y", {["desc"] = "Yank to clipboard",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set({"n",
"v"}, "<leader>Y", "\"+Y", {["desc"] = "Yank line to clipboard",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>p", "\"+p", {["desc"] = "Paste from clipboard",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>u", "<nop>", {["desc"] = "󰔑 UI Toggles",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>ul", "<cmd>set nu! rnu!<CR>", {["desc"] = "Toggle Numbers",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>uc", "<cmd>nohl<CR>", {["desc"] = "Clear Highlight",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})



