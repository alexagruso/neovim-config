return {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
	vim.keymap.set("n", "<Leader>fb", ":Telescope file_browser<CR>")
    end
}
