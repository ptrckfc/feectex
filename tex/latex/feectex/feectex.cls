%% feectex.cls
%% Copyright 2023 Patrick Franco Coutinho
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
%
% The Current Maintainer of this work is Patrick Franco Coutinho.
%
% This work consists of the file feectex.cls.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{feectex}[2023/06/16 v0.1 Classe FEEC / Unicamp]

% As opções exclusivas desta classe são processadas abaixo.
\RequirePackage{ifthen}

\newboolean{mestrado}
\newboolean{doutorado}
\DeclareOption{mestrado}{%
    \setboolean{mestrado}{true}%
    \setboolean{doutorado}{false}%
}
\DeclareOption{doutorado}{%
    \setboolean{mestrado}{false}%
    \setboolean{doutorado}{true}%
}

\newboolean{cotutela}
\setboolean{cotutela}{false}
\DeclareOption{cotutela}{%
    \setboolean{cotutela}{true}%
}

% Por se tratar de texto de dissertação / tese, as opções
% article e twocolumn são desabilitadas por padrão.
\DeclareOption{article}{%
    \ClassError{feec-unicamp}{%
        Não é possível usar esta classe para escrever artigo.%
    }{%
        A classe feec-unicamp deve ser utilizada para redação da dissertação de mestrado ou tese de doutorado apenas.%
    }%
}

\DeclareOption{twocolumn}{%
    \ClassError{feec-unicamp}{%
        Não é possível usar esta classe para escrever o texto em duas colunas.%
    }{%
        O texto da dissertação de mestrado e a tese de doutorado deve ser escrito utilizando uma coluna.%
    }%
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{abntex2}}
\ProcessOptions\relax
\LoadClass[
    12pt,               % Tamanho da fonte: 11pt ou 12pt.
    openright,          % Capítulos começam em páginas ímpares sempre.
    oneside,            % Impres. verso (oneside) ou verso / anverso (twoside).
    a4paper,            % Tamanho do papel: a4paper, a5paper.
    sumario=tradicional % Estilo do sumário: tradicional ou abnt-6027-2012.
]{abntex2}

% Pacotes.
\RequirePackage{ragged2e}
\RequirePackage{indentfirst}
\RequirePackage{nomencl}
\RequirePackage[
    alf,
    abnt-etal-cite=2,
    abnt-etal-list=0,
    abnt-etal-text=emph
]{abntex2cite}


% Configuração das margens, do parágrafo e do texto.
\setlrmarginsandblock{3cm}{2cm}{*}  % \setlrmarginsandblock{esquerda}{direita}
\setulmarginsandblock{3cm}{2cm}{*}  % \setulmarginsandblock{superior}{inferior}
\checkandfixthelayout
\setlength{\parindent}{2cm}
\frenchspacing

% Estilo do capítulo.
% Consulte o site:
%   https://linorg.usp.br/CTAN/info/latex-samples/MemoirChapStyles/
% para ver outros estilos. O estilo padrão do abnTeX2 é o abnt.
\chapterstyle{abnt}

% Margem da citação.
% ATENÇÃO: o valor de \ABNTEXcitacaorecuo definido abaixo é
% somado ao valor de \leftskip (de 1 cm, aparentemente),
% totalizando os 4 cm necessários.
\setlength{\ABNTEXcitacaorecuo}{3cm}

% Refação do\textual para correta enumeração das páginas.
\renewcommand{\textual}{%
    \addtocounter{page}{1}%
    \pagestyle{abntheadings}%
    \aliaspagestyle{part}{abntchapfirst}%
    \aliaspagestyle{chapter}{abntchapfirst}%
    \aliaspagestyle{cleared}{abntchapfirst}%
    \nouppercaseheads%
    \bookmarksetup{startatroot}%
}

%
% Implementações e reimplementações da classe.
%
\newcommand{\feectex}{\textit{feectex}~}

% Registro acadêmico.
\providecommand{\imprimirra}{}
\renewcommand{\ra}[1]{\renewcommand{\imprimirra}{#1}}

% Redefinição de \autor e criação de \autora.
\newboolean{autor}
\setboolean{autor}{false}
\renewcommand{\autor}[1]{%
    \author{#1}%
    \setboolean{autor}{true}%
}

\newboolean{autora}
\setboolean{autora}{false}
\newcommand{\autora}[1]{%
    \author{#1}%
    \setboolean{autora}{true}%
}
\newcommand{\imprimirautora}{\theauthor}

% Redefinição de \orientador e criação de \orientadora.
\newboolean{orientador}
\setboolean{orientador}{false}
\renewcommand{\orientador}[1]{%
    \renewcommand{\imprimirorientador}{#1}%
    \setboolean{orientador}{true}%
}

\newboolean{orientadora}
\setboolean{orientadora}{false}
\newcommand{\imprimirorientadora}{}
\newcommand{\orientadora}[1]{%
    \renewcommand{\imprimirorientadora}{#1}%
    \setboolean{orientadora}{true}%
}

% Redefinição de \coorientador e criação de \coorientadora.
\newboolean{coorientador}
\setboolean{coorientador}{false}
\renewcommand{\coorientador}[1]{%
    \renewcommand{\imprimircoorientador}{#1}%
    \setboolean{coorientador}{true}%
}

\newboolean{coorientadora}
\setboolean{coorientadora}{false}
\newcommand{\imprimircoorientadora}{}
\newcommand{\coorientadora}[1]{%
    \renewcommand{\imprimircoorientadora}{#1}%
    \setboolean{coorientadora}{true}%
}

% Definição da universidade e da faculdade / instituto.
\newcommand{\imprimiruniversidade}{}
\newcommand{\universidade}[1]{\renewcommand{\imprimiruniversidade}{#1}}
\newcommand{\imprimirinstitutooufaculdade}{}
\newcommand{\institutooufaculdade}[1]{
    \renewcommand{\imprimirinstitutooufaculdade}{#1}%
}
\instituicao{%
    \MakeUppercase{\imprimiruniversidade} \\%
    \imprimirinstitutooufaculdade%
}

% Definição da data de defesa. O ano que aparece na capa e
% na folha de rosto é o ano da defesa.
\newcommand{\dia}{}
\newcommand{\diadefesa}[1]{\renewcommand{\dia}{#1}}

\newcommand{\mes}{}
\newcommand{\mesdefesa}[1]{\renewcommand{\mes}{#1}}

\newcommand{\ano}{}
\newcommand{\anodefesa}[1]{\renewcommand{\ano}{#1}}

\newcommand{\datadefesa}{%
    \dia~de \mes~de \ano.%
}

% Definição da instituição de cotutela (se houver).
\newcommand{\imprimiruniversidadecotutela}{}
\newcommand{\universidadecotutela}[1]{%
    \renewcommand{\imprimiruniversidadecotutela}{#1}%
}

% Definição da área de concentração.
\newcommand{\imprimirareaconcentracao}{}
\newcommand{\areaconcentracao}[1]{\renewcommand{\imprimirareaconcentracao}{#1}}

% Definição da banca examinadora.
\newcommand{\imprimirbancaexaminadora}{}
\newcommand{\bancaexaminadora}[1]{\renewcommand{\imprimirbancaexaminadora}{#1}}

% Estilização da capa.
\renewcommand{\imprimircapa}{%
    \begin{capa}%
        \noindent%
        \begin{minipage}{0.1\textwidth}%
            \includegraphics[width=1.5cm]{%
                generic/images/unicamp-logotipo%
            }%
        \end{minipage}%
        \hspace*{\fill}%
        \begin{minipage}{0.86\textwidth}%
            \centering\ABNTEXchapterfont\large\imprimirinstituicao%
        \end{minipage}%

        \vspace{3cm}

        \begin{center}%
            \noindent{%
                \ABNTEXchapterfont\large%
                \ifthenelse{\boolean{autora}}{\imprimirautora}{}%
                \ifthenelse{\boolean{autor}}{\imprimirautor}{}%
            }%
            \vfill%

            \begin{center}%
                \begin{minipage}{0.95\textwidth}%
                    \centering%
                    {\ABNTEXchapterfont\bfseries\LARGE\imprimirtitulo}%
                \end{minipage}
            \end{center}

            \vfill%

            \noindent{\ABNTEXchapterfont\large\imprimirlocal} \\%
            {\ABNTEXchapterfont\large\ano}%
        \end{center}
    \end{capa}
}

% Montagem do preambulo.
\preambulo{%
    \ifthenelse{\boolean{mestrado}}{Dissertação}{}%
    \ifthenelse{\boolean{doutorado}}{Tese}{}%
    ~apresentada à Faculdade de Engenharia Elétrica e de Computação da Universidade Estadual de Campinas como parte dos requisitos exigidos para obtenção do título de~%
    \ifthenelse{\boolean{mestrado}}{Mestre}{}%
    \ifthenelse{\boolean{doutorado}}{Doutor}{}%
    ~em Engenharia Elétrica, na Área de \imprimirareaconcentracao%
    \ifthenelse{\boolean{cotutela}}{%
        ~no âmbito do Acordo de Cotutela firmado entre a Unicamp e a \imprimirinstituicaocotutela
    }.%
}

% Estilização da folha de rosto.
\renewcommand{\folhaderostocontent}{%
    \SingleSpacing%
    \begin{center}%
        \noindent{%
            \ABNTEXchapterfont\large%
            \ifthenelse{\boolean{autora}}{\imprimirautora}{}%
            \ifthenelse{\boolean{autor}}{\imprimirautor}{}%
        }%

        \vspace*{\fill}%

        \begin{center}%
            \begin{minipage}{0.95\textwidth}%
                \centering%
                {\ABNTEXchapterfont\bfseries\LARGE\imprimirtitulo}%
            \end{minipage}
        \end{center}
    \end{center}%

    \vspace*{\fill}%

    \hspace{\fill}%
    \begin{minipage}{.55\textwidth}%
        \ABNTEXchapterfont\textit{\imprimirpreambulo}%
    \end{minipage}%

    \vspace{1cm}

    \noindent%
    \ABNTEXchapterfont\large%
    \ifthenelse{\boolean{orientadora}}{Orientadora: \imprimirorientadora}{}%
    \ifthenelse{\boolean{orientador}}{Orientador: \imprimirorientador}{}%

    \noindent%¨
    \ifthenelse{\boolean{coorientadora}}{Coorientadora: \imprimircoorientadora}{}%
    \ifthenelse{\boolean{coorientador}}{Coorientador: \imprimircoorientador}{}%

    \vspace{1.5cm}

    \noindent%
    \begin{minipage}{.45\textwidth}%
        \tiny\justifying\noindent ESTE TRABALHO CORRESPONDE À VERSÃO FINAL DA~%
        \ifthenelse{\boolean{mestrado}}{DISSERTAÇÃO}{}%
        \ifthenelse{\boolean{doutorado}}{TESE}{}%
        ~DEFENDIDA~%
        \ifthenelse{\boolean{autora}}{%
            PELA ALUNA \MakeUppercase{\imprimirautora}%
        }{}%
        \ifthenelse{\boolean{autor}}{%
            PELO ALUNO \MakeUppercase{\imprimirautor}%
        }{}%
        , E ORIENTADA~%
        \ifthenelse{\boolean{orientadora}}{%
            PELA \MakeUppercase{\imprimirorientadora}%
        }{}%
        \ifthenelse{\boolean{orientador}}{%
            PELO \MakeUppercase{\imprimirorientador}%
        }{}%
    \end{minipage}\vfill%

    \begin{center}%
        {\ABNTEXchapterfont\large\imprimirlocal} \\%
        {\ABNTEXchapterfont\large\ano}%
    \end{center}
}

% Redefinição dos comandos relacionados à folha de rosto, uma
% vez que não é necessário adicionar qualquer arquivo.
\renewcommand{\imprimirfolhaderostostar}{%
    \begin{folhaderosto*}
        \folhaderostocontent
    \end{folhaderosto*}
}

\renewcommand{\imprimirfolhaderostonostar}{%
    \begin{folhaderosto}
        \folhaderostocontent
\end{folhaderosto}}

\makeatletter
\renewcommand{\imprimirfolhaderosto}{%
    \@ifstar
        \imprimirfolhaderostostar
        \imprimirfolhaderostonostar
}
\makeatother

% Redefinição do ambiente folhadeaprovacao.
\newcommand{\imprimirfolhaaprovacao}{}
\renewenvironment{folhadeaprovacao}{%
    \clearpage%
    \pdfbookmark[0]{\folhadeaprovacaoname}{fap}%
}{}

% Estilização da folha de aprovação.
\renewcommand{\imprimirfolhaaprovacao}{%
    \begin{folhadeaprovacao}%
        \ABNTEXchapterfont%
        \begin{center}%
            \textbf{%
                COMISSÃO JULGADORA - %
                \ifthenelse{\boolean{mestrado}}{DISSERTAÇÃO DE MESTRADO}{}%
                \ifthenelse{\boolean{doutorado}}{TESE DE DOUTORADO}{}%
            }%
        \end{center}

        \vspace{2cm}

        \noindent\textbf{%
            \ifthenelse{\boolean{autora}}{Candidata: }{}%
            \ifthenelse{\boolean{autor}}{Candidato: }{}%
        } \imprimirautor~ RA: \imprimirra%
        \vspace{\onelineskip}%

        \noindent\textbf{Data da Defesa:} \datadefesa%
        \vspace{\onelineskip}%

        \noindent\textbf{%
            Título da %
            \ifthenelse{\boolean{mestrado}}{Dissertação:}{}%
            \ifthenelse{\boolean{doutorado}}{Tese:}{}%
        }~\imprimirtitulo%

        \vspace{2cm}

        \noindent%
        \begin{minipage}[c]{\textwidth}%
            \imprimirbancaexaminadora%
        \end{minipage}

        \vspace{2cm}

        \noindent\fontsize{12.5pt}{1.2}\selectfont{A ata de defesa, com as respectivas assinaturas dos membros da Comissão Julgadora, encontra-se no SIGA (Sistema de Fluxo de Dissertação/Tese) e na Secretaria de Pós-Graduação da Faculdade de Engenharia Elétrica e de Computação.}
    \end{folhadeaprovacao}
}

% Ficha catalográfica.
\newcommand{\imprimirfichacatalografica}[1]{%
    \IfFileExists{#1}{\includepdf{#1}}{%
        \noindent%
        Ficha catalográfica (adicionar PDF)%
    }%
}

% Dedicatória (opcional).
\newcommand{\incluirtex}[1]{\IfFileExists{#1}{\include{#1}}{}}
\newcommand{\imprimirdedicatoria}[1]{\incluirtex{#1}}

% Agradecimentos (opcional).
\renewenvironment{dedicatoria}{
    \vspace*{\fill}%
    \begin{flushright}%
}{%
    \end{flushright}%
    \vspace*{\fill}%
}

\newcommand{\imprimiragradecimentos}[1]{\incluirtex{#1}}

% Epígrafe (opcional).
\renewenvironment{epigrafe}{
    \vspace*{\fill}%
    \begin{flushright}%
}{%
    \end{flushright}%
}

\newcommand{\imprimirepigrafe}[1]{\incluirtex{#1}}

% Resumo e Abstract.
\newcommand{\imprimirresumo}[1]{\incluirtex{#1}}

% Lista de ilustrações (opcional).
\newcommand{\imprimirlistailustracoes}{%
    \pdfbookmark[0]{\listfigurename}{lof}
    \listoffigures*
    \cleardoublepage
}

% Lista de tabelas (opcional).
\newcommand{\imprimirlistatabelas}{%
    \pdfbookmark[0]{\listtablename}{lot}
    \listoftables*
    \cleardoublepage
}

% Lista de abreviaturas e siglas (opcional) e lista de
% símbolos (opcional).
\renewcommand{\nomname}{}%
\newcommand{\abreviatura}[1]{\nomenclature[A]{#1}}
\newcommand{\sigla}[1]{\nomenclature[A]{#1}}
\newcommand{\simbolo}[1]{\nomenclature[S]{#1}}

\renewcommand{\nomgroup}[1]{
    \item[]%
    \ifthenelse{\equal{#1}{A}}{%
        \pdfbookmark[0]{\listadesiglasname}{las}%
        \begin{center}%
            {\printchaptertitle\listadesiglasname}%
        \end{center}%
        \vspace*{1cm}%
    }{}%
    \ifthenelse{\equal{#1}{S}}{%
        \cleardoublepage%
        \pdfbookmark[0]{\listadesimbolosname}{los}%
        \begin{center}%
            {\printchaptertitle\listadesimbolosname}%
        \end{center}%
        \vspace*{0.5cm}%
    }{}%
}

\newcommand{\imprimirlistaabreviaturassiglassimbolos}{%
    \printnomenclature%
    \cleardoublepage%
}{}


\makenomenclature

% Sumário.
\newcommand{\imprimirsumario}{%
    \pdfbookmark[0]{\contentsname}{toc}
    \tableofcontents*
    \clearpage
}

% Estilização dos elementos pós-textuais.
\newcommand{\imprimirreferencias}[1]{%
    \IfFileExists{#1}{\bibliography{#1}}{}%
}
\newcommand{\imprimirbibliografia}[1]{%
    \imprimirreferencias{#1}
}

% Novos comandos para citações.
\newcommand{\citar}[1]{\cite{#1}}
\newcommand{\citarautora}[1]{\citeauthor{#1}}
\newcommand{\citarautor}[1]{\citeauthor{#1}}
\newcommand{\citarano}[1]{\citeyear{#1}}