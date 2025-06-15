# 📱 Projeto Flutter: Dashboard de Exemplo

Este projeto foi desenvolvido como parte da disciplina **Programação de Dispositivos Móveis**, do curso de **Ciência da Computação**. O objetivo é **ensinar a construção de interfaces gráficas** com o framework **Flutter**, utilizando como exemplo a criação de um **dashboard interativo e responsivo**.

## 🎯 Objetivos do Projeto

- Apresentar os fundamentos do Flutter e Dart.
- Explorar a construção de telas com `Widgets`.
- Implementar layouts flexíveis usando `Row`, `Column`, `GridView`, `ListView` e `Stack`.
- Estimular boas práticas em organização de código e componentização.
- Demonstrar o uso de temas, navegação e responsividade.

## 🛠️ Tecnologias Utilizadas

- **Flutter 3.x**
- **Dart**
- **Android Studio** ou **Visual Studio Code** (IDE)
- **Material Design**
- (Opcional) Flutter DevTools para inspeção de layout

## 📸 Capturas de Tela

| Dashboard |
|-----------|
| ![home](screenshots/home.webp) |

## 📂 Estrutura do Projeto

```bash
lib/
├── main.dart
├── app.dart
└── screens/
    └── home_page.dart
```

## 🚀 Como Executar

1. **Clone o repositório:**

```bash
git clone https://github.com/karlaycosta/app_dashborad.git
cd app_dashborad
```

2. **Instale as dependências:**

```bash
flutter pub get
```

3. **Execute o aplicativo:**

```bash
flutter run
```

> Você pode rodar em um emulador Android, dispositivo real ou iOS (se estiver em um Mac).

## 📚 Conteúdos Trabalhados

- Estrutura básica de um projeto Flutter
- Stateless vs Stateful Widgets
- Navegação entre telas (`Navigator`)
- Layout com `Container`, `Padding`, `Expanded`, `Flexible`
- Customização com `ThemeData`
- Criação de componentes reutilizáveis

## 👨‍🏫 Público-alvo

Estudantes da disciplina de **Programação de Dispositivos Móveis**, com conhecimentos prévios em lógica de programação e orientação a objetos.

## 💡 Sugestões de Extensões

- Conectar a um backend (Firebase, Supabase ou API REST)
- Adicionar animações com `AnimatedContainer` ou `Hero`
- Utilizar pacotes como `qr_flutter` para renderização de QR Code

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---

Desenvolvido com 💙 para fins educacionais.

# Avaliação - Programação de Dispositivos Móveis

**Título do Trabalho:** Aplicativo de Listagem e Filtro com Flutter

## Objetivo

O objetivo desta avaliação é aplicar os conhecimentos de desenvolvimento de aplicativos móveis com Flutter para criar uma aplicação que consome dados de uma API externa, exibe esses dados em uma interface e implementa uma funcionalidade de filtro dinâmico.

---

## Descrição do Trabalho

O aluno deverá desenvolver um aplicativo em Flutter que realize as seguintes tarefas:

1.  **Carregar Dados da API:**
    * Ao iniciar, o aplicativo deve se conectar ao endpoint **`https://ifpaserver.org:4443/usuarios`**.
    * A lista de registros de usuários retornada pela API deve ser processada e exibida em uma lista rolável na tela.
    * Cada item da lista deve apresentar, no mínimo o **nome** e a **matrícula** do usuário de forma clara e organizada.

2.  **Implementar Filtro por Nome:**
    * A interface deve conter um campo de texto para que o usuário possa digitar um termo de busca.
    * À medida que o usuário digita, a lista de usuários deve ser filtrada em **tempo real**, exibindo apenas os registros cujo nome contenha o texto digitado.
    * A funcionalidade de filtro deve ser **insensível a maiúsculas e minúsculas** (*case-insensitive*) para garantir uma melhor experiência de uso.

---

## 📱 Aplicativo de exemplo

Veja um aplicativo de exemplo [EXEMPLO](https://exemplo-app.netlify.app/).

## Critérios de Avaliação

* **Funcionalidade (60%):**
    * Conexão com a API e carregamento dos dados sem erros.
    * Exibição correta da lista de usuários.
    * Funcionamento correto e reativo do filtro por nome.
* **Qualidade do Código (20%):**
    * Organização do projeto (separação de responsabilidades).
    * Legibilidade e clareza do código em Dart.
    * Criação de um modelo (`class`) para representar os dados do usuário.
* **Interface e Experiência do Usuário (20%):**
    * Design limpo e intuitivo.
    * Feedback visual durante o carregamento dos dados (ex: indicador de progresso).