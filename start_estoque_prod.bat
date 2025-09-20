@echo off
echo ================================
echo Iniciando sistema de estoque...
echo ================================

set ENV=prod

echo.
echo Subindo containers para o ambiente: %ENV%
"C:\Program Files\Git\bin\bash.exe" --login -i "D:\Documentos\Rhuan\AmbienteEstoque\Projetos\projeto-estoque\start.sh" %ENV%

echo.
echo ================================
echo Fim do processo. Pressione ENTER para sair.
pause
