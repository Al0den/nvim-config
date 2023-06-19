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
