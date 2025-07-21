local M = {}

function M.setup()
  local set = vim.api.nvim_set_hl
  local hl = function(name, target)
    set(0, name, { link = target })
  end

  -- LSP semantic token highlight linking
  hl('@lsp.type.namespace', '@namespace')
  hl('@lsp.type.class', '@type')
  hl('@lsp.type.enum', '@type')
  hl('@lsp.type.interface', '@type')
  hl('@lsp.type.parameter', '@parameter')
  hl('@lsp.type.property', '@property')
  hl('@lsp.type.variable', '@variable')
  hl('@lsp.typemod.variable.readonly', '@constant')
  hl('@lsp.typemod.variable.static', '@constant')
  hl('@lsp.typemod.variable.declaration', '@variable')
  hl('@lsp.type.function', '@function')
  hl('@lsp.type.method', '@method')

  -- Optional: styling modifiers
  set(0, '@lsp.mod.readonly', { italic = true })
  set(0, '@lsp.mod.declaration', { italic = true })
end

return M
