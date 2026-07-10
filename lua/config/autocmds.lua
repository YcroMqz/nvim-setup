-- Autocmds carregados no evento VeryLazy

-- Cria um grupo para evitar duplicação
local augroup = vim.api.nvim_create_augroup("cpp_template", { clear = true })

-- Injeta o template de C++ em arquivos .cpp novos/vazios
vim.api.nvim_create_autocmd("BufNewFile", {
    group = augroup,
    pattern = "*.cpp",
    callback = function()
        local template = {
            "#include <bits/stdc++.h>",
            "using namespace std;",
            "",
            "void solve() {",
            "    ",
            "}",
            "",
            "int main() {",
            "    ios_base::sync_with_stdio(false);",
            "    cin.tie(NULL);",
            "    solve();",
            "    return 0;",
            "}"
        }
        -- Insere as linhas no buffer
        vim.api.nvim_buf_set_lines(0, 0, -1, false, template)
        -- Coloca o cursor dentro da função solve() automaticamente (linha 5)
        vim.schedule(function() vim.cmd("normal! 5G") end)
    end,
    desc = "Injeta template CP em novos arquivos C++",
})
