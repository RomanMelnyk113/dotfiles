local status_ok, go = pcall(require, "go")
if not status_ok then
  return
end

local dapgo_status_ok, dapgo = pcall(require, "dap-go")
if not dapgo_status_ok then
  return
end

go.setup()
dapgo.setup()
