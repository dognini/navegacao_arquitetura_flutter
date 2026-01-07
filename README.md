# Navegação e Arquitetura Flutter

Projeto desenvolvido para estudo e prática de **Arquitetura MVVM** e **Navegação** no Flutter.

## 📚 Sobre o Projeto

Este projeto foi criado com o objetivo de explorar e implementar conceitos fundamentais de arquitetura de software e navegação em aplicações Flutter:

- **MVVM (Model-View-ViewModel)**: Padrão arquitetural que separa a lógica de negócios da interface do usuário
- **Navegação**: Implementação de rotas e fluxos de navegação no Flutter
- **Gerenciamento de Estado**: Práticas de gerenciamento de estado seguindo o padrão MVVM
- **Organização de Código**: Estrutura de pastas e separação de responsabilidades

## 🏗️ Estrutura do Projeto

```
lib/
├── app/
│   ├── model/          # Modelos de dados
│   ├── view/           # Interfaces (telas)
│   ├── view_model/     # Lógica de apresentação
│   └── shared/         # Componentes compartilhados
└── main.dart           # Ponto de entrada da aplicação
```

## 🚀 Tecnologias

- Flutter
- Dart
- Arquitetura MVVM

## 📖 Conceitos Aplicados

### MVVM (Model-View-ViewModel)

- **Model**: Representa os dados e a lógica de negócios
- **View**: Camada de apresentação (widgets)
- **ViewModel**: Intermediário entre Model e View, gerencia o estado

### Navegação

- Rotas nomeadas
- Navegação entre telas
- Passagem de parâmetros
- Gerenciamento de pilha de navegação

## 🎯 Objetivos de Aprendizado

- Compreender e implementar o padrão MVVM
- Dominar técnicas de navegação no Flutter
- Aplicar boas práticas de organização de código
- Separar responsabilidades entre camadas da aplicação
