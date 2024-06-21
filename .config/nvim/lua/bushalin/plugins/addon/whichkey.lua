return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()

      -- Document existing key chains
      require('which-key').register {
        ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore', c = { 'Codesnap [C]opy'}, s = { 'Codesnap [S]ave'} },
        ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
        ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
        ['<leader>f'] = { name = '[F]ind', _ = 'which_key_ignore', l = { '[L]ive [G]rep' }, g = { '[G]it' }, t = { '[T]hemes'} },
        ['<leader>w'] = { name = '[W]orkspace/[W]iki', _ = 'which_key_ignore' },
        ['<leader>o'] = { name = '[O]bsidian', _ = 'which_key_ignore', n = {'Obsidian [N]ew'}, t = { 'Obsidian [T]emplate'} },
        ['<leader>t'] = { name = '[T]rouble', _ = 'which_key_ignore' },
        -- NOTE:
        -- you can specify second level of prefixes like this
        ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore', t = { '[T]oggle' } },
        ['<leader>h'] = { name = '[H]arpoon', _ = 'which_key_ignore' },
        ['<leader>u'] = { name = '[U]ndo Tree', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = '[S]ource', _ = 'which_key_ignore' },
      }
      -- WARN:
      -- visual mode throws error in the updated version
      --
      -- require('which-key').register({
      --   ['<leader>g'] = { '[G]it' },
      -- }, { mode = 'v' })
    end,
  },
}
