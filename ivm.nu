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
export extern install [
	version: string@known_versions
]

# Uninstall an existing version
export extern uninstall [
	version: string@installed_versions
]

# List all installed versions
export extern list []

# List all available versions
export extern known []

# Run a command with a specific version
export extern run [
	version: string@installed_versions
	command: string
	...args: string
]

# Set the default version
export extern default [
	version: string@installed_versions
]

# Clean up temporary data
export extern clean []

# Removes all versions and temporary data
export extern implode []

# Prints the value of a setting.
export extern show [
	setting: string@complete_setting_names
]
