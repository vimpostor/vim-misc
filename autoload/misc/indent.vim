"poor man's editorconfig
func misc#indent#autoindent(...)
	let tabs = len(filter(getline('1', '$'), 'v:val =~ "^\t"'))
	let spaces = len(filter(getline('1', '$'), 'v:val =~ "^ "'))
	let n = get(a:, 1, 0) + get(filter(map(getline('1', '$'), 'len(matchstr(v:val, "^ \\+"))'), 'v:val != 0'), 0, 4) * !a:0 + 4 * !get(a:, 1, 0) * a:0
	if tabs && spaces
		echohl ErrorMsg | echo printf('Mixed indentation detected (%d tabs VS %d spaces)', tabs, spaces) | echohl None
	endif
	if (tabs > spaces && (!a:0 || !a:1)) || (a:0 && !a:1)
		exec printf('set noet ts=%d sts=0 sw=0', n)
		echo printf('Indenting with tabs (ts=%d)', n)
	else
		exec printf('set et ts=%d sts=-1 sw=0', n)
		echo printf('Indenting with spaces (ts=%d)', n)
	endif
endfunc
