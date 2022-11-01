# Example
Nflix é um projeto de testes criada pela QANinja para testes de automação de API

## Installation
Versão minima do Ruby => 2.7.6

Gems utilizadas no projeto
```
gem 'httparty', '~> 0.20.0'
gem 'rspec', '~> 3.12'
gem 'pg'
gem 'factory_bot', '~> 6.2', '>= 6.2.1'
gem 'allure-rspec', '~> 2.15.0'
```

E então execute:

    $ bundle install

Ou intale você mesmo:

    $ gem install nflix

## Subir Containers para executar os testes

Pré-condição: Ter o Docker instaldo.

```docker
# vai executar o container no modo dettach
    docker-compose up -d 
```

# Report
    $ AllureRepsec > report/allure-results