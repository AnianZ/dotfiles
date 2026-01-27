set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

lua << EOF
require("tokyonight").setup({
  style = "moon",
  transparent = true,
})

require("lualine").setup({
  options = {
    theme = "tokyonight",
  },
  tabline = {
    lualine_a = {'buffers'},
    lualine_z = {'tabs'},
  },
})
EOF

set termguicolors
colorscheme tokyonight

