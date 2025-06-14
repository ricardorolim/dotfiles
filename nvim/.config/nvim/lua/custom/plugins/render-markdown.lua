return {
  'MeanderingProgrammer/render-markdown.nvim',
  opts = {
    code = {
      sign = false,
      width = 'block',
      right_pad = 1,
    },
    heading = {
      sign = false,
      icons = {},
    },
  },
  ft = { 'markdown', 'norg', 'rmd', 'org' },
  config = function(_, opts)
    require('render-markdown').setup(opts)
    vim.keymap.set('n', '<leader>mt', require('render-markdown').toggle, { desc = 'Toggle markdown' })
  end,
}
