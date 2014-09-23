\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{controlreport}[2014/06/29]

\DeclareOption{11pt}{
  \PassOptionsToClass{\CurrentOption}{report}
}

\DeclareOption{10pt}{
  \PassOptionsToClass{\CurrentOption}{report}
}

\DeclareOption{12pt}{
  \PassOptionsToClass{\CurrentOption}{report}
}

\ExecuteOptions{11pt}

\ProcessOptions\relax

\LoadClass[a4paper, twoside]{report}

\RequirePackage{fix-cm}
\RequirePackage[lmargin=3cm, rmargin=3cm, bottom=2.5cm, bindingoffset=0cm]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
%\RequirePackage[boxed]{algorithm2e}

%document geometry
\setlength{\headsep}{1 cm} %1.3cm
\setlength{\headheight}{0.5 cm}
\setlength{\parskip}{1mm plus2mm minus2mm}
\interfootnotelinepenalty=10000
\raggedbottom

%miscellaneous document settings
\pagestyle{fancy}
\fancyhead[OR, EL]{\thepage}
\fancyhead[ER]{\chaptermark}
\fancyhead[OL]{\sectionmark}
\fancyfoot[]{}

\providecommand{\contentstitle}{Contents}

%titlepage
\renewcommand{\title}[1]{\newcommand{\thetitle}{#1}}
\newcommand{\doctype}[1]{\newcommand{\thedoctype}{#1}}
\newcommand{\university}[1]{\newcommand{\theuniversity}{#1}}
\newcommand{\faculty}[1]{\newcommand{\thefaculty}{#1}}
\newcommand{\department}[1]{\newcommand{\thedepartment}{#1}}
\renewcommand{\date}[1]{\renewcommand{\thedate}{#1}}
\newcommand{\logo}[1]{\newcommand{\thelogo}{#1}}
\newcommand{\authorinfo}[1]{\newcommand{\theauthorinfo}{#1}}
\renewcommand{\titlepage}{
\input{titlepage}
}

%counters
\newcounter{mychapter}
\newcounter{mysection}[mychapter]
\newcounter{mysubsection}[mysection]
\newcounter{mysubsubsection}[mysubsection]
\renewcommand{\themysection}{\themychapter.\arabic{mysection}}
\renewcommand{\themysubsection}{\themysection.\arabic{mysubsection}}
\renewcommand{\themysubsubsection}{\themysubsection.\arabic{mysubsubsection}}

%lengths
\newcommand{\spaceaftertitle}{1cm}
\newcommand{\spaceafternumber}{0.8cm}
\newcommand{\spacebeforesectiontitle}{1cm}

%table of contents
\newcommand{\contents}{
\newpage
\begin{flushright}
\vspace*{\spaceaftertitle}
{\Huge \bfseries \contentstitle}	
\vspace{\spaceaftertitle}
\end{flushright}
\thispagestyle{empty}
\begingroup
	\renewcommand{\chapter}[2]{}
	\tableofcontents
\endgroup
\setcounter{page}{0}
}

%sectioning
\renewcommand{\chapter}[1]{
\begingroup
	\newpage
	\refstepcounter{mychapter}
	\thispagestyle{empty}
	\vspace*{-2\headsep}
	\setlength{\parskip}{0cm}
	\flushright	
	\begingroup
		\fontsize{70}{0}\selectfont
		\themychapter\\
	\endgroup
	\vspace{\spaceafternumber}
	\begingroup
		\bfseries
		\Huge
		#1\\
	\endgroup
	\vspace{\spaceaftertitle}
\endgroup
\renewcommand{\chaptermark}{\themychapter . #1}
\renewcommand{\sectionmark}{\chaptermark}
\addcontentsline{toc}{chapter}{\themychapter. #1}
}

\renewcommand{\section}[1]{
\begingroup
	\refstepcounter{mysection}
	\setlength{\parindent}{0 cm}
	\bfseries \LARGE		
	\vspace{\spacebeforesectiontitle}
	\themysection. #1
	\vspace{0.5\spaceaftertitle}
\endgroup
\renewcommand{\sectionmark}{\themysection . #1}
\addcontentsline{toc}{section}{\sectionmark}
}

\renewcommand{\subsection}[1]{
\begingroup
	\refstepcounter{mysubsection}
	\setlength{\parindent}{0 cm}
	\bfseries \Large		
	\vspace{0.5\helycimelott}
	\themysubsection. #1
	\vspace{0.5\spaceaftertitle}
\endgroup
\addcontentsline{toc}{subsection}{\themysubsection. #1}
}

\renewcommand{\subsubsection}[1]{
\begingroup
	\refstepcounter{mysubsubsection}
	\setlength{\parindent}{0 cm}
	\bfseries \large		
	\vspace{0.5\helycimelott}
	\themysubsubsection. #1
	\vspace{0.5\spaceaftertitle}
\endgroup
\addcontentsline{toc}{subsection}{\themysubsection. #1}
}

\endinput
\AtEndOfClass