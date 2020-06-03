\NeedsTeXFormat{LaTeX2e}[95/06/01]
\ProvidesClass{thesis}
              [2002/01/24 Version 1.2]
%\typeout{}
\typeout{---------------------------------------------------------------}
\typeout{ Thesis Class (thesis.cls) version 1.3 ***ALPHA***, 2004}
\typeout{}
\typeout{ This is a modified version of kthesis, the "KTH Thesis class".}
\typeout{ Original copyright unknown.}
\typeout{ Modifications (c) 2002, 2003, 2004 R. Armiento & T. Ersmark}
\typeout{               (c) 2004 S. Orsi}
\typeout{---------------------------------------------------------------}
\typeout{}
\newcommand\@ptsize{10}
\newif\if@mainmatter \@mainmatterfalse
\newif\if@openright  \@openrighttrue
\newif\if@foreginabstract \@foreginabstractfalse
\newif\if@foreginlanguage \@foreginlanguagefalse
\newif\if@nocover \@nocovertrue
\newif\if@onlycover \@onlycoverfalse
\@twosidetrue
\DeclareOption{g5paper}%
   {\setlength\paperheight {240mm}%
    \setlength\paperwidth  {170mm}%
    \setlength\textheight  {43pc}%
    \setlength\textwidth   {30pc}}
\DeclareOption{s5paper}%
   {\setlength\paperheight {242mm}%
    \setlength\paperwidth  {165mm}%
    \setlength\textheight  {44pc}%
    \setlength\textwidth   {29pc}}
\DeclareOption{a4paper}%
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}%
    \setlength\textheight  {49pc}%
    \setlength\textwidth   {33pc}}
\DeclareOption{letterpaper}%
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}%
    \setlength\textheight  {47pc}%
    \setlength\textwidth   {36pc}}
\DeclareOption{9pt}{\renewcommand\@ptsize{9}}
\DeclareOption{10pt}{\renewcommand\@ptsize{10}}
\DeclareOption{11pt}{\renewcommand\@ptsize{11}}
\DeclareOption{12pt}{\renewcommand\@ptsize{12}}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}
\DeclareOption{coverpage}{\@nocoverfalse}
\DeclareOption{nocoverpage}{\@nocovertrue}
\DeclareOption{onlycoverpage}{\@onlycovertrue\@nocoverfalse}
\DeclareOption{onlytext}{\@onlycovertrue\@nocovertrue}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}
\DeclareOption*{%
   \if@foreginlanguage
     \PackageWarning{thesis}{Already defined a foregin language. Option `\CurrentOption' not understood and ignored.}%
   \else
     \@foreginlanguagetrue
     \typeout{Foregin language: \CurrentOption}
     \edef\@thesisforeginlanguage{\CurrentOption}
   \fi
}
\ExecuteOptions{s5paper,10pt,final,openright}
\ProcessOptions
\RequirePackage{graphics}
%\RequirePackage{tabularx}
% \RequirePackage{overcite}
%\RequirePackage{pstricks,pst-grad}
\if@foreginlanguage\RequirePackage[\@thesisforeginlanguage,english]{babel}\fi
\input{kthbk\@ptsize.clo}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\clubpenalty=9996
\widowpenalty=9999
\brokenpenalty=4991
\predisplaypenalty=10000
\postdisplaypenalty=1549
\displaywidowpenalty=1602
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}
\def\leftmark{\expandafter\@firstoftwo\firstmark{}{}}
\def\rightmark{\expandafter\@secondoftwo\botmark{}{}}
  \def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{\thepage\hfil{\itshape\leftmark}}%
      \def\@oddhead{{\itshape\rightmark}\hfil\thepage}%
      \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markboth {%
        \ifnum \c@secnumdepth >\m@ne
          \if@mainmatter
            \@chapapp\ \thechapter. \ %
          \fi
        \fi
        ##1}{}}%
    \def\sectionmark##1{%
      \markright {%
        \ifnum \c@secnumdepth >\z@
          \thesection. \ %
        \fi
        ##1}}}
\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil{\itshape\leftmark}}%
    \def\@oddhead{{\itshape\rightmark}\hfil\thepage}%
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
    \let\sectionmark\@gobble
    }
\def\title#1{\ifx#1[\let\next\@bracket@title\else%
  \gdef\@title{#1}\gdef\@shorttitle{\@title}\let\next\relax\fi\next}
\def\subtitle#1{\@subtitletrue \gdef\@subtitle{#1}}
\def\@bracket@title#1]#2{\gdef\@shorttitle{#1}\gdef\@title{#2}}
\def\author#1{\ifx#1[\@bracket@author\else%
  \gdef\@author{#1}\gdef\@shortauthor{\@author}\fi}
\def\@bracket@author#1]#2{\gdef\@shortauthor{#1}\gdef\@author{#2}}
\def\type#1{\gdef\@type{#1}}
\def\comment#1{\gdef\@comment{#1}}
\def\foregincomment#1{\@foregincommenttrue \gdef\@foregincomment{#1}}
\def\department#1{\gdef\@department{#1}}
\def\division#1{\@divisiontrue \gdef\@division{#1}}
\def\centercomment#1{\@centercommenttrue \gdef\@centercomment{#1}}
\def\address#1{\gdef\@address{#1}}
\def\shortdate#1{\gdef\@shortdate{#1}}
\def\city#1{\gdef\@city{#1}}
\def\copyrightline#1{\gdef\@copyrightline{#1}}
\def\country#1{\gdef\@country{#1}}
\def\publisher#1{\gdef\@publisher{#1}}
\def\trita#1{\gdef\@trita{#1}}
%\def\issn#1{\gdef\@issn{#1}}
%\def\isrn#1{\gdef\@isrn{#1}}
\def\isbn#1{\@isbntrue \gdef\@isbn{#1}}
\def\dedication#1{\@dedicationtrue \gdef\@dedication{#1}}
\def\intropoetry#1{\@intropoetrytrue \gdef\@intropoetry{#1}}
\def\cplogo#1{\@cplogotrue \gdef\@cplogo{#1}}
\def\cplogonblines#1{\@cplogonblinestrue \gdef\@cplogonblines{#1}}
\def\cpillustration#1{\@cpillustrationtrue \gdef\@cpillustration{#1}}
\def\innerlogo#1{\@innerlogotrue \gdef\@innerlogo{#1}}
\def\extracplogo#1{\@extracplogotrue \gdef\@extracplogo{#1}}
\def\extrainnerlogo#1{\@extrainnerlogotrue \gdef\@extrainnerlogo{#1}}
\def\extrainstitute#1{\@extrainstitutetrue \gdef\@extrainstitute{#1}}
\def\extradepartment#1{\gdef\@extradepartment{#1}}
\def\extradivision#1{\@extradivisiontrue \gdef\@extradivision{#1}}
\def\extraaddress#1{\gdef\@extraaddress{#1}}
\newif\if@isbn \@isbnfalse
\newif\if@dedication \@dedicationfalse
\newif\if@intropoetry \@intropoetryfalse
\newif\if@subtitle \@subtitlefalse
\newif\if@division \@divisionfalse
\newif\if@centercomment \@centercommentfalse
\newif\if@innerlogo \@innerlogofalse
\newif\if@cplogo \@cplogofalse
\newif\if@cplogonblines \@cplogonblinesfalse
\newif\if@cpillustration \@cpillustrationfalse
\newif\if@extracplogo \@extracplogofalse
\newif\if@extrainnerlogo \@extrainnerlogofalse
\newif\if@extrainstitute \@extrainstitutefalse
\newif\if@extradivision \@extradivisionfalse
\newif\if@foregincomment \@foregincommentfalse
\def\@shortauthor{\@author}
\def\@shorttitle{\@title}
\def\@type{\@latex@warning{No report type given}}
\def\@comment{\relax}
\def\@city{\@latex@warning{No city given}}
\def\@copyrightline{\@latex@warning{No copyrightline given}}
\def\@shortdate{\@latex@warning{No shortdate given}}
\def\@country{\@latex@warning{No country given}}
\def\@institute{Royal Institute of Technology}
\def\@department{\@latex@warning{No department given}}
\def\@address{\@latex@warning{No address given}}
\def\@publisher{\@latex@warning{No publisher given}}
\def\@trita{\@latex@warning{No TRITA number given}}
%\def\@issn{\@latex@warning{No ISSN given}}
%\def\@isrn{\@latex@warning{No ISRN given}}
\def\@extraaddress{\if@extrainstitute\@latex@warning{No extraadress given}\fi}
\let\thanks\empty


\newlength{\topleftx}%
\setlength{\topleftx}{\oddsidemargin}%
\addtolength{\topleftx}{\hoffset}%
\addtolength{\topleftx}{1in}%
\newlength{\toplefty}%
\setlength{\toplefty}{\headsep}%
\addtolength{\toplefty}{\headheight}%
\addtolength{\toplefty}{\topmargin}%
\addtolength{\toplefty}{\topskip}%
\addtolength{\toplefty}{\voffset}%
\addtolength{\toplefty}{1in}%
\newlength{\pputxcoord}%
\newlength{\pputycoord}%
\newlength{\cptmplength}
\newlength{\cptmplengthh}
\newlength{\cptmplengthhh}
\setlength{\unitlength}{1pt}%
\newcommand{\pput}[3]{\begin{picture}(0,0)%
                         \setlength{\pputxcoord}{-\topleftx}%
                         \setlength{\pputycoord}{\toplefty}%
                         \addtolength{\pputxcoord}{#1}%
                         \addtolength{\pputycoord}{-#2}%
                         \linethickness{0.01mm}%
                         \put(\strip@pt\pputxcoord,\strip@pt\pputycoord){#3}%
                      \end{picture}}%
\newcommand{\cpbox}[5]{\pput{#1}{#2}{\begin{minipage}[t][#4][b]{#3}#5\end{minipage}}%
%                            \setlength{\cptmplength}{#1}%
%                            \addtolength{\cptmplength}{#3}%
%                            \setlength{\cptmplengthh}{#2}%
%                            \addtolength{\cptmplengthh}{#4}%
%                            \pput{#1}{#2}{\circle{2}}%
%                            \pput{\cptmplength}{#2}{\circle{2}}%
%                            \pput{#1}{\cptmplengthh}{\circle{2}}%
%                            \pput{\cptmplength}{\cptmplengthh}{\circle{2}}%
                           }%
\newcommand{\cptextbox}[5]{\cpbox{#1}{#2}{#3}{#4}{\begin{flushright}{#5 \par}\end{flushright}\vfill~}}%
\newcommand{\cpbigblob}[2]{\pput{#1}{#2}{\circle{1}}%
\pput{#1}{#2}{\circle{5}}%
\pput{#1}{#2}{\circle{10}}%
\pput{#1}{#2}{\circle{15}}%
\pput{#1}{#2}{\circle{20}}%
}

\newcommand\@make@cover@page{%
\thispagestyle{empty}%
\noindent%
% \cpbigblob{0pt}{0pt}%
% \cpbigblob{\paperwidth}{0pt}%
% \cpbigblob{0pt}{\paperheight}%
% \cpbigblob{\paperwidth}{\paperheight}%
% \pput{\topleftx}{\toplefty}{\circle*{1}}%
%if g5paper/a4paper
\newlength{\cpxsc}%
\newlength{\cpysc}%
\newlength{\cplmargin}%
\newlength{\cptopskip}%
\newlength{\cptextwidth}%
\setlength{\cpxsc}{0.007874\paperwidth}%
\setlength{\cpysc}{0.005587\paperheight}%
\setlength{\cplmargin}{7\cpxsc}%
\setlength{\cptextwidth}{72\cpxsc}%
%
\cptextbox{\cplmargin}{17.5\cpysc}{\cptextwidth}{49.3mm}{\sffamily \Huge \@title}%
\if@subtitle%
   \cptextbox{\cplmargin}{55.5\cpysc}{\cptextwidth}{23.75\cpysc}{\sffamily \large \@subtitle}%
\fi%
\cptextbox{\cplmargin}{79.8\cpysc}{\cptextwidth}{8\cpysc}{\sffamily \Large \MakeUppercase{\@author}}%
\if@cpillustration%
   \settowidth{\cptmplength}{\includegraphics[height=63\cpysc]{\@cpillustration}}%
   \addtolength{\cptmplength}{\cplmargin}%
   \ifdim\cptmplength>\cptextwidth%
      \cpbox{\cplmargin}{87.8\cpysc}{\cptextwidth}{63\cpysc}{~\vfill\begin{flushright}\includegraphics[width=\cptextwidth]{\@cpillustration
}\end{flushright}\vfill~}%
   \else%
      \cpbox{\cplmargin}{87.8\cpysc}{\cptextwidth}{63\cpysc}{\begin{flushright}\includegraphics[height=63\cpysc]{\@cpillustration
}\end{flushright}}%
   \fi%
\fi%
\cptextbox{\cplmargin}{155.8\cpysc}{\cptextwidth}{22.75\cpysc}{\sffamily \Large \@type\\ \@city, \@country\ \@shortdate}%
\if@cplogo%
   \setlength{\cptmplength}{24\cpysc}%
   \if@cplogonblines%
      \addtolength{\cptmplength}{2.2\cpysc}%
      \setlength{\cptmplengthh}{2.2\cpysc}%
      \addtolength{\cptmplength}{\@cplogonblines\cptmplengthh}%
   \fi%
   \cpbox{85.25\cpxsc}{68.75\cpysc}{41\cpxsc}{34\cpysc}{\centering\includegraphics[height=\cptmplength]{\@cplogo}\vfill~}%
\fi%
% \pput{85.25\cpxsc}{93.75\cpysc}{\circle*{30}}%
% \pput{0pt}{0pt}{\begin{minipage}[t][5cm][b]{5cm}\begin{center}L\end{center}\vfill\begin{center}X\end{center}\end{minipage}}%
% \pput{0pt}{0pt}{\circle*{1}}%
% \pput{5cm}{0pt}{\circle*{3}}%
% \pput{0pt}{5cm}{\circle*{3}}%
% \pput{5cm}{5cm}{\circle*{3}}%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% IMPORTANT
% \begin{picture}(0,0)%
%    \linethickness{0.01mm}%
%    \put(0,0){\circle{1}}%
%    \put(0,0){\circle{3}}%
%    \put(0,0){\circle{5}}%
%    \put(-\strip@pt\oddsidemargin,10){\circle{2}}%
%    \put(-\strip@pt\hoffset,20){\circle{2}}%
%    \put(-\strip@pt\topleftx,30){\circle{3}}%
% \end{picture}%
% \begin{picture}(0,0)%
%    \linethickness{0.01mm}%
%    \put(0,0){\circle*{2}}%
%    \put(10,\strip@pt\headsep){\circle*{2}}%
%    \put(20,\strip@pt\headheight){\circle*{2}}%
%    \put(30,\strip@pt\topmargin){\circle*{2}}%
%    \put(40,\strip@pt\topskip){\circle*{2}}%
%    \put(50,\strip@pt\voffset){\circle*{2}}%
%    \put(60,\strip@pt\toplefty){\circle*{3}}%
% \end{picture}%
% /IMPORTANT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   \setcounter{footnote}{0}%
}

% \begin{picture}(0,0)%
%    \linethickness{0.01mm}%
%    \put(\strip@pt\topleftx,\strip@pt\toplefty){\circle{3}}%
% \end{picture}%
% \pput{0pt}{0pt}{\circle{5}}%
% \pput{\paperwidth}{0pt}{\circle{2}}%
% \pput{\paperwidth}{0pt}{\circle{5}}%
% \pput{\paperwidth}{0pt}{\circle{15}}%
% \newlength{\cmlength}%
% \setlength{\cmlength}{5cm}%
% \begin{picture}(0,0)%
%    \put(0,0){\begin{minipage}[t][5cm][b]{5cm}\begin{center}L\end{center}\end{minipage}}%
%    \put(0,0){\circle*{1}}%
%    \put(\strip@pt\cmlength,0){\circle*{3}}%
%    \put(0,-\strip@pt\cmlength){\circle*{3}}%
%    \put(\strip@pt\cmlength,-\strip@pt\cmlength){\circle*{3}}%
% %    \put(0,0){\circle*{1}}%
% \end{picture}%
% \pput{9.3mm}{23mm}{\begin{minipage}[t]{95.3mm}\begin{center}{\sffamily \huge \@title \par}\end{center}\end{minipage}}%
%
% \vglue-\headheight\vglue-\headsep\vglue-\topmargin\vglue-\topskip\vglue-\voffset%
% \begingroup%
%   \begingroup
% %
%    \newlength{\oldtextheight}
%    \setlength{\oldtextheight}{\textheight}
%    \addtolength{\textwidth}{1in}%
%    \addtolength{\textwidth}{\oddsidemargin}%
%    \addtolength{\textwidth}{\marginparsep}%
%    \addtolength{\textwidth}{\marginparwidth}%
%    \addtolength{\textheight}{1in}%
%    \addtolength{\textheight}{\topmargin}%
%    \addtolength{\textheight}{\headheight}%
%    \addtolength{\textheight}{\headsep}%
%    \addtolength{\textheight}{\footskip}%
%    \setlength{\hoffset}{-1in}%
%    \setlength{\voffset}{-1in}%
%    \setlength{\oddsidemargin}{0pt}%
%    \setlength{\topmargin}{0pt}%
%    \setlength{\topskip}{0pt}
%    \setlength{\headheight}{0pt}%
%    \setlength{\headsep}{0pt}%
%    \setlength{\marginparsep}{0pt}%
%    \setlength{\marginparwidth}{0pt}%
%    \setlength{\footskip}{0pt}%
%    \setlength{\textwidth}{\paperwidth}%
%    \setlength{\textheight}{\paperheight}%
%    \addtolength{\textwidth}{-10mm}%
%    \addtolength{\textheight}{-10mm}%
% \unitlength1mm
% \begin{picture}(0,0)%
% \put(0,0){\makebox(\number\textwidth,\number\textheight)[t]{HEJ}}%
% \end{picture}%
%    \unitlength1sp %sp is scaled point, the internal TeX-length
% \begin{picture}(0,0)%
% \linethickness{0.01mm}%
% \put(0,-\number\textheight){\framebox(\number\textwidth,\number\textheight){}}%
% \put(0,0){\makebox(\number\textwidth,\number\textheight){HEJ}}%
% \end{picture}%









% %          \begin{minipage}[c][1\sepheight][c]{0.995\columnwidth}%
% %             \hfill%
% %          \end{minipage}%
% % \circle[*]{diameter}
% %    \newrgbcolor{kthcolor}{0. 0.45 1.0}%
% % %    \psframebox[linecolor=black,linewidth=1mm]{%
% %       \begin{minipage}[t][0.99\textheight][t]{0.99\textwidth}%
% %          \psframebox*[fillcolor=kthcolor,linecolor=black,linewidth=3mm]{%
%    \begin{minipage}[t][0.99\oldtextheight][t]{\textwidth}%
% \begin{picture}(0,0)%
% \linethickness{0.01mm}%
% \put(0,-\number\textheight){\framebox(\number\textwidth,\number\textheight){}}%
% \end{picture}%
%       \begin{minipage}[t][0.99\oldtextheight][t]{0.69\textwidth}%
% \begin{picture}(0,0)%
% \linethickness{0.01mm}%
% \put(0,-\number\textheight){\framebox(\number\textwidth,\number\textheight){}}%
% \end{picture}%
%       \begin{center}
%          \vspace{0.055\oldtextheight}
%          \begin{minipage}[t][0.285\oldtextheight][t]{0.87\textwidth}%
%             \begin{picture}(0,0)%
%             \linethickness{0.01mm}%
%             \put(0,-\number\textheight){\framebox(\number\textwidth,\number\textheight){}}%
%             \end{picture}%
%             \begin{flushright}%
%                {\sffamily \huge HEJ \par}%
%             \end{flushright}%
%          \end{minipage}\\%
%          \begin{minipage}[t][0.165\oldtextheight][t]{0.87\textwidth}%
%             \begin{picture}(0,0)%
%             \linethickness{0.01mm}%
%             \put(0,-\number\textheight){\framebox(\number\textwidth,\number\textheight){}}%
%             \end{picture}%
%             \begin{flushright}%
%                \if@subtitle%
%                   {\sffamily \normalsize \@subtitle \par}%
%                \fi%
%             \end{flushright}%
%          \end{minipage}\\%
%          \begin{minipage}[t][][t]{0.87\textwidth}%
%             \begin{picture}(0,0)%
%             \linethickness{0.01mm}%
%             \put(0,-\number\textheight){\framebox(\number\textwidth,\number\textheight){}}%
%             \end{picture}%
%             \begin{flushright}%
%                {\sffamily \Large \MakeUppercase{\@author} \par}%
%             \end{flushright}%
%          \end{minipage}%
%          \end{center}%
%          \begin{minipage}[t][0.47\oldtextheight][t]{\textwidth}%
%             \begin{picture}(0,0)%
%             \linethickness{0.01mm}%
%             \put(0,-\number\textheight){\framebox(\number\textwidth,\number\textheight){}}%
%             \end{picture}%
%             \begin{flushright}%
%                \includegraphics[height=0.47\oldtextheight]{kth_physics_svv.eps}%
%             \end{flushright}%
%          \end{minipage}%
%          \begin{minipage}[b][][b]{0.87\textwidth}%
%          \begin{center}
%          \begin{minipage}[b][0.1\oldtextheight][t]{0.87\textwidth}%
%             \begin{picture}(0,0)%
%             \linethickness{0.01mm}%
%             \put(0,-\number\textheight){\framebox(\number\textwidth,\number\textheight){}}%
%             \end{picture}%
%             \begin{flushright}%
%                {\sffamily \Large \@type\\ \@city, \@country\ \@shortdate \par}%
%             \end{flushright}%
%          \end{minipage}%
%          \end{center}
%          \end{minipage}%
%
%       \end{minipage}%
%       \begin{minipage}[t]{0.31\textwidth}%
% \begin{picture}(0,0)%
% \linethickness{0.01mm}%
% \put(0,-\number\textheight){\framebox(\number\textwidth,\number\textheight){}}%
% \end{picture}%
%          \vspace*{0.48\oldtextheight}
%          \begin{center}%
%             \@cplogo%
%          \end{center}
%       \end{minipage}%
%    \end{minipage}%
%
%
%    \begin{minipage}[t][0.99\textheight][t]{0.7\textwidth}%
% \begin{picture}(0,0) \linethickness{0.01mm} \put(0,-\number\textheight){\framebox(\number\textwidth,\number\textheight){}} \end{picture}%
%           \vspace{0.09\textheight}%
%          \begin{minipage}[t][0.10\textheight][r]{\textwidth}%
%    \begin{picture}(0,0) \linethickness{0.01mm} \put(0,-\number\textheight){\framebox(\number\textwidth,\number\textheight){}} \end{picture}%
%             \begin{flushright}%
%                {\sffamily \huge \@title \hspace{0.08\textwidth}}%
%             \end{flushright}%
%          \end{minipage}\\%
%          \vspace{0.11\textheight}%
%          \begin{minipage}[t][0.04\textheight]{\textwidth}%
%    \begin{picture}(0,0) \linethickness{0.01mm} \put(0,-\number\textheight){\framebox(\number\textwidth,\number\textheight){}} \end{picture}%
%             \begin{flushright}%
%                \if@subtitle%
%                   {\sffamily \normalsize \@subtitle \hspace{0.08\textwidth}}%
%                \fi%
%             \end{flushright}%
%          \end{minipage}\\%
%          \vspace{0.09\textheight}%
%          \begin{minipage}[t]{\textwidth}%
%    \begin{picture}(0,0) \linethickness{0.01mm} \put(0,-\number\textheight){\framebox(\number\textwidth,\number\textheight){}} \end{picture}%
%             \begin{flushright}%
%                {\sffamily \large \@author \hspace{0.08\textwidth}}
%             \end{flushright}%
%          \end{minipage}\\%
%          \vfill%
%          \begin{minipage}[t]{\textwidth}%
%    \begin{picture}(0,0) \linethickness{0.01mm} \put(0,-\number\textheight){\framebox(\number\textwidth,\number\textheight){}} \end{picture}%
%             \begin{flushright}%
%                {\sffamily \@type \hspace{0.08\textwidth}\\ \@city, \@country\ \@shortdate \hspace{0.08\textwidth}}%
%             \end{flushright}%
%          \end{minipage}\\%
%           \vspace{0.08\textheight}%
%    \end{minipage}%
%    \begin{minipage}[t][0.99\textheight][c]{0.3\textwidth}%
% %       \vspace*{\stretch{1}}%
%       Gurka!%
% %       \vspace*{\stretch{1}}%
%    \end{minipage}%


%          \vfill%
%       \end{minipage}%
%    }%

%
%   \if@cplogo%
%     \if@extracplogo%
%       \vbox to 5mm{\hbox to \hsize{%
%       \@cplogo \hfill \@extracplogo}\vss}
%       %\includegraphics[height=2.5cm]{kthtext.eps}\hfill%
%       %\includegraphics[height=2.5cm]\@extracplogo}\vss}%
%     \else%
% %       \begin{center}
% %         \@cplogo
% %       \end{center}
%       \vbox to 5mm{\hbox{\@cplogo}\vss}%
%       \hfill%
%     \fi%
%   \fi
%   %%\if@isbn\else%
%   %%\vbox to 0mm{\vglue-\headheight\vglue-\headsep\scriptsize
%   %%    \hbox to 0mm{\hss TRITA-\@trita}
%   %%    \hbox to 0mm{\hss ISSN~\@issn}
%   %%    \hbox to 0mm{\hss ISRN~\@isrn}\vss}%
%   %%\fi
%   \par
%   \vskip 120\p@
%   \begin{center}%
%     {\Huge \sffamily \@title \par}% \bfseries
%     \if@subtitle
%       \vskip 1em%
%       {\large \sffamily \@subtitle \par}
%     \fi
%     \vskip 3em%
%     {\Large
%      \lineskip .75em%
%      \begin{tabular}[t]{c}%
%         \@author
%       \end{tabular}\par}%
%     \vfill%
%     {%\large
%       \@type \par}
%        \if@extrainstitute%
%          %\vskip 0.5em%
% 	 \smallskip
%          \@city \ \@shortdate
%        \fi
%     \vskip 1em%
%     {%\large
%      \lineskip .75em%
%      \if@extrainstitute%
%        \begin{tabularx}{\linewidth}{>{\centering}X>{\centering}X}%
%          \@department& \@extradepartment\cr%
%          \@institute&  \@extrainstitute%
%        \end{tabularx}%
%      \else%
%        \begin{tabular}[t]{c}%
%          \@department \\ \@institute \\ \@city \ \@shortdate
%        \end{tabular}%
%      \fi
%     \par}%
%     %\@city \ \@shortdate \\ \bigskip
%     %\@type \\
%     %\if@division \@division \\ \fi
%     %\@institute \\
%     %\@department \\
%     %\@city , \@country \\
%     %\smallskip
%     %\@shortdate \\
%     %{\large \@imprint \par}
%     %\vskip 1em%
%     %{\large
%     % \lineskip .75em%
%     %  \begin{tabular}[t]{c}%
%     %    \@type \\ \@institute \\ \@department
%     %  \end{tabular}\par}%
%   \end{center}\par
%    \setcounter{footnote}{0}%
%    \pagebreak
% \endgroup
% %    \clearpage%
% %    \endgroup%
%   }





% \newcommand\@make@cover@page{%
%   \thispagestyle{empty}%
%   \noindent%
%   \vglue-\headheight\vglue-\headsep%
%   \if@cplogo%
%     \if@extracplogo%
%       \vbox to 5mm{\hbox to \hsize{%
%       \@cplogo \hfill \@extracplogo}\vss}
%       %\includegraphics[height=2.5cm]{kthtext.eps}\hfill%
%       %\includegraphics[height=2.5cm]\@extracplogo}\vss}%
%     \else%
% %       \begin{center}
% %         \@cplogo
% %       \end{center}
%       \vbox to 5mm{\hbox{\@cplogo}\vss}%
%       \hfill%
%     \fi%
%   \fi
%   %%\if@isbn\else%
%   %%\vbox to 0mm{\vglue-\headheight\vglue-\headsep\scriptsize
%   %%    \hbox to 0mm{\hss TRITA-\@trita}
%   %%    \hbox to 0mm{\hss ISSN~\@issn}
%   %%    \hbox to 0mm{\hss ISRN~\@isrn}\vss}%
%   %%\fi
%   \par
%   \vskip 120\p@
%   \begin{center}%
%     {\Huge \sffamily \@title \par}% \bfseries
%     \if@subtitle
%       \vskip 1em%
%       {\large \sffamily \@subtitle \par}
%     \fi
%     \vskip 3em%
%     {\Large
%      \lineskip .75em%
%      \begin{tabular}[t]{c}%
%         \@author
%       \end{tabular}\par}%
%     \vfill%
%     {%\large
%       \@type \par}
%        \if@extrainstitute%
%          %\vskip 0.5em%
% 	 \smallskip
%          \@city \ \@shortdate
%        \fi
%     \vskip 1em%
%     {%\large
%      \lineskip .75em%
%      \if@extrainstitute%
%        \begin{tabularx}{\linewidth}{>{\centering}X>{\centering}X}%
%          \@department& \@extradepartment\cr%
%          \@institute&  \@extrainstitute%
%        \end{tabularx}%
%      \else%
%        \begin{tabular}[t]{c}%
%          \@department \\ \@institute \\ \@city \ \@shortdate
%        \end{tabular}%
%      \fi
%     \par}%
%     %\@city \ \@shortdate \\ \bigskip
%     %\@type \\
%     %\if@division \@division \\ \fi
%     %\@institute \\
%     %\@department \\
%     %\@city , \@country \\
%     %\smallskip
%     %\@shortdate \\
%     %{\large \@imprint \par}
%     %\vskip 1em%
%     %{\large
%     % \lineskip .75em%
%     %  \begin{tabular}[t]{c}%
%     %    \@type \\ \@institute \\ \@department
%     %  \end{tabular}\par}%
%   \end{center}\par
%   \setcounter{footnote}{0}}



\newcommand\@make@semi@title@page{%
  \thispagestyle{empty}%
  %\noindent%
  %\vbox to 5mm{\vglue-\headheight\vglue-\headsep
  %    \hbox{\includegraphics{kthtext.eps}}\vss}%
  %\hfill%
  %\if@isbn\else%
  %\vbox to 0mm{\vglue-\headheight\vglue-\headsep\scriptsize
  %    \hbox to 0mm{\hss TRITA-\@trita}
  %    \hbox to 0mm{\hss ISSN~\@issn}
  %    \hbox to 0mm{\hss ISRN~\@isrn}\vss}%
  %\fi\par
  %\vskip 120\p@
  \begin{center}%
    \if@innerlogo%
       \@innerlogo\par%
    \fi%
    \vfill
    {\large \@type \par}
    %\vskip 5em
    {\huge \@title \par}%
    \if@subtitle
      \vskip 1em%
      {\@subtitle \par}
    \fi
    \vfill
    {\large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vfill%
    \vfill%
%     \if@extrainstitute%
%       \if@innerlogo
%         \if@extrainnerlogo
%           \begin{tabularx}{\linewidth}{>{\centering}X>{\centering}X}%
%             \@innerlogo&  \@extrainnerlogo\cr\cr\cr\cr%
%             \if@division%
%                \if@extradivision%
%                   \@division&   \@extradivision\cr%
%                \else%
%                   \@division&   \cr%
%                \fi%
%             \else%
%                \if@extradivision%
%                   &   \@extradivision\cr%
%                \fi%
%             \fi%
%             \@department& \@extradepartment\cr%
%             \@institute&  \@extrainstitute\cr%
%             \@address&    \@extraaddress%
%           \end{tabularx}%
%         \else%
%           \@innerlogo \par%
%           \vfill%
%           \begin{tabularx}{\linewidth}{>{\centering}X>{\centering}X}%
%             \if@division%
%                \if@extradivision%
%                   \@division&   \@extradivision\cr%
%                \else%
%                   \@division&   \cr%
%                \fi%
%             \else%
%                \if@extradivision%
%                   &   \@extradivision\cr%
%                \fi%
%             \fi%
%             \@department& \@extradepartment\cr%
%             \@institute&  \@extrainstitute\cr%
%             \@address&    \@extraaddress%
%           \end{tabularx}%
%         \fi%
%       \else%
%         \vfill%
%         \begin{tabularx}{\linewidth}{>{\centering}X>{\centering}X}%
%             \if@division%
%                \if@extradivision%
%                   \@division&   \@extradivision\cr%
%                \else%
%                  \@division&   \cr%
%                \fi%
%             \else%
%                \if@extradivision
%                    &   \@extradivision\cr%
%                \fi%
%             \fi%
%           \@department& \@extradepartment\cr%
%           \@institute&  \@extrainstitute\cr%
%           \@address&    \@extraaddress%
%           \end{tabularx}%
%       \fi
%     \else%
      \vfill%
%       \if@innerlogo%
%         \@innerlogo\par%
%       \fi%
      \vfill%
      \if@division%
         \@division, %
      \fi \@department \\%
      \@institute , \@address\\%
      \bigskip%
      \@city , \@country \ \@shortdate \\%
%     \fi%
    %\vbox to 5mm{\vglue-\headheight\vglue-\headsep
    %    \hbox{\includegraphics{kthtext.eps}}\vss}%
    %{\large \@imprint \par}
    %\vskip 1em%
    %{\large
    % \lineskip .75em%
    %  \begin{tabular}[t]{c}%
    %    \@type \\ \@institute \\ \@department
    %  \end{tabular}\par}%
  \end{center}\par
  \setcounter{footnote}{0}}
\newcommand\@maketitle{%
  \cleardoublepage
  \if@nocover\else%
    \@make@cover@page%
    \if@onlycover\else%
      \clearpage
      \null\thispagestyle{empty}%
      \clearpage
    \fi%
  \fi%
  \if@onlycover%
    \thispagestyle{empty}%
  \else%
    \pagenumbering{roman}
    \@make@semi@title@page%
    \clearpage
    \thispagestyle{empty}%
    \null\vfill
    \if@centercomment
      \noindent\@centercomment
    \fi
    \vfill\vfill
    %\vglue 0pt plus 1fill
    \noindent%
    \if@foregincomment%
      \foreignlanguage{\@thesisforeginlanguage}{\@foregincomment}\smallskip\\%
      \@comment
    \else%
      \@comment%
    \fi%
    \par%
    \vskip 1.5em\relax%
    \noindent\if@isbn%
      ISBN~\@isbn \\[\smallskipamount]
    \fi%
      TRITA-\@trita \\
      %ISSN~\@issn \\
      %ISRN~\@isrn \\[1.5em]
    %%\fi%
    \@copyrightline \\
    %\copyright \space \@author , \  \@date \\%[1.5em]
    \@publisher \par
    \newpage
  \fi%
  \global\let\@maketitle\relax
  \global\let\title\relax
  \global\let\subtitle\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\type\relax
  \global\let\comment\relax
  \global\let\department\relax
  \global\let\address\relax
  \global\let\city\relax
  \global\let\copyrightline\relax
  \global\let\shortdate\relax
  \global\let\country\relax
  \global\let\publisher\relax
  \global\let\trita\relax
  %\global\let\issn\relax
  %\global\let\isrn\relax
  \global\let\isbn\relax
  \global\let\dedication\relax
  \global\let\intropoetry\relax
  \global\let\cplogo\relax
  \global\let\innerlogo\relax
  \global\let\extracplogo\relax
  \global\let\extrainnerlogo\relax
  \global\let\extrainstitute\relax
  \global\let\extradepartment\relax
  \global\let\extradivision\relax
  \global\let\extraaddress\relax
  \global\let\division\relax
  \global\let\foregincomment\relax
  \global\let\centercomment\relax
}
%\AtBeginDocument{\@maketitle}
\newenvironment{acknowledgments}{%
  \cleardoublepage\thispagestyle{plain}%
  \addcontentsline{toc}{chapter}{Acknowledgments}
  \chapter*{Acknowledgments%
    \@mkboth{Acknowledgments}{Acknowledgments}}}{}
\newenvironment{preface}{%
  \cleardoublepage\thispagestyle{plain}%
  \addcontentsline{toc}{chapter}{Preface}
  \chapter*{Preface%
    \@mkboth{Preface}{Preface}}}{}
\newenvironment{abstract}{%
  \cleardoublepage\thispagestyle{plain}%
  \addcontentsline{toc}{section}{\abstractname}
  \section*{\abstractname%
    \@mkboth{\abstractname}{\abstractname}}%
}{%
  %\par\medskip\vbox{\scriptsize\hbox to\textwidth{%
    %\hss\if@isbn ISBN~\@isbn\space$\bullet$\space\fi%
    %TRITA-\@trita\space$\bullet$\space%
    %ISSN~\@issn\space$\bullet$\space%
    %ISRN~\@isrn\hss}}
  \par%
  \bigskip%
}
\newenvironment{foreginabstract}{%
  \typeout{Foregin abstract found. Remember to put an otherlanguage environment around it.}%
  \thispagestyle{plain}
  \addcontentsline{toc}{section}{\abstractname}
  \section*{\abstractname%
    \@mkboth{\abstractname}{\abstractname}}%
}{%
  %\par\medskip\vbox{\scriptsize\hbox to\textwidth{%
    %\hss\if@isbn ISBN~\@isbn\space$\bullet$\space\fi%
    %TRITA-\@trita\space$\bullet$\space%
    %ISSN~\@issn\space$\bullet$\space%
    %ISRN~\@isrn\hss}}%
   \par\clearpage%
}
\newcommand*\chaptermark[1]{}
\newcommand\maketitle {\@maketitle}
\setcounter{secnumdepth}{2}
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thechapter {\@arabic\c@chapter}
\renewcommand \thesection {\thechapter.\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection .\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\@chapapp{\chaptername}
\newcommand\mainmatter{%
  \cleardoublepage
  \newpage
  \@mainmattertrue
  \pagestyle{headings}
  \pagenumbering{arabic}
  \if@dedication
    \thispagestyle{empty}
    \vglue 120\p@
    \begin{center}%
      {\LARGE\itshape \@dedication \par}%
    \end{center}\par
    \vfil
    \setcounter{footnote}{0}%
    \clearpage
    \thispagestyle{empty}%
    \vglue 0pt plus 1fill
    \newpage
  \fi
  %intropoetry was here
  \if@intropoetry %add-on: 20040501 Silvio Orsi
    \thispagestyle{empty}
    \vglue 120\p@
    \begin{flushleft}%
    \begin{verse}
      {\@intropoetry \par}%
    \end{verse}
    \end{flushleft}\par
    \vfil
    \setcounter{footnote}{0}%
    \clearpage
    \thispagestyle{empty}%
    \vglue 0pt plus 1fill
    \newpage
  \fi
  \global\let\@title\relax
  \global\let\@subtitle\relax
  \global\let\@author\relax
  \global\let\@date\relax
  \global\let\@type\relax
  \global\let\@comment\relax
  \global\let\@department\relax
  \global\let\@address\relax
  \global\let\@city\relax
  \global\let\@copyrightline\relax
  \global\let\@shortdate\relax
  \global\let\@country\relax
  \global\let\@publisher\relax
  \global\let\@trita\relax
  %\global\let\@issn\relax
  %\global\let\@isrn\relax
  \global\let\@isbn\relax
  \global\let\@dedication\relax
  \global\let\@intropoetry\relax
  \global\let\@cplogo\relax
  \global\let\@innerlogo\relax
  \global\let\@extracplogo\relax
  \global\let\@extrainnerlogo\relax
  \global\let\@extrainstitute\relax
  \global\let\@extradepartment\relax
  \global\let\@extradivision\relax
  \global\let\@extraaddress\relax
  \global\let\@division\relax
  \global\let\@centercomment\relax
  \global\let\@foregincomment\relax
  \global\let\@division\relax}
\newcommand\part{%
  \cleardoublepage
  \thispagestyle{plain}%
  \null\vfil
  \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
       \huge\bfseries \partname~\thepart
       \par
       \vskip 20\p@
     \fi
     \Huge \bfseries #2\par}%
    \@endpart}
\def\@spart#1{%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \Huge \bfseries #1\par}%
    \@endpart}
\def\@endpart{\vfil\newpage
              \null
              \thispagestyle{plain}%
              \newpage}
\newcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\thechapter}#1}%
                       \else
                         \addcontentsline{toc}{chapter}{#1}%
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \@makechapterhead{#2}%
                    \@afterheading}
\def\@makechapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \huge\bfseries \@chapapp\space \thechapter
        \par\nobreak
        \vskip 20\p@
      \fi
    \fi
    \interlinepenalty\@M
    \Huge \bfseries #1\par\nobreak
    \vskip 40\p@ \@plus 10\p@
  }}
\def\@schapter#1{\@makeschapterhead{#1}%
                 \@afterheading}
\def\@makeschapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \Huge \bfseries  #1\par\nobreak
    \vskip 40\p@ \@plus 15\p@
  }}
\newcommand\section{\@startsection {section}{1}{\z@}%
                      {-3.5ex \@plus -1ex \@minus -.2ex}%
                      {2.3ex \@plus.2ex}%
                      {\normalfont\Large\bfseries\boldmath\raggedright}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                      {-3.25ex\@plus -1ex \@minus -.2ex}%
                      {1.5ex \@plus .2ex}%
                      {\normalfont\large\bfseries\boldmath\raggedright}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                      {-3.25ex\@plus -1ex \@minus -.2ex}%
                      {1.5ex \@plus .2ex}%
                      {\normalfont\normalsize\bfseries\boldmath\raggedright}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                      {3.25ex \@plus1ex \@minus.2ex}%
                      {-1em}%
                      {\normalfont\normalsize\bfseries\boldmath}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                      {3.25ex \@plus1ex \@minus .2ex}%
                      {-1em}%
                      {\normalfont\normalsize\bfseries\boldmath}}
\setlength\leftmargini  {2.5em}
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\setlength\leftmarginv  {1em}
\setlength\leftmarginvi {1em}
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}
\newcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \renewcommand\@chapapp{\appendixname}%
  \renewcommand\thechapter{\@Alph\c@chapter}}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\@addtoreset {equation}{chapter}
\renewcommand\theequation
  {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}
\newcounter{figure}[chapter]
\renewcommand \thefigure
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}[chapter]
\renewcommand \thetable
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename~\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\newlength\captionindent
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\setlength\captionindent{\leftmargini}
\def\onecaptflag{268 }
\long\def\@makecaption#1#2{\let\@tempa\relax
  {\advance\leftskip\captionindent
   \advance\rightskip\captionindent
   \ifdim\prevdepth>-99\p@ \vskip\abovecaptionskip \relax
   \else \def\@tempa{\vbox to\topskip{}}\fi
   \footnotesize{\bfseries #1.} \@tempa \vadjust{\penalty \onecaptflag}#2\par
   \ifnum\lastpenalty=\onecaptflag
      \unpenalty \setbox\@tempboxa\lastbox
      \nointerlineskip
      \hbox to\hsize{\hskip\parfillskip\unhbox\@tempboxa}%
   \fi \vskip\belowcaptionskip}}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.85em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{2}
\newcommand\tableofcontents{%
  \cleardoublepage\thispagestyle{plain}%
  \addcontentsline{toc}{chapter}{\contentsname}
    \chapter*{\contentsname
        \@mkboth{\contentsname}{\contentsname}}%
    \@starttoc{toc}%
    }
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \begingroup
      \setlength\@tempdima{3em}%
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}
\newcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\newcommand*\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand*\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{12em}{6em}}
\newcommand\listoffigures{%
    \chapter*{\listfigurename
      \@mkboth{\listfigurename}{\listfigurename}}%
    \@starttoc{lof}%
    }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
    \chapter*{\listtablename
      \@mkboth{\listtablename}{\listtablename}}%
    \@starttoc{lot}%
    }
\let\l@table\l@figure
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]{
  \cleardoublepage\addcontentsline{toc}{chapter}{\bibname}
  \chapter*{\bibname
        \@mkboth{\bibname}{\bibname}}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newenvironment{theindex}
               {\columnseprule \z@
                \columnsep 35\p@
                \twocolumn[\@makeschapterhead{\indexname}]%
                \@mkboth{\indexname}{\indexname}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \let\item\@idxitem}
               {\onecolumn}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\@addtoreset{footnote}{chapter}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
\newcommand\abstractname{Abstract}
\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
%\newcommand\bibname{Bibliography}
\newcommand\bibname{References}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\chaptername{Chapter}
\newcommand\appendixname{Appendix}
\newcommand\today{}
\edef\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\onecolumn
\@mainmatterfalse
\pagenumbering{roman}
\pagestyle{headings}
\def\cleardoublepage{\clearpage\ifodd\c@page\else
    \thispagestyle{plain}\hbox{}\newpage\fi}
\endinput