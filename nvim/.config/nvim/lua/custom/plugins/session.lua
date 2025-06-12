return {
  'rmagatti/auto-session',
  lazy = false,

  keys = {
    -- Will use Telescope if installed or a vim.ui.select picker otherwise
    { '<leader>Ss', '<cmd>SessionSearch<CR>', desc = 'Session search' },
    -- { '<leader>Sr', '<cmd>SessionSave<CR>', desc = 'Save session' },
  },

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    allowed_dirs = { '~/code/*', '~/simscale/*' },
    bypass_save_filetypes = { 'alpha', 'dashboard' },
    git_use_branch_name = true,
  },
}
