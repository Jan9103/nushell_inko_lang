# [inko-lang][inko] for [packer.nu][]

## Features

- add the `ivm` bin directory to the PATH
- `inko` tab complete
- `ivm` tab complete
- [ ] `ipm` tab complete
	- [ ] complete packages (from a local "common package" list)
- std-lib documentation quick-access (`inko docs STD-LIB-MODULE`)

## Known issues

- since nu is buggy when importing `extern` statements with prefix its implemented a bit weird.
- nu currently doesn't have a good method to complete subcommands AND a main command
	- usually `inko FILE` runs it, but only `inko run FILE` has completion
	- no `inko --version` completion


[packer.nu]: https://github.com/jan9103/packer.nu
[inko]: https://inko-lang.org/
