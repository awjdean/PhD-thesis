\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{tufte-book}
[2023/03/20 v3.6.0 Tufte-book class]

%%
% Declare we're tufte-book
% The base LaTeX class (defaults to the book style)
\newcommand{\@tufte@class}{book}
% The name of the package (defaults to tufte-handout)
\newcommand{\@tufte@pkgname}{tufte-book}

%%
% Load the common style elements
\input{LaTeX/tufte-common.def}

%%
% Set up any book-specific stuff now
\input{LaTeX/preamble.def}

%%
% The front matter in Tufte's /Beautiful Evidence/ contains everything up to the opening page of Chapter 1.  The running heads, when they appear, contain only the (arabic) page number in the outside corner.
\newif\if@mainmatter \@mainmattertrue
\renewcommand\frontmatter{%
	\if@openright%
		\cleardoublepage%
	\else%
		\clearpage%
	\fi%
	\@mainmatterfalse%
	\pagenumbering{arabic}%
	\pagestyle{plain}%
	\setcounter{secnumdepth}{-1}
	\notnumberedchapterformat
}

%%
% The main matter in Tufte's /Beautiful Evidence/ doesn't restart the page numbering---it continues where it left off in the front matter.
\renewcommand\mainmatter{%
	\if@openright%
		\cleardoublepage%
	\else%
		\clearpage%
	\fi%
	\@mainmattertrue%
	\fancyhf{}%
	\fancyfoot[C]{\thepage} % Centered page numbers at the bottom
	% Two-side
	\renewcommand{\chaptermark}[1]{\markboth{##1}{}}%
	% LHS Book title
	\fancyhead[LE]{\smallcaps{\newlinetospace{\plaintitle}}}%
	% RHS Chapter title
	\fancyhead[RO]{\smallcaps{\newlinetospace{\leftmark}}}%
	\setcounter{secnumdepth}{2}
	\numberedchapterformat
}

%%
% The back matter contains appendices, indices, glossaries, endnotes,
% bibliographies, list of contributors, illustration credits, etc.
\renewcommand\backmatter{%
	\if@openright%
		\cleardoublepage%
	\else%
		\clearpage%
	\fi%
	\@mainmatterfalse%
	\fancyfoot[C]{\thepage} % Centered page numbers at the bottom
	\setcounter{secnumdepth}{-1}
	\notnumberedchapterformat
	% \newgeometry{marginparsep=0pt, marginparwidth=0pt}
	\centering
}

%%
% Only show the chapter & section titles in the table of contents
\setcounter{tocdepth}{1}

%%
% End of file
\endinput
