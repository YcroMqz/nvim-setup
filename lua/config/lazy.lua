local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Baixa o lazy.nvim automaticamente na primeira vez que abrir o editor
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Falha ao clonar o lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPressione qualquer tecla para sair..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

-- Configuração núcleo do gerenciador de pacotes
require("lazy").setup({
  spec = {
    -- Importa a base do LazyVim e depois os seus plugins customizados
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "plugins" },
  },
  defaults = {
    lazy = false,
    version = false, -- Sempre usa o commit mais recente para evitar quebras
  },
  install = { 
    -- Tema fallback seguro caso algo falhe
    colorscheme = { "catppuccin", "habamax" } 
  },
  checker = {
    enabled = true,  -- Checa atualizações em segundo plano
    notify = false,  -- Sem pop-ups irritantes na tela
  },
  performance = {
    rtp = {
      -- Desativa plugins nativos inúteis do Vim para iniciar mais rápido
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
