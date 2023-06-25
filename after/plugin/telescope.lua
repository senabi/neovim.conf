local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	-- builtin.grep_string({ search = vim.fn.input("Grep > ") })
  builtin.live_grep()
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
vim.keymap.set('n', '<C-a>', function ()
  builtin.buffers({
    sort_lastused = true,
    --ignore_current_buffer = true,
  })
end
, {})
-- vim.keymap.set('n', '<leader>ff',
-- vim.keymap.set("n", "<Leader>ff", function()
-- 	telescope_builtin.live_grep()
-- end, { desc = "Grep files" })


