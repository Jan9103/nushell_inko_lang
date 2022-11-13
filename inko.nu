# inko language
# inko FILE: run file
# inko [command]
# inko --version
#export extern 'inko' [
#	--version(-v)  # Prints the version number
#	file?: path
#]

# Compiles and runs FILE
export extern run [
	--format(-f): string  # The output format to use for diagnostics
	--include(-i): path   # A directory to add to the list of source directories
	file: path
]

# Compiles FILE
export extern build [
	--format(-f): string  # The output format to use for diagnostics
	--output(-o): path    # The path to write the bytecode file to
	--include(-i): path   # A directory to add to the list of source directories
	file: path
]

# Runs all unit tests in ./test
export extern test []

# Check an entire project or a file for errors.
export extern check [
	--format(-f): string  # The output format to use for diagnostics
	file?: path
]
