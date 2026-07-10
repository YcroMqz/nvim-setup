return {
    -- 1. Catppuccin recebendo injeção de cores do Matugen
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            local function load_colors()
                local path = vim.fn.stdpath("config") .. "/matugen_colors.lua"
                if vim.fn.filereadable(path) == 1 then
                    return dofile(path)
                end
                return {}
            end

            local function apply_colors()
                local colors = load_colors()
                require("catppuccin").setup({
                    flavour = "mocha",
                    transparent_background = true,
                    color_overrides = {
                        all = colors,
                        mocha = colors,
                    },
                    custom_highlights = function()
                        return {
                            Comment = { fg = "#6b7280", italic = true },
                            Function = { fg = "#60a5fa" },
                            Keyword = { fg = "#facc15", bold = true },
                            String = { fg = "#4ade80" },
                            Type = { fg = "#c084fc" },
                        }
                    end,
                    compile = { enabled = false },
                })
                vim.cmd("colorscheme catppuccin")
            end

            apply_colors()

            -- Auto-reload instantâneo se você atualizar as cores do sistema
            vim.api.nvim_create_autocmd("BufWritePost", {
                pattern = "matugen_colors.lua",
                callback = function()
                    package.loaded["catppuccin"] = nil
                    apply_colors()
                end,
            })

            -- Força fundo transparente em áreas teimosas do Neovim
            vim.api.nvim_create_autocmd("ColorScheme", {
                pattern = "*",
                callback = function()
                    local highlights = {
                        "Normal", "LineNr", "FoldColumn", "SignColumn", "VertSplit",
                        "WinSeparator", "NeoTreeNormal", "NeoTreeNormalNC",
                        "NeoTreeWinSeparator", "TelescopeNormal", "TelescopeBorder",
                        "WhichKeyFloat",
                    }
                    for _, group in ipairs(highlights) do
                        vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
                    end
                end,
            })
        end,
    },

    -- 2. Plugin de Transparência Global
    {
        "xiyaowong/transparent.nvim",
        lazy = false,
        opts = {
            extra_groups = {
                "NormalFloat", "NvimTreeNormal", "NeoTreeNormal", "NeoTreeNormalNC",
                "NeoTreeWinSeparator", "NeoTreeCursorLine", "TelescopeNormal", "TelescopeBorder",
            },
        },
    },

    -- 3. Define o tema principal do LazyVim
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin",
        },
    },
}
