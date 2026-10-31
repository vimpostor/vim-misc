func misc#init()
	let g:misc_options = extend(misc#default_options(), get(g:, 'misc_options', {}))

	if g:misc_options.default_mappings
		" header boilerplate
		command -nargs=1 -complete=file Cunit call misc#boilerplate#header_create(<q-args>)

		" file completion
		inoremap <silent> <C-X><C-F> <C-R>=misc#file#compl()<CR>
		nnoremap <silent> <C-X><C-F> :let g:file_complete_s = 0<CR>
		au CompleteDone * if get(g:, 'file_complete_a') | let g:file_complete_a = 0 | let g:file_complete_s = 1 | call feedkeys("\<C-X>\<C-F>") | endif

		" thesaurus
		set thesaurusfunc=misc#thesaurus#thesaur

		" autoindent
		command -nargs=? AutoIndent call misc#indent#autoindent(<args>)
	endif
endfunc

func misc#default_options()
	return #{
		\ default_mappings: 1,
	\ }
endfunc
