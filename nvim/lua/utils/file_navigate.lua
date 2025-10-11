local N = {}

local function find_index(files, target_file)
	local index
	for i, f in ipairs(files) do
		if vim.fn.fnamemodify(f, ":p") == vim.fn.fnamemodify(target_file, ":p") then
			index = i
			break
		end
	end

	if not index then
		vim.notify("Current file not found in directory list", vim.log.levels.WARN)
		return
	end

	return index
end

local function get_neighbor_file(files, index, direction)
	local target_index
	if direction == "next" then
		target_index = (index % #files) + 1
	else
		target_index = (index - 2) % #files + 1
	end

	return target_index
end

local function open_file(files, index)
	local target = files[index]
	if target and vim.fn.filereadable(target) == 1 then
		vim.cmd("edit " .. vim.fn.fnameescape(target))
	else
		vim.notify("Target file not readable", vim.log.levels.WARN)
	end
end

local function prepare_files(files)
	local file_list = vim.tbl_filter(function(f)
		return vim.fn.isdirectory(f) == 0
	end, files)

	table.sort(file_list, function(a, b)
		return a:lower() < b:lower()
	end)

	return file_list
end

function N.navigate_file(direction)
	if direction ~= "next" and direction ~= "prev" then
		vim.notify("navigate_file: invalid direction (use 'next' or 'prev')", vim.log.levels.ERROR)
		return
	end

	local current_file = vim.fn.bufname()

	local dir = vim.fn.fnamemodify(current_file, ":h")
	local files = prepare_files(vim.fn.globpath(dir, "*", false, true))

	if #files == 1 then
		return
	end

	local index = find_index(files, current_file)
	local target_index = get_neighbor_file(files, index, direction)

	open_file(files, target_index)
end

return N
