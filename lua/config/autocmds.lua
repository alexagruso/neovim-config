vim.api.nvim_create_autocmd("InsertEnter", {
	desc ="Disable relative number lines when entering insert mode",
	group=vim.api.nvim_create_augroup("disable-relative-number",{clear=true}),
	callback = function()
		vim.opt.relativenumber = false
	end
})

vim.api.nvim_create_autocmd("InsertLeave", {
	desc ="Enable relative number lines when exiting insert mode",
	group=vim.api.nvim_create_augroup("enable-relative-number",{clear=true}),
	callback = function()
		vim.opt.relativenumber = true
	end
})
