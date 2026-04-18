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
  opts = function(_, opts)
    -- local api = require 'pymple.api'
    -- local config = require 'pymple.config'
    --
    -- local function on_move(args)
    --   api.update_imports(args.source, args.destination, config.user_config.update_imports)
    -- end
    --
    -- local events = require 'neo-tree.events'
    -- opts.event_handlers = opts.event_handlers or {}
    -- vim.list_extend(opts.event_handlers, {
    --   { event = events.FILE_MOVED, handler = on_move },
    --   { event = events.FILE_RENAMED, handler = on_move },
    -- })

    local static_opts = {
      buffers = {
        follow_current_file = { enabled = true },
      },
      window = {
        mappings = {
          ['Z'] = 'expand_all_nodes',
        },
      },
    }
    vim.tbl_deep_extend('force', static_opts, opts)
  end,
}
