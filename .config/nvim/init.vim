set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" for https://github.com/nvim-orgmode/orgmode
lua << EOF

-- Load custom tree-sitter grammar for org filetype
require('orgmode').setup_ts_grammar()

-- Tree-sitter configuration
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
  org_todo_keywords = {'MIGHT-DO', 'TODO(t)', '|', 'DONE(d)', 'DELEGATED(e)'},
  org_hide_leading_stars = true,
  org_hide_emphasis_markers = true,
  org_agenda_templates =  {
    t = { description = 'Task', template = '*** MIGHT-DO %?\n' },
    j = { description = 'Journal', template = '** %?\n   :properties:\n   :Date: %u\n   :Highlight: \n   :end:\n' },
  }
})
EOF

