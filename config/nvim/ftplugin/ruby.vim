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

" Ruby indentation settings
"
" Indent assignments like this...
"
"     x = if condition
"       something
"     end
"
" ...not this
"
"     x = if condition
"           something
"         end
"
let g:ruby_indent_assignment_style = 'variable'

" Indent blocks like this...
"
"     first
"       .second do |x|
"       something
"     end

" ...not this
"
"     first
"       .second do |x|
"         something
"       end
"
let g:ruby_indent_block_style = 'do'

" " Indent method access modifiers like this...
"
"     class Indent
"       private :method
"       protected :method
"       private
"       def method; end
"       protected
"       def method; end
"       public
"       def method; end
"     end
"
let g:ruby_indent_access_modifier_style = 'normal'
