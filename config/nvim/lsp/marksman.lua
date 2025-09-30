-- https://github.com/artempyanykh/marksman
-- Marksman is a Markdown LSP server providing completion, cross-references,
-- diagnostics, and more.
return {
  cmd = { 'marksman', 'server' },
  filetypes = { 'markdown', 'markdown.mdx' },
  root_markers = { '.marksman.toml', '.git' },
}
