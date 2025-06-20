return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup()
		-- REQUIRED

		-- basic telescope configuration
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local finder = function()
				local paths = {}
				for index, item in ipairs(harpoon_files.items) do
					local fullName = tostring(index) .. " " .. item.value
					table.insert(paths, {
						index = index,
						value = item.value,
						fullName = fullName,
					})
				end

				return require("telescope.finders").new_table({
					results = paths,
					entry_maker = function(entry)
						return {
							value = entry.value,
							display = entry.fullName,
							ordinal = entry.fullName,
						}
					end,
				})
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = finder(),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
					attach_mappings = function(prompt_bufnr, map)
						map("i", "<c-d>", function()
							local state = require("telescope.actions.state")
							local selected_entry = state.get_selected_entry()
							local current_picker = state.get_current_picker(prompt_bufnr)

							table.remove(harpoon_files.items, selected_entry.index)
							current_picker:refresh(finder())
						end)
						return true
					end,
				})
				:find()
		end

		vim.keymap.set("n", "<C-A>", function()
			harpoon:list():prepend()
			print("[Harpoon]: Added file")
		end, { desc = "Harpoon add (prepend) file" })

		vim.keymap.set("n", "<C-a>", function()
			harpoon:list():add()
			print("[Harpoon]: Added file")
		end, { desc = "Harpoon add file" })

		vim.keymap.set("n", "<leader>hd", function()
			harpoon:list():add()
			print("[Harpoon]: Removed file")
		end, { desc = "Harpoon remove file" })

		vim.keymap.set("n", "<C-h>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon quick menu" })

		vim.keymap.set("n", "<leader>fh", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Open harpoon telescop window" })

		vim.keymap.set("n", "<leader>h[", function()
			harpoon:list():prev()
		end, { desc = "Harpoon previous file" })

		vim.keymap.set("n", "<leader>h]", function()
			harpoon:list():next()
		end, { desc = "Harpoon next file" })
	end,
}
