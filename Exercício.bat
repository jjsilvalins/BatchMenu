echo off
set desktop=C:\Users\%username%\desktop

net session >nul 2>&1
if %errorLevel% == 0 (
	echo exemplo > "%desktop%\exemplo.txt"
	echo Arquivo de exemplo Criado: %desktop%\exemplo.txt
	GOTO MENU
) else (
	echo.
	echo AVISO: Execute o script como administrador
	echo.
)
pause

:FILE
cls
echo exemplo > "%desktop%\exemplo.txt"
echo Arquivo de exemplo Criado: %desktop%\exemplo.txt
pause
goto menu

:MENU
echo ==================================
echo                MENU
echo ==================================
echo  0. Recriar arquivo de exemplo    
echo  1. Fazer Backup                
echo  2. Excluir um arquivo          
echo  3. Abrir painel de controle
echo  4. Sair                    
echo ==================================

SET /P M=Escolha um dos valores acima:
IF %M% equ 0 GOTO FILE
IF %M% equ 1 GOTO BACKUP
IF %M% equ 2 GOTO EXCLUIR
IF %M% equ 3 GOTO PAINEL
IF %M% equ 4 exit
IF %M% GEQ 5 GOTO INVALIDA

:INVALIDA
cls 
echo ==============================================
echo * Opcao Invalida! Escolha outra opcao do menu *
echo ==============================================
pause
cls
goto MENU

:BACKUP
cls
echo ==================================
echo *             BACKUP             *
echo ==================================
md "%desktop%\BackupScript"
SET /P pathFile=Diretorio (absoluto) do arquivo: 
IF EXIST "%pathFile%" ( 	
	echo Arquivo salvo em: "%desktop%\BackupScript"              
	xcopy "%pathFile%" "%desktop%\BackupScript" /Y
) ELSE (
	echo AVISO: Arquivo nao existe!
)
pause
cls
goto menu

:EXCLUIR
cls
echo ==================================
echo *        Deletar arquivo         *
echo ==================================
SET /P pathFile=Diretorio (absoluto) do arquivo: 
IF EXIST "%pathFile%" ( 
	echo Arquivo deletado com sucesso: %pathFile%              
	del "%pathFile%"
) ELSE (
	echo AVISO: Arquivo nao existe!
)
pause
cls
goto MENU

:PAINEL
cls
echo ==================================
echo *   Painel de controle aberto!   *
echo ==================================
start control.exe
pause
cls
goto MENU


