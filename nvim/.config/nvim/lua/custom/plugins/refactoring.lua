return {
  'ThePrimeagen/refactoring.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    local refactoring = require 'refactoring'
    refactoring.setup()

    -- Extract function supports only visual mode
    vim.keymap.set('x', '<leader>re', function()
      refactoring.refactor 'Extract Function'
    end, { desc = 'Extract Function' })

    vim.keymap.set('x', '<leader>rf', function()
      refactoring.refactor 'Extract Function To File'
    end, { desc = 'Extract Function To File' })

    -- Extract variable supports only visual mode
    vim.keymap.set('x', '<leader>rv', function()
      refactoring.refactor 'Extract Variable'
    end, { desc = 'Extract Variable' })

    -- Inline func supports only normal
    vim.keymap.set('n', '<leader>rI', function()
      refactoring.refactor 'Inline Function'
    end, { desc = 'Inline Function' })

    -- Inline var supports both normal and visual mode
    vim.keymap.set({ 'n', 'x' }, '<leader>ri', function()
      refactoring.refactor 'Inline Variable'
    end, { desc = 'Inline Variable' })

    vim.keymap.set('n', '<leader>rb', function()
      refactoring.refactor 'Extract Block'
    end, { desc = 'Extract Block' })

    -- Extract block supports only normal mode
    vim.keymap.set('n', '<leader>rbf', function()
      refactoring.refactor 'Extract Block To File'
    end, { desc = 'Extract Block To File' })

    -- prompt for a refactor to apply when the remap is triggered
    vim.keymap.set({ 'n', 'x' }, '<leader>rr', function()
      require('refactoring').select_refactor()
    end)
    -- Note that not all refactor support both normal and visual mode

    -- only the last line of a visual selection is left after using this
    -- load refactoring Telescope extension
    -- require('telescope').load_extension 'refactoring'

    -- vim.keymap.set({ 'n', 'x' }, '<leader>rr', function()
    --   require('telescope').extensions.refactoring.refactors()
    -- end)
  end,
}
