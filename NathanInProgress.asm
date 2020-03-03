TITLE: Minesweeper       (minesweeper.asm)

; This program runs and plays minesweeper

INCLUDE Irvine32.inc

.data
	row dword 10
	column dword 10

	board1 byte "- ",0
	board2 byte "| ",0
	board3 byte "|",0

	spacing byte " ",0

	board byte row DUP( column DUP(0) )
	visable dword row DUP( column DUP(0) )

.code
main PROC
	
	; Creates the Board

				                                      ; Initialize the board.
	

	mov ECX, column                                   ; Construct the top of the board
	mov EDX, OFFSET spacing
	call WriteString
	mov EDX, OFFSET board1
	topofboardLoop:
		call WriteString
	loop topofboardLoop

	mov ECX, column                                   ; Construct the middle parts of the board. 
    mov EBX, row

	sideofboardLoop:                                   
		call Crlf                                     ; loop for each line of vertical bars
		mov EDX, OFFSET board2
		insideofboardLoop:
			call WriteString
		loop insideofboardLoop
		mov EDX, OFFSET board3
		call Writestring

		call Crlf

		mov ECX, column								  ; loop for each line of horizontal bars
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