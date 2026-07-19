-- render-markdown.nvim
-- In-editor rendering of Markdown: headings, code blocks, tables, bullets,
-- checkboxes, callouts/admonitions, LaTeX, and more.
-- Repo: https://github.com/MeanderingProgrammer/render-markdown.nvim
--
-- Dependencies are already provided by init.lua, so there is nothing extra to add:
--   * nvim-treesitter with the `markdown` and `markdown_inline` parsers (SECTION 9)
--   * mini.nvim / mini.icons, used as the icon provider                 (SECTION 4)
--
-- NOTE: This plugin draws Nerd Font glyphs for headings, list bullets, code-block
-- language icons, callouts, etc. If those show up as boxes, install/enable a Nerd
-- Font and set `vim.g.have_nerd_font = true` near the top of init.lua.

-- `vim.pack.add` downloads the plugin (default branch) and adds it to the runtime
-- path. The `gh` helper in init.lua is file-local, so we spell out the full URL here.
vim.pack.add { 'https://github.com/MeanderingProgrammer/render-markdown.nvim' }

require('render-markdown').setup {
  -- Filetypes that get rendered. Add 'quarto', 'rmd', etc. here if you use them.
  file_types = { 'markdown' },

  -- Modes in which the pretty/rendered view is shown. In every other mode the raw
  -- markdown is shown so you can edit it directly. This is the default, spelled out
  -- so it is obvious why markdown looks "raw" while you are typing in insert mode.
  render_modes = { 'n', 'c', 't' },
}

-- Toggle the rendered view on and off. Fits the existing `<leader>t` ([T]oggle)
-- which-key group defined in init.lua.
vim.keymap.set('n', '<leader>tm', '<cmd>RenderMarkdown toggle<CR>', { desc = '[T]oggle [M]arkdown rendering' })
