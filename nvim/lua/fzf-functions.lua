function selectFtype(...)
  local fts = {
    "typescript",
    "javascript",
    "lua",
    "python",
    "vim",
    "markdown",
    "sh",
    "bash",
    "rust",
    "go",
  }

  coroutine.wrap(function()
    local choice = require "fzf".fzf(fts)
    if choice then
      vim.cmd(string.format("set ft=%s", choice[1]))
    end
  end)()
  return ...
end
