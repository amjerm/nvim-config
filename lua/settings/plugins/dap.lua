-- dap ui
--require("dapui").setup()

-- dap virtual text
--require("nvim-dap-virtual-text").setup()


-- nvim-dap
--local dap = require('dap')
--dap.adapters.chrome = {
--type = "executable",
--command = "node",
--args = {vim.fn.stdpath("data") .. "/dapinstall/chrome/vscode-chrome-debug/out/src/chromeDebug.js"}
--}

--dap.configurations.javascript = {
--{
--type = "chrome",
--request = "attach",
--program = "${file}",
--cwd = vim.fn.getcwd(),
--sourceMaps = true,
--protocol = "inspector",
--port = 9222,
--webRoot = "${workspaceFolder}"
--}
--}

--dap.configurations.typescript = {
--{
--type = "chrome",
--request = "attach",
--program = "${file}",
--cwd = vim.fn.getcwd(),
--sourceMaps = true,
--protocol = "inspector",
--port = 9222,
--webRoot = "${workspaceFolder}"
--}
--}

--dap.configurations.javascriptreact = {
--{
--type = "chrome",
--request = "attach",
--program = "${file}",
--cwd = vim.fn.getcwd(),
--sourceMaps = true,
--protocol = "inspector",
--port = 9222,
--webRoot = "${workspaceFolder}"
--}
--}

--dap.configurations.typescriptreact = {
--{
--type = "chrome",
--request = "attach",
--program = "${file}",
--cwd = vim.fn.getcwd(),
--sourceMaps = true,
--protocol = "inspector",
--port = 9222,
--webRoot = "${workspaceFolder}"
--}
--}
