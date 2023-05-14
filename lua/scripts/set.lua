vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- vim.g.clipboard = {
--   name = 'WslClipboard',
--   copy = {
--     ['+'] = 'clip.exe',
--     ['*'] = 'clip.exe',
--   },
--   paste = {
--     ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--     ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--   },
--   cache_enabled = 0,
-- }

-- vim.g.clipboard = "unnamedplus"
-- vim.clipboard = "unnamedplus"

-- vim.g.clipboard = {
--   name = 'WslClipboard',
--   copy = {
--     ['+'] = '$NEOVIM_WIN_DIR/bin/win32yank.exe -i --crlf',
--     ['*'] = '$NEOVIM_WIN_DIR/bin/win32yank.exe -i --crlf',
--   },
--   paste = {
--     ['+'] = '$NEOVIM_WIN_DIR/bin/win32yank.exe -i --lf',
--     ['*'] = '$NEOVIM_WIN_DIR/bin/win32yank.exe -i --lf',
--   },
--   cache_enabled = 0,
-- }

local win32yank = vim.fn.expand('$NEOVIM_WIN_DIR/bin/win32yank.exe')
vim.g.clipboard = {
  name = 'wsl',
  copy = {
    ['+'] = win32yank .. ' -i --crlf',
    ['*'] = win32yank .. ' -i --crlf',
  },
  paste = {
    ['+'] = win32yank .. ' -o --lf',
    ['*'] = win32yank .. ' -o --lf',
  },
}
win32yank = nil
