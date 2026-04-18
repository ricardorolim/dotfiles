return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'main',
    build = ':TSUpdate',
    -- opts = {
    --   textobjects = {
    --     select = {
    --       enable = true,
    --
    --       -- Automatically jump forward to textobj, similar to targets.vim
    --       lookahead = true,
    --
    --       keymaps = {
    --         -- You can use the capture groups defined in textobjects.scm
    --         ['aa'] = { query = '@parameter.outer', desc = 'Select outer parameter' },
    --         ['ia'] = { query = '@parameter.inner', desc = 'Select inner parameter' },
    --         ['am'] = { query = '@function.outer', desc = 'Select outer function' },
    --         ['im'] = { query = '@function.inner', desc = 'Select inner function' },
    --         ['ac'] = { query = '@class.outer', desc = 'Select outer part of a class region' },
    --         ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class region' },
    --         ['ai'] = { query = '@conditional.outer', desc = 'Select outer part of a conditional region' },
    --         ['ii'] = { query = '@conditional.inner', desc = 'Select inner part of a conditional region' },
    --         ['al'] = { query = '@loop.outer', desc = 'Select outer part of a loop region' },
    --         ['il'] = { query = '@loop.inner', desc = 'Select inner part of a loop region' },
    --         ['at'] = { query = '@comment.outer', desc = 'Select outer part of a comment region' },
    --       },
    --       -- You can choose the select mode (default is charwise 'v')
    --       --
    --       -- Can also be a function which gets passed a table with the keys
    --       -- * query_string: eg '@function.inner'
    --       -- * method: eg 'v' or 'o'
    --       -- and should return the mode ('v', 'V', or '<c-v>') or a table
    --       -- mapping query_strings to modes.
    --       selection_modes = {
    --         ['@parameter.outer'] = 'v', -- charwise
    --         ['@function.inner'] = 'V', -- linewise
    --         ['@function.outer'] = 'V', -- linewise
    --         -- ['@class.outer'] = '<c-v>', -- blockwise
    --         ['@class.inner'] = 'V', -- linewise
    --         ['@class.outer'] = 'V', -- linewise
    --       },
    --       -- If you set this to `true` (default is `false`) then any textobject is
    --       -- extended to include preceding or succeeding whitespace. Succeeding
    --       -- whitespace has priority in order to act similarly to eg the built-in
    --       -- `ap`.
    --       --
    --       -- Can also be a function which gets passed a table with the keys
    --       -- * query_string: eg '@function.inner'
    --       -- * selection_mode: eg 'v'
    --       -- and should return true or false
    --       include_surrounding_whitespace = true,
    --     },
    --     swap = {
    --       enable = true,
    --       swap_next = {
    --         ['<leader>a'] = '@parameter.inner',
    --       },
    --       swap_previous = {
    --         ['<leader>A'] = '@parameter.inner',
    --       },
    --     },
    --     move = {
    --       enable = true,
    --       set_jumps = true, -- whether to set jumps in the jumplist
    --       goto_next_start = {
    --         [']f'] = '@function.outer',
    --         [']]'] = { query = '@class.outer', desc = 'Next class start' },
    --         --
    --         -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
    --         [']o'] = '@loop.*',
    --         -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
    --         --
    --         -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
    --         -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
    --         [']s'] = { query = '@scope', query_group = 'locals', desc = 'Next scope' },
    --         [']z'] = { query = '@fold', query_group = 'folds', desc = 'Next fold' },
    --         [']p'] = '@parameter.inner',
    --         [']r'] = '@assignment.rhs',
    --         [']l'] = '@assignment.lhs',
    --         [']i'] = '@conditional.outer',
    --       },
    --       goto_next_end = {
    --         [']F'] = '@function.outer',
    --         [']['] = '@class.outer',
    --         [']P'] = '@parameter.inner',
    --         [']R'] = '@assignment.rhs',
    --         [']L'] = '@assignment.lhs',
    --         [']I'] = '@conditional.outer',
    --       },
    --       goto_previous_start = {
    --         ['[f'] = '@function.outer',
    --         ['[['] = '@class.outer',
    --         ['[p'] = '@parameter.inner',
    --         ['[r'] = '@assignment.rhs',
    --         ['[l'] = '@assignment.lhs',
    --         ['[i'] = '@conditional.outer',
    --       },
    --       goto_previous_end = {
    --         ['[F'] = '@function.outer',
    --         ['[]'] = '@class.outer',
    --         ['[P'] = '@parameter.inner',
    --         ['[R'] = '@assignment.rhs',
    --         ['[L'] = '@assignment.lhs',
    --         ['[I'] = '@conditional.outer',
    --       },
    --       -- Below will go to either the start or the end, whichever is closer.
    --       -- Use if you want more granular movements
    --       -- Make it even more gradual by adding multiple queries and regex.
    --       goto_next = {
    --         -- [']i'] = '@conditional.outer',
    --       },
    --       goto_previous = {
    --         -- ['[i'] = '@conditional.outer',
    --       },
    --     },
    --     lsp_interop = {
    --       enable = true,
    --       border = 'none',
    --       floating_preview_opts = {},
    --       peek_definition_code = {
    --         ['<leader>df'] = '@function.outer',
    --         ['<leader>dF'] = '@class.outer',
    --       },
    --     },
    --   },
    -- },
    dependencies = { 'nvim-treesitter/nvim-treesitter-context', 'nvim-treesitter/nvim-treesitter-textobjects' },
    config = function()
      -- ensure basic parser are installed
      local parsers = {
        'bash',
        'c',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
        'java',
        'javascript',
        'typescript',
        'rust',
        'python',
        'go',
      }
      require('nvim-treesitter').install(parsers)

      ---@param buf integer
      ---@param language string
      local function treesitter_try_attach(buf, language)
        -- check if parser exists and load it
        if not vim.treesitter.language.add(language) then
          return
        end
        -- enables syntax highlighting and other treesitter features
        vim.treesitter.start(buf, language)

        -- enables treesitter based folds
        -- for more info on folds see `:help folds`
        -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        -- vim.wo.foldmethod = 'expr'

        -- check if treesitter indentation is available for this language, and if so enable it
        -- in case there is no indent query, the indentexpr will fallback to the vim's built in one
        local has_indent_query = vim.treesitter.query.get(language, 'indents') ~= nil

        -- enables treesitter based indentation
        if has_indent_query then
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end

      local available_parsers = require('nvim-treesitter').get_available()
      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          local buf, filetype = args.buf, args.match

          local language = vim.treesitter.language.get_lang(filetype)
          if not language then return end

          local installed_parsers = require('nvim-treesitter').get_installed 'parsers'

          if vim.tbl_contains(installed_parsers, language) then
            -- enable the parser if it is installed
            treesitter_try_attach(buf, language)
          elseif vim.tbl_contains(available_parsers, language) then
            -- if a parser is available in `nvim-treesitter` auto install it, and enable it after the installation is done
            require('nvim-treesitter').install(language):await(function() treesitter_try_attach(buf, language) end)
          else
            -- try to enable treesitter features in case the parser exists but is not available from `nvim-treesitter`
            treesitter_try_attach(buf, language)
          end
        end,
      })

    end,
  },

  {
    'MeanderingProgrammer/treesitter-modules.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-space>',
          node_incremental = '<C-space>',
          scope_incremental = 'gs',
          node_decremental = '<bs>',
        },
      },
    },
  },

  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    dependencies = { 'nvim-treesitter/nvim-treesitter', branch = 'main' },
    init = function()
      -- Disable entire built-in ftplugin mappings to avoid conflicts.
      -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
      vim.g.no_plugin_maps = true

      -- Or, disable per filetype (add as you like)
      -- vim.g.no_python_maps = true
      -- vim.g.no_ruby_maps = true
      -- vim.g.no_rust_maps = true
      -- vim.g.no_go_maps = true
    end,
    config = function(_, opts)
      require('nvim-treesitter-textobjects').setup {
        select = {
          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          -- You can choose the select mode (default is charwise 'v')
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * method: eg 'v' or 'o'
          -- and should return the mode ('v', 'V', or '<c-v>') or a table
          -- mapping query_strings to modes.
          selection_modes = {
            ['@parameter.outer'] = 'v', -- charwise
            ['@function.inner'] = 'V', -- linewise
            ['@function.outer'] = 'V', -- linewise
            -- ['@class.outer'] = '<c-v>', -- blockwise
            ['@class.inner'] = 'V', -- linewise
            ['@class.outer'] = 'V', -- linewise
          },
          -- If you set this to `true` (default is `false`) then any textobject is
          -- extended to include preceding or succeeding whitespace. Succeeding
          -- whitespace has priority in order to act similarly to eg the built-in
          -- `ap`.
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * selection_mode: eg 'v'
          -- and should return true or false
          include_surrounding_whitespace = true,
        },

        move = {
          set_jumps = true, -- whether to set jumps in the jumplist
        },
      }

      -- make sure forward function comes first
      -- local next_hunk_repeat, prev_hunk_repeat = ts_repeat_move.make_repeatable_move_pair(gs.next_hunk, gs.prev_hunk)
      -- Or, use `make_repeatable_move` or `set_last_move` functions for more control. See the code for instructions.

      -- select
      -- You can use the capture groups defined in `textobjects.scm`
      vim.keymap.set({ 'x', 'o' }, 'am', function()
        require('nvim-treesitter-textobjects.select').select_textobject('@function.outer', 'textobjects')
      end)
      vim.keymap.set({ 'x', 'o' }, 'im', function()
        require('nvim-treesitter-textobjects.select').select_textobject('@function.inner', 'textobjects')
      end)
      vim.keymap.set({ 'x', 'o' }, 'ac', function()
        require('nvim-treesitter-textobjects.select').select_textobject('@class.outer', 'textobjects')
      end)
      vim.keymap.set({ 'x', 'o' }, 'ic', function()
        require('nvim-treesitter-textobjects.select').select_textobject('@class.inner', 'textobjects')
      end)
      -- You can also use captures from other query groups like `locals.scm`
      vim.keymap.set({ 'x', 'o' }, 'as', function()
        require('nvim-treesitter-textobjects.select').select_textobject('@local.scope', 'locals')
      end)
      vim.keymap.set({ 'x', 'o' }, 'aa', function()
        require('nvim-treesitter-textobjects.select').select_textobject('@parameter.outer', 'textobjects')
      end)
      vim.keymap.set({ 'x', 'o' }, 'ia', function()
        require('nvim-treesitter-textobjects.select').select_textobject('@parameter.inner', 'textobjects')
      end)
      vim.keymap.set({ 'x', 'o' }, 'ai', function()
        require('nvim-treesitter-textobjects.select').select_textobject('@conditional.outer', 'textobjects')
      end)
      vim.keymap.set({ 'x', 'o' }, 'ii', function()
        require('nvim-treesitter-textobjects.select').select_textobject('@conditional.inner', 'textobjects')
      end)
      vim.keymap.set({ 'x', 'o' }, 'al', function()
        require('nvim-treesitter-textobjects.select').select_textobject('@loop.outer', 'textobjects')
      end)
      vim.keymap.set({ 'x', 'o' }, 'il', function()
        require('nvim-treesitter-textobjects.select').select_textobject('@loop.inner', 'textobjects')
      end)
      vim.keymap.set({ 'x', 'o' }, 'at', function()
        require('nvim-treesitter-textobjects.select').select_textobject('@comment.outer', 'textobjects')
      end)

      -- swap
      vim.keymap.set('n', '<leader>a', function()
        require('nvim-treesitter-textobjects.swap').swap_next '@parameter.inner'
      end)
      vim.keymap.set('n', '<leader>A', function()
        require('nvim-treesitter-textobjects.swap').swap_previous '@parameter.outer'
      end)

      -- move
      -- You can use the capture groups defined in `textobjects.scm`
      vim.keymap.set({ 'n', 'x', 'o' }, ']m', function()
        require('nvim-treesitter-textobjects.move').goto_next_start('@function.outer', 'textobjects')
      end)
      vim.keymap.set({ 'n', 'x', 'o' }, ']]', function()
        require('nvim-treesitter-textobjects.move').goto_next_start('@class.outer', 'textobjects')
      end)
      -- You can also pass a list to group multiple queries.
      vim.keymap.set({ 'n', 'x', 'o' }, ']o', function()
        local move = require 'nvim-treesitter-textobjects.move'
        move.goto_next_start({ '@loop.inner', '@loop.outer' }, 'textobjects')
      end)
      -- You can also use captures from other query groups like `locals.scm` or `folds.scm`
      vim.keymap.set({ 'n', 'x', 'o' }, ']s', function()
        require('nvim-treesitter-textobjects.move').goto_next_start('@local.scope', 'locals')
      end)
      vim.keymap.set({ 'n', 'x', 'o' }, ']z', function()
        require('nvim-treesitter-textobjects.move').goto_next_start('@fold', 'folds')
      end)
      vim.keymap.set({ 'n', 'x', 'o' }, ']p', function()
        require('nvim-treesitter-textobjects.move').goto_next_start('@parameter.inner', 'textobjects')
      end)

      vim.keymap.set({ 'n', 'x', 'o' }, ']M', function()
        require('nvim-treesitter-textobjects.move').goto_next_end('@function.outer', 'textobjects')
      end)
      vim.keymap.set({ 'n', 'x', 'o' }, '][', function()
        require('nvim-treesitter-textobjects.move').goto_next_end('@class.outer', 'textobjects')
      end)

      vim.keymap.set({ 'n', 'x', 'o' }, '[m', function()
        require('nvim-treesitter-textobjects.move').goto_previous_start('@function.outer', 'textobjects')
      end)
      vim.keymap.set({ 'n', 'x', 'o' }, '[[', function()
        require('nvim-treesitter-textobjects.move').goto_previous_start('@class.outer', 'textobjects')
      end)
      vim.keymap.set({ 'n', 'x', 'o' }, '[p', function()
        require('nvim-treesitter-textobjects.move').goto_previous_start('@parameter.inner', 'textobjects')
      end)

      vim.keymap.set({ 'n', 'x', 'o' }, '[M', function()
        require('nvim-treesitter-textobjects.move').goto_previous_end('@function.outer', 'textobjects')
      end)
      vim.keymap.set({ 'n', 'x', 'o' }, '[]', function()
        require('nvim-treesitter-textobjects.move').goto_previous_end('@class.outer', 'textobjects')
      end)

      -- Go to either the start or the end, whichever is closer.
      -- Use if you want more granular movements
      vim.keymap.set({ 'n', 'x', 'o' }, ']i', function()
        require('nvim-treesitter-textobjects.move').goto_next('@conditional.outer', 'textobjects')
      end)
      vim.keymap.set({ 'n', 'x', 'o' }, '[i', function()
        require('nvim-treesitter-textobjects.move').goto_previous('@conditional.outer', 'textobjects')
      end)

      local ts_repeat_move = require 'nvim-treesitter-textobjects.repeatable_move'

      -- Repeat movement with ; and ,
      -- ensure ; goes forward and , goes backward regardless of the last direction
      vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move_next)
      vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_previous)

      -- vim way: ; goes to the direction you were moving.
      -- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
      -- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

      -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
      vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f_expr, { expr = true })
      vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F_expr, { expr = true })
      vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t_expr, { expr = true })
      vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T_expr, { expr = true })

      -- make gitsigns.nvim movement repeatable with ; and , keys.
      -- local gs = require 'gitsigns'
      -- local next_hunk_repeat, prev_hunk_repeat = ts_repeat_move.make_repeatable_move_pair(gs.nav_hunk 'next', gs.nav_hunk 'prev')
      -- local next_hunk_repeat, prev_hunk_repeat = ts_repeat_move.make(move_fn)(gs.nav_hunk 'next', gs.nav_hunk 'prev')
      -- vim.keymap.set({ 'n', 'x', 'o' }, ']c', next_hunk_repeat)
      -- vim.keymap.set({ 'n', 'x', 'o' }, '[c', prev_hunk_repeat)
    end,
  },
}
