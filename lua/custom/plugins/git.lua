return {
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-rhubarb', dependencies = { 'tpope/vim-fugitive' } },

  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gh', '<cmd>.,.GBrowse<cr>', {
        desc = 'Open current file in [G]it[H]ub',
      })
    end,
  },
}
