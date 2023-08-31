# Login Espresso

Teste realizado para a vaga de dev Ruby na empresa Espresso.

## Passos para configurar o projeto

Para esse projeto foi utilizado Ruby versao 3.1.4, Rails versao 7.0.7 e banco de dados PostgreSQL.

Sugestao de guias para instalar Ruby on Rails e PostgreSQL

[Go Rails](https://gorails.com/guides)

Apos instalar Ruby on Rails e PostgreSQL seguir os seguintes passos:

1. E necessario chaves de acesso para a gem Recaptcha funcionar. Acessar link do console e gerar as chaves.

[Recaptcha admin console](https://www.google.com/recaptcha/admin)

2. Criar arquivo .env na raiz do projeto e configurar variaveis de ambiente

```bash
cp .env.development .env
```

3. Instalar gems

```bash
gem install bundler
bundle install
```

4. Criar banco de dados

```bash
rails db:create
```

5. Executar migrations

```bash
rails db:migrate
```

6. Subir servico

```bash
rails server
```

Apos esses passo e possivel acessar a aplicacao pelo browser

https://localhost:3000

Para rodar os testes da aplicacao

```bash
rspec .
```
