local clear_bom = function()
    local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1]
    if first_line and first_line:sub(1, 3) == "\239\187\191" then
        vim.api.nvim_buf_set_lines(0, 0, 1, false, { first_line:sub(4) })
    end
end

return {
    callback = function()
        clear_bom()
    end,
}
