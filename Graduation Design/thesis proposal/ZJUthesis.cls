%%
%% Edited By jiangnan
%% jiangnan.hugo@gmail.com
%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]

\ProvidesClass{ZJUthesis}[2013/01/25 v2.0 ZJUthesis document class]
% ����ctexbookģ�棬����ר������
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions
% 2009/09/13��v0.94��֮��汾�ṩ��hyperref��֧�֣�ֱ��д��ѡ���
\LoadClass[cs4size,a4paper,fancyhdr,hyperref]{ctexbook}[2009/09/13]
%% math packages ��ѧ��ʽ��������ѧϵ������֮
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm}
%% graphicx packages��psgrag�����޸�epsͼ�е���Ϣ������dvipdfm������
\RequirePackage{graphicx}
% ��Ҫtimes������Ӣ�����忴��������windows��
\RequirePackage{times}
%\RequirePackage{fontspec}
% ��Ҫarray������������ʦ��Ϣʱ��
\RequirePackage{array}
\RequirePackage{makeidx}
% �ο����׸�ʽ������Ҫnatbib��
% sort&compress�������ڰ�����˳�����вο�����
% longnamesfirst�������ڴ���������˳�򣬽�first name��ǰ�棬�����������
% square���������ñ���÷���������
% super���������ñ��Ϊ�ϱ��ʽ
\RequirePackage[sort&compress,longnamesfirst,square,super]{natbib}
% ����ͼƬ������ͷ����ѡ����10pt���ֺ�ΪС�ֺţ��Ӵ����壬��������Ŀ���1���ַ�
\RequirePackage[margin=10pt,font={small,bf},labelsep=quad]{caption}
% �����ͱ�����Ҫ����չ��
\RequirePackage{booktabs-de}
% �������ʹ�õİ�
\RequirePackage{calc}
% �ϲ��������õ��İ�
\RequirePackage{multirow}
% ��ɫ��
\RequirePackage{xcolor}
% PDF�ĵ������Ӽ���ǩ��ǣ�����ѡ������ο�hyperref˵���ĵ�
% hyperref��Ҫ2011���Ĳ���
\hypersetup{CJKbookmarks=true,%
       bookmarksnumbered,%
               linkcolor=blue,%
              plainpages=false,%
            pdfstartview=FitH,
               hidelinks
         }
% �ĵ���ʼ����Ĭ������
\AtBeginDocument{\makeatletter\input{ZJUthesis.cfg}\makeatother}

% ʹ��geometry�����޸�ҳ��ߴ�
\RequirePackage[a4paper,%
top=51pt,bottom=51pt,left=68pt,right=57pt,%
headsep=14pt,footskip=26pt,%
includehead, includefoot]{geometry}


% ����ҳ��߱߾���1.5cm
%\oddsidemargin -0.14 true cm
% ż��ҳ����߾��������˫��ģʽ�뵥��ģʽ�������
%\if@twoside
%  \evensidemargin -0.34 true cm
%\else
%  \evensidemargin -0.14 true cm
%\fi
% ����ҳͷ�հ׳ߴ�
%\topmargin -0.74 true cm
%\headheight 0.8 true cm
%\headsep 0.5 true cm
\topsep 0.7 true cm
%\textheight 23.9 true cm
%\textwidth 16.6 true cm
%\footskip 0.9 true cm
\parskip 0.5ex plus 0.25ex minus 0.25ex
% cleardoublepage�������Ķ���
\def\cleardoublepage{%
  \clearpage
  \if@twoside
    \ifodd
      \c@page
    \else
      \thispagestyle{empty}%
      \hbox{}\newpage
      \if@twocolumn
        \hbox{}\newpage
      \fi
    \fi
  \fi}

% ����ط�����һҳ�и��������ռ��������
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}

% ����Ӣ������ΪTimes New Roman
%\setmainfont{Times New Roman}

\def\reserved@a#1 #2 #3\@nil{%
  \def\ZJUfiledate{#1}%
  \def\ZJUfileversion{#2}%
  \def\ZJUfileinfo{#3}}%
\edef\reserved@b{\csname ver@ZJUthesis.cls\endcsname}
\expandafter\reserved@a\reserved@b\@nil\relax

% ������Nchapter�Ķ���
% �����mainmatter��Ӧ��tex�ĵ��еĶ���
\newcommand\Nchapter[1]{%
  \if@mainmatter%
    \@mainmatterfalse%
    \chapter{#1}%
    \@mainmattertrue%
  \else
    \chapter{#1}%
  \fi}

% �»��ߵ�һ������
\def\ZJU@underline[#1]#2{%
  \underline{\hbox to #1{\hfil#2\hfil}}}
\def\ZJUunderline{\@ifnextchar[\ZJU@underline\underline}
\newcommand\classification[1]{\def\ZJU@value@classification{#1}}
\newcommand\confidential[1]{\def\ZJU@value@confidential{#1}}
\newcommand\UDC[1]{\def\ZJU@value@UDC{#1}}
\newcommand\serialnumber[1]{\def\ZJU@value@serialnumber{#1}}
\newcommand\school[1]{\def\ZJU@value@school{#1}}
\newcommand\SecretLevel[1]{%
  \def\ZJU@value@SecretLevel{#1}
  \def\ZJU@value@IsSecret{1}}
\newcommand\degree[1]{\def\ZJU@value@degree{#1}}
\renewcommand\title[2][\ZJU@value@title]{%
  \def\ZJU@value@title{#2}
  \def\ZJU@value@titlemark{\MakeUppercase{#1}}}
\newcommand\titletl[1]{\def\ZJU@value@titletl{#1}}
\renewcommand\author[1]{\def\ZJU@value@author{#1}}
\newcommand\supervisor[1]{\def\ZJU@value@supervisor{#1}}
\newcommand\major[1]{\def\ZJU@value@major{#1}}
\newcommand\submitdate[1]{\def\ZJU@value@submitdate{#1}}
\newcommand\institute[1]{\def\ZJU@value@institute{#1}}


% �������������
\newcommand\makeCoverPage{%
  % ����ط�д���Ƿ����ϵķ������ѧ�ţ������ֺſ��Ը���
  \thispagestyle{empty}
  {
    \songti\zihao{-4}
    \linespread{1.3}
    \begin{center}
      
      % ����ߴ���Ը���
      \vspace{20mm}
      % �㽭��ҵ��ѧ�ĸ���
      \ifpdf
        \includegraphics[width=100mm]{./CoverPagepic/zjut_logo.pdf} \\
      \else
        \includegraphics[width=100mm]{./CoverPagepic/zjut_logo.eps} \\
      \fi
      % ����ߴ���Ը���
      \vspace{15mm}
      %% \ZJU@value@school \\  \zihao{-1}
      % �����ʿѧλ������def�ļ������У���Ȼ��tex�ļ��л����Ը���
      \centerline{\songti \zihao{1}{\ZJU@label@type} }
      \centerline{\songti \zihao{-2}{} }
      \centerline{\songti \zihao{-2}{\ZJU@label@session}   }
      % ����ߴ���Ը���
      \vspace{15mm}
      % ����ط�����ձ�
      \ifpdf
        \includegraphics[width=30mm]{./CoverPagepic/zjut.pdf}    \\
      \else
        \includegraphics[width=25mm]{./CoverPagepic/zjut.eps}    \\
      \fi
    \end{center}

      \vspace{2mm}

    \begin{center}
      % ������Ŀ�������ݣ������޸�
      \begin{tabular}{rl}
        {\bfseries\fangsong\zihao{2}\ZJU@label@title:}
        &
        \bfseries\fangsong\zihao{-2} \ZJUunderline[320pt]{\ZJU@value@title} \\[3mm]
        &
        % ����ط������ڶ��б�����жϣ��������һ��д���£��еڶ�������ʾ��������ʾ
        \ifx\ZJU@value@titletl\undefined
          \hfil
        \else
          {\bfseries\fangsong\zihao{-2}\ZJUunderline[320pt]{\ZJU@value@titletl}}
        \fi \\
      \end{tabular}

      % �����������޸�
      \vspace{15mm}

      % �����������岻ͬ������������AB���򻯴��룬��������õ���array���
      \newcolumntype{A}{>{\songti}r<{}}
      \newcolumntype{B}{>{\fangsong}l<{}}
      \zihao{4}
      \begin{tabular}{A@{��}B}
        \ZJU@label@author & \ZJUunderline[200pt]{\ZJU@value@author} \\[3mm]
        \ZJU@label@supervisor & \ZJUunderline[200pt]{\ZJU@value@supervisor} \\
      \end{tabular}

      \vspace{10mm}

      \zihao{4}
      \begin{tabular}{A@{��}B}
        \ZJU@label@major & \ZJUunderline[200pt]{\ZJU@value@major} \\[3mm]
	\ZJU@label@institute & \ZJUunderline[200pt]{\ZJU@value@institute} \\ [3mm]
	\ZJU@label@submitdate & \ZJUunderline[200pt]{\ZJU@value@submitdate} \\
      \end{tabular}
    \end{center}
  }
}

%������������ҳ
\renewcommand\maketitle{%
  % �¿�һ��ҳ��
  \cleardoublepage
  % ��ҳüҳ��
  \thispagestyle{empty}
  {
    \linespread{1.3}
    \begin{center}
      {\bfseries\heiti\zihao{3}{\ZJU@value@title}}
    \end{center}
  }
}


% ��ҳüҳ�ĸ�ʽ����
% ÿһ��chapter��ʼ�ĵ�һҳ��ҳüҳ����ʽΪplain��ʽ
\fancypagestyle{plain}{%
  \fancyhf{}% �������ǰҳ���ҳüҳ�Ŷ��壬��fancyhdr���еĶ���
  \renewcommand{\headrulewidth}{0.5pt}%
  \renewcommand{\footrulewidth}{0.5pt}%
  \if@twoside
    \fancyhead[CO]{\songti\zihao{-5}\centerline{\ZJU@value@school\ZJU@label@type}}
    \fancyfoot[RO]{\zihao{-5} ~\thepage~}
    \fancyfoot[LE]{\zihao{-5} ~\thepage~}
  \else
    \fancyhead[R]{\songti\zihao{-5}\centerline{\ZJU@value@school\ZJU@label@type}}
    \fancyfoot[C]{\zihao{-5} ~\thepage~}
  \fi
}

% L���� R���� O����ҳ Eż��ҳ
% һ��ҳ��ҳüҳ����ʽ
\pagestyle{fancy}
  \fancyhf{} %fancyhfʵ����fancyhead��fancyfoot�ĺ��壬���Ĳ�����H��Fָ��
  % �ֵ�˫���ж�ҳü������
  \if@twoside
    \fancyhead[CO]{\songti\zihao{-5}\centerline{\ZJU@value@school\ZJU@label@type}}
    \fancyfoot[RO]{\zihao{-5} ~\thepage~}
    \fancyfoot[LE]{\zihao{-5} ~\thepage~}
  \else
    \fancyhead[R]{\songti\zihao{-5}\centerline{\ZJU@value@school\ZJU@label@type}}
    \fancyfoot[C]{\zihao{-5} ~\thepage~}
  \fi



%ȡ��chapter�Զ���ҳ!
\makeatletter
\renewcommand\chapter{\par\bigskip
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
\makeatother



% �����½ڱ����ʽ
\CTEXsetup[beforeskip={-1pt}]{chapter}
\CTEXsetup[afterskip={10pt}]{chapter}
\CTEXsetup[name={,}]{chapter}
\CTEXsetup[number={\chinese{chapter}{��}}]{chapter}
\CTEXsetup[format={\noindent}]{chapter}
\CTEXsetup[nameformat={\bfseries\zihao{-3}}]{chapter}
\CTEXsetup[titleformat={\bfseries\heiti\zihao{-3}}]{chapter}
%\CTEXsetup[beforeskip={1pt}]{section}
%\CTEXsetup[afterskip={1pt}]{section}
\CTEXsetup[format={\noindent}]{section}
\CTEXsetup[nameformat={\bfseries\zihao{4}}]{section}
\CTEXsetup[titleformat={\bfseries\heiti\zihao{4}}]{section}
\CTEXsetup[format={\noindent}]{subsection}
\CTEXsetup[nameformat={\zihao{-4}}]{subsection}
\CTEXsetup[titleformat={\heiti\zihao{-4}}]{subsection}
\CTEXsetup[format={\noindent}]{subsubsection}
\CTEXsetup[nameformat={\zihao{-4}}]{subsubsection}
\CTEXsetup[titleformat={\heiti\zihao{-4}}]{subsubsection}
% �˴��½ڱ���ǰ��հ׾��������Ĭ�����ã������޸���ο�ctex�ο��ĵ�ctex.pdf

% ���Ĳ������ֵ��о�����
\linespread{1.5}

% ժҪ
\newenvironment{abstract}
  {\Nchapter{\ZJU@label@abstract}}
  {}

%�ؼ���
\newcommand\keywords[1]{%
  \vspace{2ex}\noindent{\heiti \ZJU@label@keywords} #1}



% �ο����ײ���
\DeclareRobustCommand\citenum
   {\begingroup
     \NAT@swatrue\let\NAT@ctype\z@\NAT@parfalse\let\textsuperscript\relax
     \NAT@citexnum[][]}

\newcommand\ZJUthesisbib[1]{%
  \setcitestyle{numbers, round, comma, aysep={}, yysep={,}, notesep={,}}
  \setlength{\bibsep}{0.5ex}
  \setlength{\bibhang}{2em}
  \renewcommand{\bibfont}{\songti\zihao{5}}

  \bibliographystyle{ZJUthesis}
  \bibliography{#1}
}

\makeindex

% ����
\newcommand\ZJUindex{%
  \cleardoublepage
  % ������һ��������������ǩλ�ô���
  \phantomsection
  \printindex
}


\def\reflect#1{{\setbox0=\hbox{#1}\rlap{\kern0.5\wd0
  \special{x:gsave}\special{x:scale -1 1}}\box0 \special{x:grestore}}}
\def\XeTeX{\leavevmode
  \setbox0=\hbox{X\lower.5ex\hbox{\kern-.15em\reflect{E}}\kern-.1667em \TeX}%
  \dp0=0pt\ht0=0pt\box0 }

% ������ʾ��4������ chapter section subsection subsubsection�����ʵ���С
\setcounter{secnumdepth}{4}
\newtheoremstyle{break}% name
  {}%      Space above, empty = `usual value'
  {}%      Space below
  {\itshape}% Body font
  {}%         Indent amount (empty = no indent, \parindent = para indent)
  {\bfseries}% Thm head font
  {.}%        Punctuation after thm head
  {\newline}% Space after thm head: \newline = linebreak
  {}%         Thm head spec
\endinput
%%
%% End of file `ZJUthesis.cls'.