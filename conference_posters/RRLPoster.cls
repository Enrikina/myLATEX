\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{RRLPoster}[2018/06/19 A class to make posters for the UPenn Rehab Robotics Lab, uses tikzposter under the hood]

\newif\ifmjscustompaper
\mjscustompaperfalse
\newlength{\mjscustwidth}
\newlength{\mjscustheight}

\DeclareOption{ps30x40}{
    \setlength{\mjscustwidth}{30in}
    \setlength{\mjscustheight}{40in}
    \mjscustompapertrue
}
\DeclareOption{ps40x30}{
    \setlength{\mjscustwidth}{40in}
    \setlength{\mjscustheight}{30in}
    \mjscustompapertrue
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{tikzposter}}
\ProcessOptions\relax

\LoadClass[]{tikzposter}
% defaults are: 25pt, a0paper, portrait, margin=0mm, innermargin=15mm,
% blockverticalspace=15mm, colspace=15mm, subcolspace=8mm

\usepackage[utf8]{inputenc}
\usepackage{comment}
\usetikzlibrary{calc}


\usetheme{Default}

\renewcommand{\familydefault}{\sfdefault}

\usetitlestyle{Empty}
\tikzposterlatexaffectionproofoff % Turn off latex template notice

% Colors from UPenn style guide
\definecolor{blue}{HTML}{01256e}
\definecolor{darker_blue}{HTML}{00144D}
\definecolor{darkest_blue}{HTML}{000F3A}
\definecolor{lighter_blue}{HTML}{045EA7}
\definecolor{lightest_blue}{HTML}{82AFD3}

\definecolor{red}{HTML}{95001A}
\definecolor{darker_red}{HTML}{74000E}
\definecolor{darkest_red}{HTML}{57000A}

\definecolor{white}{HTML}{FFFFFF}
\definecolor{yellow}{HTML}{F2C100}

\definecolor{light_gray_1}{HTML}{F2F2F3}
\definecolor{light_gray_2}{HTML}{E0E1E3}
\definecolor{light_gray_3}{HTML}{CFD0D2}
\definecolor{light_gray_4}{HTML}{BBBDC0}
\definecolor{medium_gray_4}{HTML}{F2F2F3}
\definecolor{dark_gray_2}{HTML}{44464B}
\definecolor{dark_gray_3}{HTML}{2E2F32}
\definecolor{dark_gray_4}{HTML}{131315}

\definecolorstyle{UPenn} {
\colorlet{colorOne}{blue}
\colorlet{colorTwo}{red}
\colorlet{colorThree}{light_gray_1}
}{
% Background Colors
\colorlet{backgroundcolor}{colorThree}
\colorlet{framecolor}{colorOne}
% Title Colors
\colorlet{titlefgcolor}{colorOne}
\colorlet{titlebgcolor}{colorThree}
% Block Colors
\colorlet{blocktitlebgcolor}{colorTwo}
\colorlet{blocktitlefgcolor}{white}
\colorlet{blockbodybgcolor}{white}
\colorlet{blockbodyfgcolor}{black}
% Innerblock Colors
\colorlet{innerblocktitlebgcolor}{white}
\colorlet{innerblocktitlefgcolor}{black}
\colorlet{innerblockbodybgcolor}{white}
\colorlet{innerblockbodyfgcolor}{black}
% Note colors
\colorlet{notefgcolor}{black}
\colorlet{notebgcolor}{white}
\colorlet{notefrcolor}{white}
}

\usecolorstyle{UPenn}

\newlength{\logomidlineheight}
\setlength{\logomidlineheight}{6cm}
\newcommand{\makelogos}{
\node [yshift=\logomidlineheight] at ($(bottomleft)!0.8!(bottomleft -| topright)$) {\includegraphics[height=4.5cm]{images/PerelmanMedicine_logo_blue.pdf}};
\node [yshift=\logomidlineheight] at (bottomleft -| (0,0) {\includegraphics[height=8cm]{images/RRL}};
\node [yshift=\logomidlineheight] at ($(bottomleft)!.2!(bottomleft -| topright)$) {\includegraphics[height=5cm]{images/GRASP_Logo1_2014}};
}

\usepackage{booktabs}
\usepackage{array}
%more space between table rows:
\renewcommand{\arraystretch}{1.2}

\ifmjscustompaper
    \message{setting custom paper size to w:\the\mjscustwidth h:\the\mjscustheight}
    \geometry{paperwidth=\mjscustwidth,paperheight=\mjscustheight}
    \makeatletter
    \setlength{\TP@visibletextwidth}{\textwidth-2\TP@innermargin}
    \setlength{\TP@visibletextheight}{\textheight-2\TP@innermargin}
    \makeatother
\fi

