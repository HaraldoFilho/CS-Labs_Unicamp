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


title JOGO

.model small

public NOVO_JOGO
public VERIFICA_GANHADOR
public VERIFICA_PERDEDOR
public VERIFICA_VELHA

extrn INICIALIZAR_SERIAL:near

extrn abertura:near
extrn timer:near
extrn exibe_velha:near
extrn carrega_X_O:near

extrn LER_MOUSE:near
extrn ANALISA_CLIQUE:near

include STCK_SEG.ASM
include DATA_SEG.ASM

C_SEG segment byte public 'CODE'

assume cs:C_SEG,ds:D_SEG,ss:S_SEG

include MACROS.ASM   			; Inclui o arquivo de macros

MAIN proc

	mov ax,D_SEG	          	; Inicializa DS
	mov ds, ax	    

	cmp EXIBE_ABERTURA,0
	je PULA_ABERTURA
	
	call abertura   	  	; Abertura do Jogo

PULA_ABERTURA:
	
	call NOVO_JOGO			; Inicia novo jogo

MAIN endp

NOVO_JOGO proc near

	INICIALIZA_PLACAR
	
	call carrega_X_O		; carrega os bitmaps do X e do O para a memoria

    	call INICIALIZAR_SERIAL    	; inicializa comunicação serial
    	
    	MODO_VIDEO_GRAFICO 	        ; Macro para selecionar o modo de video     
    	
    	call DESENHAR_TABULEIRO   	; Desenha tabuleiro
    	
 	call LER_MOUSE  
    
NOVO_JOGO endp

;
; Desenha tabuleiro do jogo da velha
; 
DESENHAR_TABULEIRO proc near

        mov ah,0CH 			; escreve pixel
        mov al,6h

        mov cx,150 			; coluna inicial
        mov dx,150 			; linha   
    H1: int 10H    			; desenha linha
        inc cx
        cmp cx,450 			; escreve 300 pixels
        jle H1

        mov cx,150 			; coluna inicial
        mov dx,250 			; linha
    H2: int 10H    			; desenha linha
        inc cx
        cmp cx,450 			; escreve 300 pixels
        jle H2

        mov cx,250 			; coluna inicial
        mov dx,50 			; linha
    V1: int 10H    			; desenha linha
        inc dx
        cmp dx,350 			; escreve 300 pixels
        jle V1                

        mov cx,350 			; coluna inicial
        mov dx,50 			; linha
    V2: int 10H    			; desenha linha
        inc dx
        cmp dx,350 			; escreve 300 pixels
        jle V2     

	ret   
	 
DESENHAR_TABULEIRO endp

;
; Verifica se o jogador ativo ganhou!!
;
VERIFICA_GANHADOR proc near
	; verificando horizontal 1                
	cmp PLACAR[0],1
	jne CONTG1
	cmp PLACAR[2],1
	jne CONTG1
 	cmp PLACAR[4],1
	jne CONTG1
	mov GANHADOR,1
	mov dx,100 ; linha   
	call RISCA_H
   	MENSAGEM_GANHOU ; exibe mensagem de ganhador  
   	ret

CONTG1:	  
	; verificando horizontal 2
	cmp PLACAR[6],1
	jne CONTG2
  	cmp PLACAR[8],1
	jne CONTG2
 	cmp PLACAR[10],1
	jne CONTG2
	mov GANHADOR,1
	mov dx,200 ; linha   
	call RISCA_H
   	MENSAGEM_GANHOU ; exibe mensagem de ganhador  
   	ret

CONTG2:	            
	; verificando horizontal 3
	cmp PLACAR[12],1
	jne CONTG3
  	cmp PLACAR[14],1
	jne CONTG3
 	cmp PLACAR[16],1
	jne CONTG3
	mov GANHADOR,1
	mov dx,300 ; linha   
	call RISCA_H
   	MENSAGEM_GANHOU ; exibe mensagem de ganhador  
   	ret

CONTG3:	            
	; verificando vertical 1
	cmp PLACAR[0],1
	jne CONTG4
  	cmp PLACAR[6],1
	jne CONTG4
 	cmp PLACAR[12],1
	jne CONTG4
	mov GANHADOR,1
        mov cx,200 ; coluna inicial
	call RISCA_V
   	MENSAGEM_GANHOU ; exibe mensagem de ganhador  
   	ret

CONTG4:	            
	; verificando vertical 2
	cmp PLACAR[2],1
	jne CONTG5
  	cmp PLACAR[8],1
	jne CONTG5
 	cmp PLACAR[14],1
	jne CONTG5
	mov GANHADOR,1
        mov cx,300 ; coluna inicial
	call RISCA_V
   	MENSAGEM_GANHOU ; exibe mensagem de ganhador  
   	ret

CONTG5:	            
	; verificando vertical 2
	cmp PLACAR[4],1
	jne CONTG6
  	cmp PLACAR[10],1
	jne CONTG6
 	cmp PLACAR[16],1
	jne CONTG6
	mov GANHADOR,1
        mov cx,400 ; coluna inicial
	call RISCA_V
  	MENSAGEM_GANHOU ; exibe mensagem de ganhador  
   	ret

CONTG6:	            
	; verificando diagonal 1
	cmp PLACAR[0],1
	jne CONTG7
  	cmp PLACAR[8],1
	jne CONTG7
 	cmp PLACAR[16],1
	jne CONTG7
	mov GANHADOR,1
	call RISCA_DD
   	MENSAGEM_GANHOU ; exibe mensagem de ganhador  
   	ret

CONTG7:	            
	; verificando diagonal 2
	cmp PLACAR[4],1
	jne CONTG8
  	cmp PLACAR[8],1
	jne CONTG8
 	cmp PLACAR[12],1
	jne CONTG8
	mov GANHADOR,1
	call RISCA_DC
   	MENSAGEM_GANHOU ; exibe mensagem de ganhador  
   	ret
          
CONTG8:
	ret
VERIFICA_GANHADOR endp


;
; Verifica se jogador ativo perdeu!
;
VERIFICA_PERDEDOR proc near

	; verificando horizontal 1                
	cmp PLACAR[0],2
	jne CONTP1
  	cmp PLACAR[2],2
	jne CONTP1
 	cmp PLACAR[4],2
	jne CONTP1
	mov GANHADOR,2
	mov dx,100 ; linha   
	call RISCA_H
   	MENSAGEM_PERDEU ; exibe mensagem de ganhador  
   	ret

CONTP1:	  
	; verificando horizontal 2
	cmp PLACAR[6],2
	jne CONTP2
  	cmp PLACAR[8],2
	jne CONTP2
 	cmp PLACAR[10],2
	jne CONTP2
	mov GANHADOR,2
	mov dx,200 ; linha   
	call RISCA_H
   	MENSAGEM_PERDEU ; exibe mensagem de ganhador  
   	ret

CONTP2:	            
	; verificando horizontal 3
	cmp PLACAR[12],2
	jne CONTP3
  	cmp PLACAR[14],2
	jne CONTP3
 	cmp PLACAR[16],2
	jne CONTP3
	mov GANHADOR,2
	mov dx,300 ; linha   
	call RISCA_H
   	MENSAGEM_PERDEU ; exibe mensagem de ganhador  
   	ret

CONTP3:	            
	; verificando vertical 1
	cmp PLACAR[0],2
	jne CONTP4
  	cmp PLACAR[6],2
	jne CONTP4
 	cmp PLACAR[12],2
	jne CONTP4
	mov GANHADOR,2
	mov cx,200 ; linha   
	call RISCA_V
   	MENSAGEM_PERDEU ; exibe mensagem de ganhador  
   	ret

CONTP4:	            
	; verificando vertical 2
	cmp PLACAR[2],2
	jne CONTP5
  	cmp PLACAR[8],2
	jne CONTP5
 	cmp PLACAR[14],2
	jne CONTP5
	mov GANHADOR,2
	mov cx,300 ; linha   
	call RISCA_V
   	MENSAGEM_PERDEU ; exibe mensagem de ganhador  
   	ret

CONTP5:	            
	; verificando vertical 3
	cmp PLACAR[4],2
	jne CONTP6
  	cmp PLACAR[10],2
	jne CONTP6
 	cmp PLACAR[16],2
	jne CONTP6
	mov GANHADOR,2
	mov cx,400 ; linha   
	call RISCA_V
   	MENSAGEM_PERDEU ; exibe mensagem de ganhador  
   	ret   	  

CONTP6:	            
	; verificando diagonal 1
	cmp PLACAR[0],2
	jne CONTP7
  	cmp PLACAR[8],2
	jne CONTP7
 	cmp PLACAR[16],2
	jne CONTP7
	mov GANHADOR,2
	call RISCA_DD
   	MENSAGEM_PERDEU ; exibe mensagem de ganhador  
   	ret

CONTP7:	            
	; verificando diagonal 2
	cmp PLACAR[4],2
	jne CONTP8
  	cmp PLACAR[8],2
	jne CONTP8
 	cmp PLACAR[12],2
	jne CONTP8
	mov GANHADOR,2
	call RISCA_DC
   	MENSAGEM_PERDEU ; exibe mensagem de ganhador  
   	ret
          
CONTP8:
	ret

VERIFICA_PERDEDOR endp

;
; Verifica se deu velha!
;
VERIFICA_VELHA proc near

	; verificando horizontal 1                
	cmp PLACAR[0],0
	jz CONTV1
  	cmp PLACAR[2],0
	jz CONTV1
 	cmp PLACAR[4],0
	jz CONTV1
 	cmp PLACAR[6],0
	jz CONTV1
	cmp PLACAR[8],0
	jz CONTV1
 	cmp PLACAR[10],0
	jz CONTV1
	cmp PLACAR[12],0
	jz CONTV1
 	cmp PLACAR[14],0
	jz CONTV1
 	cmp PLACAR[16],0
	jz CONTV1
	
	mov DEU_VELHA,1	; Deu velha
        MENSAGEM_DEU_VELHA
	ESPERA 64
	call exibe_velha

	ret      
 
 ; AINDA TEM REGIAO DISPONIVEL 
 CONTV1:ret

VERIFICA_VELHA endp

RISCA_H proc near				; desenha risoco na horizontal

        DESABILITA_MOUSE
        
        mov ah,0CH 				; escreve pixel
        mov al,0Eh

        mov cx,150 				; coluna inicial
    RH: int 10H    				; desenha linha
        inc cx
        cmp cx,450 				; escreve 300 pixels
        jle RH
        
        HABILITA_MOUSE

	ret
	
RISCA_H endp

RISCA_V proc near				; desenha risco na vertical

	DESABILITA_MOUSE
	
        mov ah,0CH 				; escreve pixel
        mov al,0Eh

        mov dx,50 				; linha
    RV: int 10H    				; desenha linha
        inc dx
        cmp dx,350 				; escreve 300 pixels
        jle RV 
        
        HABILITA_MOUSE
        
        ret               

RISCA_V endp

RISCA_DC proc near				; desenha risco na diagonal crescente

	DESABILITA_MOUSE
	
       	mov ah,0CH  				; escreve pixel
       	mov al,0Eh
       	mov cx,150   				; coluna inicial
       	mov dx,350    				; linha           
RDD:   	int 10H    
       	inc cx
       	dec dx
       	cmp cx,450 				; escreve 300 pixels
       	jle RDD
       
       	HABILITA_MOUSE

       	ret
	
RISCA_DC endp

RISCA_DD proc near				; desenha risco na diagonal decrescente

	DESABILITA_MOUSE
	
       	mov ah,0CH  				; escreve pixel
       	mov al,0Eh
       	mov cx,150   				; coluna inicial
       	mov dx,50    				; linha   
RDC:   	int 10H    
       	inc cx
       	inc dx
       	cmp cx,450 				; escreve 300 pixels
       	jle RDC
       
       	HABILITA_MOUSE
       
       	ret     

RISCA_DD endp        

C_SEG ends

end