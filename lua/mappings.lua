
require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- Existing Mappings
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Save File
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", { desc = "Save file" })

-- DAP (Debug Adapter Protocol) Mappings for Debugging
map("n", "<F5>", ":lua require'dap'.continue()<CR>", { desc = "Continue debugging" })
map("n", "<F10>", ":lua require'dap'.step_over()<CR>", { desc = "Step over" })
map("n", "<F11>", ":lua require'dap'.step_into()<CR>", { desc = "Step into" })
map("n", "<F12>", ":lua require'dap'.step_out()<CR>", { desc = "Step out" })
map("n", "<Leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", { desc = "Toggle breakpoint" })
map("n", "<Leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", { desc = "Set conditional breakpoint" })
map("n", "<Leader>dr", ":lua require'dap'.repl.open()<CR>", { desc = "Open DAP REPL" })
map("n", "<Leader>dl", ":lua require'dap'.run_last()<CR>", { desc = "Run last debugging session" })
map("n", "<Leader>du", ":lua require'dapui'.toggle()<CR>", { desc = "Toggle DAP UI" })

