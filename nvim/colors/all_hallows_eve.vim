set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "all_hallows_eve"

highlight Cursor ctermfg=NONE ctermbg=15 cterm=NONE guifg=NONE guibg=#ffffff gui=NONE
highlight Visual ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#644d6e gui=NONE
highlight CursorLine ctermfg=NONE ctermbg=233 cterm=NONE guifg=NONE guibg=#191919 gui=NONE
highlight CursorColumn ctermfg=NONE ctermbg=233 cterm=NONE guifg=NONE guibg=#191919 gui=NONE
highlight ColorColumn ctermfg=NONE ctermbg=233 cterm=NONE guifg=NONE guibg=#191919 gui=NONE
highlight LineNr ctermfg=238 ctermbg=232 cterm=NONE guifg=#808080 guibg=#191919 gui=NONE
highlight CursorLineNr ctermfg=243
highlight SignColumn ctermfg=NONE ctermbg=232 cterm=NONE guifg=NONE guibg=#191919 gui=NONE
highlight VertSplit ctermfg=238 ctermbg=238 cterm=NONE guifg=#4a4a4a guibg=#4a4a4a gui=NONE
highlight MatchParen ctermfg=173 ctermbg=NONE cterm=NONE guifg=#cc7833 guibg=NONE gui=NONE
highlight StatusLine ctermfg=15 ctermbg=238 cterm=bold guifg=#ffffff guibg=#4a4a4a gui=bold
highlight StatusLineNC ctermfg=15 ctermbg=238 cterm=NONE guifg=#ffffff guibg=#4a4a4a gui=NONE
highlight Pmenu ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=NONE gui=NONE
highlight PmenuSel ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#644d6e gui=NONE
highlight IncSearch ctermfg=0 ctermbg=202 cterm=NONE guifg=NONE guibg=NONE gui=NONE
highlight Search ctermfg=0 ctermbg=226 cterm=NONE guifg=NONE guibg=NONE gui=NONE
highlight SpellBad ctermfg=255
highlight WildMenu ctermfg=22 ctermbg=148 cterm=bold guifg=NONE guibg=NONE gui=NONE
highlight StatusLine ctermfg=255 ctermbg=236 cterm=NONE guifg=NONE guibg=NONE gui=NONE
highlight Directory ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3387cc guibg=NONE gui=NONE
highlight Folded ctermfg=98 ctermbg=0 cterm=NONE guifg=#9933cc guibg=#000000 gui=NONE
highlight Normal ctermfg=15 ctermbg=0 cterm=NONE guifg=#ffffff guibg=#000000 gui=NONE
highlight Boolean ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3387cc guibg=NONE gui=NONE
highlight Character ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3387cc guibg=NONE gui=NONE
highlight Comment ctermfg=238 ctermbg=NONE cterm=NONE guifg=#9933cc guibg=NONE gui=NONE
highlight Conditional ctermfg=173 ctermbg=NONE cterm=NONE guifg=#cc7833 guibg=NONE gui=NONE
highlight Constant ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3387cc guibg=NONE gui=NONE
highlight Define ctermfg=173 ctermbg=NONE cterm=NONE guifg=#cc7833 guibg=NONE gui=NONE
highlight ErrorMsg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
highlight WarningMsg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
highlight Float ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3387cc guibg=NONE gui=NONE
highlight Function ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
highlight Identifier ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
highlight Keyword ctermfg=173 ctermbg=NONE cterm=NONE guifg=#cc7833 guibg=NONE gui=NONE
highlight Label ctermfg=77 ctermbg=NONE cterm=NONE guifg=#66cc33 guibg=NONE gui=NONE
highlight NonText ctermfg=238 ctermbg=232 cterm=NONE guifg=#404040 guibg=#0d0d0d gui=NONE
highlight Number ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3387cc guibg=NONE gui=NONE
highlight Operator ctermfg=173 ctermbg=NONE cterm=NONE guifg=#cc7833 guibg=NONE gui=NONE
highlight PreProc ctermfg=173 ctermbg=NONE cterm=NONE guifg=#cc7833 guibg=NONE gui=NONE
highlight Special ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
highlight SpecialKey ctermfg=238 ctermbg=234 cterm=NONE guifg=#404040 guibg=#191919 gui=NONE
highlight Statement ctermfg=173 ctermbg=NONE cterm=NONE guifg=#cc7833 guibg=NONE gui=NONE
highlight StorageClass ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
highlight String ctermfg=77 ctermbg=NONE cterm=NONE guifg=#66cc33 guibg=NONE gui=NONE
highlight Tag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
highlight Title ctermfg=15 ctermbg=NONE cterm=bold guifg=#ffffff guibg=NONE gui=bold
highlight Todo ctermfg=98 ctermbg=NONE cterm=underline,bold guifg=#9933cc guibg=NONE gui=inverse,bold
highlight Type ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
highlight Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
highlight rubyClass ctermfg=173 ctermbg=NONE cterm=NONE guifg=#cc7833 guibg=NONE gui=NONE
highlight rubyFunction ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
highlight rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
highlight rubySymbol ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3387cc guibg=NONE gui=NONE
highlight rubyConstant ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
highlight rubyStringDelimiter ctermfg=77 ctermbg=NONE cterm=NONE guifg=#66cc33 guibg=NONE gui=NONE
highlight rubyBlockParameter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
highlight rubyInstanceVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
highlight rubyInclude ctermfg=173 ctermbg=NONE cterm=NONE guifg=#cc7833 guibg=NONE gui=NONE
highlight rubyGlobalVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
highlight rubyRegexp ctermfg=185 ctermbg=NONE cterm=NONE guifg=#cccc33 guibg=NONE gui=NONE
highlight rubyRegexpDelimiter ctermfg=185 ctermbg=NONE cterm=NONE guifg=#cccc33 guibg=NONE gui=NONE
highlight rubyEscape ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3387cc guibg=NONE gui=NONE
highlight rubyControl ctermfg=173 ctermbg=NONE cterm=NONE guifg=#cc7833 guibg=NONE gui=NONE
highlight rubyClassVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
highlight rubyOperator ctermfg=173 ctermbg=NONE cterm=NONE guifg=#cc7833 guibg=NONE gui=NONE
highlight rubyException ctermfg=173 ctermbg=NONE cterm=NONE guifg=#cc7833 guibg=NONE gui=NONE
highlight rubyPseudoVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
highlight rubyRailsUserClass ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
highlight rubyRailsARAssociationMethod ctermfg=167 ctermbg=NONE cterm=NONE guifg=#c83730 guibg=NONE gui=NONE
highlight rubyRailsARMethod ctermfg=167 ctermbg=NONE cterm=NONE guifg=#c83730 guibg=NONE gui=NONE
highlight rubyRailsRenderMethod ctermfg=167 ctermbg=NONE cterm=NONE guifg=#c83730 guibg=NONE gui=NONE
highlight rubyRailsMethod ctermfg=167 ctermbg=NONE cterm=NONE guifg=#c83730 guibg=NONE gui=NONE
highlight erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
highlight erubyComment ctermfg=98 ctermbg=NONE cterm=NONE guifg=#9933cc guibg=NONE gui=NONE
highlight erubyRailsMethod ctermfg=167 ctermbg=NONE cterm=NONE guifg=#c83730 guibg=NONE gui=NONE
highlight htmlTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
highlight htmlEndTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
highlight htmlTagName ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
highlight htmlArg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
highlight htmlSpecialChar ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3387cc guibg=NONE gui=NONE
highlight javaScriptFunction ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
highlight javaScriptRailsFunction ctermfg=167 ctermbg=NONE cterm=NONE guifg=#c83730 guibg=NONE gui=NONE
highlight javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
highlight yamlKey ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
highlight yamlAnchor ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
highlight yamlAlias ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
highlight yamlDocumentHeader ctermfg=77 ctermbg=NONE cterm=NONE guifg=#66cc33 guibg=NONE gui=NONE
highlight cssURL ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
highlight cssFunctionName ctermfg=167 ctermbg=NONE cterm=NONE guifg=#c83730 guibg=NONE gui=NONE
highlight cssColor ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3387cc guibg=NONE gui=NONE
highlight cssPseudoClassId ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
highlight cssClassName ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
highlight cssValueLength ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3387cc guibg=NONE gui=NONE
highlight cssCommonAttr ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
highlight cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
