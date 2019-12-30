if executable('zeal')
  setlocal keywordprg=:Silent\ zeal\ make:\
  if empty(maparg('<F1>', 'n'))
    nnoremap <buffer> <F1> :<c-u>Silent zeal make:Top<cr>
  endif
endif
