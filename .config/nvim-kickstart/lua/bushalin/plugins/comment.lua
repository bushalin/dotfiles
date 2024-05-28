return {
  {
    'numToStr/Comment.nvim',
    keys = {
      { 'gcc', mode = 'n', desc = 'comment toggle current line' },
      { 'gc', mode = { 'n', 'o' }, desc = 'comment toggle linewise' },
      { 'gc', mode = 'x', desc = 'comment toggle linewise (visual)' },
      { 'gbc', mode = 'n', desc = 'comment toggle current block' },
      { 'gb', mode = { 'n', 'o' }, desc = 'comment toggle blockwise' },
      { 'gb', mode = 'x', desc = 'comment toggle blockwise (visual)' },
    },
    opts = {},
  },
}
