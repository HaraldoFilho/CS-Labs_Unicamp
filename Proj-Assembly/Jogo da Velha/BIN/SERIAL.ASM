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


title SERIAL

.model small

public INICIALIZAR_SERIAL
public ENVIAR
public RECEBER

extrn NOVO_JOGO:near
extrn LER_MOUSE:near
extrn desenha_X:near
extrn desenha_O:near
extrn VERIFICA_GANHADOR:near
extrn VERIFICA_PERDEDOR:near
extrn VERIFICA_VELHA:near

include STCK_SEG.ASM
include DATA_SEG.ASM

C_SEG segment byte public 'CODE'

assume cs:C_SEG,ds:D_SEG,ss:S_SEG

include MACROS.ASM		; inclui arquivo de macros

INICIALIZAR_SERIAL proc near    ;inicializa todas as variaveis e registrdores

        mov al,INI1             ;Habilita inicializacao de velocidade
        mov dx,LCR
        out dx,al

        mov dx,TR
        mov al,60H
        out dx,al               ;Seta velocidade para 1200 bauds

        mov dx,IER	        ; Desativa todos os tipos de interrupçoes
        mov al,00
        out dx,al

        mov al,INI2             ;inicializa paridade, bits e stop bit 8N1
        mov dx,LCR
        out dx,al

        mov al,INI3             ;habilita DTR e RTS
        mov dx,MCR
        out dx,al

        mov al,INI4             ;habilita Dados, THRE, LS, MSC
        mov dx,IER
        out dx,al
        ret

INICIALIZAR_SERIAL endp

; 
; Procedimento para receber os dados via serial
;
RECEBER proc near 
        mov dx,LSR
        in al,dx                ;Le o estado do registrador
        and al,1
        jz REC_SAIR

        mov dx,TR
        in al,dx                ;Le o caracter do anel
       
        cmp al,00
        jz B1
        cmp al,02
        jz B2              
        cmp al,04
        jz B3              
        cmp al,06
        jz B4
        cmp al,08
        jz B5
        cmp al,10
        jz B6              
        cmp al,12
        jz B7              
        cmp al,14
        jz B8    
        cmp al,16
        jz B9 
        ret	  ; Se nao for nenhuma das opçoes sai da funcao

B1: jmp B1_
B2: jmp B2_
B3: jmp B3_
B4: jmp B4_
B5: jmp B5_
B6: jmp B6_
B7: jmp B7_
B8: jmp B8_
B9: jmp B9_
        
REC_SAIR:   
	mov al,00
        add al,01
        ret        
             
B1_:              
        mov POS_COLUNA_FIM,230    ; Prepara para plotar apenas, valores padrao
        mov POS_COLUNA,170        ; Prepara para plotar, valores padrao
        mov POS_LINHA_FIM,130     ; Prepara para plotar apenas, valores padrao
        mov POS_LINHA,70
        jmp CONT
B2_:              
        mov POS_COLUNA_FIM,330    ; Prepara para plotar apenas, valores padrao
        mov POS_COLUNA,270        ; Prepara para plotar, valores padrao
        mov POS_LINHA_FIM,130     ; Prepara para plotar apenas, valores padrao
        mov POS_LINHA,70
        jmp CONT
B3_:              
        mov POS_COLUNA_FIM,430    ; Prepara para plotar apenas, valores padrao
        mov POS_COLUNA,370        ; Prepara para plotar, valores padrao
        mov POS_LINHA_FIM,130     ; Prepara para plotar apenas, valores padrao
        mov POS_LINHA,70
        jmp CONT
B4_:              
        mov POS_COLUNA_FIM,230    ; Prepara para plotar apenas, valores padrao
        mov POS_COLUNA,170        ; Prepara para plotar, valores padrao
        mov POS_LINHA_FIM,230     ; Prepara para plotar apenas, valores padrao
        mov POS_LINHA,170
        jmp CONT
B5_:              
        mov POS_COLUNA_FIM,330    ; Prepara para plotar apenas, valores padrao
        mov POS_COLUNA,270        ; Prepara para plotar, valores padrao
        mov POS_LINHA_FIM,230     ; Prepara para plotar apenas, valores padrao
        mov POS_LINHA,170
        jmp CONT
B6_:              
        mov POS_COLUNA_FIM,430    ; Prepara para plotar apenas, valores padrao
        mov POS_COLUNA,370        ; Prepara para plotar, valores padrao
        mov POS_LINHA_FIM,230     ; Prepara para plotar apenas, valores padrao
        mov POS_LINHA,170
        jmp CONT
B7_:              
        mov POS_COLUNA_FIM,230    ; Prepara para plotar apenas, valores padrao
        mov POS_COLUNA,170        ; Prepara para plotar, valores padrao
        mov POS_LINHA_FIM,330     ; Prepara para plotar apenas, valores padrao
        mov POS_LINHA,270
        jmp CONT
B8_:              
        mov POS_COLUNA_FIM,330    ; Prepara para plotar apenas, valores padrao
        mov POS_COLUNA,270        ; Prepara para plotar, valores padrao
        mov POS_LINHA_FIM,330     ; Prepara para plotar apenas, valores padrao
        mov POS_LINHA,270
        jmp CONT                        
B9_:              
        mov POS_COLUNA_FIM,430    ; Prepara para plotar apenas, valores padrao
        mov POS_COLUNA,370        ; Prepara para plotar, valores padrao
        mov POS_LINHA_FIM,330     ; Prepara para plotar apenas, valores padrao
        mov POS_LINHA,270
        jmp CONT                
CONT:        
        mov ah,0                  ; zera bit alto!
        mov si,ax                 ; Indice Auxiliar
        mov PLACAR[si],02h        ; Marca como selecionado!
        
	cmp JOGADOR,1
      	je DES_X

	call desenha_O
      	jmp VER_PER

DES_X:	call desenha_X
        
VER_PER:call VERIFICA_PERDEDOR    ; verifica se perdeu com a jogada recebida!
        cmp  GANHADOR,2           ; verifica se o outro ganhou, se a funcao anterior setou 2!                
        je RECF

        call VERIFICA_VELHA    	  ; verifica se perdeu com a jogada recebida!
        cmp  DEU_VELHA,1          ; verifica se o outro ganhou, se a funcao anterior setou 2!                
        je RECF 

        mov VEZ_DO_JOGADOR,0      ; Definindo que eh a vez de quem recebeu a jogada do outro!
	MENSAGEM_SUA_VEZ  
    	call LER_MOUSE
        ret
 ;
 ; Para o jogo e espera o usuario teclar ESC!
 ; 
 RECF:  DESABILITA_MOUSE
 	
 	mov ah,0h
	int 16h
    	
	cmp ah,01h		; verifica se foi pressionada a tecla ESC
	je SAIRR					

	cmp ah,3Bh		; verifica se foi pressionada a tecla F1
	jne RECF 		
	
	call NOVO_JOGO
	
 SAIRR: ENCERRA_PROGRAMA

RECEBER endp

;
; Enviando jogo!
;
ENVIAR proc near                ;procedimento para enviar dados pela porta
                                ;serial, ao outro computador
 
; Envie SI da jogada normalmente                         
ENV1:   mov dx,LSR
        in al,dx                ; verifica se pode ser mandado o caracter
        and al,01000000B
        jz ENV1                 ; nao pode ser enviado, tenta de novo
        nop
        mov ax,si               ; recupera o tamanho do indice para ser enviado
        mov dx,TR
        out dx,ax

     	call VERIFICA_GANHADOR  ; verifica se o usuario ativo ganhou!
        cmp GANHADOR,1	     	; verifica se a funcao anterior setou o ganhador!
     	je ENVF			        ; Se ganhou, nao envia mensagem de AGUARDE! e ja sai da funcao!

        call VERIFICA_VELHA    	; verifica se perdeu com a jogada recebida!
        cmp  DEU_VELHA,1       	; verifica se o outro ganhou, se a funcao anterior setou 2!                
        je ENVF

        mov VEZ_DO_JOGADOR,1    ; Definindo que eh a vez do outro jogador, pois acabamos de enviar a jogada!      
        MENSAGEM_AGUARDE       	; Exibe mensagem solicitando que Aguarde!
        ret
;
; Para o jogo e espera o usuario teclar ESC!
;
ENVF:	DESABILITA_MOUSE
	
	mov ah,0h
	int 16h
    	
	cmp ah,01h		; verifica se foi pressionada a tecla ESC
	je SAIRE					

	cmp ah,3Bh		; verifica se foi pressionada a tecla F1
	jne ENVF 		
	
	call NOVO_JOGO
    	                
SAIRE: ENCERRA_PROGRAMA   

ENVIAR endp

C_SEG ends

end
