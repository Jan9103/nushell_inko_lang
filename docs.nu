# Inko docs
use util.nu inko_dir

def complete_module [] {
	let dir = (inko_dir)
	if $dir != null {
		cd $'($dir)/lib/inko/libstd/std'
		ls **/*.inko | each {|i| $i.name | str substring ',-5'}
	}
}

def parse_docstrings [] {
	cat time.inko | parse -r '(?P<entry>([\t ]*#[^\n]*\n)+[\t ]*fn [^\n]*)' | get -i entry
	# this parses ALL functions, regardless of if in a class or not

	cat time.inko | parse -r '(?P<entry>(#[^\n]*\n)+fn [^\n]*)' | get -i entry
	# for functions outside of classes

	cat time.inko | parse -r '(?P<entry>(#[^\n]*\n)+class [^\n]*\n(([\t ]+[^\n]*|)\n)*)' | get -i entry
	# classes (WIP)
}

# view "documentation" for parts of the inko libstd
export def 'inko docs std' [
	module: string@complete_module
] {
	let dir = (inko_dir)
	if $dir == null {
		let latest_inko = (ivm known | lines | last)
		print -e 'Unable to find inko-lib dir.'
		print -e $'Quickfix: ivm install ($latest_inko); ivm default ($latest_inko)'
	} else {
		let editor = ($env | get -i EDITOR | default nano)
		# apply read-only mode if known
		let editor = (
			if $editor in ['vim', 'nvim'] { $'($editor) -M'
			} else { $editor }
		)
		nu -c $'($editor) ($dir)/lib/inko/libstd/std/($module).inko'
	}
}
