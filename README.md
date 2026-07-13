# 💤 Meu Setup do Neovim (LazyVim)

Este repositório contém a minha configuração pessoal do Neovim, construída sobre a base do **LazyVim**, mas totalmente modificada para entregar uma experiência agradável e otimizada para **Programação Competitiva (C++)** e desenvolvimento geral.

## Recursos adicionados

- **Compilação e execução (`<F5>`)**: Atalho inteligente no `keymaps.lua` que salva, compila com flags otimizadas (`-O2 -Wall -DLOCAL`) e roda o código em uma split vertical automaticamente (suporta C++, C, Python e Go).
- **Estética Transparente**: Configuração `design.lua` que força transparência total mantendo as pílulas sólidas e coloridas do **Catppuccin Mocha**.
- **Minimap**: Visualizador de código lateral (`mini.map`) usando resolução de caracteres Braille para simular a textura real do texto.
- **Breadcrumbs (`barbecue.nvim`)**: Barra superior mostrando o escopo exato (classe/função) onde o cursor está.
- **Captura de Código (silicon.nvim)**: Gera uma captura do trecho de código selecionado por meio do aatalho `<leader>sc`. (semelhante a extensão Snapcode do VsCode).
- **Discord Rich Presence**: Integração via `neocord` para exibir o status do seu código em tempo real no Discord.
- **Renderizador de Imagens**: Suporte para abrir e visualizar imagens reais diretamente dentro do editor.

## 🛠️ Requisitos e Dependências do Sistema

Para que todos os plugins visuais funcionem perfeitamente na sua máquina, certifique-se de ter instalado no seu sistema:

```bash
# No Arch Linux:
sudo pacman -S silicon imagemagick
```
Obs: Para o renderizador de imagens funcionar, é necessário estar utilizando algum terminal com suporte a gráficos (Ex: _Kitty, Alacritty, foot_).
