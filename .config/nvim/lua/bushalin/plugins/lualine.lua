---@diagnostic disable: unused-local
return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
    config = function()
      local lsp_clients = function()
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
          return ''
        end

        local c = {}
        for _, client in pairs(clients) do
          table.insert(c, client.name)
        end
        return '󰫹󰬀󰫽 ' .. table.concat(c, '|')
      end

      -- NOTE:
      -- Show lsp progress in the lualine
      local lsp_progress = function()
        local messages = vim.lsp.util.get_progress_messages()
        if #messages == 0 then
          return
        end
        local status = {}
        for _, msg in pairs(messages) do
          table.insert(status, (msg.percentage or 0) .. '%% ' .. (msg.title or ''))
        end
        local spinners = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' }
        local ms = vim.loop.hrtime() / 1000000
        local frame = math.floor(ms / 120) % #spinners
        return table.concat(status, ' | ') .. ' ' .. spinners[frame + 1]
      end

      -- separators
      local bottomSeparators = { left = '', right = '' }
      local topSeparators = { left = '', right = '' }
      local emptySeparators = { left = '', right = '' }

      local default_section_separator = { left = '', right = '' }
      local round_section_separator = { left = '', right = '' }
      local stright_section_separator = { left = '', right = '' }

      local default_component_separator = { left = '', right = '' }
      local round_component_separator = { left = '', right = '' }
      local stright_component_separator = { left = '', right = '' }

      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          -- NOTE:
          -- Separators    
          -- For straight line just give an empty string
          component_separators = round_component_separator,
          section_separators = round_section_separator,
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {
            'dapui_watches',
            'dapui_breakpoints',
            'dapui_scopes',
            'dapui_console',
            'dapui_stacks',
            'dap-repl',
          },
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = {
            { 'branch' },
            { 'diff' },
            {
              'diagnostics',
              update_in_insert = false,
            },
          },
          lualine_c = {
            {
              'filename',
              file_status = true,
              path = 0,
            },
          },
          lualine_x = {
            { 'filetype' },
          },
          lualine_y = {
            {
              function()
                local lsps = vim.lsp.get_active_clients { bufnr = vim.fn.bufnr() }
                local icon = require('nvim-web-devicons').get_icon_by_filetype(vim.api.nvim_buf_get_option(0, 'filetype'))
                if lsps and #lsps > 0 then
                  local names = {}
                  for _, lsp in ipairs(lsps) do
                    table.insert(names, lsp.name)
                  end
                  return string.format('%s %s', table.concat(names, ', '), icon)
                else
                  return icon or ''
                end
              end,

              on_click = function()
                vim.api.nvim_command 'LspInfo'
              end,
              color = function()
                local _, color = require('nvim-web-devicons').get_icon_cterm_color_by_filetype(vim.api.nvim_buf_get_option(0, 'filetype'))
                return { fg = color }
              end,
            },
            { 'hostname', icons_enabled = true, icon = '' },
          },
          lualine_z = {
            {
              'location',
            },
            {
              function()
                local starts = vim.fn.line 'v'
                local ends = vim.fn.line '.'
                local count = starts <= ends and ends - starts + 1 or starts - ends + 1
                return count .. 'V'
              end,
              cond = function()
                return vim.fn.mode():find '[Vv]' ~= nil
              end,
            },
          },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {
          lualine_a = { 'buffers' },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { { 'tabs', mode = 1, path = 1, } },
        },
        winbar = {},
        inactive_winbar = {},
        extensions = {},
      }
    end,
  },
}
