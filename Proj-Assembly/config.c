#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <conio.h>

int main()
{
     FILE* cfg;
     char opcao;
     
     
do
{
     cfg = fopen("config.ini","w");  

     system("cls");
     
     printf("################# UTILITARIO DE CONFIGURACAO DO JOGO DA VELHA ################\n");  

     do
     {
          printf("\n\nExibe ABERTURA ? ( S / N ) : ");
          opcao = getch();
          if((opcao=='S')||(opcao=='s'))
          {
               printf("SIM");
               fprintf(cfg,"EXIBE_ABERTURA dw 1	; 0 = NAO , 1 = SIM\n");
          }
          if((opcao=='N')||(opcao=='n')) 
          {
               printf("NAO");
               fprintf(cfg,"EXIBE_ABERTURA dw 0	; 0 = NAO , 1 = SIM\n");
          }
     }while((opcao!='S')&&(opcao!='s')&&(opcao!='N')&&(opcao!='n'));
     
     do
     {
          printf("\n\nQual sera o JOGADOR deste computador ? ( X / O ) : ");
          opcao = getch();   
          if((opcao=='X')||(opcao=='x')) 
          {
               printf("X");
               fprintf(cfg,"JOGADOR	       dw 0	; 0 = X , 1 = O\n");
          }
          if((opcao=='O')||(opcao=='o')) 
          {
               printf("O");
               fprintf(cfg,"JOGADOR	       dw 1	; 0 = X , 1 = O\n");
          }
     }while((opcao!='X')&&(opcao!='x')&&(opcao!='O')&&(opcao!='o'));
     
     do
     {
          printf("\n\nCOMECA jogando ou ESPERA ? ( C / E ) : ");
          opcao = getch();     
          if((opcao=='C')||(opcao=='c')) 
          {
               printf("COMECA");
               fprintf(cfg,"VEZ_DO_JOGADOR dw 0     ; 0 = começa jogando , 1 = espera o outro!\n\n");
          }
          if((opcao=='E')||(opcao=='e')) 
          {
               printf("ESPERA");
               fprintf(cfg,"VEZ_DO_JOGADOR dw 1     ; 0 = começa jogando , 1 = espera o outro!\n\n");
          }
     }while((opcao!='C')&&(opcao!='c')&&(opcao!='E')&&(opcao!='e'));

     do
     {
          printf("\n\nQual PORTA esta sendo utilizada neste computador ? ( 1 = COM1 / 2 = COM2 ) : ");
          opcao = getch();   
          if(opcao=='1')
          {
               printf("COM1\n\n\n");
               fprintf(cfg,"TR  equ 3F8H		; Receive/Transmit data register. Also the L.O. byte of the Baud Rate Divisor\n");
               fprintf(cfg,"IER equ 3F9H		; Interrupt Enable Register. Also the H.O. byte of the Baud Rate Divisor\n");
               fprintf(cfg,"IIR equ 3FAH		; Interrupt Identification Register (read only).\n");
               fprintf(cfg,"LCR equ 3FBH		; Line Control Register. \n");
               fprintf(cfg,"MCR equ 3FCH		; Modem Control Register.\n");
               fprintf(cfg,"LSR equ 3FDH		; Line Status Register (read only).\n");
               fprintf(cfg,"MSR equ 3FEH		; Modem Status Register (read only). \n");
               fprintf(cfg,"SPR equ 3FFH		; Shadow Receive Register (read only, not available on original PCs).\n\n");               
          }
          if(opcao=='2')
          {
               printf("COM2\n\n\n");
               fprintf(cfg,"TR  equ 2F8H		; Receive/Transmit data register. Also the L.O. byte of the Baud Rate Divisor\n");
               fprintf(cfg,"IER equ 2F9H		; Interrupt Enable Register. Also the H.O. byte of the Baud Rate Divisor\n");
               fprintf(cfg,"IIR equ 2FAH		; Interrupt Identification Register (read only).\n");
               fprintf(cfg,"LCR equ 2FBH		; Line Control Register. \n");
               fprintf(cfg,"MCR equ 2FCH		; Modem Control Register.\n");
               fprintf(cfg,"LSR equ 2FDH		; Line Status Register (read only).\n");
               fprintf(cfg,"MSR equ 2FEH		; Modem Status Register (read only). \n");
               fprintf(cfg,"SPR equ 2FFH		; Shadow Receive Register (read only, not available on original PCs).\n\n");               
          }
     }while((opcao!='1')&&(opcao!='2'));
     
     
     fprintf(cfg,"INI1 equ 10000011b      ;inicializa LCR\n");
     fprintf(cfg,"INI2 equ 00000011b      ;inicializa LCR\n");
     fprintf(cfg,"INI3 equ 00000011b      ;inicializa MCR\n");
     fprintf(cfg,"INI4 equ 00001111b      ;inicializa IER\n");
          
     fclose(cfg);

     printf("CONFIRMA A CONFIGURACAO ACIMA ? ( S / N ) : ");
     
     do{ opcao = getch(); }while((opcao!='S')&&(opcao!='s')&&(opcao!='N')&&(opcao!='n'));   
     
}while((opcao!='S')&&(opcao!='s'));

if((opcao=='S')||(opcao=='s')) printf("SIM\n\n");
if((opcao=='N')||(opcao=='n')) printf("NAO\n\n"); 
     
return 0;

}

     
     

          
