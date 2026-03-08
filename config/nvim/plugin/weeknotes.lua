local weeknotes = require("weeknotes")

vim.api.nvim_create_user_command("WeeknotesTransform", function(opts)
  weeknotes.transform_range(opts.line1, opts.line2)
end, { range = true, desc = "Transform pasted notes bullets into weeknotes markdown" })

vim.api.nvim_create_user_command("WeeknotesSetSubtitle", function()
  weeknotes.set_subtitle_and_rename()
end, { desc = "Set weeknote subtitle and rename file" })
