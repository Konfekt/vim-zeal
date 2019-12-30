if executable('zeal')
  setlocal keywordprg=:Silent\ zeal\ r:\
  if empty(maparg('<F1>', 'n'))
    nnoremap <buffer> <F1> :<c-u>Silent zeal r:introduction<cr>
  endif
endif
