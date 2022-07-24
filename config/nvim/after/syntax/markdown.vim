" http://www.panozzaj.com/blog/2016/03/21/ignore-urls-and-acroynms-while-spell-checking-vim/
" Don't mark URL-like things as spelling errors
syntax match UrlNoSpell '\w\+:\/\/[^[:space:]]\+' contains=@NoSpell
