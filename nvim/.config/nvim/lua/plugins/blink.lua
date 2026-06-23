return {
  "saghen/blink.cmp",
  opts = {
    enabled = function()
      local disabled_filetypes = { markdown = true, text = true, plaintex = true }
      return not disabled_filetypes[vim.bo.filetype]
    end,
  },
}
