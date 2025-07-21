return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000, -- Load before all other plugins
  config = function()
    require('catppuccin').setup {
      transparent_background = true,
      flavour = 'mocha', -- Options: latte, frappe, macchiato, mocha
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        telescope = true,
        mason = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { 'undercurl' },
            hints = { 'undercurl' },
            warnings = { 'undercurl' },
            information = { 'undercurl' },
          },
        },
      },
    }
    vim.cmd.colorscheme 'catppuccin-mocha'
    require('core.highlight').setup()
  end,
}
