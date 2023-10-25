-- local dap = require("dap")

-- -- dap.configurations.go = {
-- --   type = "go",
-- --   name = "Attach Remote",
-- --   mode = "remote",
-- --   request = "attach",
-- -- }

-- require('dap-go').setup {
--   dap_configurations = {
--     {
--       type = "go",
--       name = "Attach Remote",
--       mode = "remote",
--       request = "attach"
--     },
--   },

--   delve = {
--     path = "dlv",
--     initialize_timeout_sec = 20,
--     port = "${port}",
--     args = {},
--   },

-- }


require("dap-go").setup()
local dap = require("dap")

dap.adapters.go = function(callback, config)
	local stdout = vim.loop.new_pipe(false)
    local handle
    local pid_or_err
    local port = 38697
    local opts = {
		stdio = {nil, stdout},
		args = {"dap", "-l", "127.0.0.1:" .. port},
		detached = true
    }
    handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
		stdout:close()
		handle:close()
		if code ~= 0 then
			print('dlv exited with code', code)
		end
    end)
    assert(handle, 'Error running dlv: ' .. tostring(pid_or_err))
    stdout:read_start(function(err, chunk)
		assert(not err, err)
		if chunk then
			vim.schedule(function()
				require('dap.repl').append(chunk)
			end)
		end
    end)
    -- Wait for delve to start
    vim.defer_fn(
		function()
			callback({type = "server", host = "127.0.0.1", port = port})
		end,
		100)
end

dap.configurations.go = {
	{
		type = "go",
		name = "Debug the golang",
		request = "launch",
		program = "${file}",
		env = {
			DB_USER = "docker",
			DB_PASS = "docker",
			DB_NAME = "sampledb"
		}
	},
	{
		type = "go",
		name = "Debug the golang test",
		request = "launch",
		mode = "test",
		program = "${file}",
	},
	{
		type = "go",
		name = "Debug test (go.mod)",
		request = "launch",
		mode = "test",
		program = "./${relativeFileDirname}",
	}
}

