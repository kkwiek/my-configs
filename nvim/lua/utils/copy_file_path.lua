local function copy_file_path(type)
  local file = vim.api.nvim_buf_get_name(0)
  if file == "" then
    vim.notify("No file name", vim.log.levels.WARN)
    return
  end

  local path
  if type == "absolute" then
    path = vim.fn.fnamemodify(file, ":p")
  elseif type == "relative" then
    path = vim.fn.fnamemodify(file, ":.")
  else
    return
  end

  vim.fn.setreg("+", path)
  vim.notify("Copied: " .. path)
end

return copy_file_path
