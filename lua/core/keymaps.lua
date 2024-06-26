local builtin = require "telescope.builtin"

vim.keymap.set("n", "<leader>e", function()
    vim.cmd("NvimTreeToggle")
end)

vim.keymap.set("n", "<leader>g", function()
    require("telescope").extensions.lazygit.lazygit()
end)

--Window navigation
vim.keymap.set("n", "<leader><Left>", function()
    vim.api.nvim_command("wincmd h")
end)

vim.keymap.set("t", "<leader><Left>", function()
    vim.api.nvim_command("wincmd h")
end)

vim.keymap.set("n", "<leader><Right>", function()
    vim.api.nvim_command("wincmd l")
end)

vim.keymap.set("n", "<leader><Up>", function()
    vim.api.nvim_command("wincmd k")
end)

vim.keymap.set("n", "<leader><Down>", function()
    vim.api.nvim_command("wincmd j")
end)

vim.keymap.set("n", "<leader>t", function()
    vim.cmd("ToggleTerm size=60 direction=vertical")
end)

vim.keymap.set("t", "<leader>t", function()
    vim.cmd("ToggleTerm")
end)

vim.keymap.set("t", "<leader>q", function()
    require'toggleterm'.exec("exit")
end)

--Window actions
vim.keymap.set("n", "<leader>w", function()
    vim.cmd("w")
end)

--Telescope
vim.keymap.set("n", "<leader>f", function()
    builtin.find_files()
end)

vim.keymap.set("n", "<leader>fp", function()
    vim.cmd("Telescope project")
end)

vim.keymap.set("n", "<leader>fh", function()
    builtin.help_tags()
end)

vim.keymap.set("n", "<leader>fg", function()
    builtin.live_grep()
end)

vim.keymap.set("n", "<leader>n", function()
    vim.api.nvim_command("vnew")
end)

--Buffers
vim.keymap.set("n", "<leader>bq", function()
    vim.cmd("bdelete")
end)

vim.keymap.set('n', "<leader>b", function()
    vim.cmd("buffers")
end)

vim.keymap.set("n", "<leader>b<Right>", function()
    vim.cmd("bnext")
end)

vim.keymap.set("n", "<leader>b<Left>", function()
    vim.cmd("bprevious")
end)

--LSP
vim.keymap.set("n", "<leader>q", function()
    vim.lsp.buf.hover()
end)

vim.keymap.set("n", "<leader>d", function()
    vim.lsp.buf.definition()
end)

--Others
vim.keymap.set("n", "<leader>o", function()
    vim.lsp.buf.format()
end)
