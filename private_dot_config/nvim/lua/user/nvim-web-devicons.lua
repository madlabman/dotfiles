local ok, webdevicons = pcall(require, "nvim-web-devicons")
if not ok then
  return
end

webdevicons.setup({
    override = {
        vy = {
            icon = "󱔎",
            name = "Vyper"
        },
    }
})
