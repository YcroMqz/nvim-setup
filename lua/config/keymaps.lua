-- Atalho rápido: Salva, compila e roda um C++ simples em uma split
-- Obs: Para problemas reais de CP, use o CompetiTest (<leader>rr) configurado no cp.lua
vim.keymap.set("n", "<F5>", function()
    vim.cmd("write")
    local file = vim.fn.expand("%:p")
    local out = vim.fn.expand("%:p:r")
    
    -- Flags clássicas: -O2 (otimização), -Wall (avisos), -DLOCAL (sua macro de debug)
    local cmd = string.format("g++ -DLOCAL -std=c++20 -O2 -Wall '%s' -o '%s' && '%s'", file, out, out)
    
    vim.cmd("vsplit | terminal " .. cmd)
end, { desc = "Build & Run C++ Rápido" })

-- Atalho para o Color Picker
vim.keymap.set("n", "<leader>cp", "<cmd>CccPick<cr>", { desc = "Color Picker" })
