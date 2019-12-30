if executable('zeal')
	setlocal keywordprg=:Silent\ zeal\ pandoc:\
  if empty(maparg('<F1>', 'n'))
    nnoremap <buffer> <F1> :<c-u>Silent zeal pandoc:User\'s\ Guide<cr>
  endif
endif
