# StockManager

Aplicativo de gerenciamento de estoque desenvolvido em Flutter e Dart como projeto acadêmico.

## Funcionalidades

### Autenticação
- Cadastro de usuários com nome, e-mail e senha.
- Login com e-mail e senha.
- Logout.
- Proteção das telas para usuários não autenticados.
- Validação de campos e tratamento de erros.
- Autenticação gerenciada pelo Firebase Authentication.

### Gerenciamento de estoque
- Cadastro de produtos.
- Listagem de produtos.
- Edição de produtos.
- Exclusão de produtos.
- Controle de quantidade em estoque.
- Consulta de informações dos produtos.

### Dados dos produtos
Cada produto possui:
- ID
- Nome
- SKU
- Categoria
- Quantidade
- Preço de compra
- Preço de venda

## Tecnologias utilizadas

- Flutter
- Dart
- SQLite
- Firebase Authentication
- Firebase Core
- sqflite
- sqflite_common_ffi_web

## Estrutura do projeto

```text
lib/
├── main.dart
├── firebase_options.dart
├── database/
│   └── database_helper.dart
├── models/
│   └── product.dart
├── screens/
│   ├── home_screen.dart
│   ├── login_screen.dart
│   ├── register_screen.dart
│   └── product_form_screen.dart
└── services/
    ├── auth_service.dart
    └── product_service.dart
```

## Como executar o projeto

### Pré-requisitos

- Flutter instalado.
- Dart instalado.
- Node.js instalado (para configurar o Firebase CLI).
- Conta Google para acessar o Firebase.

### Instalação

Clone o repositório:

```bash
git clone https://github.com/luis-felipee/stock_manager.git
```

Entre na pasta:

```bash
cd stock_manager
```

Instale as dependências:

```bash
flutter pub get
```

### Configuração do Firebase

O projeto utiliza Firebase Authentication para gerenciar o cadastro e login dos usuários.

Para configurar o Firebase em outro ambiente:

1. Crie um projeto no Firebase Console.
2. Ative o método de autenticação por e-mail e senha.
3. Instale o Firebase CLI e faça login.
4. Instale o FlutterFire CLI.
5. Execute:

```bash
flutterfire configure
```

6. Selecione o projeto Firebase e as plataformas desejadas.

### Executar no navegador

Configure o SQLite para Web:

```bash
dart run sqflite_common_ffi_web:setup
```

Execute:

```bash
flutter run -d chrome
```

### Executar no Android

```bash
flutter run
```

## Banco de dados

O aplicativo utiliza SQLite para persistência dos produtos.

A tabela `products` armazena os dados dos produtos cadastrados, incluindo nome, SKU, categoria, quantidade e preços.

O campo SKU possui restrição de unicidade para evitar produtos duplicados.

O Firebase Authentication é responsável pelo gerenciamento das contas e sessões dos usuários.

