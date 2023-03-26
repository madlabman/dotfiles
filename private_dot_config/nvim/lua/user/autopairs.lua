local status_ok, pairs = pcall(require, "nvim-autopairs")
if not status_ok then
	return
end

pairs.setup({
    check_ts = true,
    ts_config = {
        lua = { "string" }, -- it will not add pair on that treesitter node
        javascript = { "template_string" },
    },
})
