export-env {
	let-env PATH = ($env.PATH | append $'($env.HOME)/.local/share/ivm/bin')
}
