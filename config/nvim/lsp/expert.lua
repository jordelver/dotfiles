return {
  -- Command and arguments to start the server.
  cmd = { 'expert' },

  -- Sets the "root directory" to the parent directory of the file in the
  -- current buffer that contains either a "mix.exs" or a ".git" directory.
  -- Files that share a root directory will reuse the connection to the
  -- same LSP server.
  root_markers = { 'mix.exs', '.git' },

  -- Filetypes to automatically attach to.
  filetypes = { 'elixir', 'eelixir', 'heex' },
}
