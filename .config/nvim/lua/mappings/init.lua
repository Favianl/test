local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
map("n", "<leader>9", "<Plug>ColorConvertCycle", opts)
----- Save ----
map("n", "<leader>w", ":w<CR>", opts)
----- Quit ----
map("n", "<leader>q", ":q<CR>", opts)
----- Quit whitout save ----
map("n", "<leader>0", ":q!<CR>", opts)

------- Toggle tree --------
map("n", "<leader>nt", ":NvimTreeToggle<CR>", opts)

------ Remove search highlight ------
map("n", "<Esc><Esc>", ":nohlsearch<CR>", opts)

------ Navigate between windows -------
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

----- Navigate tabs ------
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)
----- BarBar Mappings ------
-- Close buffer
map("n", "<A-c>", ":BufferClose<CR>", opts)
-- Magic buffer-picking mode
map("n", "<C-p>", ":BufferPick<CR>", opts)

-------- Resize window -----
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

--------- Move text up and down ------
-- move line normal mode
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)
-- move line insert mode
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
-- move block visual mode
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

--------- indent visual mode ------
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

---------------- Hop Mappings ---------------
map("n", "<leader>h", ":HopWord<cr>", opts)
map("n", "<leader>hh", ":HopChar2<cr>", opts)
map("n", "<leader>hd", ":HopChar1<cr>", opts)
map("n", "<leader>hl", ":HopLine<cr>", opts)

------ Telescope ----------
map("n", "<leader>f", ":Telescope find_files<cr>", opts)
-- map("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
-- map("n", "<leader>pf", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
map("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)
