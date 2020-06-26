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


title MOUSE

.model small

public LER_MOUSE
public ANALISA_CLIQUE

extrn RECEBER:near

extrn desenha_X:near
extrn desenha_O:near

include STCK_SEG.ASM
include DATA_SEG.ASM

C_SEG segment byte public 'CODE'

assume cs:C_SEG,ds:D_SEG,ss:S_SEG

include MACROS.ASM			; inclui arquivo de macros

LER_MOUSE proc near
	cmp VEZ_DO_JOGADOR,0    	; Verifica se é a vez do jogador
	jne LER				; Condicao para o caso inicial, se o jogador comeca joga deve ser exibida a mensagem!
 	MENSAGEM_SUA_VEZ		; 

LER:   	mov ah,0BH           		; Fica monitorando uma posicao TECLA de comando (ex. ESC)
    	int 21H                 
    	cmp al,0FFH
    	je TESTA_TECLA          	; Verifica se a tecla digitada eh ESC

    	cmp VEZ_DO_JOGADOR,0    	; Verifica se é a vez do jogador 
    	jnz ESPERAR_OUTRO_JOGAR 	; Se for diferente de zero eh a vez do outro

	HABILITA_MOUSE  
	
	MONITORA_MOUSE

	cmp bx,01h	   		; Qntos cliques?
	jge ANALISA
	jmp LER
	
ESPERAR_OUTRO_JOGAR:  			; Recebe a jogada via serial do outro jogador!
     	MENSAGEM_AGUARDE
     	call RECEBER    		; Verifica se há algo para ser recebido!
     	jz SAIR         		; Dependendo do retorno poderá sair, por exemplo se o outro sair, encerra tbm!
	
   	jmp LER

ANALISA:call ANALISA_CLIQUE
   	jmp LER


TESTA_TECLA: 
    	mov ah,07h               	; le caracter digitado sem apresentar na tela
    	int 21H  
    	cmp al,27d               	; Se for ESC encerra !
    	je SAIR
    	jmp LER

SAIR: 	ENCERRA_PROGRAMA

LER_MOUSE endp


;
; Analisa situacao da clicada
;

ANALISA_CLIQUE proc
     	cmp cx, 150
     	jl FORA_TABULEIRO                
     	cmp cx, 250
     	jl C1
     	cmp cx, 350
     	jl C2
     	cmp cx, 450
     	jl C3  
     	jmp FORA_TABULEIRO

  C1:
     	mov COLUNA_CLICADA,0            ; Jogador 1 clicou em alguma linha da coluna 1
     	mov POS_COLUNA_FIM,230
     	mov POS_COLUNA,170
     	cmp dx,50
     	jl FORA_TABULEIRO
     	cmp dx,150
     	jl L1
     	cmp dx,250
     	jl L2
     	cmp dx,350
     	jl L3 
     	jmp FORA_TABULEIRO
 
FORA_TABULEIRO:  
	MENSAGEM_TABULEIRO	
	jmp LER
 
  C2:
     	mov COLUNA_CLICADA,2 
     	mov POS_COLUNA_FIM,330;
     	mov POS_COLUNA,270;
     	cmp dx,50
     	jl FORA_TABULEIRO
     	cmp dx,150
     	jl L1
     	cmp dx,250
     	jl L2
     	cmp dx,350
     	jl L3            
     	jmp FORA_TABULEIRO
     
       
  C3:
     	mov COLUNA_CLICADA,4       
     	mov POS_COLUNA_FIM,430;
     	mov POS_COLUNA,370;
     	cmp dx,50
     	jl FORA_TABULEIRO
     	cmp dx,150
     	jl L1
     	cmp dx,250
     	jl L2
     	cmp dx,350
     	jl L3  
     	jmp FORA_TABULEIRO
  
    
  L1: 	jmp L1_DESENHA               	; Clique ocorreu na LINHA 1!   
  L2: 	jmp L2_DESENHA               	; Clique ocorreu na LINHA 2!   
  L3: 	jmp L3_DESENHA               	; Clique ocorreu na LINHA 3!   
	
 L1_DESENHA:
      	mov si,COLUNA_CLICADA       	; Indice Auxiliar
      	cmp PLACAR[si],01h          	; Verifica se ja foi escolhido
      	jge POS_OCUPADA         
      	mov PLACAR[si],01h          	; Marca como selecionado!
      	mov POS_LINHA,70
      	mov POS_LINHA_FIM,130
	jmp VER_JOG

 L2_DESENHA:
      	mov si,COLUNA_CLICADA       	; Indice Auxiliar
      	add si,6;
      	cmp PLACAR[si],01h          	; Verifica se ja foi escolhido
      	jge POS_OCUPADA        
      	mov PLACAR[si],01h          	; Marca como selecionado!
      	mov POS_LINHA,170
      	mov POS_LINHA_FIM,230
      	jmp VER_JOG
      
 L3_DESENHA:
      	mov si,COLUNA_CLICADA       	; Indice Auxiliar
      	add si,12;
      	cmp PLACAR[si],01h          	; Verifica se ja foi escolhido
      	jge POS_OCUPADA         
      	mov PLACAR[si],01h          	; Marca como selecionado!
      	mov POS_LINHA,270
      	mov POS_LINHA_FIM,330
      	
VER_JOG:cmp JOGADOR,1
      	je DES_O

	call desenha_X
      	ret

DES_O:	call desenha_O
	ret

;
; Mensagem que informa que o clique foi efetuado em regiao ja ocupada ou fora do tabuleiro
;
POS_OCUPADA: 
	MENSAGEM_ERRO             
	jmp LER;

endp ANALISA_CLIQUE

C_SEG ends

end
