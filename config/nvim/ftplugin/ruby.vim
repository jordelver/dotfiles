" Align (line up) hashes when splitting them out
let b:splitjoin_align = 1

" When splitting, leave a trailing comma after the last item
let b:splitjoin_trailing_comma = 1

" Don't use 'hanging args' because we are not savages
let b:splitjoin_ruby_hanging_args = 0

" Wrap Ruby comments to 50 characters
call OnSyntaxChange#Install('Comment', '^Comment$', 1, 'a')
autocmd User SyntaxCommentEnterA setlocal textwidth=50
autocmd User SyntaxCommentLeaveA setlocal textwidth=0
