return {
  -- O plugin mais rápido e moderno para mostrar cores
  "NvChad/nvim-colorizer.lua",
  event = "BufReadPre", -- Só carrega quando você abrir um arquivo de texto (ajuda na velocidade do nvim)
  opts = {
    user_default_options = {
      RGB = true,       -- Exibe cores como #RGB
      RRGGBB = true,    -- Exibe cores como #RRGGBB
      names = true,     -- Exibe cores digitadas por nome, ex: "Blue" ou "red"
      RRGGBBAA = true,  -- Exibe cores com transparência
      AARRGGBB = true,  -- Exibe cores no formato 0xAARRGGBB
      rgb_fn = true,    -- Mostra funções rgb() do CSS
      hsl_fn = true,    -- Mostra funções hsl() do CSS
      css = true,       -- Habilita tudo de CSS
      css_fn = true,    -- Habilita funções de CSS
      tailwind = true,  -- Maravilhoso se você estiver fazendo UI/Design
    },
  },
}
