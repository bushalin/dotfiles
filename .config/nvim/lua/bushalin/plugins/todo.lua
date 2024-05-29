return {
  -- TODO:
  -- HACK:
  -- WARN:
  -- WARNING:
  -- XXX:
  -- PREF:
  -- OPTIM:
  -- PERFORMANCE:
  -- OPTIMIZE:
  -- NOTE:
  -- INFO:
  -- TEST:
  -- TESTING:
  -- PASSED:
  -- FAILED:
  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = true },
    keys = {
      vim.keymap.set('n', ']t', function()
        require('todo-comments').jump_next {
          keywords = {
            'ERROR',
            'WARNING',
          },
        }
      end, { desc = '[T]odo comment jump_next' }),

      vim.keymap.set('n', '[t', function()
        require('todo-comments').jump_prev {
          keywords = {
            'ERROR',
            'WARNING',
          },
        }
      end, { desc = '[T]odo comment jump_prev' }),
    },
  },
}
