# Inko docs

export def inko_dir [] {
	let version = (
		ivm list | lines
		| parse '{version} (default)'
		| get -i 0.version
	)
	if $version != null {
		$'($env.HOME)/.local/share/ivm/installed/($version)'
	} else { null }
}
