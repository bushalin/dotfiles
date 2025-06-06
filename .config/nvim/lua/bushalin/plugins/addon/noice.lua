return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    'MunifTanjim/nui.nvim',
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
  },
  config = function()
    require('noice').setup {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = false, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = true, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
      messages = {
        enabled = true, -- enables the Noice messages UI
        view = 'mini', -- default view for messages
        view_error = 'notify', -- view for errors
        view_warn = 'notify', -- view for warnings
        view_history = 'notify', -- view for :messages
        view_search = 'virtualtext', -- view for search count messages. Set to `false` to disable
      },
      -- custom setup to show macro notifications
      routes = {
        {
          view = 'notify',
          filter = { event = 'msg_showmode' },
        },
      },
    }

    vim.keymap.set({ 'n', 'i', 's' }, '<c-f>', function()
      if not require('noice.lsp').scroll(4) then
        return '<c-f>'
      end
    end, { silent = true, expr = true })

    vim.keymap.set({ 'n', 'i', 's' }, '<c-b>', function()
      if not require('noice.lsp').scroll(-4) then
        return '<c-b>'
      end
    end, { silent = true, expr = true })
  end,
}
