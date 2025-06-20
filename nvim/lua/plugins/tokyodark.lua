function LineNumberColors()
	vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#444B6A", bold = false })
	vim.api.nvim_set_hl(0, "LineNr", { fg = "white", bold = true })
	vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#444B6A", bold = false })
end

return {
	"tiagovla/tokyodark.nvim",
	config = function()
		vim.cmd.colorscheme("tokyodark")
		LineNumberColors()
	end,
}
