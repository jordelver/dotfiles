local refs = require("weeknotes.refs")
local subtitle = require("weeknotes.subtitle")
local transform = require("weeknotes.transform")

local M = {}

M.transform_range = transform.transform_range
M.rebuild_refs = refs.rebuild_refs
M.set_subtitle_and_rename = subtitle.set_subtitle_and_rename

return M
