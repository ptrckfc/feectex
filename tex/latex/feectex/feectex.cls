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

%!TeX encoding = utf-8

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{feectex}[2023/08/09 v2.0.0 Classe FEEC / Unicamp]

\RequirePackage{ifthen}

\newboolean{mestrado}
\setboolean{mestrado}{false}
\newboolean{doutorado}
\setboolean{doutorado}{false}
\DeclareOption{mestrado}{
    \setboolean{mestrado}{true}
}
\DeclareOption{doutorado}{
    \setboolean{doutorado}{true}
}

\newboolean{cotutela}
\setboolean{cotutela}{false}
\DeclareOption{cotutela}{
    \setboolean{cotutela}{true}
}

% Por se tratar de texto de dissertação / tese, as opções
% article e twocolumn são desabilitadas por padrão. Deste
% modo, o usuário é informado sobre o erro caso ele venha
% a declarar ao menos uma destas opções.
\DeclareOption{article}{
    \ClassError{feectex}{
        Não é possível usar esta classe para escrever artigo.
    }{
        A classe feectex deve ser utilizada para redação da dissertação de mestrado ou tese de doutorado apenas.
    }
}

\DeclareOption{twocolumn}{
    \ClassError{feectex}{
        Não é possível usar esta classe para escrever o texto em duas colunas.
    }{
        O texto da dissertação de mestrado e a tese de doutorado deve ser escrito em uma única coluna (que ocupa todo espaço disponível para o texto).
    }
}

\DeclareOption{a5paper}{
    \ClassError{feectex}{
        O texto final deve ser apresentado em papel A4.
    }{
        O padrão A4 já está configurado na classe feectex. Remova a opção a5paper em sua declaração de classe do documento.
    }
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{abntex2}}
\ProcessOptions\relax
\LoadClass[
    12pt,               % Tamanho da fonte: 11pt ou 12pt.
    openright,          % Capítulos começam em páginas ímpares sempre.
    oneside,            % Impres. verso (oneside) ou verso / anverso (twoside).
    a4paper,
    sumario=tradicional % Estilo do sumário: tradicional ou abnt-6027-2012.
]{abntex2}

% Pacotes.
\RequirePackage[T1]{fontenc}    % Output (impressão) de caracteres acentuados.
\RequirePackage[utf8]{inputenc} % Input de caracteres acentuados.
\RequirePackage[
    alf,
    abnt-etal-cite=2,
    abnt-etal-list=0,
    abnt-etal-text=emph
]{abntex2cite}

% Configuração das margens, do parágrafo e do texto.
\setlrmarginsandblock{3cm}{2cm}{*}
\setulmarginsandblock{3cm}{2cm}{*}
\checkandfixthelayout

\setlength{\parindent}{2cm}
\frenchspacing

% Espaçamento entre linhas.
\OnehalfSpacing

% Margem da citação.
% ATENÇÃO: o valor de \ABNTEXcitacaorecuo definido abaixo é
% somado ao valor de \leftskip (de 1 cm, aparentemente).
\setlength{\ABNTEXcitacaorecuo}{4cm}

% Estilo do capítulo.
% Consulte o site:
%   https://linorg.usp.br/CTAN/info/latex-samples/MemoirChapStyles/
% para ver outros estilos. O estilo padrão do abnTeX2 é o
% abnt.
\chapterstyle{abnt}

% Refação do \textual para correta enumeração das páginas.
\renewcommand{\textual}{
    \pagestyle{abntheadings}
    \aliaspagestyle{part}{abntchapfirst}
    \aliaspagestyle{chapter}{abntchapfirst}
    \aliaspagestyle{cleared}{abntchapfirst}
    \nouppercaseheads
    \bookmarksetup{startatroot}
}

% Registro acadêmico (RA).
\newcommand{\imprimirra}{}
\renewcommand{\ra}[1]{\renewcommand{\imprimirra}{#1}}

% Redefinição de \autor e criação de \autora.
\newboolean{autor}
\setboolean{autor}{false}
\renewcommand{\autor}[1]{
    \author{#1}
    \setboolean{autor}{true}
}

\newboolean{autora}
\setboolean{autora}{false}
\newcommand{\autora}[1]{
    \author{#1}
    \setboolean{autora}{true}
}
\newcommand{\imprimirautora}{\theauthor}

% Redefinição de \orientador e criação de \orientadora.
\newboolean{orientador}
\setboolean{orientador}{false}
\renewcommand{\orientador}[1]{
    \renewcommand{\imprimirorientador}{#1}
    \setboolean{orientador}{true}
}

\newboolean{orientadora}
\setboolean{orientadora}{false}
\newcommand{\imprimirorientadora}{}
\newcommand{\orientadora}[1]{
    \renewcommand{\imprimirorientadora}{#1}
    \setboolean{orientadora}{true}
}

% Redefinição de \coorientador e criação de \coorientadora.
\newboolean{coorientador}
\setboolean{coorientador}{false}
\renewcommand{\coorientador}[1]{
    \renewcommand{\imprimircoorientador}{#1}
    \setboolean{coorientador}{true}
}

\newboolean{coorientadora}
\setboolean{coorientadora}{false}
\newcommand{\imprimircoorientadora}{}
\newcommand{\coorientadora}[1]{
    \renewcommand{\imprimircoorientadora}{#1}
    \setboolean{coorientadora}{true}
}

% Definição da universidade e da faculdade / instituto.
\newcommand{\imprimiruniversidade}{}
\newcommand{\universidade}[1]{\renewcommand{\imprimiruniversidade}{#1}}
\newcommand{\imprimirfaculdade}{}
\newcommand{\faculdade}[1]{\renewcommand{\imprimirfaculdade}{#1}}
\instituicao{%
    \MakeUppercase{\imprimiruniversidade} \\%
    \imprimirfaculdade%
}

\universidade{Universidade Estadual de Campinas}
\faculdade{Faculdade de Engenharia Elétrica e de Computação}

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
\newcommand{\universidadecotutela}[1]{
    \renewcommand{\imprimiruniversidadecotutela}{#1}
}

% Definição da área de concentração.
\newcommand{\imprimirareaconcentracao}{}
\newcommand{\areaconcentracao}[1]{\renewcommand{\imprimirareaconcentracao}{#1}}

% Definição da banca examinadora.
\newcommand{\imprimirbancaexaminadora}{}
\newcommand{\bancaexaminadora}[1]{\renewcommand{\imprimirbancaexaminadora}{#1}}

% Estilização da capa.
\newlength{\espacotitulo}
\setlength{\espacotitulo}{\textwidth}
\newcommand{\ajustetitulo}[1]{\setlength{\espacotitulo}{#1\textwidth}}

\renewcommand{\imprimircapa}{%
    \begin{capa}
        \begin{center}
            \SingleSpacing%
            \begin{minipage}{0.1\textwidth}%
                \centering%
                \includegraphics[width=1.5cm]{generic/images/unicamp-logotipo}
            \end{minipage}%
            \begin{minipage}{0.9\textwidth}%
                \centering%
                \ABNTEXchapterfont\large\imprimirinstituicao
            \end{minipage}
            \vspace{3cm}

            \ABNTEXchapterfont\large%
            \ifthenelse{\boolean{autora}}{\imprimirautora}{}%
            \ifthenelse{\boolean{autor}}{\imprimirautor}{}
            \vspace{\fill}

            \OnehalfSpacing%
            \begin{minipage}{\espacotitulo}%
                \centering%
                \ABNTEXchapterfont\bfseries\LARGE\imprimirtitulo
            \end{minipage}
            \vspace*{\fill}

            \SingleSpacing%
            \ABNTEXchapterfont\large\imprimirlocal \\%
            \ABNTEXchapterfont\large\ano
        \end{center}
    \end{capa}
}

% Montagem do preâmbulo.
\preambulo{%
    \ifthenelse{\boolean{mestrado}}{Dissertação}{}\ifthenelse{\boolean{doutorado}}{Tese}{} apresentada à Faculdade de Engenharia Elétrica e de Computação da Universidade Estadual de Campinas como parte dos requisitos exigidos para obtenção do título de \ifthenelse{\boolean{mestrado}}{Mestre}{}\ifthenelse{\boolean{doutorado}}{Doutor}{} em Engenharia Elétrica, na Área de \imprimirareaconcentracao \ifthenelse{\boolean{cotutela}}{no âmbito do Acordo de Cotutela firmado entre a Unicamp e a \imprimiruniversidadecotutela}.
}

\newcommand{\marcar}[1]{
    \addtocounter{abntex@bookmarkcounter}{1}%
    \phantomsection\pdfbookmark[0]{#1}{chapterb\arabic{abntex@bookmarkcounter}}
}

% Estilização da folha de rosto.
\renewcommand{\folhaderostocontent}{%
    \SingleSpacing%
    \begin{center}%
        \noindent{%
            \ABNTEXchapterfont\large%
            \ifthenelse{\boolean{autora}}{\imprimirautora}{}%
            \ifthenelse{\boolean{autor}}{\imprimirautor}{}
        }
        \vspace{\fill}

        \OnehalfSpacing%
        \begin{minipage}{\espacotitulo}%
            \centering%
            \ABNTEXchapterfont\bfseries\LARGE\imprimirtitulo
        \end{minipage}
    \end{center}
    \vspace*{\fill}

    \SingleSpacing%
    \begin{flushright}%
        \begin{minipage}{.50\textwidth}%
            \ABNTEXchapterfont\textit{\imprimirpreambulo}
        \end{minipage}
    \end{flushright}
    \vspace{1cm}

    \begin{flushleft}
        \ABNTEXchapterfont\large%
        \ifthenelse{\boolean{orientadora}}{Orientadora: \imprimirorientadora}{}%
        \ifthenelse{\boolean{orientador}}{Orientador: \imprimirorientador}{}%

        \ifthenelse{\boolean{coorientadora}}{%
            Coorientadora: \imprimircoorientadora%
        }{}%
        \ifthenelse{\boolean{coorientador}}{%
            Coorientador: \imprimircoorientador%
        }{}
        \vspace{2cm}

        \begin{minipage}{.475\textwidth}%
            \tiny%
            ESTE TRABALHO CORRESPONDE À VERSÃO FINAL DA \ifthenelse{\boolean{mestrado}}{DISSERTAÇÃO}{}\ifthenelse{\boolean{doutorado}}{TESE}{} DEFENDIDA \ifthenelse{\boolean{autora}}{PELA ALUNA \MakeUppercase{\imprimirautora}}{}\ifthenelse{\boolean{autor}}{PELO ALUNO \MakeUppercase{\imprimirautor}}{}, E ORIENTADA \ifthenelse{\boolean{orientadora}}{PELA \MakeUppercase{\imprimirorientadora}}{}\ifthenelse{\boolean{orientador}}{PELO \MakeUppercase{\imprimirorientador}}{}
        \end{minipage}
    \end{flushleft}
    \vspace{\fill}

    \begin{center}
        \ABNTEXchapterfont\large\imprimirlocal \\%
        \ABNTEXchapterfont\large\ano
    \end{center}
}

% Redefinição dos comandos relacionados à folha de rosto,
% uma vez que não é necessário adicionar qualquer arquivo.
\renewcommand{\imprimirfolhaderostostar}{%
    \begin{folhaderosto*}%
        \folhaderostocontent
    \end{folhaderosto*}
}

\renewcommand{\imprimirfolhaderostonostar}{%
    \begin{folhaderosto}%
        \folhaderostocontent
    \end{folhaderosto}
}

\makeatletter
\renewcommand{\imprimirfolhaderosto}{
    \addtocounter{page}{1}
    \@ifstar
        \imprimirfolhaderostostar
        \imprimirfolhaderostonostar
}
\makeatother

% Ficha catalográfica.
\newcommand{\imprimirfichacatalografica}[1]{%
    \marcar{Ficha catalográfica}
    \IfFileExists{#1}{\includepdf{#1}}{%
        \noindent%
        Ficha catalográfica (adicionar PDF)%
    }%
    \cleardoublepage
}

% Redefinição do ambiente folhadeaprovacao.
\newcommand{\imprimirfolhaaprovacao}{}
\renewenvironment{folhadeaprovacao}{%
    \clearpage
    \marcar{Folha de aprovação}
}{}

% Estilização da folha de aprovação.
\renewcommand{\imprimirfolhaaprovacao}{%
    \begin{folhadeaprovacao}%
        \ABNTEXchapterfont%
        \SingleSpacing%
        \begin{center}%
            \textbf{%
                COMISSÃO JULGADORA - %
                \ifthenelse{\boolean{mestrado}}{DISSERTAÇÃO DE MESTRADO}{}%
                \ifthenelse{\boolean{doutorado}}{TESE DE DOUTORADO}{}%
            }%
        \end{center}
        \vspace{2cm}

        \begin{flushleft}
            \textbf{%
                \ifthenelse{\boolean{autora}}{Candidata: }{}%
                \ifthenelse{\boolean{autor}}{Candidato: }{}%
            } \imprimirautor~RA: \imprimirra%
            \vspace{0.5\onelineskip}%

            \textbf{Data da Defesa:} \datadefesa%
            \vspace{0.5\onelineskip}%

            \textbf{%
                Título da %
                \ifthenelse{\boolean{mestrado}}{Dissertação:}{}%
                \ifthenelse{\boolean{doutorado}}{Tese:}{}%
            }~\imprimirtitulo%
            \vspace{2cm}

            \begin{minipage}[c]{\textwidth}%
                \imprimirbancaexaminadora
            \end{minipage}
            \vspace{2cm}

            \begin{minipage}{\textwidth}%
                \fontsize{12.5pt}{14pt}\selectfont{A ata de defesa, com as respectivas assinaturas dos membros da Comissão Julgadora, encontra-se no SIGA (Sistema de Fluxo de Dissertação/Tese) e na Secretaria de Pós-Graduação da Faculdade de Engenharia Elétrica e de Computação.}
            \end{minipage}
        \end{flushleft}
    \end{folhadeaprovacao}
    \cleardoublepage
}

\newcommand{\imprimir}[1]{
    \IfFileExists{#1}{%
        \begin{#1}
            \input{#1}%
        \end{#1}
    }{}
}

% Dedicatória (opcional).
\renewenvironment{dedicatoria}{
    \marcar{Dedicatória}
    \vspace*{-\topskip}%
    \vspace*{\fill}%
    \begin{flushright}%
}{%
    \end{flushright}%
    \vspace*{\fill}%
    \cleardoublepage
}

\newcommand{\imprimirdedicatoria}{%
    \imprimir{dedicatoria}
}

% Agradecimentos (opcional).
\newcommand{\imprimiragradecimentos}{
    \imprimir{agradecimentos}
}

% Epígrafe (opcional).
\renewenvironment{epigrafe}{
    \marcar{Epígrafe}
    \vspace*{\fill}%
    \begin{flushright}%
}{%
    \end{flushright}%
    \cleardoublepage
}

\newcommand{\imprimirepigrafe}{
    \imprimir{epigrafe}
}

% Resumo e Abstract.
\newcommand{\imprimirpalavraschave}{}
\newcommand{\palavraschave}[1]{\renewcommand{\imprimirpalavraschave}{#1}}
\newcommand{\imprimirkeywords}{}
\newcommand{\keywords}[1]{\renewcommand{\imprimirkeywords}{#1}}

\newcommand{\imprimirresumo}{
    \IfFileExists{resumo}{
        \begin{resumo}%
            \input{resumo}%

            \vspace{\onelineskip}%
            \noindent%
            \textbf{Palavras-chave}:~\imprimirpalavraschave.
        \end{resumo}
    }{}
    \IfFileExists{abstract}{
        \begin{resumo}[Abstract]
            \begin{otherlanguage*}{english}
                \input{abstract}%

                \vspace{\onelineskip}%
                \noindent%
                \textbf{Keywords}:~\imprimirkeywords.
            \end{otherlanguage*}
        \end{resumo}
    }{}
}

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

% Lista de abreviaturas e siglas (opcional)
\newcommand{\imprimirlistaabreviaturassiglas}{%
    \IfFileExists{abreviaturas-siglas}{%
        \begin{siglas}%
            \input{abreviaturas-siglas}%
        \end{siglas}
    }{}
}

% Lista de % símbolos (opcional).
\newcommand{\imprimirlistasimbolos}{%
    \IfFileExists{simbolos}{%
    \begin{simbolos}%
        \input{simbolos}
    \end{simbolos}
    }{}
}

% Sumário.
\newcommand{\imprimirsumario}{%
    \pdfbookmark[0]{\contentsname}{toc}%
    \pagestyle{empty}   % Remove numeração do sumário.
    \tableofcontents*
    \cleardoublepage
}

% Estilização dos elementos pós-textuais.
\newcommand{\imprimirbibliografia}[1]{%
    \bibliography{#1}%
}

% Novo comando para inclusão de arquivos .tex
\newcommand{\incluir}[1]{%
    \IfFileExists{#1}{\include{#1}}{}
}

% Novos comandos para citações.
\newcommand{\citar}[1]{\cite{#1}}
\newcommand{\citarautora}[1]{\citeauthor{#1}}
\newcommand{\citarautor}[1]{\citeauthor{#1}}
\newcommand{\citarano}[1]{\citeyear{#1}}
