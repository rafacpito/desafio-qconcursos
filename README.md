# README

Para realizar a solução foi tomada as seguintes conclusões:

*  O campo daily_access em questions era referente aos acessos que a questão está tendo no dia atual;
*  Para realizar a busca das questões mais procuradas em semana/mês/ano, foi utilizado o ultimo(a) semana/mes/ano;

A solução foi feita da sequinte maneira:

*  Ao rodar os seeds, é lido os arquivos jsons e salvo em um banco de dados as informações referentes a questões e seus acessos;

Após o banco estar populado, temos duas rotas, elas são:

*  hottest

essa rota realiza a busca das questões mais quentes no dia e retorna uma listagem em ordem da mais acessada a menos accesada, não é necessário enviar nenhum parametro, mas é possivel enviar o parametro page para alterar a pagina exibida;

*  hottest_in_period

essa rota realiza a busca das questões mais quentes no período informado, retornando uma listagem da quantidade de acessos no periodo e a questão que foi acessada, do mais acessado para o menos acessado, é necessário enviar o parametro period igual a week, month ou year, se não enviar nada, ele ira lidar como sendo year. Caso seja enviado week, ele buscara as questões mais acessadas de hoje ate uma semana atras, month de hoje ate um mês atras e de year de hoje ate um ano atras.

# INSTALAÇÃO

Para rodar o projeto na sua maquina é necessário, após realizar o clone do projeto:

*  Acessar o terminal e ir para a pasta do projeto;
*  Rodar o seguinte comando: docker-compose build (isso se ja tiver com o docker e o docker-compose instalado no seu computador);
*  Apos finalizado, rodar o comando: docker-compose up (demora bastante para importar as questoes e os acessos para o banco);
*  Com isso o ambiente estará instalado corretamente e com a aplicação rodando no localhost:3001;

