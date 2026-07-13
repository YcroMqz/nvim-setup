return {
    -- 1. Catppuccin recebendo injeção de cores do Matugen
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            local function load_colors()
                local path = vim.fn.stdpath("config") .. "/matugen_colors.lua"
                -- Tenta ler o arquivo. Se falhar, retorna nil silenciosamente
                local success, colors = pcall(dofile, path)
                if success and type(colors) == "table" then
                    return colors
                end
                return nil
            end

            local function apply_colors()
                local colors = load_colors()

                -- Configuração base
                local setup_opts = {
                    flavour = "mocha",
                    transparent_background = true,
                    compile = { enabled = false },
                }

                -- Só injeta overrides se o Matugen tiver gerado o arquivo
                if colors then
                    setup_opts.color_overrides = { all = colors, mocha = colors }
                end

                -- Definição de highlights (mantém o seu estilo)
                setup_opts.custom_highlights = function()
                    return {
                        LineNr = { fg = colors and colors.overlay1 or "#9399b2", bg = "NONE" },
                        CursorLineNr = { fg = colors and colors.text or "#cdd6f4", bold = true, bg = "NONE" },
                        Comment = { fg = "#6b7280", italic = true },
                        Function = { fg = "#60a5fa" },
                        Keyword = { fg = "#facc15", bold = true },
                        String = { fg = "#4ade80" },
                        Type = { fg = "#c084fc" },
                    }
                end

                require("catppuccin").setup(setup_opts)
                vim.cmd("colorscheme catppuccin")
            end

            apply_colors()

            -- Auto-reload se o arquivo de cores mudar
            vim.api.nvim_create_autocmd("BufWritePost", {
                pattern = "matugen_colors.lua",
                callback = function()
                    package.loaded["catppuccin"] = nil
                    apply_colors()
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

    -- 4. Força a barrinha (Lualine) a usar o tema colorido e sólido do Catppuccin
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {"catppuccin/nvim"},
        opts = function(_, opts)
            opts.options.theme = "catppuccin"
            return opts
        end,
    },
}
