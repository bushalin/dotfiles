return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()
      require('which-key').add {
        { '<leader>c', group = '[C]ode' },
        { '<leader>c_', hidden = true },
        { '<leader>cc', desc = 'Codesnap [C]opy' },
        { '<leader>cs', desc = 'Codesnap [S]ave' },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>d_', hidden = true },
        { '<leader>f', group = '[F]ind' },
        { '<leader>f_', hidden = true },
        { '<leader>fg', desc = '[G]it' },
        { '<leader>fl', desc = '[L]ive [G]rep' },
        { '<leader>ft', desc = '[T]hemes' },
        { '<leader>g', group = '[G]it' },
        { '<leader>g_', hidden = true },
        { '<leader>gt', desc = '[T]oggle' },
        { '<leader>h', group = '[H]arpoon' },
        { '<leader>h_', hidden = true },
        { '<leader>o', group = '[O]bsidian' },
        { '<leader>o_', hidden = true },
        { '<leader>od', desc = '[O]bsidian [D]aily' },
        { '<leader>on', desc = '[O]bsidian [N]ew' },
        { '<leader>ot', desc = '[O]bsidian [T]emplate' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>r_', hidden = true },
        { '<leader>s', group = '[S]ource' },
        { '<leader>s_', hidden = true },
        { '<leader>t', group = '[T]rouble' },
        { '<leader>t_', hidden = true },
        { '<leader>u', group = '[U]ndo Tree' },
        { '<leader>u_', hidden = true },
        { '<leader>w', group = '[W]orkspace/[W]iki' },
        { '<leader>w_', hidden = true },
      }
    end,
  },
}
