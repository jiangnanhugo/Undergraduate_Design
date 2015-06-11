%%latex 模板
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{ZJUthesis}[2013/01/25 v2.0 ZJUthesis document class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions
\LoadClass[cs4size,a4paper,fancyhdr,hyperref]{ctexbook}[2009/09/13]
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm}
\RequirePackage{graphicx}
\RequirePackage{times}
\RequirePackage{array}
\RequirePackage[titles]{tocloft}
\RequirePackage[nottoc,notlof,notlot]{tocbibind}
\RequirePackage{makeidx}
\RequirePackage[sort&compress,longnamesfirst,square,super]{natbib}
\RequirePackage[margin=10pt,font={small,bf},labelsep=quad]{caption}
\RequirePackage{booktabs-de}
\RequirePackage{calc}
\RequirePackage{multirow}
\RequirePackage{xcolor}
\hypersetup{CJKbookmarks=true,%
       bookmarksnumbered,%
               linkcolor=blue,%
              plainpages=false,%
            pdfstartview=FitH,
               hidelinks
         }
\AtBeginDocument{\makeatletter\input{ZJUthesis.cfg}\makeatother}

% 使用geometry包来修改页面尺寸
\RequirePackage[a4paper,%
top=51pt,bottom=51pt,left=68pt,right=57pt,%
headsep=14pt,footskip=26pt,%
includehead, includefoot]{geometry}


% 奇数页左边边距是1.5cm
%\oddsidemargin -0.14 true cm
% 偶数页的左边距设置则分双面模式与单面模式两种情况
%\if@twoside
%  \evensidemargin -0.34 true cm
%\else
%  \evensidemargin -0.14 true cm
%\fi
% 设置页头空白尺寸
%\topmargin -0.74 true cm
%\headheight 0.8 true cm
%\headsep 0.5 true cm
\topsep 0.7 true cm
%\textheight 23.9 true cm
%\textwidth 16.6 true cm
%\footskip 0.9 true cm
\parskip 0.5ex plus 0.25ex minus 0.25ex
% cleardoublepage这个命令的定义
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

% 这个地方定义一页中浮动对象可占的最大比例
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}

% 设置英文字体为Times New Roman
\setmainfont{Times New Roman}%设置Times New Roman为默认的英文字体
\setCJKmainfont{SimSun}      %设置宋体为默认的中文字体



\def\reserved@a#1 #2 #3\@nil{%
  \def\ZJUfiledate{#1}%
  \def\ZJUfileversion{#2}%
  \def\ZJUfileinfo{#3}}%
\edef\reserved@b{\csname ver@ZJUthesis.cls\endcsname}
\expandafter\reserved@a\reserved@b\@nil\relax

% 新命令Nchapter的定义
% 这里的mainmatter对应于tex文档中的定义
\newcommand\Nchapter[1]{%
  \if@mainmatter%
    \@mainmatterfalse%
    \chapter{#1}%
    \@mainmattertrue%
  \else
    \chapter{#1}%
  \fi}

% 下划线的一个定义
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



% 制作封面的命令
\newcommand\makeCoverPage{%
  % 这个地方写的是封面上的分类号与学号，字体字号可以更改
  \thispagestyle{empty}
  {
    \songti\zihao{-4}
    \linespread{1.3}
    \begin{center}
      
      % 这个尺寸可以更改
      \vspace{20mm}
      % 浙江工业大学四个字
      \ifpdf
        \includegraphics[width=100mm]{./CoverPagepic/zjut_logo.pdf} \\
      \else
        \includegraphics[width=100mm]{./CoverPagepic/zjut_logo.eps} \\
      \fi
      % 这个尺寸可以更改
      \vspace{15mm}
      %% \ZJU@value@school \\  \zihao{-1}
      % 这个博士学位论文在def文件中已有，当然在tex文件中还可以更改
      \centerline{\songti \zihao{1}{\ZJU@label@type} }
      \centerline{\songti \zihao{-2}{} }
      \centerline{\bfseries\songti \zihao{-2}{\ZJU@label@session}   }
      % 这个尺寸可以更改
      \vspace{15mm}
      % 这个地方调入徽标
      \ifpdf
        \includegraphics[width=30mm]{./CoverPagepic/zjut.pdf}    \\
      \else
        \includegraphics[width=25mm]{./CoverPagepic/zjut.eps}    \\
      \fi
    \end{center}

      \vspace{2mm}

    \begin{center}
      % 论文题目部分内容，可以修改
      \begin{tabular}{rl}
        {\bfseries\songti\zihao{2}\ZJU@label@title\quad}
        &
        \bfseries\songti\zihao{-2} \ZJUunderline[280pt]{\ZJU@value@title} \\[3mm]
        &
        % 这个地方是做第二行标题的判断，如果标题一行写不下，有第二行则显示，否则不显示
        \ifx\ZJU@value@titletl\undefined
          \hfil
        \else
          {\bfseries\songti\zihao{-2}\ZJUunderline[280pt]{\ZJU@value@titletl}}
        \fi \\
      \end{tabular}

      % 这个距离可以修改
      \vspace{15mm}

      % 左右两边字体不同，定义两个宏AB来简化代码，这个功能用到了array宏包
      \newcolumntype{A}{>{\songti}r<{}}
      \newcolumntype{B}{>{\songti}l<{}}
      \zihao{4}
      \begin{tabular}{A@{\quad}B}
        \ZJU@label@author & \ZJUunderline[200pt]{\ZJU@value@author} \\[3mm]
        \ZJU@label@supervisor & \ZJUunderline[200pt]{\ZJU@value@supervisor} \\
      \end{tabular}

      \vspace{10mm}

      \zihao{4}
      \begin{tabular}{A@{\quad}B}
        \ZJU@label@major & \ZJUunderline[200pt]{\ZJU@value@major} \\[3mm]
	\ZJU@label@institute & \ZJUunderline[200pt]{\ZJU@value@institute} \\ [3mm]
	\ZJU@label@submitdate & \ZJUunderline[200pt]{\ZJU@value@submitdate} \\
      \end{tabular}
    \end{center}
  }
}

%插入中文题名页
\renewcommand\maketitle{%
  % 新开一个页面
  \cleardoublepage
  % 无页眉页脚
  \thispagestyle{empty}
  {
    \linespread{1.3}
    \begin{center}
      {\bfseries\heiti\zihao{3}{\ZJU@value@title}}
    \end{center}
  }
}


% 空页眉页的格式定义
% 每一个chapter开始的第一页的页眉页脚样式为plain样式
\fancypagestyle{plain}{%
  \fancyhf{}% 先清除当前页面的页眉页脚定义，是fancyhdr包中的定义
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

% L靠左 R靠右 O奇数页 E偶数页
% 一般页的页眉页脚样式
\pagestyle{fancy}
  \fancyhf{} %fancyhf实际是fancyhead与fancyfoot的合体，它的参数用H和F指定
  % 分单双面判断页眉的设置
  \if@twoside
    \fancyhead[CO]{\songti\zihao{-5}\centerline{\ZJU@value@school\ZJU@label@type}}
    \fancyfoot[RO]{\zihao{-5} ~\thepage~}
    \fancyfoot[LE]{\zihao{-5} ~\thepage~}
  \else
    \fancyhead[R]{\songti\zihao{-5}\centerline{\ZJU@value@school\ZJU@label@type}}
    \fancyfoot[C]{\zihao{-5} ~\thepage~}
  \fi






% 设置章节标题格式
\CTEXsetup[beforeskip={18pt}]{chapter}
\CTEXsetup[afterskip={18pt}]{chapter}
\CTEXsetup[name={第,章}]{chapter}
\CTEXsetup[number={\chinese{chapter}{}}]{chapter}
\CTEXsetup[format={\noindent\centering\bfseries}]{chapter}
\CTEXsetup[nameformat={\zihao{-2}}]{chapter}
\CTEXsetup[titleformat={\heiti\zihao{-2}}]{chapter}

%\CTEXsetup[beforeskip={12pt}]{section}
%\CTEXsetup[afterskip={6pt}]{section}
\CTEXsetup[format={\noindent\bfseries}]{section}
\CTEXsetup[nameformat={\zihao{-3}}]{section}
\CTEXsetup[titleformat={\songti\zihao{-3}}]{section}

\CTEXsetup[format={\noindent\bfseries}]{subsection}
\CTEXsetup[nameformat={\zihao{4}}]{subsection}
\CTEXsetup[titleformat={\songti\zihao{4}}]{subsection}
% 此处章节标题前后空白距离采用了默认设置，如需修改请参考ctex参考文档ctex.pdf

% 正文部分文字的行距设置
\linespread{1.5}

% 摘要
\newenvironment{abstract}
  {\setlength{\parskip}{24pt}
  \linespread{1.0}\Nchapter{\bfseries\heiti\ZJU@label@abstract}
  \setlength{\parskip}{18pt}}
  {}

%关键字
\newcommand\keywords[1]{%
  \vspace{2ex}\noindent{\heiti \ZJU@label@keywords} #1}

%英文摘要
\newenvironment{Eabstract}
  {\setlength{\parskip}{24pt}\linespread{1.0}\Nchapter{\bfseries\ZJU@label@Eabstract}\setlength{\parskip}{18pt}}
  {}

%英文关键字
\newcommand\Ekeywords[1]{%
  \vspace{2ex}\noindent{\bf \ZJU@label@Ekeywords} #1}

\newcommand\ZJUfrontmatter{%
  \frontmatter
  % 正文内容前的部分页码格式为大写罗马数字

  \pagenumbering{Roman}
}


% 致谢
\renewenvironment{thanks}
  {\setlength{\parskip}{18pt}
   \linespread{1.5}\centering\Nchapter{\songti\bfseries\ZJU@label@thanks}
   \setlength{\parskip}{18pt}}
  {}

\renewcommand{\theequation}{\thechapter-\arabic{equation}}
\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\renewcommand{\thetable}{\thechapter-\arabic{table}}


\renewcommand\cftfigpresnum{图}
\renewcommand\cfttabpresnum{表}
%\settowidth{\cftfignumwidth}{\cftfigpresnum}
%\settowidth{\cfttabnumwidth}{\cfttabpresnum}
%\renewcommand{\cftfigaftersnumb}{~~~~}
%\renewcommand{\cfttabaftersnumb}{~~~~}



% 生成目录（论文中称目次）
\newcommand\ZJUcontents{%
  \renewcommand{\contentsname}{目录}
  %chapter
  \renewcommand{\cftchapleader}{\cftdotfill{\cftdot}}
  \renewcommand{\cftchapdotsep}{\bfseries\cftdotsep}
  \renewcommand{\cftchapfont}{\bfseries\songti\zihao{5}}
  \renewcommand{\cftchappagefont}{\bfseries\zihao{5}}

  %section
  \renewcommand{\cftsecleader}{\cftdotfill{\cftdot}}
  \renewcommand{\cftsecdotsep}{\cftdotsep}
  \renewcommand{\cftsecfont}{\songti\zihao{5}}
  \renewcommand{\cftsecpagefont}{\zihao{5}}
     
  %subsection
  \renewcommand{\cftsubsecleader}{\cftdotfill{\cftdot}} 
  \renewcommand{\cftsubsecdotsep}{\cftdotsep}
  \renewcommand{\cftsubsecfont}{\songti\zihao{5}}
  \renewcommand{\cftsubsecpagefont}{\zihao{5}}
  
  \setlength{\cftbeforechapskip}{-6pt}
  \setlength{\cftbeforesecskip}{-12pt}
  \setlength{\cftbeforesubsecskip}{-12pt}
  \setlength{\cftsecindent}{1em}
  \setlength{\cftsubsecindent}{2em}
   
  \setcounter{tocdepth}{3}
  
  \addtocontents{toc}{\cftpagenumbersoff{chapter}}
  \tableofcontents
  \addtocontents{toc}{\cftpagenumberson{chapter}}
}

% 插图目录
\newcommand\ZJUListofFigures{%
  \renewcommand\listfigurename{图目录}
  \renewcommand{\cftfigfont}{\songti\zihao{5}}
  \renewcommand{\cftfigleader}{\cftdotfill{\cftdot}}
  \renewcommand{\cftfigdotsep}{\cftdotsep}
  \renewcommand{\cftfigpagefont}{\rm\zihao{5}}
  \setlength{\cftbeforefigskip}{-10pt}
  \listoffigures
}

% 附表目录
\newcommand\ZJUListofTables{%
  \renewcommand\listtablename{表目录}
  \renewcommand{\cfttabfont}{\songti\zihao{5}}
  \renewcommand{\cfttableader}{\cftdotfill{\cftdot}}
  \renewcommand{\cfttabdotsep}{\cftdotsep}
  \renewcommand{\cfttabpagefont}{\rm\zihao{5}}
  \setlength{\cftbeforetabskip}{-10pt}
  \listoftables
}


% 参考文献部分
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

% 索引
\newcommand\ZJUindex{%
  \cleardoublepage
  % 不用这一句会造成索引的书签位置错误
  \phantomsection
  \printindex
}


\def\reflect#1{{\setbox0=\hbox{#1}\rlap{\kern0.5\wd0
  \special{x:gsave}\special{x:scale -1 1}}\box0 \special{x:grestore}}}
\def\XeTeX{\leavevmode
  \setbox0=\hbox{X\lower.5ex\hbox{\kern-.15em\reflect{E}}\kern-.1667em \TeX}%
  \dp0=0pt\ht0=0pt\box0 }

% 设置显示到4级标题 chapter section subsection subsubsection，可适当减小
\setcounter{secnumdepth}{4}

\theoremstyle{plain}
\newtheorem{thm}{Theorem}[section]
\newtheorem{lem}[thm]{Lemma}
\newtheorem{prop}[thm]{Proposition}
\newtheorem*{cor}{Corollary}

\theoremstyle{definition}
\newtheorem{defn}{定义}[section]
\newtheorem{conj}{Conjecture}[section]
\newtheorem{exmp}{Example}[section]

\theoremstyle{remark}
\newtheorem*{rem}{Remark}
\newtheorem*{note}{Note}


\makeatletter
\renewcommand{\numberline}[1]{%
\settowidth\@tempdimb{#1\hspace{0.5em}}%
\ifdim\@tempdima<\@tempdimb%
  \@tempdima=\@tempdimb%
\fi%
\hb@xt@\@tempdima{\@cftbsnum #1\@cftasnum\hfil}\@cftasnumb}
\makeatother







\endinput
%%
%% End of file `ZJUthesis.cls'.
