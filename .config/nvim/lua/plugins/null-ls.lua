require("null-ls").setup({
  sources = {
    require("null-ls").builtins.diagnostics.mypy.with({
      extra_args = { "--config-file", vim.fn.getcwd() .. "/mypy.ini" },
    }),
    require("null-ls").builtins.diagnostics.flake8,
    require("null-ls").builtins.formatting.black,
    require("null-ls").builtins.diagnostics.djlint,
    require("null-ls").builtins.formatting.djlint,
    require("null-ls").builtins.formatting.prettier,
    -- require("null-ls").builtins.diagnostics.eslint_d,
    require("null-ls").builtins.formatting.phpcsfixer,
    require("null-ls").builtins.formatting.latexindent,
    require("null-ls").builtins.formatting.gdformat,
    require("null-ls").builtins.formatting.csharpier,
    -- add make formatter & linter
    require("null-ls").builtins.formatting.makefmt,
    require("null-ls").builtins.diagnostics.checkmake,
    -- formmater for lua
    require("null-ls").builtins.formatting.stylua,
  },
  
  on_attach = function(client, bufnr)
    print("mypy configuration path:", vim.fn.getcwd() .. "/mypy.ini")
    
    vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
      if client.server_capabilities.documentFormattingProvider then
        vim.lsp.buf.format({ bufnr = bufnr })
      else
        print("Formatter not available")
      end
    end, { desc = "Format with djlint" })
  end,
})
