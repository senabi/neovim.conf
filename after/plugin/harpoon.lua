local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-b>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-m>", function() ui.nav_file(4) end)

-- function switch_buffers()
--   -- Get the current buffer number
--   local current_buffer = vim.api.nvim_get_current_buf()

--   -- Get the list of all buffers
--   local buffers = vim.api.nvim_list_bufs()

--   -- Filter out the "neo-tree filesystem [1]" buffer
--   local filtered_buffers = {}
--   for _, buffer in ipairs(buffers) do
--     if buffer ~= current_buffer and vim.api.nvim_buf_get_name(buffer) ~= 'neo-tree filesystem [1]' then
--       table.insert(filtered_buffers, buffer)
--     end
--   end

--   -- Get the last two used buffers
--   local last_buffers = {}
--   if #filtered_buffers >= 2 then
--     table.insert(last_buffers, filtered_buffers[#filtered_buffers])
--     table.insert(last_buffers, filtered_buffers[#filtered_buffers - 1])
--   else
--     -- Less than two buffers available, use all of them
--     last_buffers = filtered_buffers
--   end

--   -- Switch to the first buffer in the last_buffers list
--   if last_buffers[1] then
--     vim.api.nvim_set_current_buf(last_buffers[1])
--   end
-- end

-- -- Map Ctrl + Tab to switch_buffers function
-- -- vim.keymap.set('n', '<C-Tab>', function() switch_buffers() end)
-- vim.api.nvim_set_keymap('n', '<C-Tab>', ':lua switch_buffers()<CR>', { noremap = true, silent = true })
