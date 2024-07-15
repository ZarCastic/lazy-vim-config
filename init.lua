-- bootstrap lazy.nvim, LazyVim and your plugins

if vim.g.vscode then
    -- VSCode extension
    vim.g.vscode = true
end
require("config.lazy")
