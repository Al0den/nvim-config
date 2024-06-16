vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        if vim.bo.filetype == "NvimTree" and #vim.api.nvim_list_wins() == 1 then
            vim.api.nvim_command("q")
        end
    end,
})

vim.api.nvim_create_autocmd("VimLeave", {
    callback = function()
        if vim.bo.filetype == "tex" then
            vim.api.nvim_command("!latexmk -c")
        end
    end
})

-- Indentations
vim.api.nvim_create_autocmd("FileType", {
    pattern = "cpp",
    command = "setlocal shiftwidth=4 tabstop=4",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "html",
    command = "setlocal shiftwidth=2 tabstop=2"
})

vim.api.nvim_create_autocmd("ModeChanged", {
    callback = function()
        if vim.bo.filetype == "toggleterm" then
            vim.api.nvim_command("startinsert")
        end
    end
})

