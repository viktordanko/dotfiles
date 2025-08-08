return {
  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      matchup = {
        enable = true,
      },
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "prisma",
        "csv",
        "dart",
        "graphql",
        "http",
        "java",
        "json",
        "rust",
        "toml",
        "cpp",
        "gitignore",
        "gitcommit",
        "svelte",
        "scss",
        "css",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "xml",
        "yaml",
        "hyprlang",
      },
    },
  },
  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- would overwrite `ensure_installed` with the new value.
  -- If you'd rather extend the default config, use the code below instead:
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = function(_, opts)
  --     -- add tsx and treesitter
  --     vim.list_extend(opts.ensure_installed, {
  --       "tsx",
  --       "typescript",
  --     })
  --   end,
  -- },
}
