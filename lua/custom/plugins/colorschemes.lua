-- Extra colorschemes
-- ==================
-- Installs and configures a handful of additional colorschemes. Each one is only
-- *configured* here, not activated, so your current active theme (set in init.lua)
-- is left untouched. To try any of them live use `:Telescope colorscheme`, and to
-- make one the permanent default see the note at the bottom of this file.
--
-- Two flavours of colorscheme show up below:
--   * Lua themes (kanagawa, oxocarbon, solarized-osaka, bamboo) are configured by
--     calling their `.setup{}`. The config is remembered, so `:colorscheme <name>`
--     later applies it.
--   * Vimscript themes by sainnhe (gruvbox-material, everforest) are configured by
--     setting `vim.g.*` variables *before* `:colorscheme` is run; there is no setup
--     function to call.
--
-- Across the board italic comments are disabled to match the tokyonight setup in
-- init.lua. Tweak any of the options below to taste.

-- init.lua's `gh` helper is file-local, so we spell out full URLs here.
local function gh(repo) return 'https://github.com/' .. repo end

-- 1. gruvbox-material (sainnhe) -----------------------------------------------
-- Vimscript theme. Configured via globals; apply with `:colorscheme gruvbox-material`.
vim.pack.add { gh 'sainnhe/gruvbox-material' }
vim.g.gruvbox_material_background = 'soft' -- 'hard' | 'medium' | 'soft'
vim.g.gruvbox_material_foreground = 'material' -- 'material' | 'mix' | 'original'
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_disable_italic_comment = 1
vim.g.gruvbox_material_better_performance = 1

-- 2. kanagawa.nvim (rebelot) --------------------------------------------------
-- Variants: `kanagawa`/`kanagawa-wave`, `kanagawa-dragon`, `kanagawa-lotus` (light).
vim.pack.add { gh 'rebelot/kanagawa.nvim' }
require('kanagawa').setup {
  commentStyle = { italic = false },
  keywordStyle = { italic = false },
  background = { dark = 'wave', light = 'lotus' },
}

-- 3. everforest (sainnhe) -----------------------------------------------------
-- Vimscript theme. Configured via globals; apply with `:colorscheme everforest`.
vim.pack.add { gh 'sainnhe/everforest' }
vim.g.everforest_background = 'medium' -- 'hard' | 'medium' | 'soft'
vim.g.everforest_enable_italic = 1
vim.g.everforest_disable_italic_comment = 1
vim.g.everforest_better_performance = 1

-- 4. oxocarbon.nvim (nyoom-engineering) ---------------------------------------
-- Minimal theme with no setup function; light/dark follows `&background`.
-- Apply with `:colorscheme oxocarbon`.
vim.pack.add { gh 'nyoom-engineering/oxocarbon.nvim' }

-- 5. solarized-osaka.nvim (craftzdog) -----------------------------------------
-- A tokyonight fork. Variants: `solarized-osaka` (dark), `solarized-osaka-day` (light).
vim.pack.add { gh 'craftzdog/solarized-osaka.nvim' }
---@diagnostic disable-next-line: missing-fields
require('solarized-osaka').setup {
  styles = {
    comments = { italic = false },
  },
}

-- 6. bamboo.nvim (ribru17) ----------------------------------------------------
-- Styles are chosen in setup: 'vulgaris' (default dark), 'multiplex' (darker),
-- 'light'. Apply with `:colorscheme bamboo`.
vim.pack.add { gh 'ribru17/bamboo.nvim' }
require('bamboo').setup {
  style = 'vulgaris',
  code_style = { comments = 'none' }, -- disable italic comments
}

-- 7. papercolor-theme (NLKNguyen) ---------------------------------------------
-- Vimscript theme (a Material-inspired light/dark scheme). Configured via a single
-- globals dictionary; apply with `:colorscheme PaperColor` (note the capitals).
-- PaperColor renders from `&background`, so set light/dark before applying it.
vim.pack.add { gh 'NLKNguyen/papercolor-theme' }
vim.g.PaperColor_Theme_Options = {
  theme = {
    default = {
      allow_bold = 1,
      allow_italic = 0, -- disable italics to match the rest of this file
    },
  },
}

-- Quick colorscheme switcher
-- --------------------------
-- Opens the Telescope colorscheme picker. `enable_preview = true` live-applies each
-- theme as you move through the list, so you can eyeball them without pressing Enter.
-- Bound under the `<leader>s` ([S]earch) group as `<leader>sC` (`sc` is taken by
-- Commands); which-key shows the description automatically.
vim.keymap.set('n', '<leader>sC', function() require('telescope.builtin').colorscheme { enable_preview = true } end, { desc = '[S]earch [C]olorscheme (live preview)' })

-- Make one the permanent default
-- ------------------------------
-- Your active theme is still whatever init.lua sets (tokyonight-storm). To switch,
-- either set it interactively for this session:
--     :colorscheme kanagawa-dragon
-- or make it permanent by uncommenting one line below (this file loads after
-- init.lua, so it wins):
--
-- vim.opt.background = 'dark' -- some themes (oxocarbon, everforest, gruvbox) read this
-- nvim detects light/dark from the terminal (OSC 11) at startup; gruvbox-material
-- renders from &background, so no vim.opt.background is set here. The `theme` script
-- nudges running instances via :set background=<mode>.
vim.cmd.colorscheme 'gruvbox-material'
-- vim.cmd.colorscheme 'kanagawa-wave'
-- vim.cmd.colorscheme 'everforest'
-- vim.cmd.colorscheme 'oxocarbon'
-- vim.cmd.colorscheme 'solarized-osaka'
-- vim.cmd.colorscheme 'bamboo'
-- vim.cmd.colorscheme 'PaperColor' -- reads &background; set light/dark first
