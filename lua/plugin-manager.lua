-- Bootstrap plugin manager (packer.nvim).
local ensure_plugin_manager = function()
	local plugin_manager_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if vim.fn.empty(vim.fn.glob(plugin_manager_path)) > 0 then
		vim.fn.system({
			"git",
			"clone",
			"--depth",
			"1",
			"https://github.com/wbthomason/packer.nvim",
			plugin_manager_path,
		})
		vim.cmd [[ packadd packer.nvim ]]
		return true
	else
		return false
	end
end

return ensure_plugin_manager()
