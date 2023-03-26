local status_ok, hotpot = pcall(require, "hotpot")
if not status_ok then
	return
end

hotpot.setup()
