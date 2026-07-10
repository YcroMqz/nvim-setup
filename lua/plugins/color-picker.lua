return {
  {
    "uga-rosa/ccc.nvim",
    cmd = "CccPick",
    config = function()
      local ccc = require("ccc")

      ccc.setup({
        highlighter = {
          auto_enable = true,
          lsp = true,
        },
      })
    end,
  },
}
