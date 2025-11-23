-- Visual
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.colorcolumn = "88"
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.scrolloff = 10
-- lualine already shows mode
vim.opt.showmode = false

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Undo
vim.opt.undofile = true
vim.opt.backup = false
vim.opt.writebackup = false

-- Miscellaneous
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.clipboard = "unnamedplus"
vim.opt.wildmenu = true

-- Show preview of replace
vim.opt.inccommand = "split"

-- Unsure but in kickstart.lua
vim.opt.breakindent = true

-- clipboard
local win32yank_path = '/mnt/c/Program Files/win32yank-x64/win32yank.exe'
if vim.env.WSL_DISTRO_NAME then
    vim.g.clipboard = {
        name = 'win32yank-wsl',
        copy = {
            ['+'] = { win32yank_path, '-i', '--crlf' },
            ['*'] = { win32yank_path, '-i', '--crlf' },
        },
        paste = {
            ['+'] = { win32yank_path, '-o', '--lf' },
            ['*'] = { win32yank_path, '-o', '--lf' },
        },
        cache_enabled = 0,
    }
end
