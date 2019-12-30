if executable('zeal')
  setlocal keywordprg=:Silent\ zeal\ bash:\
  if empty(maparg('<F1>', 'n'))
    nnoremap <buffer> <F1> :<c-u>Silent zeal bash<cr>
  endif
endif
