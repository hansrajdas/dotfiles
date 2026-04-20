-- ============================================================
-- Options (migrated from ~/.vimrc)
-- ============================================================
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.ignorecase     = true
vim.opt.smartcase      = true
vim.opt.hlsearch       = true
vim.opt.incsearch      = true
vim.opt.ruler          = true
vim.opt.tabstop        = 4
vim.opt.shiftwidth     = 4
vim.opt.autoindent     = true
vim.opt.smartindent    = true
vim.opt.expandtab      = true
vim.opt.cursorline     = true
vim.opt.mouse          = ""
vim.opt.laststatus     = 0    -- hide statusline
vim.opt.cmdheight      = 0    -- hide command line when not in use
vim.opt.diffopt:append("vertical")

-- Search down into subfolders (used by :find)
vim.opt.path:append("**")

-- Skip *.pyc files in :find
vim.opt.wildignore:append("**/*.pyc")
vim.opt.wildmenu = true

-- Syntax and filetype
vim.cmd("syntax enable")
vim.cmd("filetype plugin on")
vim.cmd("colorscheme vim")

-- ColorColumn highlight (column itself off by default, matching vimrc)
-- Uncomment the next line to enable: vim.opt.colorcolumn = "100"
vim.cmd("highlight ColorColumn ctermbg=red")

-- ============================================================
-- Bootstrap lazy.nvim (plugin manager)
-- ============================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- ============================================================
-- Plugins (migrated from vim-plug)
-- ============================================================
require("lazy").setup({
    -- fzf binary (use Homebrew installation directly)
    { dir = "/usr/local/opt/fzf" },
    -- fzf.vim commands (:Files, :Buffers, :Rg, etc.)
    { "junegunn/fzf.vim" },
    -- Go development
    {
        "fatih/vim-go",
        build = ":GoUpdateBinaries",
        ft = { "go" },
    },
}, {
    -- lazy.nvim UI inside a floating window
    ui = { border = "rounded" },
})

-- ============================================================
-- Plugin settings
-- ============================================================
vim.g.go_gopls_enabled      = 1
vim.g.go_use_language_server = 1

-- Preview window: top 40%, toggle with ctrl-/
vim.g.fzf_preview_window = { "up:40%", "ctrl-/" }

-- ============================================================
-- Key mappings
-- ============================================================
local map = vim.keymap.set

-- fzf file finder
map("n", "<C-p>", ":Files<CR>",   { desc = "fzf: find files" })
-- fzf buffer list
map("n", "<Leader>b", ":Buffers<CR>", { desc = "fzf: buffers" })
-- Next file in arglist
map("n", "<C-n>", ":n<CR>",       { desc = "Next file in arglist" })
-- Write and move to next file
map("n", "<C-s>", ":wn<CR>",      { desc = "Write and next file" })
-- Ripgrep search (no <CR> — waits for search term)
map("n", "<C-l>", ":Rg ",         { desc = "fzf: ripgrep search" })

-- ============================================================
-- User commands
-- ============================================================
vim.api.nvim_create_user_command("Py", "! python3 %", { desc = "Run current file with python3" })
vim.api.nvim_create_user_command("Go", "! go run %",  { desc = "Run current file with go run" })

-- Custom :Rg command — skips z/, .git/, tags, cscope files
vim.cmd([[
    command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case --ignore-case'
      \   . ' --glob "!z/*" --glob "!.git/*" --glob "!tags" --glob "!cscope.*" '
      \   . shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:50%')
      \          : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
      \   <bang>0)
]])
