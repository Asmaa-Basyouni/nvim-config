return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    opts = {
      -- This fixes the UI by formatting CopilotChat buffers perfectly!
      file_types = { "markdown", "copilot-chat" }, 
    },
  },
}
