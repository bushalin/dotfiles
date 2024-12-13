return {
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font, lazy = true },
    },
    config = function()
      local telescope = require('telescope')
      local builtin = require('telescope.builtin')
      local themes = require('telescope.themes')

      telescope.setup {
        pickers = {
          find_files = {
            theme = 'ivy',
          },
          builtin = { theme = 'ivy' },
          grep_string = { theme = 'ivy' },
          live_grep = { theme = 'ivy' },
          oldfiles = { theme = 'ivy' },
          colorscheme = { enable_preview = true },
        },
        extensions = {
          fzf = {},
          ['ui-select'] = themes.get_dropdown(),
        },
      }

      -- Load Telescope extensions
      local extensions = { 'fzf', 'ui-select', 'harpoon', 'notify', 'CopilotChat' }
      for _, ext in ipairs(extensions) do
        pcall(telescope.load_extension, ext)
      end

      -- Key mappings for Telescope
      local keymap = vim.keymap.set
      keymap('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
      keymap('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
      keymap('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
      keymap('n', '<leader>fs', builtin.builtin, { desc = '[F]ind [S]elect Telescope' })
      keymap('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
      keymap('n', '<leader>flg', builtin.live_grep, { desc = '[F]ind [L]ive [G]rep' })
      keymap('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
      keymap('n', '<leader>fr', builtin.resume, { desc = '[F]ind [R]esume' })
      keymap('n', '<leader>fm', builtin.marks, { desc = '[F]ind [M]arks' })
      keymap('n', '<leader>fgc', builtin.git_commits, { desc = '[F]ind [G]it [C]ommits' })
      keymap('n', '<leader>fgs', builtin.git_status, { desc = '[F]ind [G]it [S]tatus' })
      keymap('n', '<leader>f.', builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
      keymap('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      keymap('n', '<leader>fO', function() builtin.live_grep({ search_dirs = vim.v.oldfiles }) end, { desc = '[F]ind in [O]ldfiles'})

      -- Advanced key mappings with additional configurations
      keymap('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(themes.get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      keymap('n', '<leader>f/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[F]ind [/] in Open Files' })

      keymap('n', '<leader>fa', function()
        builtin.find_files {
          follow = true,
          hidden = true,
          no_ignore = true,
        }
      end, { desc = '[F]ind [A]ll files' })

      keymap('n', '<leader>fn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[F]ind [N]eovim files' })

      keymap('n', '<leader>fs', function()
        builtin.treesitter {
          theme = 'cursor'
        }
      end, { desc = '[F]ind [S]ymbols'})

    end,
  },
}

