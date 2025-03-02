return {
	"nvim-flutter/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
	},
	config = function()
		require("flutter-tools").setup({
			ui = {
				border = "rounded",
				notification_style = "plugin",
			},

			decorations = {

				statusline = {

					app_version = true,
					device = true,
					project_config = true,
				},

				debugger = {

					enable = true,
					run_via_dap = true,
					exception_breakpoints = "all",
					register_configuration = function()
						local dap = require("dap")

						dap.adapters.dart = {
							type = "executable",
							command = "dart",
							args = { "debug_adapter" },
						}

						dap.configurations.dart = {
							{
								type = "dart",
								name = "Flutter Run",
								request = "launch",
								program = "${workspaceFolder}/lib/main.dart",
							},
							{
								type = "dart",
								name = "Flutter Attach",
								request = "attach",
							},
						}
					end,
				},
				root_patterns = { ".git", "pubspec.yaml" },
				flutter_lookup_cmd = nil,
				widget_guides = {
					enabled = true,
				},
				closing_tags = {
					prefix = "/>",
					priority = 10,
					enabled = true,
				},
				dev_log = {
					enabled = true,
					filter = nil, -- optional callback to filter the log
					-- takes a log_line as string argument; returns a boolean or nil;
					-- the log_line is only added to the output if the function returns true
					notify_errors = false, -- if there is an error whilst running then notify the user
					open_cmd = "15split", -- command to use to open the log buffer
					focus_on_open = true, -- focus on the newly opened log window
				},
				dev_tools = {
					autostart = false, -- autostart devtools server if not detected
					auto_open_browser = false, -- Automatically opens devtools in the browser
				},
				outline = {
					open_cmd = "30vnew", -- command to use to open the outline buffer
					auto_open = false, -- if true this will open the outline automatically when it is first populated
				},
				lsp = {
					color = { -- show the derived colours for dart variables
						enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
						background = true, -- highlight the background
						background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
						foreground = true, -- highlight the foreground
						virtual_text = true, -- show the highlight using virtual text
						virtual_text_str = "■", -- the virtual text character to highlight
					},
					-- on_attach = my_custom_on_attach,
					capabilities = require("cmp_nvim_lsp").default_capabilities(), -- e.g. lsp_status capabilities
					--- OR you can specify a function to deactivate or change or control how the config is created
					-- see the link below for details on each option:
					-- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md#client-workspace-configuration
					settings = {
						showTodos = true,
						completeFunctionCalls = true,
						analysisExcludedFolders = { "<path-to-flutter-sdk-packages>" },
						renameFilesWithClasses = "prompt", -- "always"
						enableSnippets = true,
						updateImportsOnRename = true, -- Whether to update imports and other directives when files are renamed. Required for `FlutterRename` command.
					},
				},
			},
		})
	end,
}
