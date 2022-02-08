set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" for https://github.com/nvim-orgmode/orgmode
lua << EOF
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'f110024d539e676f25b72b7c80b0fd43c34264ef',
    files = {'src/parser.c', 'src/scanner.cc'},
  },
  filetype = 'org',
}

require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup({
  org_agenda_files = {'~/sync/org/*'},
  org_default_notes_file = '~/sync/org/refile.org',
  org_todo_keywords = {'TODO(t)', 'WAITING', '|', 'DONE(d)', 'DELEGATED(e)'},
  org_hide_leading_stars = true,
  org_hide_emphasis_markers = true,
  org_agenda_templates =  {
    t = { description = 'Task', template = '*** TODO %?\n    SCHEDULED: %t' },
    j = { description = 'Journal', template = '** %?\n   %u' },
  }
})
EOF
