# Sobre
NFlix é um projeto particular criado pela QA Ninja e dipsonibilizado para estudos de automação de testes com diferentes
stacks e frameworks.

## Pré-Requisito
- Windows - Linux - Mac
- Ruby 3.0.0
- Docker
- Docker-compose

## Docker Compose
```sh
# vai executar os containers no modo dettach
docker-compose up -d 
```
## Configuração Banco de Dados
- Logar com as seguintes credenciais

| Login             | Password |
|-------------------|----------|
| root@qaninja.io   | qaninja  |

## Canectando ao Banco de Dados
![pgAdmin](https://user-images.githubusercontent.com/53004819/204164636-052984a2-6ad1-4bae-b488-97abb0bfb245.gif)

| Name | Hostname | UserName | password |
|------|----------|----------|----------|
| pgdb | pgdb     | postgres | qaninja  |

## Conectando Database NFLIX
![pgAdmin 4 - Google Chrome 2022-11-27 20-15-41_Trim](https://user-images.githubusercontent.com/53004819/204165084-61e8b7d7-fc6b-46d1-afa8-17eb6c6b62be.gif)

| Database |
|----------|
| nflix    |

### Clonar projeto
```sh
git clone git@github.com:David-Nascimento/Ruby-HTTParty.git
```

### Atualizar o Bundler
```sh
bundle install
```

### Execução do Teste 
- Regressão
```sh
rspec
```
- Com Tags
```sh
rspec -t new_user
```

Gerar relatorio Allure
```sh
allure serve result/allure_results
```