if executable('zeal')
  setlocal keywordprg=:Silent\ zeal\ html:\
  if empty(maparg('<F1>', 'n'))
    nnoremap <buffer> <F1> :<c-u>Silent zeal html<cr>
  endif
endif
