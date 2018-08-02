" Vim color file
" Converted from Textmate theme 1337 using Coloration v0.4.0 (http://github.com/sickill/coloration)

highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "1337"

hi Cursor ctermfg=234 ctermbg=231 cterm=NONE guifg=#191919 guibg=#f8f8f0 gui=NONE
hi Visual ctermfg=NONE ctermbg=239 cterm=NONE guifg=NONE guibg=#515151 gui=NONE
hi CursorLine ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#2f2f2f gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#2f2f2f gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#2f2f2f gui=NONE
hi LineNr ctermfg=102 ctermbg=236 cterm=NONE guifg=#898986 guibg=#2f2f2f gui=NONE
hi VertSplit ctermfg=240 ctermbg=240 cterm=NONE guifg=#5a5a58 guibg=#5a5a58 gui=NONE
hi MatchParen ctermfg=203 ctermbg=NONE cterm=underline guifg=#ff5e5e guibg=NONE gui=underline
hi StatusLine ctermfg=231 ctermbg=240 cterm=bold guifg=#f8f8f2 guibg=#5a5a58 gui=bold
hi StatusLineNC ctermfg=231 ctermbg=240 cterm=NONE guifg=#f8f8f2 guibg=#5a5a58 gui=NONE
hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=239 cterm=NONE guifg=NONE guibg=#515151 gui=NONE
hi IncSearch ctermfg=234 ctermbg=223 cterm=NONE guifg=#191919 guibg=#fbe3bf gui=NONE
hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi Directory ctermfg=216 ctermbg=NONE cterm=NONE guifg=#fdb082 guibg=NONE gui=NONE
hi Folded ctermfg=242 ctermbg=234 cterm=NONE guifg=#6d6d6d guibg=#191919 gui=NONE

hi Normal ctermfg=231 ctermbg=234 cterm=NONE guifg=#f8f8f2 guibg=#191919 gui=NONE
hi Boolean ctermfg=209 ctermbg=NONE cterm=NONE guifg=#ff8942 guibg=NONE gui=NONE
hi Character ctermfg=216 ctermbg=NONE cterm=NONE guifg=#fdb082 guibg=NONE gui=NONE
hi Comment ctermfg=242 ctermbg=NONE cterm=NONE guifg=#6d6d6d guibg=NONE gui=NONE
hi Conditional ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ff5e5e guibg=NONE gui=NONE
hi Constant ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Define ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ff5e5e guibg=NONE gui=NONE
hi DiffAdd ctermfg=231 ctermbg=64 cterm=bold guifg=#f8f8f2 guibg=#43800a gui=bold
hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE guifg=#880505 guibg=NONE gui=NONE
hi DiffChange ctermfg=231 ctermbg=23 cterm=NONE guifg=#f8f8f2 guibg=#1c3250 gui=NONE
hi DiffText ctermfg=231 ctermbg=24 cterm=bold guifg=#f8f8f2 guibg=#204a87 gui=bold
hi ErrorMsg ctermfg=231 ctermbg=197 cterm=NONE guifg=#f8f8f0 guibg=#f92649 gui=NONE
hi WarningMsg ctermfg=231 ctermbg=197 cterm=NONE guifg=#f8f8f0 guibg=#f92649 gui=NONE
hi Float ctermfg=216 ctermbg=NONE cterm=NONE guifg=#fdb082 guibg=NONE gui=NONE
hi Function ctermfg=117 ctermbg=NONE cterm=NONE guifg=#8cdaff guibg=NONE gui=NONE
hi Identifier ctermfg=223 ctermbg=NONE cterm=NONE guifg=#fbdfb5 guibg=NONE gui=italic
hi Keyword ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ff5e5e guibg=NONE gui=NONE
hi Label ctermfg=223 ctermbg=NONE cterm=NONE guifg=#fbe3bf guibg=NONE gui=NONE
" hi NonText ctermfg=59 ctermbg=235 cterm=NONE guifg=#3b3a32 guibg=#242424 gui=NONE
hi Number ctermfg=216 ctermbg=NONE cterm=NONE guifg=#fdb082 guibg=NONE gui=NONE
hi Operator ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ff5e5e guibg=NONE gui=NONE
hi PreProc ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ff5e5e guibg=NONE gui=NONE
hi Special ctermfg=231 ctermbg=NONE cterm=NONE guifg=#f8f8f2 guibg=NONE gui=NONE
hi SpecialKey ctermfg=59 ctermbg=236 cterm=NONE guifg=#3b3a32 guibg=#2f2f2f gui=NONE
hi Statement ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ff5e5e guibg=NONE gui=NONE
hi StorageClass ctermfg=223 ctermbg=NONE cterm=NONE guifg=#fbdfb5 guibg=NONE gui=italic
hi String ctermfg=223 ctermbg=NONE cterm=NONE guifg=#fbe3bf guibg=NONE gui=NONE
hi Tag ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ff5e5e guibg=NONE gui=NONE
hi Title ctermfg=231 ctermbg=NONE cterm=bold guifg=#f8f8f2 guibg=NONE gui=bold
hi Todo ctermfg=242 ctermbg=NONE cterm=inverse,bold guifg=#6d6d6d guibg=NONE gui=inverse,bold
hi Type ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ff5e5e guibg=NONE gui=NONE
hi rubyFunction ctermfg=117 ctermbg=NONE cterm=NONE guifg=#8cdaff guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=216 ctermbg=NONE cterm=NONE guifg=#fdb082 guibg=NONE gui=NONE
hi rubyConstant ctermfg=223 ctermbg=NONE cterm=NONE guifg=#fbe3bf guibg=NONE gui=NONE
hi rubyStringDelimiter ctermfg=223 ctermbg=NONE cterm=NONE guifg=#fbe3bf guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fc9354 guibg=NONE gui=italic
hi rubyInstanceVariable ctermfg=193 ctermbg=NONE cterm=NONE guifg=#e9fdac guibg=NONE gui=NONE
hi rubyInclude ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ff5e5e guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=193 ctermbg=NONE cterm=NONE guifg=#e9fdac guibg=NONE gui=NONE
hi rubyRegexp ctermfg=223 ctermbg=NONE cterm=NONE guifg=#fbe3bf guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=223 ctermbg=NONE cterm=NONE guifg=#fbe3bf guibg=NONE gui=NONE
hi rubyEscape ctermfg=216 ctermbg=NONE cterm=NONE guifg=#fdb082 guibg=NONE gui=NONE
hi rubyControl ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ff5e5e guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=193 ctermbg=NONE cterm=NONE guifg=#e9fdac guibg=NONE gui=NONE
hi rubyOperator ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ff5e5e guibg=NONE gui=NONE
hi rubyException ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ff5e5e guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=193 ctermbg=NONE cterm=NONE guifg=#e9fdac guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=223 ctermbg=NONE cterm=NONE guifg=#fbe3bf guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod ctermfg=68 ctermbg=NONE cterm=NONE guifg=#6699cc guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=68 ctermbg=NONE cterm=NONE guifg=#6699cc guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=68 ctermbg=NONE cterm=NONE guifg=#6699cc guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=68 ctermbg=NONE cterm=NONE guifg=#6699cc guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi erubyComment ctermfg=242 ctermbg=NONE cterm=NONE guifg=#6d6d6d guibg=NONE gui=NONE
hi erubyRailsMethod ctermfg=68 ctermbg=NONE cterm=NONE guifg=#6699cc guibg=NONE gui=NONE
hi htmlTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlEndTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlTagName ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlArg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=216 ctermbg=NONE cterm=NONE guifg=#fdb082 guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=223 ctermbg=NONE cterm=NONE guifg=#fbdfb5 guibg=NONE gui=italic
hi javaScriptRailsFunction ctermfg=68 ctermbg=NONE cterm=NONE guifg=#6699cc guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=223 ctermbg=NONE cterm=NONE guifg=#fbdfb5 guibg=NONE gui=NONE
hi yamlKey ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ff5e5e guibg=NONE gui=NONE
hi yamlAnchor ctermfg=193 ctermbg=NONE cterm=NONE guifg=#e9fdac guibg=NONE gui=NONE
hi yamlAlias ctermfg=193 ctermbg=NONE cterm=NONE guifg=#e9fdac guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=223 ctermbg=NONE cterm=NONE guifg=#fbe3bf guibg=NONE gui=NONE
hi cssURL ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fc9354 guibg=NONE gui=italic
hi cssFunctionName ctermfg=216 ctermbg=NONE cterm=NONE guifg=#fdb082 guibg=NONE gui=NONE
hi cssColor ctermfg=216 ctermbg=NONE cterm=NONE guifg=#fdb082 guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=116 ctermbg=NONE cterm=NONE guifg=#97d8ea guibg=NONE gui=NONE
hi cssClassName ctermfg=116 ctermbg=NONE cterm=NONE guifg=#97d8ea guibg=NONE gui=NONE
hi cssValueLength ctermfg=216 ctermbg=NONE cterm=NONE guifg=#fdb082 guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=216 ctermbg=NONE cterm=NONE guifg=#fdb082 guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
