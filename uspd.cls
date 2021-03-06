%% Copyright (c) Igor V. Merzlyakov, 2016
%%               Kirill V. Zaborsky, 2013
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

% Primary usage inscription
\newif\ifuspd@printusage\uspd@printusagefalse
\DeclareOption{printusage}{\uspd@printusagetrue}

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
\RequirePackage{suffix}

\setlength{\unitlength}{1mm}
\linespread{1.25} %\onehalfspacing
\setlength{\parindent}{12.5mm}
\setlength{\headsep}{12.5mm}

\newlength{\defindent}
\setlength{\defindent}{\parindent}

\newcommand{\No}{\textnumero{}}

\addto\captionsrussian{%
  \renewcommand{\figurename}{Рисунок}
}

% \makeatletter
% \renewcommand{\appendix}{\par%
%   \setcounter{section}{0}%
%   \setcounter{subsection}{0}%
%   \def\sectionname{\appendixname}%
%   \addcontentsline{toc}{section}{\appendixname}%
%   \gdef\thesection{\appendixname\hspace{12pt}\@arabic\c@section}%
% }

\newcommand{\toclesssec}[1]{
  \stepcounter{section}
  \section*{\arabic{section}.\quad#1}
}
\newcommand\hiddensec[1]{\toclesssec{#1}}% alias
\newcounter{appendix}
%\renewcommand{\theappendix}{\arabic{appendix}}
\newlength{\appskip}
\setlength{\appskip}{12pt}

\newcommand\uspdapp[1]{%
  \clearpage%
  \refstepcounter{appendix}%
  \setcounter{section}{0}%
  \setcounter{equation}{0}%
  \setcounter{figure}{0}%
  \setcounter{table}{0}%

  \renewcommand{\theappendix}{\arabic{appendix}}

  \renewcommand{\theequation}{\theappendix.\arabic{equation}}%
  \renewcommand{\thefigure}{\theappendix.\arabic{figure}}%
  \renewcommand{\thetable}{\theappendix.\arabic{table}}%
  \addcontentsline{toc}{section}{\appendixname\ \theappendix.\ #1}%
  \begin{flushright}\MakeUppercase\appendixname\ \theappendix\\ \end{flushright}%
  \begin{center}\MakeTextUppercase{ #1} \end{center}
  \par\nobreak\addvspace{\appskip}}

\WithSuffix\newcommand\uspdapp*[1]{%
  \clearpage%
  \renewcommand{\theappendix}{\unskip}% for references
  \refstepcounter{appendix}%
  \setcounter{section}{0}%
  \setcounter{equation}{0}%
  \setcounter{figure}{0}%
  \setcounter{table}{0}%

  \renewcommand{\theequation}{\arabic{equation}}%
  \renewcommand{\thefigure}{\arabic{figure}}%
  \renewcommand{\thetable}{\arabic{table}}%
  \addcontentsline{toc}{section}{\appendixname.\ #1}%
  \begin{flushright}\MakeUppercase\appendixname\\\end{flushright}%
  \begin{center}\MakeTextUppercase{ #1} \end{center}
  \par\nobreak\addvspace{\appskip}}

\DeclareCaptionLabelSeparator{dash}{ -- }
\captionsetup[table]{%
labelsep=dash,justification=raggedright,singlelinecheck=false,%
aboveskip=3mm,belowskip=0mm}
\captionsetup[figure]{%
labelsep=dash,justification=centering,singlelinecheck=false,%
aboveskip=3mm,belowskip=3mm}


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
\setcounter{secnumdepth}{5}

\newcommand{\point}{\par\refstepcounter{subsubsection}\thesubsubsection.\quad}   % пункт
\newcommand{\subpoint}{\par\refstepcounter{paragraph}\thesubpoint.\quad}         % подпункт
\newcommand{\subsubpoint}{\par\refstepcounter{subparagraph}\thesubsubpoint.\quad}% подподпункт

\newcommand{\thepoint}{\thesubsection.\arabic{subsubsection}}
\newcommand{\thesubpoint}{\thepoint.\arabic{paragraph}}
\newcommand{\thesubsubpoint}{\thesubpoint.\arabic{subparagraph}}

\newcommand{\overpoint}{{\par\refstepcounter{subsection}\thesubsection\quad}}
\newcommand{\overoverpoint}{{\par\refstepcounter{section}\thesection\quad}}

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
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\parindent}%
                                     {1pt}%
                                     {1pt}%
                                     {\uspd@sect@alignleft\uspd@subsubsect@style}}

%\renewcommand{\thesection}{\arabic{section}}
%\renewcommand{\thesubsection}{\thesection.\arabic{subsection}}
% \renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}

\righthyphenmin=2
\sloppy

\setlength{\topsep}{0pt}
\renewcommand{\itemize}{\asparaitem}
\renewcommand{\enumerate}{\asparaenum}
\renewcommand{\description}{\asparadesc}

\renewcommand\paradescriptionlabel[1]{\normalfont #1}

\renewcommand{\cftsecfont}{\normalfont}
\renewcommand{\cftsecpagefont}{\normalfont}
\renewcommand{\cftsubsecindent}{\cftsecindent}
\newlength{\onenumwidth}
\settowidth{\onenumwidth}{1.1}
\addtolength{\cftsecnumwidth}{\onenumwidth}
\newlength{\numwidth}
\settowidth{\numwidth}{1}
\addtolength{\cftsubsecnumwidth}{\numwidth}

\renewcommand{\cftsecaftersnum}{.}
\renewcommand{\cftsubsecaftersnum}{\cftsecaftersnum}
\renewcommand{\cftdotsep}{\cftnodots}
\renewcommand{\cftbeforesecskip}{\cftbeforesubsecskip}

% font definitions
\newcommand{\fontShape}{\normalfont}
\newcommand{\smallFontSize}{\fontsize{10pt}{12pt}}
\newcommand{\smallFont}{%
  \smallFontSize\selectfont\fontShape}

\newcommand\stamp[2]{{
\newpage
\noindent\begin{picture}(0,0)(0,0)
\put(-12,-252){\framebox(12,145)}
\put(-7,-252){\line(0,1){145}}
\put(-12,-142){\line(1,0){12}}
\put(-12,-167){\line(1,0){12}}
\put(-12,-192){\line(1,0){12}}
\put(-12,-227){\line(1,0){12}}
\put(-11,-251){\begin{sideways}\parbox[t]{25mm}{\smallFont Инв. \No{} подп.}\end{sideways}}
\put(-11,-226){\begin{sideways}\parbox[t]{35mm}{\smallFont Подп. и дата}\end{sideways}}
\put(-11,-191){\begin{sideways}\parbox[t]{25mm}{\smallFont Взам инв. \No}\end{sideways}}
\put(-11,-166){\begin{sideways}\parbox[t]{25mm}{\smallFont Инв. \No{} дубл.}\end{sideways}}
\put(-11,-141){\begin{sideways}\parbox[t]{35mm}{\smallFont Подп. и дата}\end{sideways}}
\ifuspd@printusage
  \setbox0=\hbox{#1\unskip}
  \ifdim\wd0=0pt
    % empty
  \else
    \put(-12,-61){\framebox(12,45)}
    \put(-7,-61){\line(0,1){45}}
    \put(-11,-49){\begin{sideways}\parbox[t]{45mm}{\smallFont Перв. примен.}\end{sideways}}%
    \put(-5,-49){\begin{sideways}\parbox[t]{45mm}{\smallFont #1}\end{sideways}}%
  \fi
\fi
\end{picture}
#2
\newpage
}}

\newcommand\signfield[1]{{\phantom{ЖЖЖЖЖ}}~{#1}}
\newcommand\datefield{<<\underline{\phantom{Ж}}>>~\underline{\phantom{ЖЖЖЖ}}~{\number\year}~г.}
\newcommand\signeefield[3]{#1\newline\signfield{#2}\newline\datefield\newline\newline}
\newcommand\pagesfield[1]{\ifthenelse{\pageref{#1} > 1}{Листов \pageref{#1}}{}}
\renewcommand{\labelitemi}{--}
\newcommand\LU[1]{\markboth{{#1}--ЛУ}{{#1}--ЛУ}\setcounter{page}{1}
\thispagestyle{uspdnormheadings}\stamp{}{
% field 0, label
%{\noindent\hfill Совершенно секретно}

\begin{center}

% field 1, organization
%{ОАО <<НПК <<НИИДАР>>}

% field 2, names and signatures
\begin{tabular}{p{70mm}cp{85mm}}
\multicolumn{1}{c}{
  \setbox0=\hbox{\agreeingsT{}\unskip}\ifdim\wd0=0pt
    % empty
  \else
    СОГЛАСОВАНО%
  \fi
} & & \multicolumn{1}{c}{УТВЕРЖДАЮ} \\
%& & \\
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
\begin{tabular}{p{80mm}cp{80mm}}
\agreeingsB{} & & \approversB{} \\
\end{tabular}

% field 7, year
\vfill
{{\number\year}}
\end{center}
\label{endlu}
\thispagestyle{uspdluheadings}
}

\newcommand\TP[1]{{\markboth{{#1}}{{#1}}\setcounter{page}{1}\stamp{\primaryusage}{
\thispagestyle{uspdluheadings}

{УТВЕРЖДЕН}

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
  primaryusage/.store in =\primaryusage,
  agreeingsT/.store in = \agreeingsT,
  agreeingsB/.store in = \agreeingsB,
  approversT/.store in = \approversT,
  approversB/.store in = \approversB,
  agreeingsT,agreeingsB,
  approversT,approversB,
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
%\hline
\endfoot}{\end{longtable}}

\renewcommand\tableofcontents{%
  \begingroup
  \uspd@sect@aligncenter
  \section*{\contentsname
    \@mkboth{%
      \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
  \endgroup
  \@starttoc{toc}\newpage}

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
\AtEndDocument{
\ifnum \thepage > 2
  \uspd@changesheet
\fi\label{enddoc}}