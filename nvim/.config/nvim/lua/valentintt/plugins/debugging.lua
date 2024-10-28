return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"leoluz/nvim-dap-go",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("dapui").setup({})
		require("dap-go").setup({})

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<Leader>dc", function()
			dap.continue()
		end, {desc = "Debugger continue"})
		vim.keymap.set("n", "<Leader>dso", function()
			dap.step_over()
		end, {desc = "Debugger step over"})
		vim.keymap.set("n", "<Leader>dsi", function()
			dap.step_into()
		end, {desc = "Debugger step into"})
		vim.keymap.set("n", "<Leader>dsu", function()
			dap.step_out()
		end, {desc = "Debugger step out"})
		vim.keymap.set("n", "<Leader>dbt", function()
			dap.toggle_breakpoint()
		end, {desc = "Debugger toggle breakpoint"})
		vim.keymap.set("n", "<Leader>dBS", function()
			dap.set_breakpoint()
		end, {desc = "Debugger set breakpoint"})
		vim.keymap.set("n", "<Leader>lp", function()
			dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
		end, {desc = "Debugger set breakpoint and log"})
		vim.keymap.set("n", "<Leader>dr", function()
			dap.repl.open()
		end, {desc = "Debugger repl open"})
		vim.keymap.set("n", "<Leader>dl", function()
			dap.run_last()
		end, {desc = "Debugger run last"})
		vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
			require("dap.ui.widgets").hover()
		end, {desc = "Debugger hover"})
		vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
			require("dap.ui.widgets").preview()
		end, {desc = "Debugger preview"})
		vim.keymap.set("n", "<Leader>df", function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.frames)
		end, {desc = "Debugger center frames"})
		vim.keymap.set("n", "<Leader>ds", function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.scopes)
		end, {desc = "Debugger center scopes"})
	end,
}
