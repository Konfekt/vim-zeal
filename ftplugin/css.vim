if executable('zeal')
  setlocal keywordprg=:Silent\ zeal\ css:\
  if empty(maparg('<F1>', 'n'))
    nnoremap <buffer> <F1> :<c-u>Silent zeal css<cr>
  endif
endif
