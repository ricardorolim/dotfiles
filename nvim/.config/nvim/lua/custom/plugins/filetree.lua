return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  keys = {
    { '<leader>ft', '<cmd>Neotree toggle<cr>', desc = 'NeoTree' },
    { '<leader>fr', '<cmd>Neotree reveal<cr>', desc = 'NeoTree' },
  },
  opts = {
    buffers = {
      follow_current_file = { enabled = true },
    },
    window = {
      mappings = {
        ['Z'] = 'expand_all_nodes',
      },
    },
  },
}
