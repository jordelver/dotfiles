local refs = require("weeknotes.refs")
local transform = require("weeknotes.transform")

local M = {}

M.transform_range = transform.transform_range
M.rebuild_refs = refs.rebuild_refs

return M
