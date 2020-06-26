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

D_SEG segment byte common 'DATA'
	
	include CONFIG.INI
	       
	POS_COLUNA       dw ?
	POS_LINHA        dw ?
	POS_COLUNA_FIM   dw ?  
	POS_LINHA_FIM    dw ?	
	COLUNA_CLICADA   dw ?
	PLACAR           dw 9 dup (?)
	GANHADOR         dw ?
	DEU_VELHA	 dw ?

	TEXTO_AGUARDE   db ' * Aguardando o adversario jogar...         ','$'
	TEXTO_SUA_VEZ   db ' * Eh sua vez de jogar!                     ','$' 
	TEXTO_ERRO	db ' * Errado! Clique em uma regiao disponivel! ','$'
	TEXTO_TABULEIRO db ' * Errado! Clique dentro do tabuleiro!      ','$'
	TEXTO_GANHOU    db ' * PARABENS!!!! VOCE GANHOU!!! :)           ','$'
	TEXTO_PERDEU    db ' * VOCE PERDEU! QUE PENA!!!	 :(	      	','$'
	TEXTO_DEU_VELHA db ' * DEU VELHA!!! NINGUEM GANHOU! :P          ','$'
	TEXTO_FIM_JOGO	db ' ESC = Sair      F1 = Jogar Novamente	','$' 

	ARQUIVO1 db 'VELHA.BMP',0
	HANDLE1 dw ?
	BUFFER db 320 dup(0)  

      	ARQUIVO2 db 'X.BMP',0
	HANDLE2 dw ?
	X_BUF db 60 dup ( 60 dup (0) )

	ARQUIVO3 db 'O.BMP',0
	HANDLE3 dw ?
	O_BUF db 60 dup ( 60 dup (0) )
	
	JOGO db 'JOGO'
	VELHA db 'V E L H A'

D_SEG ends
