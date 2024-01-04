local ok, iom = pcall(require, "indent-o-matic")
if not ok then
	return
end

iom.setup()
