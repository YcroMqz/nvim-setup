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

## 🎨 Adaptive Colors (via Matugen)

Este Neovim possui um sistema adaptativo que extrai as cores do seu wallpaper ou imagem a sua escolha e as aplica na UI (via [Matugen](https://github.com/inobulles/matugen)).

### Como funciona?
1. O Matugen utiliza um **Template** (`templates/nvim-colors.lua.template`) como molde.
2. Ao rodar o comando `matugen image <caminho_da_foto>`, ele extrai as cores da imagem e gera o arquivo de configuração `matugen_colors.lua`.
3. O Neovim detecta esse arquivo e altera o tema automaticamente.

### Como ativar no seu PC
Se você deseja que o Neovim tenha cores adaptativas:

1. **Instale o Matugen** no seu sistema.
2. Copie o template do repositório para o seu sistema:

```bash
mkdir -p ~/.config/matugen/templates
cp templates/nvim-colors.lua.template ~/.config/matugen/templates/nvim-colors.lua.template
```
3. Para atualizar as cores do nvim, execute:

```bash
matugen image "/caminho/para/sua/imagem.jpg"
```
   
## 🛠️ Requisitos e Dependências

Para que todos os plugins visuais funcionem perfeitamente na sua máquina, certifique-se de ter instalado no seu sistema:

```bash
# No Arch Linux:
yay -S matugen-bin silicon imagemagick
```
Obs: Para o renderizador de imagens funcionar, é necessário estar utilizando algum terminal com suporte a gráficos (Ex: _Kitty, Alacritty, foot_).
