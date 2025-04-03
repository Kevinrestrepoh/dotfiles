local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "golines", "gofumpt", "goimports" },
    gomod = { "gofumpt", "goimports" },
    gowork = { "gofumpt", "goimports" },
    gotmpl = { "gofumpt", "goimports" },
  },

  formatters = {
    golines = {
      command = "golines",
      args = { "--max-len=130", "--no-reformat-tags" },
    },
    goimports = {
      command = "goimports",
      args = { "-w", "$FILENAME" },
      stdin = false,
    },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
