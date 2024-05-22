local map = vim.keymap.set
-- git related remaps
local gitsigns = require('gitsigns')

map('n', ']c', function()
  if vim.wo.diff then
    vim.cmd.normal({ ']c', bang = true })
  else
    gitsigns.nav_hunk('next')
  end
end, { desc = "Git next hunk" })
map('n', '[c', function()
  if vim.wo.diff then
    vim.cmd.normal({ '[c', bang = true })
  else
    gitsigns.nav_hunk('prev')
  end
end, { desc = "Git previous hunk" })

-- Actions
map('n', '<leader>ggs', gitsigns.stage_hunk, { desc = "Git stage hunk" })
map('n', '<leader>ggr', gitsigns.reset_hunk, { desc = "Git reset hunk" })
map('v', '<leader>ggs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
map('v', '<leader>ggr', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
map('n', '<leader>ggS', gitsigns.stage_buffer, { desc = "Git Stage buffer" })
map('n', '<leader>ggu', gitsigns.undo_stage_hunk, { desc = "Git undo-stage hunk" })
map('n', '<leader>ggR', gitsigns.reset_buffer, { desc = "Git Reset buffer" })
map('n', '<leader>ggp', gitsigns.preview_hunk, { desc = "Git preview hunk" })
-- map('n', '<leader>gb', function() gitsigns.blame_line { full = true } end)
map('n', '<leader>tgb', gitsigns.toggle_current_line_blame, { desc = "Git toggle current line blame" })
map('n', '<leader>ggd', gitsigns.diffthis, { desc = "Git diff this" })
map('n', '<leader>ggD', function() gitsigns.diffthis('~') end, { desc = "Git diff this Selection" })
map('n', '<leader>tgd', gitsigns.toggle_deleted, { desc = "Git toggle deleted" })
