vim.keymap.set("n", "<F5>", require("dap").continue)
vim.keymap.set("n", "<F3>", require("dap").step_over)
vim.keymap.set("n", "<F2>", require("dap").step_into)
vim.keymap.set("n", "<F4>", require("dap").step_out)
vim.keymap.set("n", "<leader>b", require("dap").toggle_breakpoint)
vim.keymap.set("n", "<leader>B", require("dap").set_breakpoint)
-- vim.keymap.set("n", "<leader>lp", require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")))
vim.keymap.set("n", "<leader>dr", require("dap").repl.open)
vim.keymap.set("n", "<leader>dt", require("dap-go").debug_test)

require("nvim-dap-virtual-text").setup()
require('dap-go').setup()
require("dapui").setup({
    icons = { expanded = "", collapsed = "", current_frame = "" },
})

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
