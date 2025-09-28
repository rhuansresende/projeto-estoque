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

set BASE_PATH=D:\Documentos\Rhuan\AmbienteEstoque\Projetos

echo.
echo Atualizando repositorios Git...

:: Estoque Backup
cd /d %BASE_PATH%\estoque-backup
if exist .git (
  echo Atualizando Estoque Backup...
  git pull
) else (
  echo [AVISO] estoque-backup nao é um repositório Git
)

:: Estoque Service
cd /d %BASE_PATH%\estoque-service
if exist .git (
  echo Atualizando Estoque Service...
  git pull
) else (
  echo [AVISO] estoque-service nao é um repositório Git
)

:: Estoque WEB
cd /d %BASE_PATH%\estoque-web
if exist .git (
  echo Atualizando Estoque WEB...
  git pull
) else (
  echo [AVISO] estoque-web nao é um repositório Git
)

:: Projeto Estoque
cd /d %BASE_PATH%\projeto-estoque
if exist .git (
  echo Atualizando Projeto Estoque...
  git pull
) else (
  echo [AVISO] projeto-estoque nao é um repositório Git
)

echo.
echo Subindo containers para o ambiente: %ENV%
"C:\Program Files\Git\bin\bash.exe" --login -i "%BASE_PATH%\projeto-estoque\start.sh" %ENV%

echo.
echo ================================
echo Fim do processo.
