return {
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,

    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('gruvbox').setup {
        ---@diagnostic disable-next-line: missing-fields
        italic = {
          comments = false,
        },
        contrast = 'hard',
      }

      vim.cmd.colorscheme 'gruvbox'
    end,
  },
}
