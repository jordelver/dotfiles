return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- Snacks.picker supports the fzf syntax is supported, for example:
    --
    -- +------------+----------------------------+------------------------------------+
    -- | Token      | Match type                 | Description                        |
    -- +------------+----------------------------+------------------------------------+
    -- | sbtrkt     | fuzzy-match                | Items that match sbtrkt            |
    -- | 'wild      | exact-match (quoted)       | Items that include wild            |
    -- | ^music     | prefix-exact-match         | Items that start with music        |
    -- | .mp3$      | suffix-exact-match         | Items that end with .mp3           |
    -- | !fire      | inverse-exact-match        | Items that do not include fire     |
    -- | !^music    | inverse-prefix-exact-match | Items that do not start with music |
    -- | !.mp3$     | inverse-suffix-exact-match | Items that do not end with .mp3    |
    -- +------------+---------------------------+-------------------------------------+
    picker = {
      enabled = true,

      debug = {
        -- Show scores in the list
        scores = true,
      },

      layouts = {
        default = {
          layout = {
            width = 0.95,
            height = 0.95,
          }
        }
      },
    },
  },
  keys = {
    -- Fuzzily find files
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },

    -- Grep the entire codebase
    { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },

    -- Fuzzily find open buffers
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },

    -- Resume the last picker including any state
    { "<leader>fr", function() Snacks.picker.resume() end, desc = "Resume" },

    -- Grep for the word under the cursor
    { "<leader>fw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
  },
}
