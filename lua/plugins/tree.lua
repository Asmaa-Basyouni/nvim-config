return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      -- Modern keymaps using native Neovim 0.12+ features
      local function my_on_attach(bufnr)
        local api = require("nvim-tree.api")

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- Load default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- Modern way to open files externally via native Neovim system handler
        vim.keymap.set("n", "x", function()
          local node = api.tree.get_node_under_cursor()
          if node and node.absolute_path then
            vim.ui.open(node.absolute_path)
          end
        end, opts("Open System Default"))
      end

      require("nvim-tree").setup({
        disable_netrw = true,
        hijack_netrw = true,
        on_attach = my_on_attach,
        view = {
          width = 35,
          side = "left",
        },
      })
    end,
  },
}
