-- Run this spec with:
-- nvim --headless "+PlenaryBustedDirectory ~/.config/nvim/tests/weeknotes { minimal_init = '~/.config/nvim/tests/minimal_init.lua' }" +qa

local weeknotes = require("weeknotes")

local function fixture_path(name)
  return vim.fn.expand("~/.config/nvim/tests/weeknotes/fixtures/" .. name)
end

local function expected_path(name)
  return vim.fn.expand("~/.config/nvim/tests/weeknotes/expected/" .. name)
end

local function read_lines(path)
  return vim.fn.readfile(path)
end

local function with_buffer(lines, fn)
  local bufnr = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_set_current_buf(bufnr)
  vim.bo[bufnr].textwidth = 80
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
  fn(bufnr)
  return vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
end

describe("weeknotes", function()
  it("transforms canonical notes content", function()
    local input = read_lines(fixture_path("sample-canonical.input.txt"))
    local expected = read_lines(expected_path("sample-canonical.expected.md"))

    local actual = with_buffer(input, function(bufnr)
      weeknotes.transform_range(1, vim.api.nvim_buf_line_count(bufnr))
    end)

    assert.are.same(expected, actual)
  end)

  it("wraps plain top-level bullets with markdown continuation indent", function()
    local input = read_lines(fixture_path("sample-plain-wrap.input.txt"))
    local expected = read_lines(expected_path("sample-plain-wrap.expected.md"))

    local actual = with_buffer(input, function(bufnr)
      weeknotes.transform_range(1, vim.api.nvim_buf_line_count(bufnr))
    end)

    assert.are.same(expected, actual)
  end)

  it("normalizes smart quotes and strips only outer child quotes", function()
    local input = read_lines(fixture_path("sample-quotes.input.txt"))
    local expected = read_lines(expected_path("sample-quotes.expected.md"))

    local actual = with_buffer(input, function(bufnr)
      weeknotes.transform_range(1, vim.api.nvim_buf_line_count(bufnr))
    end)

    assert.are.same(expected, actual)
  end)

  it("rebuilds references with stable dedupe behavior", function()
    local input = read_lines(fixture_path("sample-refs.input.md"))
    local expected = read_lines(expected_path("sample-refs.expected.md"))

    local actual = with_buffer(input, function()
      weeknotes.rebuild_refs()
    end)

    assert.are.same(expected, actual)
  end)

  it("rebuilds references in first-appearance order", function()
    local input = read_lines(fixture_path("sample-refs.input.md"))
    local expected = read_lines(expected_path("sample-refs-first-appearance.expected.md"))

    local actual = with_buffer(input, function()
      weeknotes.rebuild_refs()
    end)

    assert.are.same(expected, actual)
  end)

  it("preserves non-bullet lines and only transforms bullet blocks", function()
    local input = read_lines(fixture_path("sample-frontmatter.input.md"))
    local expected = read_lines(expected_path("sample-frontmatter.expected.md"))

    local actual = with_buffer(input, function(bufnr)
      weeknotes.transform_range(1, vim.api.nvim_buf_line_count(bufnr))
    end)

    assert.are.same(expected, actual)
  end)

  it("maps inline labels to child URLs in order", function()
    local input = read_lines(fixture_path("sample-inline-label-mapping.input.txt"))
    local expected = read_lines(expected_path("sample-inline-label-mapping.expected.md"))

    local actual = with_buffer(input, function(bufnr)
      weeknotes.transform_range(1, vim.api.nvim_buf_line_count(bufnr))
    end)

    assert.are.same(expected, actual)
  end)

  it("rebuilds refs at document bottom after partial range transform", function()
    local input = {
      "Header line",
      "",
      "- Item [foo]",
      "    - https://foo.com",
      "",
      "Tail line",
      "",
      "[tail]: https://tail.com",
    }

    local expected = {
      "Header line",
      "",
      "- Item [foo]",
      "",
      "Tail line",
      "",
      "[foo]: https://foo.com",
      "[tail]: https://tail.com",
    }

    local actual = with_buffer(input, function()
      weeknotes.transform_range(3, 5)
    end)

    assert.are.same(expected, actual)
  end)

  it("normalizes paste artifact unicode separators", function()
    local input = read_lines(fixture_path("sample-paste-artifacts.input.txt"))
    local expected = read_lines(expected_path("sample-paste-artifacts.expected.md"))

    local actual = with_buffer(input, function(bufnr)
      weeknotes.transform_range(1, vim.api.nvim_buf_line_count(bufnr))
    end)

    assert.are.same(expected, actual)
  end)
end)
