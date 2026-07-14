-- Atalho Coringa: Salva, compila/executa o arquivo atual dependendo da linguagem
vim.keymap.set("n", "<F5>", function()
    vim.cmd("write") -- Salva o arquivo atual primeiro

    local file = vim.fn.expand("%:p")   -- Caminho completo do arquivo
    local out = vim.fn.expand("%:p:r")   -- Caminho sem a extensão (para o executável)
    local ft = vim.bo.filetype            -- Detecta a linguagem do arquivo atual

    local cmd = ""

    -- Estrutura para definir o comando baseado na linguagem
    if ft == "cpp" then
        cmd = string.format("g++ -DLOCAL -std=c++20 -O2 -Wall '%s' -o '%s' && '%s'", file, out, out)
    elseif ft == "c" then
        cmd = string.format("gcc -O2 -Wall '%s' -o '%s' && '%s'", file, out, out)
    elseif ft == "python" then
        cmd = string.format("python3 '%s'", file)
    elseif ft == "go" then
        cmd = string.format("go run '%s'", file)
    elseif ft == "lua" then
        cmd = string.format("lua '%s'", file)
    else
        -- Aviso caso aperte F5 numa linguagem que não configuramos
        vim.notify("Linguagem [" .. ft .. "] não configurada para o F5 rápido!", vim.log.levels.WARN)
        return
    end

    -- Abre uma split vertical e roda o comando no terminal do Neovim
    vim.cmd("vsplit | terminal " .. cmd)
end, { desc = "Build & Run Coringa" })

-- Atalho para o Color Picker
vim.keymap.set("n", "<leader>cp", "<cmd>CccPick<cr>", { desc = "Color Picker" })
