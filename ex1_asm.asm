.MODEL TINY

.code
	ORG    100h
Start:
	jmp    main

	msg1		DB     "Wynik calosc: $"
	msg2		DB     10,13,"Wynik reszta: $"
	a               DW     14h							
	b               DW     0Ah												
	d               DW     03h							
	WynikCalosc     DW     ?
	WynikReszta     DW     ?	

main proc near
	mov		ax, a
	mov		bx, 4
	mul		bx
	mov		bx, ax
	mov		ax, b
	mul		ax
	sub		ax, bx
	mov		bx, ax						
	mov		bx, d
	idiv		bx

	mov		WynikCalosc, ax
	mov		WynikReszta, dx

	mov		dx, OFFSET msg1
	mov		ah, 09h
	int		21h

	mov		ax, WynikCalosc
	add		ax, 48
	mov		dx, ax
	xor		ax, ax
	mov		ah, 02h
	int		21h

	mov		dx, OFFSET msg2
	mov		ah, 09h
	int		21h

	mov		ax, WynikReszta
	add		ax, 48
	mov		dx, ax
	xor		ax, ax
	mov		ah, 02h
	int		21h

	mov   		ax, 4C00h
	int   		21h
	int 		20h

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
main endp
END    Start
