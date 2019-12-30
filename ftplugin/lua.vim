if executable('zeal')
  setlocal keywordprg=:Silent\ zeal\ lua:\
  if empty(maparg('<F1>', 'n'))
    nnoremap <buffer> <F1> :<c-u>Silent zeal lua<cr>
  endif
endif
