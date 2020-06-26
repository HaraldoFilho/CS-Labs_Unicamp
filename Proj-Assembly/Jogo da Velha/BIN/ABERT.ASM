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

title ANIMACAO DA ABERTURA

.model small

public abertura

extrn timer:near

include STCK_SEG.ASM
include DATA_SEG.ASM

C_SEG segment byte public 'CODE'

assume cs:C_SEG,ds:D_SEG,ss:S_SEG

include MACROS.ASM			; inclui arquivo de macros

abertura proc near

	SALVA_REGS
		
	SEL_VIDEO 12h			; seleciona modo de video grafico VGA

	
; ---------------- Desenha Jogo da Velha ---------------------------------------

	ESPERA 13

        mov ah,0CH 			; escreve pixel
        mov al,6h

        mov cx,325 			; coluna inicial
        mov dx,158 			; linha   
    H1: int 10H    			; desenha linha
        ESPERA 1
        inc cx
        cmp cx,370 			; escreve 45 pixels
        jle H1

        mov cx,325 			; coluna inicial
        mov dx,176 			; linha
    H2: int 10H    			; desenha linha
        ESPERA 1
        inc cx
        cmp cx,370 			; escreve 45 pixels
        jle H2

        mov cx,339 			; coluna inicial
        mov dx,144 			; linha
    V1: int 10H    			; desenha linha
        ESPERA 1
        inc dx
        cmp dx,190 			; escreve 46 pixels
        jle V1                

        mov cx,355 			; coluna inicial
        mov dx,144 			; linha
    V2: int 10H    			; desenha linha
        ESPERA 1
        inc dx
        cmp dx,190 			; escreve 46 pixels
        jle V2     

	ESPERA 7			; espera 7 ciclos da int 08h (aprox 0,5 segundo)

	MOV_CURSOR 10,45		
	MOSTRA_AT 'X',0Ch,1		; escreve a letra 'X' em vermelho
	
	ESPERA 26			; espera 26 ciclos da int 08h (aprox 2 segundos)

	MOV_CURSOR 9,45		
	MOSTRA_AT 'O',0Ah,1		; escreve a letra 'O' em verde

	
	
;------ Redesenha trecho da linha apagado pela letra O verde -----------
	SALVA_REGS
        mov ah,0CH 			; escreve pixel
        mov al,6h
        mov cx,360 			; coluna inicial
        mov dx,158 			; linha   
    H8: int 10H    			; desenha linha
        inc cx
        cmp cx,370 			; escreve 10 pixels
        jle H8
	RESTAURA_REGS
;-----------------------------------------------------------------------


	ESPERA 26			; espera 26 ciclos da int 08h (aprox 2 segundos)

	MOV_CURSOR 10,43		
	MOSTRA_AT 'X',0Ch,1		; escreve a letra 'X' em vermelho

	ESPERA 26			; espera 26 ciclos da int 08h (aprox 2 segundos)
	
	MOV_CURSOR 10,41		
	MOSTRA_AT 'O',0Ah,1		; escreve a letra 'O' em verde
	
	ESPERA 7			; espera 7 ciclos da int 08h (aprox 0,5 segundo)

	MOV_CURSOR 0,0		
	MOSTRA_AT 0,0Eh,1		; define atributo corrente como letra amarela com fundo preto

;-----------------------------------------------------------------------


; ------- Escreve a palavra J O G O com as letras caindo uma a uma -------

	xor si,si			
	mov cl,0			
	mov ch,35			
	
VOLTA1:	MOV_CURSOR cl,ch		

	MOSTRA JOGO[si]			; mostra cada uma das letras da palavra J O G O

;------ Redesenha trecho da linha apagado pela letra O caindo ------------
	SALVA_REGS
        mov ah,0CH 			; escreve pixel
        mov al,6h
        mov cx,325 			; coluna inicial
        mov dx,158 			; linha   
    H9: int 10H    			; desenha linha
        inc cx
        cmp cx,335 			; escreve 10 pixels
        jle H9
	RESTAURA_REGS
;-------------------------------------------------------------------------

	ESPERA 2			; espera 2 ciclos da int 08h (aprox 0,16 segundos)

	cmp cl,10			; verifica se chegou na linha 10
	je PULA1			; se sim, nao apaga o caracter escrito
	MOSTRA 0			; se nao, apaga o caracter escrito

PULA1:	inc cl				; incrementa uma linha para escrever novamente o caracter
	cmp cl,11			; verifica se caracter ja foi impresso na linha 10 
	jb VOLTA1			; se nao, imprime o caracter na proxima linha
	mov cl,0			; se sim, volta para a linha 0
	add ch,2			; e pula uma coluna
	inc si				; vai para a proxima letra da palavra
	cmp si,4			; verifica se chegou ao final da palavra
	jb VOLTA1			; se nao, imprime nova letra

	mov cl,12			
	sub ch,2

;-------------------------------------------------------------------------



; ------------- Faz a letra O verde cair ---------------------------------

VOLTA5:	MOV_CURSOR cl,ch		

	MOSTRA_AT 'O',0Ah,1		; escreve a letra 'O' em verde

	ESPERA 2			; espera 2 ciclos da int 08h (aprox 0,16 segundos)

	MOSTRA_AT 0,0Eh,1		; apaga a letra

	inc cl				; vai para a proxima linha
	cmp cl,24			; verifica se chegou na ultima linha
	jb VOLTA5			; se nao, imprime novamente

;-------------------------------------------------------------------------


; ---- Escreve a palavra DA com a letra D vindo da esquerda --------------
; ---- e a letra E vindo da direita da tela ------------------------------
; ---- e as duas se chocando no  centro da tela --------------------------
	
	mov cl,0
	mov ch,79
	
VOLTA2:	MOV_CURSOR 12,cl
	MOSTRA 'D'
	
	MOV_CURSOR 12,ch
	MOSTRA 'A'
	
	ESPERA 1			; espera 1 ciclo da int 08h (aprox 0,08 segundos)
	
	cmp cl,39			; verifica se as letras ja chegaram ao centro da tela
	je PULA2			; se sim, para
	
	MOSTRA 0			; se nao, apaga letra A
	MOV_CURSOR 12,cl		; vai para a posicao da letra D
	MOSTRA 0			; apaga letra D
		
	inc cl				; anda a letra D uma coluna para a direita	
	dec ch				; anda a letra A uma coluna para a esquerda
	
	jmp VOLTA2

PULA2:
	
;-------------------------------------------------------------------------
	
	
; ----------- Escreve a palavra V E L H A subindo ------------------------

	xor si,si
	mov cl,24
	mov ch,36

VOLTA3:	MOV_CURSOR cl,ch

VOLTA4: MOSTRA_AV VELHA[si]		; mostra cada uma das letras da palavra VELHA
	inc si				; vai para a proxima letra
	cmp si,9			; verifica se chegou no final da palavra
	jb VOLTA4			; se nao, imprime proxima letra

	ESPERA 1			; espera 1 ciclo da int 08h (aprox 0,08 segundos)			

	cmp cl,14			; verifica se chegou na linha 14
	je PULA3			; se sim, nao apaga a palavra escrita
	MOV_CURSOR cl,ch		; se nao, move o cursor para o inicio da palavra
	MOSTRA_AT 0,1Eh,9		; e apaga a palavra

PULA3:	xor si,si
	dec cl				; sobe uma linha
	cmp cl,13			; verifica se palavra ja esta na linha 14
	ja VOLTA3			; se nao, imprime palavra uma linha acima

;---------------------------------------------------------------------------

	ESPERA 64			; espera 64 ciclos da int 08h (5 segundos)
	
	RESTAURA_REGS
	
	ret
	
abertura endp

C_SEG ends

end
