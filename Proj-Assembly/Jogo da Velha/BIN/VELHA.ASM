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


title IMPRIME IMAGEM DA VELHA

.model small

public exibe_velha

extrn timer:near

include STCK_SEG.ASM
include DATA_SEG.ASM

C_SEG segment byte public 'CODE'

assume cs:C_SEG,ds:D_SEG,ss:S_SEG

include MACROS.ASM		; inclui arquivo de macros

exibe_velha proc near
	
	mov ah,3Dh 		; funcao para abertura de arquivo ja existente
	lea dx,ARQUIVO1
	mov cl,0		; atributo de leitura apenas
	int 21h
	mov HANDLE1,ax 		; salva o handle ou o código de erro na memoria
	
	SEL_VIDEO 13h		; seleciona modo grafico 320x200 256 cores
	
	xor dx,dx		
VOLTA1:	xor cx,cx
	xor si,si
	SALVA_REGS
	mov ah,3Fh		; funcao para leitura de bytes no arquivo
	mov bx,HANDLE1 		; handle do arquivo a ser lido
	mov cx,320		; quantidade de bytes a serem lidos
	lea dx,BUFFER		; carrega em buffer uma linha de imagem
	int 21h
	RESTAURA_REGS

	mov ah,0Ch		; funcao de escrita de pixel na tela
VOLTA2:	mov al,BUFFER[si]	; valor do pixel a ser escrito
	int 10H			; escreve pixel
	inc cx			; incrementa uma coluna
	inc si			
	cmp cx,320		; verifica se uma linha inteira foi impressa
	jb VOLTA2		; se nao, escreve outra coluna
	inc dx			; se sim, vai para a proxima linha
	cmp dx,200		; verifica se ja atingiu a ultima linha
	jb VOLTA1		; se nao, imprime outra linha

	mov ah,3Eh		; funcao para fechamento de arquivo aberto
	mov bx,HANDLE1 		; obtem o handle armazenado
	int 21h
	
	ESPERA 128
	
	SEL_VIDEO 12h
	
	MENSAGEM_DEU_VELHA
				
	ret

exibe_velha endp

C_SEG ends

end
