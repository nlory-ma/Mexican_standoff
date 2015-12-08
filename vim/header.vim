
"let l:file = expand('%:f')
"if l:file != c || l:file != "cpp" || l:file != h || l:file != "hpp" || l:file != "ml" || l:file != "Makefile"
"	autocmd	BufNewFile	*.					call				Insert_header_42_other()
"	autocmd	BufWritePre	*.					call				Update_header_42_other()
"endif

autocmd	BufNewFile	*.c						call				Header_42()
autocmd	BufWritePre	*.c						call				Header_42_Update()
autocmd	BufNewFile	*.h						call				Header_42()
autocmd	BufWritePre	*.h						call				Header_42_Update()
autocmd	BufNewFile	*.cpp					call				Header_42()
autocmd	BufWritePre	*.cpp					call				Header_42_Update()
autocmd	BufNewFile	*.hpp					call				Header_42()
autocmd	BufWritePre	*.hpp					call				Header_42_Update()
autocmd	BufNewFile	*.js					call				Header_42()
autocmd	BufWritePre	*.js					call				Header_42_Update()
autocmd	BufNewFile	*.css					call				Header_42()
autocmd	BufWritePre	*.css					call				Header_42_Update()
autocmd	BufNewFile	*.cs					call				Header_42()
autocmd	BufWritePre	*.cs					call				Header_42_Update()
autocmd	BufNewFile	*.scala					call				Header_42()
autocmd	BufWritePre	*.scala					call				Header_42_Update()
autocmd	BufNewFile	*.rs					call				Header_42()
autocmd	BufWritePre	*.rs					call				Header_42_Update()
autocmd	BufNewFile	*.go					call				Header_42()
autocmd	BufWritePre	*.go					call				Header_42_Update()
autocmd	BufNewFile	*.swift					call				Header_42()
autocmd	BufWritePre	*.swift					call				Header_42_Update()
autocmd	BufNewFile	*.ml					call				Insert_header_42_ocaml()
autocmd	BufWritePre	*.ml					call				Update_header_42_ocaml()
autocmd	BufNewFile	*.mli					call				Insert_header_42_ocaml()
autocmd	BufWritePre	*.mli					call				Update_header_42_ocaml()
autocmd	BufNewFile	*.php					call				Insert_header_42_php()
autocmd	BufWritePre	*.php					call				Update_header_42_php()
autocmd	BufNewFile	*.html					call				Insert_header_42_html()
autocmd	BufWritePre	*.html					call				Update_header_42_html()
autocmd	BufNewFile	*.lua					call				Insert_header_42_lua()
autocmd	BufWritePre	*.lua					call				Update_header_42_lua()
autocmd	BufNewFile	*.hs					call				Insert_header_42_haskell()
autocmd	BufWritePre	*.hs					call				Update_header_42_haskell()
autocmd	BufNewFile	*.s						call				Insert_header_42_asm()
autocmd	BufWritePre	*.s						call				Update_header_42_asm()
autocmd	BufNewFile	*.s64					call				Insert_header_42_asm()
autocmd	BufWritePre	*.s64					call				Update_header_42_asm()
autocmd	BufNewFile	*.asm					call				Insert_header_42_asm()
autocmd	BufWritePre	*.asm					call				Update_header_42_asm()
autocmd	BufNewFile	*.h64					call				Insert_header_42_asm()
autocmd	BufWritePre	*.h64					call				Update_header_42_asm()
autocmd	BufNewFile	Makefile				call				Insert_header_42_Makefile()
autocmd	BufWritePre	Makefile				call				Update_header_42_Makefile()


function!		Get_42_info(begin, end, nul_line, setline)

	let user = system("echo $USER | tr -d '\n'")
	let	date = strftime("%Y/%m/%d %H:%M:%S")
	let line = "/*   " . a:begin . date. " by " . user
	let cmd = "echo " . user . " | wc -c | awk '{print $1}' | tr -d '\n'"
	let len = system(cmd)
	let space = 17 - len
	while space > 0
		let line = line . " "
		let space -= 1
	endwhile
	let line = line . a:end
	if a:setline ==? '1'
		call a:setline(a:nul_line, line)
	else
		call append(a:nul_line, line)
	endif
endfunction

function!		Get_42_mail()

	let user = system("echo $USER | tr -d '\n'")
	let	mail = system("echo $MAIL | tr -d '\n'")
	let line = "/*   By: ". user . " <" . mail . ">"
	let	cmd = "echo ". user . mail . " | wc -c | awk '{print $1}' | tr -d '\n'"
	let len = system(cmd)
	let space = 40 - len
	while space >= 0
		let line = line . " "
		let space -= 1
	endwhile
	let line = line . "+#+  +:+       +#+        */"
	call append(5, line)
endfunction

function!		Get_file_info()
	let line = "/*   "
	let	file = expand('%:f')
	let cmd = "/usr/bin/basename " . file . " | tr -d '\n'"
	let file = system(cmd)
	let	line = line . file

	let cmd = "echo " . file . " | tr -d '\n' | wc -c | awk '{print $1}' "
	let len = system(cmd)
	let space = 51 - len
	while space > 0
		let line = line . " "
		let	space -= 1
	endwhile
	let line = line . ":+:      :+:    :+:   */"
	call append(3, line)


endfunction

function!		Insert_header()


	let user = system("echo $USER | tr -d '\n'")
	call append(0,  "/* ************************************************************************** */")
	call append(1,  "/*                                                                            */")
	call append(2,  "/*                                                        :::      ::::::::   */")
	call Get_file_info()
	call append(4,  "/*                                                    +:+ +:+         +:+     */")
	call Get_42_mail()
	call append(6,  "/*                                                +#+#+#+#+#+   +#+           */")
	call Get_42_info("Created: ",                                       "  #+#    #+#             */", 7, 0)
	call Get_42_info("Updated: ",                                        " ###   ########.fr       */", 8, 0)
	call append(9,  "/*                                                                            */")
	call append(10, "/* ************************************************************************** */")
	unlet user
endfunction

function!		Update_header()

	let s:login = system("echo $USER | tr -d '\n'")
	let l:pattern = "/*   Update:"
	let l:line = getline(9)
	if match(l:line, l:pattern) != -1
		call Get_42_info("Updated", "###   ########.fr       */", 9, 1)
	endif
	unlet s:login
endfunction

function!		Header_42()

	if has('autocmd')
		"nnoremap <C-c> <C-h> :call Insert_header()<cr>
		"nnoremap <C-c> <C-h> :call Update_header()<cr>
		map <C-c><C-h> mz:execute Insert_header()<cr>
		"map <C-c><C-h> mz:execute Update_header()<cr>
		autocmd BufWritePre * call Update_header()
	endif
endfunction


function!		Header_42_Update()

"	if has('autocmd')
"		nnoremap <C-c> <C-h> :call Update_header()<cr>
"	endif
	call Update_header()
endfunction
call Header_42()

"map <C-c><C-h> mz:execute Insert_header()<cr>

