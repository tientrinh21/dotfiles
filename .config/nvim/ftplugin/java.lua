local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = '/home/tientrinh/.workspace/' .. project_name

local config = {
	cmd = { 
		"java", 
		"-Declipse.application=org.eclipse.jdt.ls.core.id1", 
		"-Dosgi.bundles.defaultStartLevel=4", 
		"-Declipse.product=org.eclipse.jdt.ls.core.product", 
		"-Dlog.protocol=true", 
		"-Dlog.level=ALL", 
		"-Xms1g", 
		"-Xmx2G", 
		"--add-modules=ALL-SYSTEM", 
		"--add-opens", "java.base/java.util=ALL-UNNAMED", 
		"--add-opens", "java.base/java.lang=ALL-UNNAMED", 
		"-jar", "/home/tientrinh/.jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar", 
		"-configuration", "/home/tientrinh/.jdtls/config_linux", 
		"-data", workspace_dir
	},
	filetypes = { "java" },
	autostart = true,
}

require('jdtls').start_or_attach(config)
