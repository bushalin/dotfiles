return {
  {
    'vimwiki/vimwiki',
    enabled = false,
    ft = '.md',
    event = 'BufEnter *.md',
    keys = { '<leader>ww', '<leader>wt', '<leader>ws' },
    init = function()
      vim.g.vimwiki_list = {
        {
          path = '~/Documents/vimwiki/',
          syntax = 'markdown',
          ext = '.md',
        },
        {
          path = '~/Documents/Work/Notes/',
          syntax = 'markdown',
          ext = '.md',
        },
        {
          path = '~/Documents/Personal/Obsidian/',
          syntax = 'markdown',
          ext = '.md',
        },
      }
      vim.g.vimwiki_ext2syntax = {
        ['.md'] = 'markdown',
        ['.markdown'] = 'markdown',
        ['.mdown'] = 'markdown',
      }
    end,
  },
}
