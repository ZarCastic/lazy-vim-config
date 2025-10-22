return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      gopls = {
        settings = {
          gopls = {
            gofumpt = true,
            codelenses = {
              gc_details = false,
              generate = true,
              regenerate_cgo = true,
              run_govulncheck = true,
              test = true,
              tidy = true,
              upgrade_dependency = true,
              vendor = true,
            },
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
            analyses = {
              nilness = true,
              unusedparams = true,
              unusedwrite = true,
              unusedfunc = true,
              unusedresult = true,
              unusedvariable = true,
              useany = true,
              waitgroup = true,
              shadow = true,
              staticcheck = true,
              errcheck = true,
              modernize = true,
              ST1023 = true, -- redundant type in variable declaration
              ST1022 = true, -- Documentation comment of exported variable or constant should start with variable name
              ST1021 = true, -- Documentation comment of exported type should start with type name
              ST1020 = true, -- Documentation comment of exported function should start with function name
              ST1019 = true, -- Importing the same package multiple times
              ST1015 = true, -- switch default should be first or last case
              ST1013 = true, -- should use constants for HTTP erorr codes
              ST1012 = true, -- poorly chosen erorr variable name
              ST1008 = true, -- functions error value should be its last return value
              ST1005 = true, -- incorrectly formatted error string
              SA9008 = true, -- else branch of type assertion is probably not reading the right value
              SA9003 = true, -- empty body in if or else branch
              SA9001 = true, -- defers in loops may not run when you expect them to
              SA6002 = true, -- storing non-pointer values in sync.Pool allocates memory
              SA6000 = true, -- using regexp.Match in loop should use regexp.Compile
              SA5011 = true, -- possible nil pointer dereference
              SA5010 = true, -- impossible type assertion
              SA5007 = true, -- infinite recursive call
              SA5005 = true, -- finalizer references finalized object
              SA5002 = true, -- empty for
              SA5000 = true, -- assignment to nil map
              SA4031 = true, -- check never nil
              SA4017 = true, -- discarding return values of function without side effects
            },
            usePlaceholders = true,
            completeUnimported = true,
            staticcheck = true,
            directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
            semanticTokens = true,
          },
        },
      },
    },
    setup = {
      gopls = function(_, opts)
        -- workaround for gopls not supporting semanticTokensProvider
        -- https://github.com/golang/go/issues/54531#issuecomment-1464982242
        LazyVim.lsp.on_attach(function(client, _)
          if not client.server_capabilities.semanticTokensProvider then
            local semantic = client.config.capabilities.textDocument.semanticTokens
            client.server_capabilities.semanticTokensProvider = {
              full = true,
              legend = {
                tokenTypes = semantic.tokenTypes,
                tokenModifiers = semantic.tokenModifiers,
              },
              range = true,
            }
          end
        end, "gopls")
        -- end workaround
      end,
    },
  },
}
