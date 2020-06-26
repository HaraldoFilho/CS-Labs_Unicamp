;-------------------------------------------------- 
; RA 058589 - Alex Oliveira Cremonezi 
; RA 003059 - Haraldo Sergio Albergaria Pereira Filho 
; RA 033546 - Jonatas Botelho da Silva     
;
; Jogo da Velha - Projeto MC404
; Professor Ricardo Pannain
; Junho 2007
;
;--------------------------------------------------


title TIMER

public timer

include STCK_SEG.ASM

C_SEG segment byte public 'CODE'

assume cs:C_SEG,ss:S_SEG

contador proc near

	inc cl ; conta o numero de ciclos da int 08h
	iret
	
contador endp

timer proc near
        ;Le o endereco atual da interrupcao 1Ch 
        mov ah, 35H
        mov al, 1CH
        int 21H
        push es
        push bx
	
	xor cl,cl ; inicia cl que sera usado como contador de ciclos da int 08h
	
        ;Coloca o procedimento contador na interrupcao 1Ch
        mov ax, seg contador
        mov ds, ax
        mov dx, offset contador
        mov ah, 25H
        mov al, 1CH
        int 21H
        
VOLTA:	cmp cl,ch ; verifica se timer atingiu o numero de ciclos desejado
	jb VOLTA

        ;Volta a interrupcao original para 1Ch
        pop dx
        pop ax
        mov ds, ax
        mov ah, 25H
        mov al, 1CH
        int 21H
        
        ret

timer endp

C_SEG ends

end
