function! ShortCut()
        
        
        
        
        
        
        let fname = "/home/seki/Dropbox/Tool/Anchor/short.txt"
        for line in readfile(fname)
"                if line !=~ '#'
"                        echo line
"                        echo "a"
"                endif
                let r = split(line,'\t')
                echo r[0]
        endfor
endfunction


" Fortest (Do quickrun on the target character!):
" aiu
" あいう

function! s:char2bits(char)
        let bits = map(range(8), '0')
        let cur_keta = len(bits) - 1
        let nr = char2nr(a:char)
        while cur_keta >= 0
                let cur_num = float2nr(pow(2, cur_keta))
                if nr >= cur_num
                        let nr -= cur_num
                        let bits[cur_keta] = 1
                endif
                let cur_keta -= 1
        endwhile
        return reverse(bits)
endfunction

function! s:is_trail_char(char)
        let bits = s:char2bits(a:char)
        return bits[0] && !bits[1]
endfunction

function! s:get_current_and_next_index(str, cur_idx)
        let cur_idx = a:cur_idx
        let str = a:str

        let end_idx = cur_idx + 1
        while s:is_trail_char(str[end_idx])
                let end_idx += 1
        endwhile

        " NOTE: `cur_idx` is always first index.
        return [cur_idx, end_idx]
endfunction

function! s:get_current_character()
        if mode() ==# 'c'
                let str = getcmdline()
                let cur_idx = getcmdpos() - 1
                return matchstr(str, '.', cur_idx)
        elseif mode() ==# 'n'
                let str = getline('.')
                let cur_idx = col('.') - 1
                return matchstr(str, '.', cur_idx)
        else
                echoerr 'not supported'
        endif
        return char
endfunction

function! Test()
       execute ":normal ybp"
       echo 1
endfunction


command! Test call Test()

"let d = get_current_character()
"echo d

"call s:get_current_character()

if !has('virtualedit') || !has('windows') || !has('syntax')
   echohl ErrorMsg
   echon 'Not enough features, need at least +virtualedit, +windows and +syntax'
   echohl None
else
   command! ShortCut call ShortCut()
endif
