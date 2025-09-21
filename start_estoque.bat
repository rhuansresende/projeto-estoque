@echo off
echo ================================
echo Iniciando sistema de estoque...
echo ================================

:MENU
echo.
echo Selecione o ambiente:
echo 1. DEV
echo 2. HOM
echo 3. PROD
echo 4. Sair
set /p choice="Escolha uma opcao (1-4): "

if "%choice%"=="1" set ENV=dev
if "%choice%"=="2" set ENV=hom
if "%choice%"=="3" set ENV=prod
if "%choice%"=="4" goto :EOF

:: Verifica se a escolha é válida
if "%ENV%"=="" (
    echo Opcao invalida! Tente novamente.
    goto MENU
)

echo.
echo Subindo containers para o ambiente: %ENV%
"C:\Program Files\Git\bin\bash.exe" --login -i "D:\Documentos\Rhuan\AmbienteEstoque\Projetos\projeto-estoque\start.sh" %ENV%

echo.
echo ================================
echo Fim do processo.
