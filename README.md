This Vim plug-in binds `<F1>` to showing the documentation of the keyword under the cursor in the offline documentation browser [Zeal](http://www.zealdocs.org).
If there's no keyword, hitting `<F1>` shows a documentation entry page

To fall back to showing [DevDocs](https://devdocs.io/) in a browser, in case no zeal documentation is defined, install @romainl 's [vim-devdocs](https://github.com/romainl/vim-devdocs) and add to your `vimrc`

```vim
augroup DevDocs
  autocmd!
  autocmd Filetype * if empty(maparg('<F1>', 'n')) | nnoremap <buffer> <F1> :<c-u>DD<CR> | endif
augroup END
```

If you prefer to stay in Vim for reading DevDocs, install @girishji 's [devdocs.vim](https://github.com/girishji/devdocs.vim) instead and replace above `:DD` by `:DevdocsFind`.

---

To look up the current keyword in many configuration files in the terminal as well, have a look at [vim-keyword-lookup](https://github.com/Konfekt/vim-keyword-lookup).

