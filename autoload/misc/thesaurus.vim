func misc#thesaurus#thesaur(findstart, base)
	if a:findstart
		return searchpos('\<', 'bnW', line('.'))[1] - 1
	endif
	let res = []
	let h = ''
	for l in systemlist('aiksaurus '.shellescape(a:base))
		if l[:3] == '=== '
			let h = '('.substitute(l[4:], ' =*$', ')', '')
		elseif l ==# 'Alphabetically similar known words are: '
			let h = "\U0001f52e"
		elseif l[0] =~ '\a' || (h ==# "\U0001f52e" && l[0] ==# "\t")
			call extend(res, map(split(substitute(l, '^\t', '', ''), ', '), {_, val -> {'word': val, 'menu': h}}))
		endif
	endfor
	return res
endfunc
