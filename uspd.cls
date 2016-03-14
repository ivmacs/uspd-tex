%% Copyright (c) Kirill V. Zaborsky, 2013
%%               Alexander V. Inyukhin, 2004.
%%
%% This system is distributed in the hope that it will be useful,
%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{uspd}
              [1995/11/30 v1.3l
               USPD LaTeX document class]
\DeclareOption{a5paper}
    {\ClassError{uspd}{Option `a5paper' not supported}{}}
\DeclareOption{b5paper}
    {\ClassError{uspd}{Option `b5paper' not supported}{}}
\DeclareOption{onecolumn}%
    {\ClassError{uspd}{Option `onecolumn' not supported}{}}
\DeclareOption{twocolumn}{%
    \ClassError{uspd}{Option `twocolumn' not supported}{}
}
\DeclareOption{titlepage}%
    {\ClassError{uspd}{Option `titlepage' not supported}{}}
\PassOptionsToClass{onecolumn}{extarticle}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}

% Info part
\newif\ifuspd@withinfo\uspd@withinfotrue
\DeclareOption{noinfopart}{\uspd@withinfofalse}

\ProcessOptions\relax
\LoadClass[a4paper,onecolumn]{extarticle}

\RequirePackage{rotating}
\RequirePackage{xcolor}
\RequirePackage{polyglossia}
\setdefaultlanguage{russian}
\RequirePackage[top=25mm,right=10mm,bottom=15mm,left=20mm]{geometry}
\RequirePackage{pgfkeys}
\RequirePackage{setspace}
\RequirePackage{textcase}
\RequirePackage[titles]{tocloft}
\RequirePackage{caption}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{paralist}

\setlength{\unitlength}{1mm}
%\linespread{1.25}
\onehalfspacing

\setlength{\parindent}{12.5mm}

\newcommand{\No}{\textnumero{}}

\def\ps@uspdluheadings{
  \def\@oddfoot{\\{}}%Литера <<О>>}} % ГОСТ 2.103-68
  \def\@evenfoot{\\{}}%Литера <<О>>}}
  \let\@oddhead\@empty\let\@evenhead\@empty
  \let\@mkboth\@gobbletwo
  \let\sectionmark\@gobble
  \let\subsectionmark\@gobble
}

\def\ps@uspdnormheadings{
  \let\@oddfoot\@empty\let\@evenfoot\@empty
  \def\@oddhead{
  	\vbox{
		\vbox{\hfil\thepage\hfil}
		{\vskip 5mm}
		\vbox{\hfil\rightmark\hfil}
	}
  }
  \def\@evenhead{\\{\leftmark}\\}
  \let\@mkboth\@gobbletwo
  \let\sectionmark\@gobble
  \let\subsectionmark\@gobble
}

\setcaptionmargin{\parindent}
\setcounter{tocdepth}{2}

% \renewcommand{\point}{\par\refstepcounter{subsubsection}\thesubsubsection\quad}
% 
% \newcounter{niidarSubpoint}[subsubsection]
% \renewcommand{\subpoint}{\par\refstepcounter{niidarSubpoint}\thesubpoint\quad}
% 
% \renewcommand{\thepoint}{\thesubsection.\arabic{subsubsection}}
% \renewcommand{\thesubpoint}{\thepoint.\arabic{niidarSubpoint}}
% 
% \newcommand{\overpoint}{{\par\refstepcounter{subsection}\thesubsection\quad}}
% \newcommand{\overoverpoint}{{\par\refstepcounter{section}\thesection\quad}}

\newcommand{\uspd@sect@alignleft}{%
  \let\\\@centercr\@rightskip\@flushglue \rightskip\@rightskip%
  \leftskip\z@skip}
\newcommand{\uspd@sect@aligncenter}{%
  \let\\\@centercr
  \rightskip\@flushglue\leftskip\@flushglue
  \parindent\z@\parfillskip\z@skip}

\newcommand{\uspd@sect@style}{\normalfont\MakeUppercase}
\newcommand{\uspd@subsect@style}{\normalfont}
\newcommand{\uspd@subsubsect@style}{\normalfont\normalsize}

\renewcommand\section{\@startsection {section}{1}{\parindent}%
                                   {12pt}%
                                   {12pt}%
                                   {\uspd@sect@aligncenter\uspd@sect@style}}
\renewcommand\subsection{\@startsection{subsection}{2}{\parindent}%
                                     {12pt}%
                                     {12pt}%
                                    {\uspd@sect@alignleft\uspd@subsect@style}}
% \renewcommand\subsubsection{\@startsection{subsubsection}{3}{\parindent}%
%                                      {0pt}%
%                                      {0pt}%
%                                      {\uspd@sect@alignleft\uspd@subsubsect@style}}

% \renewcommand{\thesection}{\arabic{section}}
% \renewcommand{\thesubsection}{\thesection.\arabic{subsection}}
% \renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}

\righthyphenmin=2
\sloppy

\setlength{\topsep}{0pt}
\renewcommand{\itemize}{\asparaitem}
\renewcommand{\enumerate}{\asparaenum}

\renewcommand{\cftsecfont}{\normalfont}
\renewcommand{\cftsecpagefont}{\normalfont}
\renewcommand{\cftsubsecindent}{\cftsecindent}
\newlength{\onenumwidth}
\settowidth{\onenumwidth}{.1}
\addtolength{\cftsecnumwidth}{\onenumwidth}
\addtolength{\cftsubsecnumwidth}{\onenumwidth}

%\renewcommand{\cftsecnumwidth}{}
\renewcommand{\cftdotsep}{\cftnodots}
\renewcommand{\cftbeforesecskip}{\cftbeforesubsecskip}
% \renewcommand{\cfttoctitlefont}{\hfil\bfseries\MakeTextUppercase}
% \renewcommand{\cftaftertoctitle}{\hfill}

% font definitions
\newcommand{\fontShape}{\normalfont}
\newcommand{\smallFontSize}{\fontsize{10pt}{12pt}}
\newcommand{\smallFont}{%
  \smallFontSize\selectfont\fontShape}

\newcommand\stamp[1]{{
\newpage
\noindent\begin{picture}(0,0)(0,0)
\put(-12,-252){\framebox(12,145)}
\put(-7,-252){\line(0,1){145}}
\put(-12,-142){\line(1,0){12}}
\put(-12,-167){\line(1,0){12}}
\put(-12,-192){\line(1,0){12}}
\put(-12,-227){\line(1,0){12}}
\put(-11,-251){\begin{sideways}\parbox[t]{25mm}{\smallFont Инв. {\No}подп.}\end{sideways}}
\put(-11,-226){\begin{sideways}\parbox[t]{35mm}{\smallFont Подп. и дата}\end{sideways}}
\put(-11,-191){\begin{sideways}\parbox[t]{25mm}{\smallFont Взам инв. {\No}}\end{sideways}}
\put(-11,-166){\begin{sideways}\parbox[t]{25mm}{\smallFont Инв. {\No} дубл.}\end{sideways}}
\put(-11,-141){\begin{sideways}\parbox[t]{35mm}{\smallFont Подп. и дата}\end{sideways}}
\end{picture}
#1
\newpage
}}

\newcommand\signfield[1]{\underline{\phantom{ЖЖЖЖЖ}}~{#1}}
\newcommand\datefield{<<\underline{\phantom{Ж}}>>~\underline{\phantom{ЖЖЖЖЖ}}~{\number\year}~г.}
\newcommand\signeefield[3]{#1\newline\signfield{#2}\newline\datefield\newline\newline}
\newcommand\pagesfield[1]{\ifthenelse{\pageref{#1} > 1}{Листов \pageref{#1}}{}}
\renewcommand{\labelitemi}{--}
\newcommand\LU[1]{\markboth{{#1}--ЛУ}{{#1}--ЛУ}\setcounter{page}{1}
\thispagestyle{uspdnormheadings}\stamp{
% field 0, label
%{\noindent\hfill Совершенно секретно}

\begin{center}

% field 1, organization
%{ОАО <<НПК <<НИИДАР>>}

% field 2, names and signatures
\begin{tabular}{p{70mm}cp{70mm}}
\multicolumn{1}{c}{
  \setbox0=\hbox{\agreeingsT{}\unskip}\ifdim\wd0=0pt
    % empty
  \else
    СОГЛАСОВАНО%
  \fi
} & & \multicolumn{1}{c}{УТВЕРЖДАЮ} \\
& & \\
\agreeingsT{} & & \approversT{} \\
\end{tabular}

\vskip 15mm

% field 3, program name, allcaps

%\makeatletter
\@title
%\makeatother

%\vskip 5mm

{ЛИСТ УТВЕРЖДЕНИЯ}

%\vskip 5mm

% field 4, document id, storage type

{{#1}--ЛУ}

%{\scriptsize (вид носителя данных)}

% field 5, number of sheets (only if > 1)
\pagesfield{endlu}

\vskip 20mm

% field 6,
\begin{tabular}{p{70mm}cp{70mm}}
\agreeingsB{} & & \approversB{} \\
\end{tabular}

% field 7, year
\vfill
{{\number\year}}
\end{center}
\label{endlu}
\thispagestyle{uspdluheadings}
}

\newcommand\TP[1]{{\markboth{{#1}}{{#1}}\setcounter{page}{1}\stamp{
\thispagestyle{uspdluheadings}

{УТВЕРЖДЕНО}

{{#1}--ЛУ}

\vskip 20mm

% field 1, organization
%\begin{center}
%{ОАО <<НПК <<НИИДАР>>}
%\end{center}

% field 2, names and signatures
{}

\vskip 20mm

% field 3, program name, allcaps
\begin{center}
\makeatletter
\@title
\makeatother

\end{center}

%\vskip 20mm

% field 4, document id, storage type
\begin{center}
{{#1}}
%{\scriptsize (вид носителя данных)}
\end{center}

% field 5, number of sheets (only if > 1)
\begin{center}
\pagesfield{enddoc}
\end{center}

% field 6,

% field 7, year
\vfill
\begin{center}
{{\number\year}}
\end{center}
}}
}}
  
\pgfkeys{
  /uspd/.cd,
  designation/.store in =\designation,
  abstract/.store in =\abstract,
  agreeingsT/.store in = \agreeingsT,
  agreeingsB/.store in = \agreeingsB,
  approversT/.store in = \approversT,
  approversB/.store in = \approversB,
  agreeingsT,agreeingsB,
  approversT,approversB
}

\newcommand{\uspdset}[1][]{
  \pgfkeys{/uspd/.cd,#1}
}

\newcommand{\columnOne}{.06\textwidth}
\newcommand{\columnTwo}{.06\textwidth}
\newcommand{\columnThree}{.06\textwidth}
\newcommand{\columnFour}{.06\textwidth}
\newcommand{\columnFive}{.08\textwidth}
\newcommand{\columnSix}{.10\textwidth}
\newcommand{\columnSeven}{.10\textwidth}
\newcommand{\columnEight}{.12\textwidth}
\newcommand{\columnNine}{.07\textwidth}
\newcommand{\columnTen}{.07\textwidth}

\newenvironment{changesheet}{%
\clearpage
\setlength{\tabcolsep}{0.5mm}
\newcolumntype{s}{>{\smallFont}c}
\newcolumntype{S}{>{\smallFont}c}
\noindent
\begin{longtable}{|*{10}{s|}}
\hline
\multicolumn{10}{|S|}{Лист регистрации изменений}\\\hline
&\multicolumn{4}{S|}{Номера листов (страниц)}&&&&&\\\cline{2-5}
\parbox[c]{\columnOne\tabcolsep-1.5\arrayrulewidth}{%
  \vspace{-\baselineskip}\centering\smallFont{Изм}}&
\parbox[c]{\columnTwo\tabcolsep-\arrayrulewidth}{%
  \centering\smallFont{из\-ме\-нён\-ных}}&
\parbox[c]{\columnThree\tabcolsep-\arrayrulewidth}{%
  \centering\smallFont{за\-ме\-нён\-ных}}&
\parbox[c]{\columnFour\tabcolsep-\arrayrulewidth}{%
  \centering\smallFont{но\-вых}}&
\parbox[c]{\columnFive\tabcolsep-\arrayrulewidth}{%
  \centering\smallFont{ан\-ну\-ли\-ро\-ван\-ных}}&
\parbox[c]{\columnSix\tabcolsep-\arrayrulewidth}{%
  \vspace{-\baselineskip}\centering\smallFont{Всего листов (страниц) в докум}}&
\parbox[c]{\columnSeven\tabcolsep-\arrayrulewidth}{%
  \vspace{-\baselineskip}\centering\smallFont{{\No} документа}}&
\parbox[c]{\columnEight\tabcolsep-\arrayrulewidth}{%
  \vspace{-\baselineskip}\centering\smallFont{Входящий {\No} сопроводительного докум и дата}\vspace{1mm}}&
\parbox[c]{\columnNine\tabcolsep-\arrayrulewidth}{%
  \vspace{-\baselineskip}\centering\smallFont{Подп}}&
\parbox[c]{\columnTen\tabcolsep-1.5\arrayrulewidth}{%
  \vspace{-\baselineskip}\centering\smallFont{Дата}}\\\hline
\endfirsthead
\hline
&\multicolumn{4}{S|}{Номера листов (страниц)}&&&&&\\\cline{2-5}
\parbox[c]{\columnOne-2\tabcolsep-1.5\arrayrulewidth}{%
  \vspace{-\baselineskip}\centering\smallFont{Изм}}&
\parbox[c]{\columnTwo-2\tabcolsep-\arrayrulewidth}{%
  \centering\smallFont{из\-ме\-нён\-ных}}&
\parbox[c]{\columnThree-2\tabcolsep-\arrayrulewidth}{%
  \centering\smallFont{за\-ме\-нён\-ных}}&
\parbox[c]{\columnFour-2\tabcolsep-\arrayrulewidth}{%
  \centering\smallFont{но\-вых}}&
\parbox[c]{\columnFive-2\tabcolsep-\arrayrulewidth}{%
  \centering\smallFont{ан\-ну\-ли\-ро\-ван\-ных}}&
\parbox[c]{\columnSix-2\tabcolsep-\arrayrulewidth}{%
  \vspace{-\baselineskip}\centering\smallFont{Всего листов (страниц) в докум}}&
\parbox[c]{\columnSeven-2\tabcolsep-\arrayrulewidth}{%
  \vspace{-\baselineskip}\centering\smallFont{{\No} документа}}&
\parbox[c]{\columnEight-2\tabcolsep-\arrayrulewidth}{%
  \vspace{-\baselineskip}\centering\smallFont{Входящий {\No} сопроводительного докум и дата}\vspace{1mm}}&
\parbox[c]{\columnNine-2\tabcolsep-\arrayrulewidth}{%
  \vspace{-\baselineskip}\centering\smallFont{Подп}}&
\parbox[c]{\columnTen-2\tabcolsep-1.5\arrayrulewidth}{%
  \vspace{-\baselineskip}\centering\smallFont{Дата}}\\\hline
\endhead
\hline
\endfoot}{\end{longtable}}

\renewcommand\tableofcontents{%
  \begingroup
  \uspd@sect@aligncenter
  \section*{\contentsname
    \@mkboth{%
      \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
  \endgroup
  \@starttoc{toc}}

\newcommand{\uspd@annotation}{
  \begingroup
  \uspd@sect@aligncenter
  \section*{Aннотация
    \@mkboth{%
      \MakeTextUppercase{Аннотация}}{\MakeTextUppercase{Аннотация}}}%
  \endgroup
  \abstract{}\newpage}

\newcommand\uspd@content{
  \sloppy
  \LU{\designation{}}
  \TP{\designation{}}
  \pagestyle{uspdnormheadings}
  \ifuspd@withinfo
  \uspd@annotation
  \tableofcontents
  \fi
}

\newcommand\uspd@changesheet{
  \begin{changesheet}
  &&&&&&&&&\\\hline
  &&&&&&&&&\\\hline
  &&&&&&&&&\\\hline
  &&&&&&&&&\\\hline
  &&&&&&&&&\\\hline
  &&&&&&&&&\\\hline
  &&&&&&&&&\\\hline
  &&&&&&&&&\\\hline
  &&&&&&&&&\\\hline
  &&&&&&&&&\\\hline
  &&&&&&&&&\\\hline
  &&&&&&&&&\\\hline
  &&&&&&&&&\\\hline
  &&&&&&&&&\\\hline
  &&&&&&&&&\\\hline
  &&&&&&&&&\\\hline
  &&&&&&&&&\\\hline
  &&&&&&&&&\\\hline
  &&&&&&&&&\\\hline
  &&&&&&&&&\\\hline
  &&&&&&&&&\\\hline
  &&&&&&&&&\\\hline
  &&&&&&&&&\\\hline
  &&&&&&&&&\\\hline
  &&&&&&&&&\\\hline
  &&&&&&&&&\\\hline
  &&&&&&&&&\\\hline
  &&&&&&&&&\\\hline
  \end{changesheet}
  }

\AtBeginDocument{\uspd@content}
\AtEndDocument{\uspd@changesheet}