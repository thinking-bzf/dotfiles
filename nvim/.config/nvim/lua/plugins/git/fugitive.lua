return {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    config = function()
        local function blameToggle()
            local found = false
            for _, winid in ipairs(vim.api.nvim_list_wins()) do
                local bufnr = vim.api.nvim_win_get_buf(winid)
                local filetype = vim.bo[bufnr].filetype
                if filetype == "fugitiveblame" then
                    vim.api.nvim_win_close(winid, true)
                    found = true
                    break
                end
            end
            if not found then
                -- rikka.vimCmd("Git blame --date=short")
            end
        end

        -- aka: who write this code? leader-w(ho)
        -- rikka.setKeymap("n", "<leader>w", blameToggle, { desc = "Git Blame Toggle" })

        -- rikka.createCommand("His", function()
            -- rikka.vimCmd("Git log %")
        -- end, { desc = "Open git log(history) of current buffer" })
    end,
}
