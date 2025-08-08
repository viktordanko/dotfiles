-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("n", "<leader>fs", "<cmd>SessionSearch<cr>", { noremap = true, silent = true, desc = "Sessions" })

-- copilot
map("i", "<C-j>", 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })
vim.g.copilot_no_tab_map = true

map("n", "<leader>fl", "<cmd>FzfLua resume<cr>", { noremap = true, silent = true, desc = "Resume FzfLua" })
map("n", "<leader>fa", "<cmd>FzfLua<cr>", { noremap = true, silent = true, desc = "Find anything" })

-- console.log
map(
  "n",
  "<leader>cp",
  "yiwo<esc>iconsole.log({ <esc>pa });<esc>:w<cr>",
  { noremap = true, silent = true, desc = "Put current word into console.log" }
)

map(
  "v",
  "<leader>cp",
  "yo<esc>iconsole.log({ <esc>pa });<esc>:w<cr>",
  { noremap = true, silent = true, desc = "Put selection into console.log" }
)

map("n", "<leader>fl", "<cmd>FzfLua resume<cr>", { noremap = true, silent = true, desc = "Resume FzfLua" })

local fzf_cword = function()
  local word = vim.fn.expand("<cword>")
  require("fzf-lua").grep({ search = word })
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-g>", true, true, true), "n", false)
end

map("n", "<leader>*", fzf_cword, { noremap = true, silent = true, desc = "Grep word under cursor" })
map("n", "<leader>#", fzf_cword, { noremap = true, silent = true, desc = "Grep word under cursor" })

map("n", "<leader><leader>", "<cmd>FzfLua git_files<cr>", { noremap = true, silent = true, desc = "Find git files" })

map("n", "<D-k>", ":m .-2<CR>==") -- move line down(n)
map("n", "<D-j>", ":m .+1<CR>==") -- move line up(n)
map("v", "<D-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
map("v", "<D-k>", ":m '<-2<CR>gv=gv") -- move line down(v)

map("n", "<D-s>", "<cmd>w<cr>", { noremap = true, silent = true, desc = "Save file" })
map("i", "<D-s>", "<cmd>w<cr><esc>", { noremap = true, silent = true, desc = "Save file" })
map("i", "<D-CR>", "{<CR>}<Esc>O", { noremap = true, silent = true, desc = "Opening and closing curly bracket" })
