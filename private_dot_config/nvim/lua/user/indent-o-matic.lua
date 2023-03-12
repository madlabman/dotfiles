local status_ok, iom = pcall(require, "indent-o-matic")
if not status_ok then
	return
end

iom.setup()
