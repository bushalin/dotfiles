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
          component_separators = topSeparators,
          section_separators = topSeparators,
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
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
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
          lualine_x = { lsp_clients, 'fileformat', 'filetype' },
          lualine_y = { 'hostname' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {},
      }
    end,
  },
}
