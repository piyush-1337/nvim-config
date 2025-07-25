return {
  '3rd/image.nvim',
  event = 'VeryLazy',
  opts = {
    backend = 'kitty', -- your terminal
    integrations = {
      markdown = {
        enabled = true,
        clear_in_insert_mode = false,
        download_remote_images = true,
        only_render_image_at_cursor = false,
        filetypes = { 'markdown', 'vimwiki' },
      },
    },
    max_width = nil,
    max_height = nil,
    max_width_window_percentage = nil,
    max_height_window_percentage = 50,
    window_overlap_clear_enabled = true,
    window_overlap_clear_ft_ignore = { 'cmp_menu', 'cmp_docs', '' },
  },
  config = function(_, opts)
    require('image').setup(opts)
  end,
}
