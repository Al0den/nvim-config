local abbreviations = {
    wrap = "set wrap",
    nowrap = "set nowrap",
    ps = "PackerSync",
    msg = "messages",
}

for l, r in pairs(abbreviations) do
    vim.cmd(string.format("cnorea %s %s", l, r))
end
