if executable('zeal')
  setlocal keywordprg=:Silent\ zeal\ c:\

  if empty(maparg('<F1>', 'n')) | nnoremap <buffer> <F1> :<c-u>Silent zeal c<cr>| endif
endif
