return {
  -- 1. The Core AI Suggestion Engine (For the gray ghost text)
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true, -- Shows gray suggestions automatically as you type
          debounce = 75,
          keymap = {
            accept = false, -- Handled manually by our nvim-cmp Tab key mapping
            next = "<M-]>",  -- Alt + ] to cycle next
            prev = "<M-[>",  -- Alt + [ to cycle prev
            dismiss = "<C-]>",
          },
        },
        panel = { enabled = false },
      })
    end,
  },

  -- 2. The Interactive Chat Client Slider
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      window = {
        layout = "vertical",
        side = "right", -- Forces the panel to open on the right side
        width = 45,     -- A clean Code-Assistant panel width
      },
    },
    keys = {
      { "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "Toggle Copilot Chat" },
    },
  },
}
