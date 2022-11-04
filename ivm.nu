def known_versions [] {
	^ivm known
	| lines
	| split row ' ' | where $it != '(default)'
}
def installed_versions [] {
	^ivm list
	| lines
	| split row ' ' | where $it != '(default)'
}
def complete_install_version [] {
	known_versions
	| append 'latest'
}
def complete_setting_names [] {
	['data' 'bin' 'cache' 'install' 'config' 'downloads']
}

# Install a new version
export extern 'ivm install' [
	version: string@known_versions
]

# Uninstall an existing version
export extern 'ivm uninstall' [
	version: string@installed_versions
]

# List all installed versions
export extern 'ivm list' []

# List all available versions
export extern 'ivm known' []

# Run a command with a specific version
export extern 'ivm run' [
	version: string@installed_versions
	command: string
	...args: string
]

# Set the default version
export extern 'ivm default' [
	version: string@installed_versions
]

# Clean up temporary data
export extern 'ivm clean' []

# Removes all versions and temporary data
export extern 'ivm implode' []

# Prints the value of a setting.
export extern 'ivm show' [
	setting: string@complete_setting_names
]
