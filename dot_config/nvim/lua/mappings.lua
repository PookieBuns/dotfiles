local map = function(mode, lhs, rhs, opts)
	vim.keymap.set(mode, lhs, rhs, opts)
end

local map_leader = function(mode, suffix, rhs, opts)
	vim.keymap.set(mode, "<Leader>" .. suffix, rhs, opts)
end

-- keymaps
map("i", "jk", "<Esc>")
map("n", "=", "za")
map({ "n", "v" }, "j", [[v:count == 0 ? 'gj' : 'j']], { expr = true })
map({ "n", "v" }, "k", [[v:count == 0 ? 'gk' : 'k']], { expr = true })
map_leader({ "n", "v", "o" }, "l", [[&wrap ? 'g$' : '$']], { expr = true })
map_leader({ "n", "v", "o" }, "h", [[&wrap ? 'g^' : '^']], { expr = true })

-- fat finger prevention
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Q", "q", {})
vim.api.nvim_create_user_command("WQ", "wq", {})
vim.api.nvim_create_user_command("Wq", "wq", {})

-- plugin management
vim.api.nvim_create_user_command("Plugins", function()
	vim.pack.update(nil, { offline = true })
end, {})
vim.api.nvim_create_user_command("PluginsDelete", function()
	local inactive = vim.iter(vim.pack.get())
		:filter(function(x)
			return not x.active
		end)
		:map(function(x)
			return x.spec.name
		end)
		:totable()
	vim.pack.del(inactive)
end, {})
