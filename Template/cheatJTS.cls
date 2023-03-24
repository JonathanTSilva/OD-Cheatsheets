\ProvidesClass{cheatJTS}[July 28th 2022, v1.0.0]
\NeedsTeXFormat{LaTeX2e}
\LoadClass{article}

%============================================================
%------------------------- PACKAGES -------------------------
%============================================================

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
%\RequirePackage{fontspec}
\RequirePackage{amssymb, amsmath, amsthm, amsfonts}
\RequirePackage[table]{xcolor}
\RequirePackage{fancyhdr}
\RequirePackage{multicol, multirow}
\RequirePackage[landscape]{geometry}
\RequirePackage{graphicx}
\RequirePackage{hyperref}
\RequirePackage{lipsum}
\RequirePackage{academicons}
\RequirePackage{ifthen}
\RequirePackage{globalvals}
% \RequirePackage{tabularx}
% \RequirePackage{longtable}
% \RequirePackage{xltabular}
\RequirePackage{supertabular}
\RequirePackage{tikz}
\RequirePackage{booktabs}
\RequirePackage[os=win]{menukeys}

%============================================================
%-------------------------- FONTS ---------------------------
%============================================================

%----- FIRA SANS THIN -----
\RequirePackage[thin, extralight]{FiraSans} %% option 'sfdefault' activates Fira Sans as the default text font
\renewcommand*\oldstylenums[1]{{\firaoldstyle #1}}

%----- ROBOTO LIGHT CONDENSED -----
\RequirePackage[sfdefault, light, condensed]{roboto}  %% Option 'sfdefault' only if the base font of the document is to be sans serif

%============================================================
%-------------------------- CONFIG --------------------------
%============================================================

\def\Title{\useVal{title}}
\setlength\parindent{0pt}
\setcounter{secnumdepth}{0}

%============================================================
%------------------------- OPTIONS --------------------------
%============================================================

%----- GEOMETRY -----
\geometry{
    a4paper,
    top=1.5cm,
    left=1cm,
    right=1cm,
    bottom=1.5cm,
    headheight=1cm,
    headsep=0.4cm,
    footskip=0.7cm
}

%----- HYPERREF -----
\hypersetup{
    bookmarks = true,
    unicode = false,
    pdftoolbar = true,
    pdfmenubar = true,
    pdffitwindow = false,
    pdfstartview = {FitV},
    pdftitle = {\@title},
    pdfauthor = {\useVal{author}},
    pdfsubject = {\useVal{subject}},
    pdfkeywords = {\useVal{keywords}},
    pdfnewwindow = true,
    colorlinks = true,
    pdfborder = {0 0 0},
    linkcolor = blue,
    citecolor = green,
    filecolor = cyan,
    urlcolor = black
}

%----- FANCYHDR -----
\newcommand{\changefont}{%
    \fontsize{7}{9}\selectfont
}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\rhead{\textcolor{gray}{\useVal{title}}}
\cfoot{\textcolor{gray}{\changefont \textbf{Copyright © 2022 \href{https://www.github.com/JonathanTSilva}{JonathanTSilva}} \\ 
Other cheatsheets, round-ups and quick guide available at \href{https://www.github.com/JonathanTSilva/OD-Cheatsheets}{github.com/JonathanTSilva/OD-Cheatsheets}
}}

%----- TIKZ -----
\usetikzlibrary{positioning, shadows, calc}

%----- MENUKEYS -----
\renewmenumacro{\menu}[>]{roundedmenus}
\renewmenumacro{\directory}{pathswithfolder}
% \newmenustyle*{pathswithfolder}[pre]{style}[sep]{mid}{last}{single}[post]{theme}

%============================================================
%--------------------- NEW ENVIRONMENTS ---------------------
%============================================================

\newenvironment{topics}
    {
        \rowcolors{2}{gray!10}{white}
        \begin{supertabular*}{\linewidth}{AB}
            \toprule
    }
    {
        \end{supertabular*}
    }

\newenvironment{onetopic}
    {
        \vspace*{-3.8pt}
        \noindent\rule[0.5ex]{\linewidth}{0.8pt}
    }

\newenvironment{cheatsheet}
    {
        \footnotesize
        \begin{multicols}{3}
            \changenewpage
            \setlength{\premulticols}{0pt}
            \setlength{\postmulticols}{0pt}
            \setlength{\multicolsep}{1pt}
            \setlength{\columnsep}{1.8em}
            \maketitle
    }
    {
        \end{multicols}
    }

\maxdeadcycles=5000
\makeatletter
    \let\mcnewpage\newpage
    \newcommand{\changenewpage}{%
    \renewcommand\newpage{%
        \if@firstcolumn
        \hrule width\linewidth height0pt
        \columnbreak
        \else
        \mcnewpage
        \fi
    }}
\makeatother

%============================================================
%---------------------- NEW COMMANDS ----------------------
%============================================================

\makeatletter
\renewcommand{\section}{
    \@startsection{section}{1}{0mm}
        {-1ex plus -.5ex minus -.2ex}
        {0.5ex plus .2ex}
        {\firathin\large}
}
\renewcommand{\subsection}{
    \@startsection{subsection}{2}{0mm}
        {-1explus -.5ex minus -.2ex}
        {0.5ex plus .2ex}
        {\firathin\normalsize\itshape}
}
\renewcommand{\subsubsection}{
    \@startsection{subsubsection}{3}{0mm}
        {-1ex plus -.5ex minus -.2ex}
        {1ex plus .2ex}
        {\firathin\small\itshape}
}
% \renewcommand\tabularxcolumn[1]{m{#1}}
% \newcolumntype{A}{>{\raggedright\arraybackslash\hsize=.4\hsize\bfseries}X}
% \newcolumntype{B}{>{\raggedright\arraybackslash\hsize=.6\hsize}X}
% \newcolumntype{L}{>{\raggedright\arraybackslash}X}
% \newcolumntype{R}{>{\raggedleft\arraybackslash}X}
\newcolumntype{A}{>{\raggedright\arraybackslash\bfseries}m{0.305\linewidth}}
\newcolumntype{B}{>{\raggedright\arraybackslash}m{0.60\linewidth}}

\renewcommand{\maketitle}{
    
    \fancyhf{}
    \cfoot{\textcolor{gray}{\changefont Copyright © 2022 \href{https://www.github.com/JonathanTSilva}{JonathanTSilva} \\ 
    Other cheatsheets, round-ups and quick guide available at \href{https://www.github.com/JonathanTSilva/OD-Cheatsheets}{github.com/JonathanTSilva/OD-Cheatsheets}
    }}

    \begin{tikzpicture}
        \node[minimum height=1.2cm, minimum width=\linewidth, inner sep=0] % fill=gray!30
                (A) at (0,0) {};
        \node[inner sep=0, right=1mm of A.west] (B) {\useVal{logo}};
        \node[inner sep=0, right=2mm of B.east, text width=7cm] {\scalebox{0.9}[1.0]{\Huge\useVal{title}} \\ \firathin\useVal{author}};
    \end{tikzpicture}
    \vspace*{0.5px}
}

\makeatother

%============================================================
%-------------------------- COLORS --------------------------
%============================================================

%============================================================
%------------------------ SET COLORS ------------------------
%============================================================

%============================================================
%------------------------ STRUCTURE -------------------------
%============================================================
