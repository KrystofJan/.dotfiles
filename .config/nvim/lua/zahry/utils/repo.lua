local M = {}

-- Default configuration
local config = {
  repo_name = nil
}

-- Setup function for plugin-style configuration
function M.setup(opts)
  config = vim.tbl_deep_extend("force", config, opts or {})
end

-- Escape special pattern characters for string matching
function M.escape_pattern(str)
  return str:gsub("([%.%+%-%*%?%[%]%^%$%(%)%%])", "%%%1")
end

-- Check if current working directory contains the configured repository
function M.is_in_repo()
  if not config.repo_name then
    error("Repository name not configured. Call setup() first.")
  end
  local cwd = vim.fn.getcwd()
  return string.find(cwd, M.escape_pattern(config.repo_name)) ~= nil
end

-- Get the full path to the configured repository root
function M.get_repo_path()
  if not config.repo_name then
    error("Repository name not configured. Call setup() first.")
  end
  local cwd = vim.fn.getcwd()
  return string.match(cwd, "^(.-/" .. M.escape_pattern(config.repo_name) .. ")")
end

return M
