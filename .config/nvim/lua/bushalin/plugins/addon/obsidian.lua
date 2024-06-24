return {
  {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = '.md',
    event = 'BufEnter *.md',
    keys = { '<leader>oo', '<leader>on', '<leader>od'},
    dependencies = {
      -- Required.
      'nvim-lua/plenary.nvim',
    },

    config = function()
      local obsidian = require 'obsidian'

      local opts = {
        workspaces = {
          {
            name = 'personal',
            path = '~/Documents/obsidian/personal/',
            overrides = {
              notes_subdir = 'notes',
            },
            templates = {
              folder = 'templates',
              date_format = '%Y-%m-%d-%a',
              time_format = '%H:%M',
            },
            new_notes_location = 'current_dir',
          },
        },

        -- Alternatively - and for backwards compatibility - you can set 'dir' to a single path instead of
        -- 'workspaces'. For example:
        -- dir = "~/vaults/work",

        -- Optional, if you keep notes in a specific subdirectory of your vault.
        notes_subdir = 'notes',

        -- Optional, set the log level for obsidian.nvim. This is an integer corresponding to one of the log
        -- levels defined by "vim.log.levels.*".
        log_level = vim.log.levels.INFO,

        daily_notes = {
          -- Optional, if you keep daily notes in a separate directory.
          folder = 'dailies',
          -- Optional, if you want to change the date format for the ID of daily notes.
          date_format = '%Y-%m-%d',
          -- Optional, if you want to change the date format of the default alias of daily notes.
          alias_format = '%B %-d, %Y',
          -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
          template = nil,
        },

        -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
        completion = {
          -- Set to false to disable completion.
          nvim_cmp = true,
          -- Trigger completion at 2 chars.
          min_chars = 2,
        },

        -- Optional, configure key mappings. These are the defaults. If you don't want to set any keymappings this
        -- way then set 'mappings = {}'.
        mappings = {
          -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
          ['gf'] = {
            action = function()
              return require('obsidian').util.gf_passthrough()
            end,
            opts = { noremap = false, expr = true, buffer = true },
          },
          -- Toggle check-boxes.
          ['<leader>ch'] = {
            action = function()
              return require('obsidian').util.toggle_checkbox()
            end,
            opts = { buffer = true },
          },
          -- Smart action depending on context, either follow link or toggle checkbox.
          ['<cr>'] = {
            action = function()
              return require('obsidian').util.smart_action()
            end,
            opts = { buffer = true, expr = true },
          },
        },

        -- Where to put new notes. Valid options are
        --  * "current_dir" - put new notes in same directory as the current buffer.
        --  * "notes_subdir" - put new notes in the default notes subdirectory.
        new_notes_location = 'notes_subdir',

        -- Optional, customize how note IDs are generated given an optional title.
        ---@param title string|?
        ---@return string
        note_id_func = function(title)
          -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
          -- In this case a note with the title 'My new note' will be given an ID that looks
          -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
          local suffix = ''
          if title ~= nil then
            -- If title is given, transform it into valid file name.
            suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
          else
            -- If title is nil, just add 4 random uppercase letters to the suffix.
            for _ = 1, 4 do
              suffix = suffix .. tostring(os.time()) .. string.char(math.random(65, 90))
            end
          end
          -- return tostring(os.time()) .. '-' .. suffix
          return suffix
        end,

        -- Optional, customize how note file names are generated given the ID, target directory, and title.
        ---@param spec { id: string, dir: obsidian.Path, title: string|? }
        ---@return string|obsidian.Path The full path to the new note.
        note_path_func = function(spec)
          -- This is equivalent to the default behavior.
          local path = spec.dir / tostring(spec.id)
          return path:with_suffix '.md'
        end,

        -- Optional, customize how wiki links are formatted. You can set this to one of:
        --  * "use_alias_only", e.g. '[[Foo Bar]]'
        --  * "prepend_note_id", e.g. '[[foo-bar|Foo Bar]]'
        --  * "prepend_note_path", e.g. '[[foo-bar.md|Foo Bar]]'
        --  * "use_path_only", e.g. '[[foo-bar.md]]'
        -- Or you can set it to a function that takes a table of options and returns a string, like this:
        wiki_link_func = 'use_alias_only',
        -- wiki_link_func = function(opts)
        --   return require('obsidian.util').wiki_link_id_prefix(opts)
        -- end,

        -- Optional, customize how markdown links are formatted.
        markdown_link_func = 'use_alias_only',
        -- markdown_link_func = function(opts)
        --   return require('obsidian.util').markdown_link(opts)
        -- end,

        -- Either 'wiki' or 'markdown'.
        preferred_link_style = 'markdown',

        -- Optional, customize the default name or prefix when pasting images via `:ObsidianPasteImg`.
        ---@return string
        image_name_func = function()
          -- Prefix image names with timestamp.
          return string.format('%s-', os.time())
        end,

        -- Optional, boolean or a function that takes a filename and returns a boolean.
        -- `true` indicates that you don't want obsidian.nvim to manage frontmatter.
        disable_frontmatter = false,

        -- Optional, alternatively you can customize the frontmatter data.
        ---@return table
        note_frontmatter_func = function(note)
          -- Add the title of the note as an alias.
          if note.title then
            note:add_alias(note.title)
          end

          local out = { id = note.id, aliases = note.aliases, tags = note.tags }

          -- `note.metadata` contains any manually added fields in the frontmatter.
          -- So here we just make sure those fields are kept in the frontmatter.
          if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
            for k, v in pairs(note.metadata) do
              out[k] = v
            end
          end

          return out
        end,

        -- Optional, for templates (see below).
        templates = {
          folder = 'templates',
          date_format = '%Y-%m-%d',
          time_format = '%H:%M',
          -- A map for custom variables, the key should be the variable and the value a function
          substitutions = {},
        },

        -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
        -- URL it will be ignored but you can customize this behavior here.
        ---@param url string
        follow_url_func = function(url)
          -- Open the URL in the default web browser.
          vim.fn.jobstart { 'open', url } -- Mac OS
          -- vim.fn.jobstart({"xdg-open", url})  -- linux
        end,

        -- Optional, set to true if you use the Obsidian Advanced URI plugin.
        -- https://github.com/Vinzent03/obsidian-advanced-uri
        use_advanced_uri = false,
      }
      obsidian.setup(opts)

      vim.keymap.set('n', '<leader>oo',function ()
        local telescope = require('telescope.builtin')
        local notes_path = os.getenv 'HOME' .. '/Documents/obsidian/personal/'
        telescope.find_files { cwd = notes_path }
      end, {desc = '[O]bsidian [O]pen'})

      vim.keymap.set('n', '<leader>on', '<cmd>ObsidianNew<cr>', { desc = '[O]bsidian [N]ew' })
      vim.keymap.set('n', '<leader>od', '<cmd>ObsidianToday<cr>', { desc = '[O]bsidian [D]aily TODAY' })
      vim.keymap.set('n', '<leader>ot', '<cmd>ObsidianTemplate<cr>', { desc = '[O]bsidian [T]emplate' })
    end,
  },
}
