return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files)   -- find files
      vim.keymap.set("n", "<leader>fg", builtin.live_grep)    -- grep in project
      vim.keymap.set("n", "<leader>fb", builtin.buffers)      -- open buffers
      vim.keymap.set("n", "<leader>fh", builtin.help_tags)    -- help
      vim.keymap.set("n", "<leader>fs", builtin.grep_string)  -- word under cursor
    end,
  },
}
