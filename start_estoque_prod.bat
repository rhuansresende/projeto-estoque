@echo off
echo ================================
echo Iniciando sistema de estoque...
echo ================================

set ENV=prod
cd /d "D:\Documentos\Rhuan\AmbienteEstoque\Projetos\projeto-estoque"

echo.
echo Subindo containers para o ambiente: %ENV%
"C:\Program Files\Git\bin\bash.exe" --login -i "./start.sh" %ENV%

echo.
echo ================================
echo Fim do processo.
