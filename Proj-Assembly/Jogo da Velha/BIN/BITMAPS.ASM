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

title BITMAPS

.model small

public carrega_X_O
public desenha_X
public desenha_O

extrn timer:near
extrn ENVIAR:near
extrn RECEBER:near

include STCK_SEG.ASM
include DATA_SEG.ASM

C_SEG segment byte public 'CODE'

assume cs:C_SEG,ds:D_SEG,ss:S_SEG

include MACROS.ASM		; inclui arquivo de macros

carrega_X_O proc near

	SALVA_REGS

	mov ah,3Dh 		; funcao para abertura de arquivo ja existente
	lea dx,ARQUIVO2
	mov cl,0		; atributo de leitura apenas
	int 21h
	mov HANDLE2,ax 		; salva o handle ou o código de erro na memoria

	mov ah,3Fh		; funcao para leitura de bytes no arquivo
	mov bx,HANDLE2 		; handle do arquivo a ser lido
	mov cx,3600		; quantidade de bytes a serem lidos
	lea dx,X_BUF		; carrega em X_BUF o desenho de X
	int 21h
	mov ah,3Eh		; funcao para fechamento de arquivo aberto
	mov bx,HANDLE2 		; obtem o handle armazenado
	int 21h


	mov ah,3Dh 		; funcao para abertura de arquivo ja existente
	lea dx,ARQUIVO3
	mov cl,0		; atributo de leitura apenas
	int 21h
	mov HANDLE3,ax 		; salva o handle ou o código de erro na memoria

	mov ah,3Fh		; funcao para leitura de bytes no arquivo
	mov bx,HANDLE3 		; handle do arquivo a ser lido
	mov cx,3600		; quantidade de bytes a serem lidos
	lea dx,O_BUF		; carrega em O_BUF o desenho de O
	int 21h

	mov ah,3Eh		; funcao para fechamento de arquivo aberto
	mov bx,HANDLE3 		; obtem o handle armazenado
	int 21h
	
	RESTAURA_REGS
	
	ret
	
carrega_X_O endp


desenha_X proc near

	DESABILITA_MOUSE
	
	SALVA_REGS

	xor si,si

	mov ah,0Ch		; funcao de escrita de pixel na tela

	mov dx,POS_LINHA		
VOLTA1:	mov cx,POS_COLUNA
VOLTA2:	mov al,X_BUF[si]	; valor do pixel a ser escrito
	int 10H			; escreve pixel
	inc cx			; incrementa uma coluna
	inc si			
	cmp cx,POS_COLUNA_FIM	; verifica se uma linha inteira foi impressa
	jb VOLTA2		; se nao, escreve outra coluna
	inc dx			; se sim, vai para a proxima linha
	cmp dx,POS_LINHA_FIM	; verifica se ja atingiu a ultima linha
	jb VOLTA1		; se nao, imprime outra linha
			
	RESTAURA_REGS

	cmp JOGADOR,0		; verifica se e o jogador X
      	jne FIM_X		; se nao, nao envia jogada
        
        call ENVIAR             ; se sim, envia jogada para o outro!     
        
FIM_X:  HABILITA_MOUSE

	ret

desenha_X endp

desenha_O proc near

       	DESABILITA_MOUSE

	SALVA_REGS
       	
	xor si,si

	mov ah,0Ch		; funcao de escrita de pixel na tela

	mov dx,POS_LINHA		
VOLTA3:	mov cx,POS_COLUNA
VOLTA4:	mov al,O_BUF[si]	; valor do pixel a ser escrito
	int 10H			; escreve pixel
	inc cx			; incrementa uma coluna
	inc si			
	cmp cx,POS_COLUNA_FIM	; verifica se uma linha inteira foi impressa
	jb VOLTA4		; se nao, escreve outra coluna
	inc dx			; se sim, vai para a proxima linha
	cmp dx,POS_LINHA_FIM	; verifica se ja atingiu a ultima linha
	jb VOLTA3		; se nao, imprime outra linha
			
	RESTAURA_REGS

	cmp JOGADOR,1		; verifica se e o jogador O
      	jne FIM_O		; se nao, nao envia jogada
        
        call ENVIAR             ; se sim, envia jogada para o outro!    
        
FIM_O:  HABILITA_MOUSE          

	ret

desenha_O endp


C_SEG ends

end
