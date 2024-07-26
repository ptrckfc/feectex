# FEECTeX

_FEECTeX é uma classe LaTeX para a escrita de teses e dissertações da Faculdade de Engeharia Elétrica e de Computação (FEEC) da Universidade Estadual de Campinas (UNICAMP)._

A presente implementação segue a **Instrução Normativa CCPG Nº 002/2021** disponível, por ora, no [site](https://www.prpg.unicamp.br/documentos-e-normas/normas/instrucoes-normativas/) da Pró-Reitoria de Pós-Graduação (PRPG).

FEECTeX é elaborada a partir da classe abnTeX2 ([site](https://www.abntex.net.br) / [GitHub](https://www.github.com/abntex)).

A classe é implementada com o objetivo de propiciar ao aluno a escrita do texto final sem (muitas) preocupações. Junto com a classe é fornecido um _template_ de tese / dissertação, o qual pode ser utilizado como ponto de partida para a escrita de um novo trabalho.

## Como Usar

Você pode utilizar o FEECTeX localmente em seu computador ou na nuvem. Neste último caso, recomenda-se o [Overleaf](https://www.overleaf.com/). Já para trabalhar localmente, é necessário ter uma distribuição TeX instalada em seu computador, _e.g._, o [MiKTeX](https://miktex.org/) e o [TeX Live](https://tug.org/texlive/), e um editor, como o TeXstudio ou o Visual Studio Code com a extensão LaTeX Workshop.

A maneira mais direta de iniciar a redação do seu trabalho é a seguinte. 1) Faça o download do repositório ou do _release_ em formato .zip; 2) descompacte o arquivo, se necessário, e você estará pronto para começar!

### Preenchendo as informações necessárias e gerando o arquivo PDF

Abra o arquivo `principal.tex` e preencha as informações necessárias.

Na declaração `\documentclass{...}`, diga se o trabalho é `mestrado` ou `doutorado`. Se o trabalho foi realizado em cotutela, informe isto na mesma declaração (basta remover o comentário). Por fim, se o trabalho não foi escrito em português, coloque como última opção a língua principal do documento. (ATENÇÃO: na atual versão, o FEECTeX não preenche as informações em língua estrangeira.)

Em seguida, informe o título da obra (`\titulo{}`). Se o título ocupar mais de uma linha (o que é bastante comum) e for necessário ajustar sua exibição na capa e na folha de rosto, **não** utilize o comando `\\`. Faça uso do comando `\ajustetitulo{<valor>}` implementado na classe FEECTeX, onde `<valor>` é um número entre 0 e 1 (e.g., 0.9). `\ajustetitulo{}` pode ser declarado no arquivo `principal.tex` logo abaixo de `\titulo{}`.

Preencha, então, o seu nome, o número do seu RA, o título e o nome de sua orientadora / seu orientador, o título e o nome de sua coorientadora / seu coorientador (se não houver, comente ambas as linhas), a universidade, o instituto ou faculdade, a universidade onde foi realizada a cotutela (se não houver, comente a linha), o local da defesa; o dia, o mẽs e o ano da defesa; a área de concentração; e, por fim, os títulos e os nomes dos componentes da banca examinadora.

## Comandos

| Comando                                             | Descrição                                             |
|-----------------------------------------------------|-------------------------------------------------------|
| \titulo{&hellip;}                                   | Título do trabalho.                                   |
| \autora{&hellip;} ou \autor{&hellip;}               | Nome da aluna ou do aluno.                            |
| \ra{&hellip;}                                       | Número do RA.                                         |
| \orientadora{&hellip;} ou \orientador{&hellip;}     | Título e nome da orientadora ou do orientador.        |
| \coorientadora{&hellip;} ou \coorientador{&hellip;} | Título e nome da coorientadora ou do coorientador.    |
| \universidadecotutela{&hellip;}                     | Nome da universidade de cotutela.                     |
| \local{&hellip;}                                    | Local (cidade) onde foi realizada a defesa.           |
| \diadefesa{&hellip;}                                | Dia em que foi realizada a defesa.                    |
| \mesdefesa{&hellip;}                                | Mês em que foi realizada a defesa.                    |
| \anodefesa{&hellip;}                                | Ano em que foi realizada a defesa.                    |
| \areaconcentracao{&hellip;}                         | Área de concentração do trabalho.                     |
| \bancaexaminadora{&hellip;}                         | Títulos e nomes dos componentes da banca examinadora. |
| \palavraschave{&hellip;}                            | Palavras-chave (colocadas no resumo.)                 |
| \keywords{&hellip;}                                 | _Keywords_ (colocadas no _abstract_.)                 |
| \imprimircapa                                       | Imprime a capa do trabalho.                           |
| \imprimirfolhaderosto                               | Imprime a folha de rosto do trabalho.                 |
| \imprimirfichacatalografica{&hellip;}               | Imprime a ficha catalográfica (PDF).                  |
| \imprimirfolhaaprovacao                             | Imprime a folha de aprovação.                         |
| \imprimirdedicatoria                                | Imprime a dedicatória (opcional).                     |
| \imprimiragradecimentos                             | Imprime os agradecimentos (opcional)[^1].             |
| \imprimirepigrafe                                   | Imprime a epígrade (opcional).                        |
| \imprimirresumo                                     | Imprime o resumo e o _abstract_.                      |
| \imprimirlistailustracoes                           | Imprime a lista de ilustrações (opcional).            |
| \imprimirlistatabelas                               | Imprime a lista de tabelas (opcional).                |
| \imprimirlistaabreviaturassiglas                    | Imprime a lista de abreviaturas e siglas (opcional).  |
| \imprimirlistasimbolos                              | Imprime a lista de símbolos (opcional).               |
| \imprimirsumario                                    | Imprime o sumário.                                    |

[^1]: A folha com os agradecimentos é opcional. No entanto, se você obteve apoio das agências de fomento (FAPESP, CNPQ, CAPES etc.), é bastante provável que você seja obrigado a agradecê-las aqui.

Também foram criadas as versões em português para outros comandos. Veja abaixo a lista de equivalências.

| Comando                         | Equivale a&hellip;                         |
|---------------------------------|--------------------------------------------|
| \incluir{&hellip;}              | \include{&hellip;} (*)                     |
| \imprimirbibliografia{&hellip;} | \bibliography{&hellip;}                    |
| \citar{&hellip;}                | \cite{&hellip;}                            |
| \citarautora{&hellip;}          | \citeauthor{&hellip;}                      |
| \citarautor{&hellip;}           | \citeauthor{&hellip;}                      |
| \citarano{&hellip;}             | \citeyear{&hellip;}                        |

(*) O comando `\incluir{&hellip;}` verifica de antemão se o arquivo existe.

## Versões

### s1.0.0 (26/07/2024)

* Release da versão simplificada.
* Corrige alguns erros gramaticais no arquivo principal.tex.

## Isenção de Responsabilidade

O presente trabalho foi realizado de maneira independente, não possuindo qualquer relação com a Faculdade de Engenharia Elétrica e de Computação (FEEC) ou com a Universidade Estadual de Campinas (UNICAMP).
