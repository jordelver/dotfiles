-- `herb-language-server` can be installed via `npm`:
-- npm install -g @herb-tools/language-server
return {
  -- Command and arguments to start the server.
  cmd = { 'herb-language-server', '--stdio' },

  -- Filetypes to automatically attach to.
  filetypes = { 'html', 'eruby' },

  -- Sets the "root directory" to the parent directory of the file in the
  -- current buffer that contains either a "Gemfile" or a ".git" directory.
  -- Files that share a root directory will reuse the connection to the
  -- same LSP server.
  root_markers = { 'Gemfile', '.git' },
}
