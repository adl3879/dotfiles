local comments = require('comments')

comments.setup({})

vim.keymap.set('n', '<leader>cc', comments.single_line_comment)
vim.keymap.set('v', '<leader>cc', comments.multi_line_comment)

