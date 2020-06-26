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


; MACROS DE VIDEO:

SEL_VIDEO macro modo			; macro para selecionar modo de video
	mov al,modo
	mov ah,0h
	int 10h
endm

VER_VIDEO macro				; macro para verificar qual o modo de video
	mov ah,0Fh
	int 10h
endm

LIMPA_TELA macro L1,C1,L2,C2,COR	; macro para limpar a tela
	push cx
	mov dh,L1			; dh = L1
	mov cx,C2			; cx = C2
	sub cx,C1			; cx = C2 - C1
	add cx,1			; cx = (C2-C1)+1 = numero de colunas que serao limpas
	mov al,0			; al = caracter nulo (limpa)
	mov bl,COR			; bl = cor do caracter
NL:	MOV_CURSOR dh,C1		; movimenta cursor para linha,C1
	mov ah,9h			; 
	int 10h				; limpa linha
	inc dh				; avanca uma linha
	cmp dh,L2			; verifica se ja limpou L2
	jbe NL				; se nao, limpa outra
	MOV_CURSOR 0,0			
	pop cx
endm

TAM_CURSOR macro tam			; macro para alterar o tamanho do cursor
	push cx
	mov cl,0
	mov ch,tam
	mov ah,1h
	int 10h
	pop cx
endm

MOV_CURSOR macro lin,col		; macro para mover o cursor
	mov dh,lin
	mov dl,col
	mov ah,2h
	int 10h
endm

POS_CURSOR macro			; macro para pegar a posicao do cursor
	mov ah,3h
	int 10h
endm

SEL_PAGINA macro pag			; macro para selecionar a pagina
	mov al,pag
	mov bh,al
	mov ah,5h
	int 10h
endm

LECAR macro				; macro para ler um caracter sobre o cursor
	mov ah,8h
	int 10h
endm

MOSTRA macro car			; macro para mostrar um caracter sobre o cursor com atributo corrente
	push cx
	mov cx,1
	mov al,car
	mov ah,0Ah
	int 10h
	pop cx
endm

MOSTRA_AV macro car			; macro para mostrar um caracter sobre o cursor com atributo corrente e avancar uma posicao
	push cx
	mov cx,1
	mov al,car
	mov ah,0Eh
	int 10h
	pop cx
endm

MOSTRA_AT macro car,atr,n		; macro para mostrar um caracter sobre o cursor com atributo
	push cx
	mov cx,n
	mov ah,9h
	mov al,car
	mov bl,atr
	int 10h
	pop cx
endm


; MACROS DE MOUSE:

HABILITA_MOUSE macro
    	mov ax,01h         		; habilita o mouse
    	int 33h
endm

DESABILITA_MOUSE macro
	mov ax,02h     	   		; desabilita o mouse
       	int 33h  
endm

MONITORA_MOUSE macro
	mov ax,06h	   		; Funcao para monitorar mouse
	mov bx,00h         		; O interesse eh no botao ESQUERDO
 	int 33h		   		; retorna em CX coordenada horizontal e DX a vertical, BX 
endm

	
; MACROS GERAIS:

ESPERA macro ciclos			; macro para fazer o programa esperar um determinado numero de ciclos da int 08h
	SALVA_REGS
	mov ch,ciclos
	call timer
	RESTAURA_REGS	
endm

SALVA_REGS macro			; macro para salvar conteudo dos registradores na pilha
 	push si 			
	push ds
	push dx
	push cx
	push bx
	push ax
endm

RESTAURA_REGS macro			; macro para restaurar conteudo dos registradores da pilha
	pop ax
	pop bx
	pop cx
	pop dx
	pop ds
	pop si
endm

ENCERRA macro				; macro para encerrar o programa e retornar ao S.O.
	mov ah,4Ch
	int 21h
endm


;----------------------------------------------------------------------------------------------;


;
; Macro para limpar a tela e escolher o modo de video
;
MODO_VIDEO_GRAFICO macro
	mov ah,0h	   		; Funcao para selecionar o modo de video
	mov al,12h	   		; Modo 12h: 640x480 e 16 cores VGA
	int 10h		   		; Chamada da interrupcao

	mov ah,02h	   		; Funcao para mover o cursor
	mov dh,0d	  	        ; Mover para linha 0
	mov dl,0d	   		; Mover para coluna 0
	int 10h		   		; Chamada da interrupcao
endm


INICIALIZA_PLACAR macro			; Funcao para inicializar o placar de um novo jogo
	xor si,si
	
ZERA:	mov PLACAR[si],0		; Coloca 0 em todas as posicoes de memoria do placar
	inc si
	cmp si,18
	jb ZERA
		
	mov GANHADOR,0
	mov DEU_VELHA,0
endm


ENCERRA_PROGRAMA macro
    DESABILITA_MOUSE

    mov ah,02h	   	    		; Funcao para mover o cursor
    mov dh,24d	   			; Mover para linha 24
    int 10h	       			; Chamada da interrupcao

    mov ax,3H     			; Volta ao modo 3
    int 10h   
  
    mov al,27
    out dx,al   
    
    mov ah, 4CH       			; Registrador de chamada Funcao 4CH do DOS (EXIT)            
    int 21H    	   			; Interrupcao
endm


EXIBE_TECLA macro
    cmp dl,79d	   			; Compara se eh o inicio da Linha
    jz LER		   		; Volta para LER, atingiu o limite
    mov ah,09h	   			; FUncao para exibir caracteres
    int 10h
    mov ah,02h	   			; Funcao para mover o cursor
    inc dl		   		; MOve o ponteiro para a proxima posicao
    int 10h		   		; Chamada da interrupcao
    jmp LER	   	   		; Continua Lendo
endm

MENSAGEM_AGUARDE macro
         DESABILITA_MOUSE

	; Posiciona o cursor
         mov ah,02H  			; seta cursor
         mov bh,00h  			; Modo grafico
         mov dh,00h  			; Linha 0
         mov dl,100  			; coluna 100
         int 10h

	; Exibe mensagem
         mov ah,09H  		 	; funcao para imprimir string
         lea dx,TEXTO_AGUARDE 		; offset da mensagem
         mov bl,6h               	; foreground
         int 21h		 	; interrupcao para exibir mensagem        
endm

MENSAGEM_SUA_VEZ macro
	; Posiciona o cursor
         mov ah,02H  			; seta cursor
         mov bh,00h  			; Modo grafico
         mov dh,00h  			; Linha 0
         mov dl,100  			; coluna 100
         int 10h

	; Exibe mensagem
         mov ah,09H  		 	; funcao para imprimir string
         lea dx,TEXTO_SUA_VEZ 		; offset da mensagem
         mov bl,6h               	; foreground
         int 21h		 	; interrupcao para exibir mensagem

	 HABILITA_MOUSE
endm

MENSAGEM_ERRO macro
	; Posiciona o cursor
         mov ah,02H  			; seta cursor
         mov bh,00h  			; Modo grafico
         mov dh,00h  			; Linha 0
         mov dl,100  			; coluna 100
         int 10h

	; Exibe mensagem
         mov ah,09H  		 	; funcao para imprimir string
         lea dx,TEXTO_ERRO	 	; offset da mensagem
         mov bl,6h               	; foreground
         int 21h		 	; interrupcao para exibir mensagem
endm


MENSAGEM_TABULEIRO macro
	; Posiciona o cursor
         mov ah,02H  			; seta cursor
         mov bh,00h  			; Modo grafico
         mov dh,00h  			; Linha 0
         mov dl,100  			; coluna 100
         int 10h

	; Exibe mensagem
         mov ah,09H  		 	; funcao para imprimir string
         lea dx,TEXTO_TABULEIRO  	; offset da mensagem
         mov bl,6h               	; foreground
         int 21h		 	; interrupcao para exibir mensagem
endm

MENSAGEM_FIM_DE_JOGO macro
	; Posiciona o cursor
         mov ah,02H  			; seta cursor
         mov bh,00h  			; Modo grafico
         mov dh,28  			; Linha 0
         mov dl,100  			; coluna 100
         int 10h

	; Exibe mensagem
         mov ah,09H  		 	; funcao para imprimir string
         lea dx,TEXTO_FIM_JOGO   	; offset da mensagem
         mov bl,6h               	; foreground
         int 21h			; interrupcao para exibir mensagem
endm

MENSAGEM_GANHOU macro
	; Posiciona o cursor
         mov ah,02H  			; seta cursor
         mov bh,00h  			; Modo grafico
         mov dh,00h  			; Linha 0
         mov dl,100  			; coluna 100
         int 10h

	; Exibe mensagem
         mov ah,09H  		 	; funcao para imprimir string
         lea dx,TEXTO_GANHOU     	; offset da mensagem
         mov bl,6h               	; foreground
         int 21h		 	; interrupcao para exibir mensagem
         MENSAGEM_FIM_DE_JOGO
endm

MENSAGEM_PERDEU macro
	; Posiciona o cursor
         mov ah,02H  			; seta cursor
         mov bh,00h  			; Modo grafico
         mov dh,00h  			; Linha 0
         mov dl,100  			; coluna 100
         int 10h

	; Exibe mensagem
         mov ah,09H  		 	; funcao para imprimir string
         lea dx,TEXTO_PERDEU     	; offset da mensagem
         mov bl,6h               	; foreground
         int 21h		 	; interrupcao para exibir mensagem
         MENSAGEM_FIM_DE_JOGO
endm


MENSAGEM_DEU_VELHA macro
	; Posiciona o cursor
         mov ah,02H  			; seta cursor
         mov bh,00h 			; Modo grafico
         mov dh,00h  			; Linha 0
         mov dl,100  			; coluna 100
         int 10h

	; Exibe mensagem
         mov ah,09H  		 	; funcao para imprimir string
         lea dx,TEXTO_DEU_VELHA    	; offset da mensagem
         mov bl,6h               	; foreground
         int 21h		 	; interrupcao para exibir mensagem
         MENSAGEM_FIM_DE_JOGO
endm
