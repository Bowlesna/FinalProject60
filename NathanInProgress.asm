TITLE: Minesweeper       (minesweeper.asm)

; This program runs and plays minesweeper

INCLUDE Irvine32.inc

.data
	row dword ?
	column dword ?

	board1 byte "- ",0
	board2 byte "| ",0
	board3 byte "|",0

	spacing byte " ",0

.code
main PROC
	
	; Creates the Board

	mov row, 5                                        ; Initialize the board.
	mov column, 10

	mov ECX, column                                   ; Construct the top of the board
	mov EDX, OFFSET spacing
	call WriteString
	mov EDX, OFFSET board1
	topofboardLoop:
		call WriteString
	loop topofboardLoop

	mov ECX, column                                   ; Construct the middle parts of the board. Includes a row of | and a row of --
    mov EBX, row

	sideofboardLoop:                                   
		call Crlf
		mov EDX, OFFSET board2
		insideofboardLoop:
			call WriteString
		loop insideofboardLoop
		mov EDX, OFFSET board3
		call Writestring

		call Crlf

		mov ECX, column
		mov EDX, OFFSET spacing
	    call WriteString
		mov EDX, OFFSET board1
		middleofboardLoop:
			call WriteString
		loop middleofboardLoop

		mov ECX, column
	dec EBX
	cmp EBX, 0
	jne sideofboardLoop
	call Crlf


	exit
main ENDP
END main