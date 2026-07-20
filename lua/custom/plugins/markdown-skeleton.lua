-- markdown-skeleton
-- Seed brand-new markdown files with an H1 heading of the filename, e.g. opening
-- `nvim myprompt.md` starts the buffer with `# myprompt.md`, a blank line, and the
-- cursor waiting to type on the line below.
--
-- This is a plain autocmd, not a plugin, so there is nothing to `vim.pack.add`. It
-- lives here because the loader in init.lua auto-requires every file in this directory.
--
-- `BufNewFile` only fires for files that do not exist yet, so opening an existing
-- markdown file is left untouched.

vim.api.nvim_create_autocmd('BufNewFile', {
  desc = 'Seed new markdown files with a filename H1 heading',
  group = vim.api.nvim_create_augroup('markdown-skeleton', { clear = true }),
  pattern = { '*.md', '*.markdown' },
  callback = function(args)
    -- `:t` keeps the tail (filename with extension), so the heading is `# myprompt.md`.
    local heading = '# ' .. vim.fn.fnamemodify(args.file, ':t')
    -- heading, a blank line, then the empty line the cursor lands on
    vim.api.nvim_buf_set_lines(args.buf, 0, -1, false, { heading, '', '' })
    -- Put the cursor on line 3 (1-line gap below the heading) and start typing
    vim.api.nvim_win_set_cursor(0, { 3, 0 })
    vim.cmd.startinsert()
  end,
})
