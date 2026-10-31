"create new c style header-source file pair
func misc#boilerplate#header_create(n)
	let h = ['hpp', 'h', 'hh', 'hxx', 'cpp', 'c', 'cc', 'cxx']
	call mkdir(fnamemodify(a:n, ":h"), "p")
	let f = fnamemodify(a:n, ":r") . "."
	let i = index(h, fnamemodify(a:n, ":e")) % (len(h) / 2)
	exec "edit " . f . h[i + len(h) / 2]
	call setline(".", '#include "' . fnamemodify(f, ":t") . h[i] . '"')
	norm 2o
	exec "edit " . f . h[i]
	call setline(".", "#pragma once")
	norm 2o
	wa
endfunc
