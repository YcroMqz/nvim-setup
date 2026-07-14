# 💤 Meu Setup do Neovim (LazyVim)

Este repositório contém a minha configuração pessoal do Neovim, construída sobre a base do **LazyVim**, mas totalmente modificada para entregar uma experiência agradável.

## 📦 Instalação

```bash
mv ~/.config/nvim ~/.config/nvim.bak # backup da sua config atual, se tiver
git clone https://github.com/YcroMqz/nvim-setup.git ~/.config/nvim
nvim
```

## Recursos adicionados

- **Compilação e execução (`<F5>`)**: Atalho inteligente no `keymaps.lua` que salva, compila com flags otimizadas (`-O2 -Wall -DLOCAL`) e roda o código em uma split vertical automaticamente (suporta C++, C, Python e Go).
- **Programação Competitiva (CompetiTest)**: Baixa problemas e roda/edita casos de teste direto no editor (`<leader>rr` roda, `<leader>ra` adiciona teste, `<leader>re` edita, `<leader>rc` baixa problema).
- **Estética Transparente**: Configuração `design.lua` que força transparência total mantendo as pílulas sólidas e coloridas do **Catppuccin Mocha**.
- **Minimap**: Visualizador de código lateral (`mini.map`) usando resolução de caracteres Braille para simular a textura real do texto.
- **Breadcrumbs (`barbecue.nvim`)**: Barra superior mostrando o escopo exato (classe/função) onde o cursor está.
- **Captura de Código (silicon.nvim)**: Gera uma captura do trecho de código selecionado por meio do atalho `<leader>sc`. (semelhante a extensão Snapcode do VsCode).
- **Color Picker e Colorizer**: `<leader>cp` abre um seletor de cores (ccc.nvim), e códigos hex/rgb/hsl no código já aparecem destacados com a cor real (nvim-colorizer).
- **Discord Rich Presence**: Integração via `neocord` para exibir o status do seu código em tempo real no Discord.
- **Renderizador de Imagens**: Suporte para abrir e visualizar imagens reais diretamente dentro do editor.

## 🛠️ Requisitos e Dependências

**Obrigatório** (captura de código e renderizador de imagem):

```bash
# Arch Linux
yay -S silicon imagemagick
```
> Obs: o renderizador de imagens só funciona em terminais com suporte a gráficos (Ex: _Kitty, Alacritty, foot_).

**Opcional** — Matugen, só se você quiser cores adaptativas (veja a seção abaixo).

## 🎨 Adaptive Colors (via Matugen)

Este Neovim extrai as cores do seu wallpaper ou de uma imagem à sua escolha e aplica na UI via [Matugen](https://github.com/InioX/matugen).

**Como funciona:** o Matugen usa `templates/nvim-colors.lua.template` como molde e, ao rodar `matugen image <foto>`, gera `matugen_colors.lua`. O Neovim lê esse arquivo ao iniciar; se ele não existir, cai automaticamente no Catppuccin Mocha padrão.

### Ativando

```bash
yay -S matugen-bin

mkdir -p ~/.config/matugen/templates
cp ~/.config/nvim/lua/templates/nvim-colors.lua.template ~/.config/matugen/templates/
```

Registre o template no `~/.config/matugen/config.toml` — só copiar o arquivo pra pasta **não é suficiente**, o Matugen precisa dele declarado aqui:

```bash
nvim ~/.config/matugen/config.toml
```

Em seguida, cole o seguinte conteúdo no arquivo:

```toml
[config]

[templates.neovim]
input_path = "~/.config/matugen/templates/nvim-colors.lua.template"
output_path = "~/.config/nvim/matugen_colors.lua"
```
> ⚠️ O `output_path` precisa apontar pra dentro da sua config do Neovim — é esse caminho que o `design.lua` lê via `stdpath("config")`.

Gere as cores a partir de uma imagem:

```bash
matugen image "/caminho/para/sua/imagem.jpg"
```

Como o arquivo é escrito por um processo externo, o Neovim **não** detecta a mudança em tempo real se já estiver aberto. Feche e abra de novo.
