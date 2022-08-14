" It's common in JavaScript to omit the file extension
" Also some plugins mess this up so I overwite it...
setlocal suffixesadd=.js,.jsx,.ts,.tsx,.d.ts

if has("nvim")
  setlocal includeexpr=luaeval(\"require'tsconfig'.includeexpr(_A)\",v:fname)
endif
