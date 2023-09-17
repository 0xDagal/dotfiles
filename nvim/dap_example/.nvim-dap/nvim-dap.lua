local dap = require('dap')

dap.adapters.delve = {
    executable = {
      args = { "dap", "-l", "127.0.0.1:${port}" },
      command = "/home/user/.local/share/nvim/mason/bin/dlv"
    },
    port = "${port}",
    type = "server"
}

dap.configurations.go = {
    {
		name = "Launch file gmalware",
		program = "${fileDirname}",
		request = "launch",
		mode = "debug",
		type = "delve",
		env = {
			HTTP_PROXY = "socks5://gmalware2.rd.glimps.lan:8080",
			HTTPS_PROXY = "socks5://gmalware2.rd.glimps.lan:8080",
			ALL_PROXY = "socks5://gmalware2.rd.glimps.lan:8080"
		},
		args = {
			"--config",
			"/home/user/Projects/gcore/config.yml"
		},
	},
    {
		mode = "test",
		name = "Delve: Debug test (go.mod)",
		program = "./${relativeFileDirname}",
		request = "launch",
		type = "delve",
	},
}
