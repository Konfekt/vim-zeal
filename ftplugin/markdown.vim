if executable('zeal')
  setlocal keywordprg=:Silent\ zeal\ markdown:\
  if empty(maparg('<F1>', 'n'))
    nnoremap <buffer> <F1> :<c-u>Silent zeal markdown:Philosophy<cr>
  endif
endif
