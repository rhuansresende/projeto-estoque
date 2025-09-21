@echo off
echo ================================
echo Iniciando sistema de estoque...
echo ================================

set ENV=prod
set BASE_PATH=D:\Documentos\Rhuan\AmbienteEstoque\Projetos

:: Lista de projetos para atualizar
set PROJECTS=estoque-backup estoque-service estoque-web projeto-estoque

echo.
echo Atualizando repositórios Git...

for %%P in (%PROJECTS%) do (
    echo ------------------------
    echo Atualizando projeto %%P
    cd /d %BASE_PATH%\%%P
    if exist .git (
        git pull
    ) else (
        echo [AVISO] %%P nao é um repositório Git
    )
)

echo.
echo Subindo containers para o ambiente: %ENV%
cd /d %BASE_PATH%\projeto-estoque
"C:\Program Files\Git\bin\bash.exe" --login -i "./start.sh" %ENV%

echo.
echo ================================
echo Fim do processo.
pause
