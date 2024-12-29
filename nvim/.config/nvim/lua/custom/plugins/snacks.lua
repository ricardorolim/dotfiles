local image = '~/downloads/wolf.webp'

-- image generation:
-- magick wolf.webp -shave 150x150 wolf-out.webp
-- ascii-image-converter -C -H 30 wolf-out.webp | sed 's/:/ /g' > wolf2.ascii

return {
  'folke/snacks.nvim',
  ---@type snacks.Config
  opts = {
    dashboard = {
      sections = {
        { section = 'header' },
        { section = 'keys', gap = 1, padding = 1 },
        { section = 'startup' },
        {
          pane = 2,
          section = 'terminal',
          -- the image is cached based on the cmd string, so it needs to be updated if the image changes
          cmd = 'cat ~/downloads/wolf2.ascii',
          height = 30,
          width = 100,
          padding = 0,
          indent = 20,
        },
      },
    },
  },
}
