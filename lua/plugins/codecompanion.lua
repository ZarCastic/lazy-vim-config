return {
  "olimorris/codecompanion.nvim",
  opts = {},
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    { "ibhagwan/fzf-lua", config = true },
  },
  keys = {
    { "<leader>ac", "<esc>:CodeCompanionChat Toggle<cr>" },
    { "<leader>ap", "<esc>:CodeCompanionActions<cr>" },
    { "<leader>aa", "<esc>:CodeCompanion #{buffer}" },
  },
}
