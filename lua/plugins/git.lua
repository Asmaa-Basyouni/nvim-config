return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add          = { text = "┃" }, -- Shows green bars for new lines
          change       = { text = "┃" }, -- Shows blue bars for edits
          delete       = { text = "_" }, -- Shows red bars for deleted code
          topdelete    = { text = "‾" },
          changedelete = { text = "~" },
          untracked    = { text = "┆" },
        },
      })
    end,
  },
}
