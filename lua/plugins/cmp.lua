return {
    -- O LazyVim moderno usa blink.cmp em vez de nvim-cmp
    "saghen/blink.cmp",
    opts = {
        completion = {
            -- Menos poluição visual: desativa menus aparecendo sem você pedir
            menu = { auto_show = false },
            documentation = { auto_show = false },

            -- Não insere texto nem seleciona a primeira opção automaticamente
            list = {
                selection = { preselect = false, auto_insert = false },
            },
        },
    },
}
