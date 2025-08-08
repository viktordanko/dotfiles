return {
  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "checkstyle",
        "css-lsp",
        "prisma-language-server",
        "html-lsp",
        "json-lsp",
        "lua-language-server",
        "marksman",
        "prettier",
        "sonarlint-language-server",
        "svelte-language-server",
        "tailwindcss-language-server",
        "taplo",
        "vtsls",
        "eslint-lsp",
      },
    },
  },
}
