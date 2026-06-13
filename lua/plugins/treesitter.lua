return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "lua", "python", "javascript", "typescript",
        "bash", "json", "yaml", "html", "css", "c",
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
}
