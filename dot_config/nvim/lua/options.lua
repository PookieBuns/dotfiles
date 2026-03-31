vim.g.mapleader = " "

-- visual
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.cursorlineopt = "screenline,number" -- wrapped lines will only highlight the screen line
vim.o.colorcolumn = "+1"
vim.o.signcolumn = "yes"
vim.o.list = true -- show whitespace characters
vim.o.foldlevelstart = 99
vim.o.winborder = "single"
vim.o.scrolloff = 10
vim.o.showmode = false
vim.o.wrap = false

-- undo
vim.o.undofile = true
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false

-- search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- show preview of replace
vim.o.inccommand = "split"

-- cmdline auto completion
vim.cmd([[
  autocmd CmdlineChanged [:\/\?] call wildtrigger()
  set wildmode=noselect:lastused,full
  set wildoptions=pum
  autocmd CmdlineEnter [/\?] set pumheight=8
  autocmd CmdlineLeave [/\?] set pumheight&
]])

-- misc
vim.o.clipboard = "unnamedplus"
