return {
    "michaelrommel/nvim-silicon",
    lazy = true,
    keys = {
        { "<leader>sc", "<cmd>Silicon<cr>", mode = "v", desc = "Silicon Copy (Clipboard)" },
    },
    config = function()
        require("silicon").setup({
            font = "Fira Code=34", 
            theme = "Catppuccin Mocha", 
            background = "#1e1e2e", 
            shadow_color = "#11111b",
            shadow_blur_radius = 15,
            window_title = function() return vim.fn.expand("%:t") end, 
        })
    end
}
