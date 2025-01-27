# CI/CD Pipeline para Laravel com Docker

Este projeto usa GitHub Actions para automatizar o processo de integração contínua (CI) e entrega contínua (CD) para um projeto Laravel. O pipeline configura o PHP e o Composer, executa testes, cria um binário do projeto e cria a imagem Docker do projeto.

## Como funciona o pipeline

O workflow é dividido em dois jobs principais:

1. **Build**: Este job cuida de:
    - Instalar as dependências do Composer.
    - Verificar se o arquivo `artisan` está presente no projeto.
    - Rodar os testes usando o `php artisan test`.
    - Criar um arquivo binário compactado (.tar.gz) do projeto.
    - Publicar o arquivo binário como artefato para download.

2. **Build Docker**: Este job:
    - Cria a imagem Docker do projeto com base no `Dockerfile` presente no repositório. A imagem é gerada usando o comando `docker build`.

## Como usar

1. **Clone este repositório**:
   ```bash
   git clone https://github.com/andersonas/ci-cd.git
   cd minhaaplicacao
