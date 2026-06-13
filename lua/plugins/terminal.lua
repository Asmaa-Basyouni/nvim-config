return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<C-\>]], 
        direction = "float", 
        float_opts = {
          border = "curved",
          width = function() return math.floor(vim.o.columns * 0.8) end,
          height = function() return math.floor(vim.o.lines * 0.7) end,
        },
        start_in_insert = true,
      })

      -- This explicitly targets terminal #2 to open vertically on the right
      -- Normal mode shortcut: Ctrl + b
      vim.keymap.set('n', '<C-b>', '<Cmd>2ToggleTerm direction=vertical size=60<CR>', { silent = true })
      
      -- This allows you to also close it using Ctrl + b while inside the terminal typing
      vim.keymap.set('t', '<C-b>', '<Cmd>2ToggleTerm<CR>', { silent = true })
    end,
  },
}
