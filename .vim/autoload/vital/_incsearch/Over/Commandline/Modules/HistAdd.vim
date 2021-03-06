" ___vital___
" NOTE: lines between '" ___vital___' is generated by :Vitalize.
" Do not mofidify the code nor insert new lines before '" ___vital___'
if v:version > 703 || v:version == 703 && has('patch1170')
  function! vital#_incsearch#Over#Commandline#Modules#HistAdd#import() abort
    return map({'make': ''},  'function("s:" . v:key)')
  endfunction
else
  function! s:_SID() abort
    return matchstr(expand('<sfile>'), '<SNR>\zs\d\+\ze__SID$')
  endfunction
  execute join(['function! vital#_incsearch#Over#Commandline#Modules#HistAdd#import() abort', printf("return map({'make': ''}, \"function('<SNR>%s_' . v:key)\")", s:_SID()), 'endfunction'], "\n")
  delfunction s:_SID
endif
" ___vital___
scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim


let s:module = {
\	"name" : "HistAdd",
\	"mode" : "cmd"
\}

function! s:module.on_leave(cmdline)
	call histadd(self.mode, a:cmdline.getline())
endfunction


function! s:make(...)
	let module = deepcopy(s:module)
	let module.mode = get(a:, 1, "cmd")
	return module
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
