if executable('zeal')
	if empty(maparg('<F1>', 'n')) | nnoremap <buffer> <F1> :<c-u>Silent zeal perlcheat<cr>| endif
endif
