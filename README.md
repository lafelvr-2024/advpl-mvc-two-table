
# Projeto ADVPL - MVC com Duas Tabelas e Testes Automatizados (TIR)

Este projeto tem como objetivo demonstrar uma estrutura básica utilizando o padrão MVC em ADVPL,
envolvendo duas tabelas relacionadas. Ele também inclui testes automatizados utilizando o framework TIR.

## 📁 Estrutura do Projeto

```
advpl-mvc-two-table/
├── src/
│   └── custom.fat.afat002.prw          # Código principal com regras de negócio
├── tst/
│   ├── custom_fat_afat002.xml          # Suite de testes TIR
│   ├── custom_fat_afat002_inclusao.xml # Teste de inclusão
│   ├── custom_fat_afat002_alteracao.xml# Teste de alteração
│   └── custom_fat_afat002_exclusao.xml # Teste de exclusão
├── config.json                         # Configuração do ambiente TIR
└── .vscode/.advpl/                     # Bibliotecas auxiliares para o VSCode
```

## ⚙️ Funcionalidades

- Cadastro com dois domínios (tabelas relacionadas);
- Testes de inclusão, alteração e exclusão com TIR;
- Estrutura limpa e modularizada;
- Pronto para uso em ambientes Protheus com suporte ao TIR.

## ✅ Pré-requisitos

- **TOTVS Developer Studio** com extensão ADVPL;
- Ambiente configurado para uso do **TIR**;
- Repositório de fontes ADVPL (como RPO ou banco de desenvolvimento).

## 🚀 Como executar os testes

1. Configure o `config.json` com as informações do seu ambiente (usuário, senha, ambiente, etc);
2. Execute os testes com o comando:

```bash
python tst/custom_fat_afat002.xml --junitxml=result.xml
```

> Observação: Utilize o runner do TIR da TOTVS.

## 🧪 Testes Automatizados (TIR)

Foram criados testes específicos para:

- Inclusão de registros;
- Alteração de campos;
- Exclusão de dados;

Os testes podem ser executados de forma independente ou em conjunto via suíte XML.

---

Desenvolvido com 💙 em ADVPL por fins educacionais e de compartilhamento técnico.

