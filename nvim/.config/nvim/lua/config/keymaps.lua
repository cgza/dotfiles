-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--
-- MIS KEYMAPS PREVIOS
--
-- Center screen when jumping
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Better ESC
vim.keymap.set("i", "jj", "<ESC>", { desc = "ESC from insert" })
vim.keymap.set("i", "jk", "<ESC>", { desc = "ESC from insert" })

-- Navigate between Blank Spaces
vim.keymap.set("n", "ñ", "{", { desc = "prev" })
vim.keymap.set("n", "ç", "}", { desc = "next" })

-- Buffer navigation
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bx", ":bdelete<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
-- vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })

--TABS
-- navigation
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<S-Tab>", ":tabn<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Previous tab" })
vim.keymap.set("n", "<leader>td", ":tabclose<CR>", { desc = "Close tab" })
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close tab" })
-- moving
vim.keymap.set("n", "<leader>tm", ":tabmove<CR>", { desc = "Move tab" })
vim.keymap.set("n", "<leader>tç", ":tabmove +1<CR>", { desc = "Move tab right" })
vim.keymap.set("n", "<leader>tñ", ":tabmove -1<CR>", { desc = "Move tab left" })
-- Function to open file in new tab
local function open_file_in_tab()
  vim.ui.input({ prompt = "File to open in new tab: ", completion = "file" }, function(input)
    if input and input ~= "" then
      vim.cmd("tabnew " .. input)
    end
  end)
end
-- Enhanced keybindings
vim.keymap.set("n", "<leader>tO", open_file_in_tab, { desc = "Open file in new tab" })

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })
-- Cambio el default delete
vim.keymap.set({ "n", "v" }, "d", '"_d', { desc = "Delete without yanking" })
vim.keymap.set({ "n", "v" }, "dd", '"_dd', { desc = "Delete without yanking" })
-- Asigno el default delete (with yanking) to Shift-D
vim.keymap.set({ "n", "v" }, "<S-d>", "d")
vim.keymap.set({ "n", "v" }, "<S-d><S-d>", "dd")

-- Better Pasting remembering yanked
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("x", "p", [["_dP]])

--Mover up-down las líneas seleccionada
vim.keymap.set("n", "<C-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<C-k>", ":m .-2<CR>==")
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")
-- estos no funcionan en insert mode porque coinciden con otros maps
-- vim.keymap.set("i", "<C-j>", ":m .+1<CR>==gi")
-- vim.keymap.set("i", "<C-k>", ":m .-2<CR>==gi")

-- MIS OVERRIDES DE LAZYVIM
--
-- Terminal Mappings
local map = vim.keymap.set
map("t", "<C-x>", "<cmd>close<cr>", { desc = "Hide Terminal" })

--windows
map("n", "<leader>wx", "<C-W>c", { desc = "Delete Window", remap = true })
