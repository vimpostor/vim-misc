func misc#file#compl()
	let f = matchstr(strpart(getline('.'), 0, col('.')-1), '\f\+$')
	if (!get(g:, 'file_complete_s') || len(f)) && !get(g:, 'file_complete_a')
		call complete(col('.')-len(f), map(getcompletion(f, 'file'), 'v:val[:-1-(v:val[-1:]=="/")]'))
		let g:file_complete_a = 1
	endif
	let g:file_complete_s = 0
	return ''
endfunc
