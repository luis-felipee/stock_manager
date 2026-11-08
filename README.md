# StockManager 📦

Aplicativo de gerenciamento de estoque desenvolvido em Flutter e Dart, com integração ao banco de dados SQLite.

O projeto tem como objetivo facilitar o controle de produtos, permitindo cadastrar, visualizar, editar e excluir itens de um estoque.

## 🎯 Objetivo

Desenvolver uma aplicação mobile para gerenciamento de estoque, aplicando conceitos de desenvolvimento de software, persistência de dados, operações CRUD, organização de código e navegação entre telas.

## 🚀 Funcionalidades

- **Cadastro de produtos:** registro de novos produtos com nome, SKU, categoria, quantidade e preços.
- **Listagem de produtos:** visualização dos produtos cadastrados.
- **Edição de produtos:** atualização das informações dos produtos existentes.
- **Exclusão de produtos:** remoção de produtos do estoque.
- **Controle de estoque:** acompanhamento das quantidades disponíveis.
- **Validação de formulários:** verificação de campos obrigatórios e valores numéricos.
- **Verificação de SKU:** impedimento de cadastro de produtos com códigos duplicados.
- **Persistência de dados:** armazenamento das informações em banco de dados SQLite.

## 🛠️ Tecnologias utilizadas

- **Flutter:** framework utilizado para o desenvolvimento da aplicação.
- **Dart:** linguagem de programação.
- **SQLite:** banco de dados para armazenamento das informações.
- **sqflite:** integração com SQLite.
- **sqflite_common_ffi_web:** suporte ao banco de dados na versão Web.
- **Path:** manipulação de caminhos de arquivos.

## 📁 Estrutura do projeto

```text
lib/
├── main.dart
├── database/
│   └── database_helper.dart
├── models/
│   └── product.dart
├── screens/
│   ├── home_screen.dart
│   └── product_form_screen.dart
└── services/
    └── product_service.dart
```

### Organização

- **database:** configuração e gerenciamento do banco de dados.
- **models:** definição da estrutura dos dados dos produtos.
- **screens:** telas e componentes da interface.
- **services:** implementação das operações de acesso e manipulação dos dados.
- **main.dart:** ponto de entrada da aplicação.

## ⚙️ Como executar o projeto

### Pré-requisitos

- Flutter SDK instalado.
- Dart SDK.
- Visual Studio Code ou Android Studio.

### Instalação

1. Clone o repositório:

```bash
git clone URL_DO_REPOSITORIO
```

2. Entre na pasta do projeto:

```bash
cd stock_manager
```

3. Instale as dependências:

```bash
flutter pub get
```

4. Para executar no navegador:

```bash
dart run sqflite_common_ffi_web:setup
flutter run -d chrome
```

5. Para executar em um dispositivo ou emulador Android:

```bash
flutter run
```

## 💾 Banco de dados

O projeto utiliza SQLite para armazenar os dados dos produtos.

A tabela `products` possui os seguintes campos:

| Campo | Tipo | Descrição |
|---|---|---|
| id | INTEGER | Identificador único |
| name | TEXT | Nome do produto |
| sku | TEXT | Código de identificação único |
| category | TEXT | Categoria do produto |
| quantity | INTEGER | Quantidade em estoque |
| purchase_price | REAL | Preço de compra |
| sale_price | REAL | Preço de venda |
| created_at | TEXT | Data de criação |

O campo SKU possui uma restrição de unicidade (`UNIQUE`), impedindo o cadastro de produtos com o mesmo código.

## 📌 Considerações finais

O StockManager foi desenvolvido como projeto acadêmico, com o propósito de aplicar conhecimentos de desenvolvimento de aplicativos, integração com banco de dados, operações CRUD e organização de código utilizando Flutter e Dart.