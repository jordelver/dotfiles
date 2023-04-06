local M = {
  -- Where to store notes
  notes_directory = vim.env.NOTES_DIR,
}

function M.open_today()
  local todays_date = os.date("%Y-%m-%d")
  local note_filename = todays_date .. ".md"
  local note_path = M.notes_directory .. note_filename
  local file_contents = {
    "# " .. todays_date,
    "",
    "- "
  }

  M.open_or_create_note(note_path, file_contents)
end

function M.open_tomorrow()
  local one_day = (24 * 60 * 60)
  local tomorrows_date = os.date("%Y-%m-%d", os.time() + one_day)
  local note_filename = tomorrows_date .. ".md"
  local note_path = M.notes_directory .. note_filename
  local file_contents = {
    "# " .. tomorrows_date,
    "",
    "- "
  }

  M.open_or_create_note(note_path, file_contents)
end

function M.open_context()
  local branch_name = require("utils.git").current_branch_name()
  local note_filename = branch_name .. ".md"
  local note_path = M.notes_directory .. note_filename
  local file_contents = {
    "# " .. branch_name,
    "",
    "- "
  }

  M.open_or_create_note(note_path, file_contents)
end

function M.open_or_create_note(path, file_contents)
  if not vim.loop.fs_stat(path) then
    M.create_note(path)
    M.open_note(path)
    M.prepopulate_note(file_contents)
  else
    M.open_note(path)
  end
end

function M.create_note(note_path)
  vim.cmd(string.format(":silent exec '!touch %s'", note_path))
end

function M.open_note(note_path)
  vim.cmd(string.format("tab drop %s", note_path))
end

function M.prepopulate_note(file_contents)
  vim.api.nvim_buf_set_lines(0, 0, -1, false, file_contents)
  vim.api.nvim_command("write")
  vim.api.nvim_win_set_cursor(0, {3, 2})
end

return M
