-- Keymaps 
vim.keymap.set("x",				"<leader>re",	function() require("refactoring").refactor("Extract Function")				end, { desc = "Extract Function"				})
vim.keymap.set("x",				"<leader>rf",	function() require("refactoring").refactor("Extract Function To File")	end, { desc = "Extract Function to File"	})
vim.keymap.set("x",				"<leader>rv",	function() require("refactoring").refactor("Extract Variable")				end, { desc = "Extract Variable"				})
vim.keymap.set("n",				"<leader>rI",	function() require("refactoring").refactor("Inline Function")				end, { desc = "Inline Function"				})
vim.keymap.set("n",				"<leader>rr",	function() require("refactoring").refactor("Refactor Names")				end, { desc = "Refactor Names"				})
vim.keymap.set({ "n", "x" },	"<leader>ri",	function() require("refactoring").refactor("Inline Variable")				end, { desc = "Inline Variable"				})
vim.keymap.set("n",				"<leader>rb",	function() require("refactoring").refactor("Extract Block")					end, { desc = "Extract Block"					})
vim.keymap.set("n",				"<leader>rbf", function() require("refactoring").refactor("Extract Block To File")		end, { desc = "Extract Block to File"		})

require("refactoring").setup()
