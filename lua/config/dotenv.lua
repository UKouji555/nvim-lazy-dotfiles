local M = {}

function M.eval(env_path)
  local file = io.open(env_path, "r")
  if not file then
    return
  end
  for line in file:lines() do
    local key, value = line:match("^([%w_]+)%s*=%s*(.+)$")
    if key and value then
      vim.env[key] = value
    end
  end
  file:close()
end

return M
