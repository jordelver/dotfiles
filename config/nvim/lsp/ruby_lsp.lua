return {
  -- Command and arguments to start the server.
  cmd = { 'ruby-lsp' },

  -- Filetypes to automatically attach to.
  filetypes = { 'ruby', 'eruby' },

  -- Sets the "root directory" to the parent directory of the file in the
  -- current buffer that contains either a "Gemfile" or a
  -- ".git" directory. Files that share a root directory will reuse
  -- the connection to the same LSP server.
  root_markers = { 'Gemfile', '.git' },

  -- Enabled LSP for single files, not just project directories
  single_file_support = true
}
