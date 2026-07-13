return {
    "nvim-mini/mini.map",
    version = false,
    keys = {
        { "<leader>mo", "<cmd>lua require('mini.map').open()<cr>", desc = "Abrir Minimap" },
        { "<leader>mc", "<cmd>lua require('mini.map').close()<cr>", desc = "Fechar Minimap" },
        { "<leader>mm", "<cmd>lua require('mini.map').toggle()<cr>", desc = "Toggle Minimap" },
    },
    config = function()
        local map = require("mini.map")
        
        map.setup({
            integrations = {
                map.gen_integration.builtin_search(),
                map.gen_integration.gitsigns(),
                map.gen_integration.diagnostic(),
            },
            symbols = {
                encode = map.gen_encode_symbols.dot("4x2"),
                -- barrinha de rolagem
                scroll_line = "▶", 
                scroll_view = "┃", 
            },
            window = {
                side = "right",
                width = 18, 
                winblend = 0,
                show_integration_count = false,
            },
        })

        vim.api.nvim_set_hl(0, "MiniMapNormal", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "MiniMapSymbolView", { fg = "#ffffff", bg = "NONE" }) -- Cor da trilha (Mauve/Roxo)
        vim.api.nvim_set_hl(0, "MiniMapSymbolLine", { fg = "#89b4fa", bg = "NONE" }) -- Cor do ponteiro atual (Blue/Azul)
    end,
}
