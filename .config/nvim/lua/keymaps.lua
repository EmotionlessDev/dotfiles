vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false })

-- twilight
vim.api.nvim_set_keymap("n", "TW", ":Twilight<enter>", { noremap = false })

-- buffers
vim.api.nvim_set_keymap("n", "<C-d>", ":bprev<enter>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-n>", ":bnext<enter>", { noremap = true })
vim.api.nvim_set_keymap("n", "⌃⌫", ":bdelete<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "⌘,", ":bdelete<enter>", { noremap = false })

-- files
vim.api.nvim_set_keymap("n", "QQ", ":q!<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "E", "$", { noremap = false })
vim.api.nvim_set_keymap("n", "B", "^", { noremap = false })
vim.api.nvim_set_keymap("n", "ss", ":noh<CR>", { noremap = true })

-- splits
vim.api.nvim_set_keymap("n", "<C-W>,", ":vertical resize -10<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-W>.", ":vertical resize +10<CR>", { noremap = true })
vim.keymap.set('n', '<space><space>', "<cmd>set nohlsearch<CR>")

-- Quicker close split
vim.keymap.set("n", "<leader>qq", ":q<CR>", { silent = true, noremap = true })

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set("i", "<F2>", "<ESC>:w!<CR>", { silent = true })
vim.keymap.set({ "n", "v" }, "`", ":", { noremap = true })
vim.keymap.set({ "n", "v" }, "<F2>", ":w!<CR>", { silent = true })

-- Keymaps for dvorak users
-- vim.opt.langmap = "dh,hj,tk,nl,kd,jt,DH,HJ,TK,NL,KD,JT"

-- Keymaps for go
vim.keymap.set("n", "<leader>ll", "<cmd>GoIfErr<cr>", { silent = true, noremap = false })
-- Keymaps for c++ cp
vim.api.nvim_set_keymap('n', '<F2>', ':!clang++ --debug -Wall -std=c++20 -DONPC % -o main && ./main<CR>',
    { noremap = true })
-- Formatter

-- Keymaps for scrolling
vim.keymap.set({ "n", "v" }, "<C-j>", "20jzz", { noremap = true })
vim.keymap.set({ "n", "v" }, "<C-k>", "20kzz", { noremap = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })

vim.keymap.set("n", "N", "Nzzzv", { noremap = true })
vim.keymap.set("n", "n", "nzzzv", { noremap = true })
vim.keymap.set("n", "J", "mzJ`z", { noremap = true })

-- Keymaps for tex
vim.api.nvim_set_keymap('i', '<C-f>', '<cmd>lua run_command()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-f>', '<cmd>lua latex_edit()<CR>', { noremap = true, silent = true })
function latex_edit()
    local cmd = string.format("silent exec '!inkscape-figures edit \"%s/figures/\" > /dev/null 2>&1 &'",
        vim.fn.expand('%:p:h'))
    vim.api.nvim_command(cmd)
end

function run_command()
    vim.api.nvim_command("silent exec '.!inkscape-figures create \"'..getline('.')..'\" \"" ..
    vim.fn.expand('%:p:h') .. '/figures/"\'')
end

vim.api.nvim_set_keymap('n', '<Space><F3>', ':echo "Compiling..." <bar> :VimtexCompile<CR>',
    { noremap = true, silent = true })
