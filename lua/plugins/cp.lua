return {
    {
        "xeluxee/competitest.nvim",
        dependencies = "MunifTanjim/nui.nvim",
        cmd = "CompetiTest",
        keys = {
            { "<leader>rr", "<cmd>CompetiTest run<cr>", desc = "CP: Rodar Casos de Teste" },
            { "<leader>ra", "<cmd>CompetiTest add_testcase<cr>", desc = "CP: Adicionar Teste Manual" },
            { "<leader>re", "<cmd>CompetiTest edit_testcase<cr>", desc = "CP: Editar Teste" },
            { "<leader>rc", "<cmd>CompetiTest receive problem<cr>", desc = "CP: Baixar Problema" },
        },
        config = function()
            require("competitest").setup({
                local_config_file_name = ".competitest.lua",
                floating_border = "rounded",
                floating_border_highlight = "FloatBorder",
                
                -- Onde os problemas baixados vão ser salvos
                received_problems_path = "$(CWD)/$(PROBLEM).$(FEXT)",
                received_contests_directory = "$(CWD)",
                received_contests_problems_path = "$(PROBLEM).$(FEXT)",
                
                -- Flags de compilação da Maratona
                compile_command = {
                    cpp = { exec = "g++", args = { "-Wall", "-Wextra", "-O2", "-DLOCAL", "$(FNAME)", "-o", "$(FNOEXT)" } },
                },
                run_command = {
                    cpp = { exec = "./$(FNOEXT)" },
                },
                runner_ui = {
                    interface = "popup",
                },
            })
        end,
    },
}
