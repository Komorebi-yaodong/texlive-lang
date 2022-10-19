% !TeX encoding = latin9
% This is the french torture file for all formats.
%                                   Copyright Bernard Gaulle as in french.doc
%
% � passer en 8 bits conform�ment � votre syst�me
%                                                       
%%      checksum        = "25011 3750 14847 120214"
%%
%
% For localisation:
%
\makeatletter%
\ifx\documentclass\undefined\let\kbAissue\relax\let\typeouA\typeout%
\else%
   \let\typeouA\@gobble%
% For debugging one can remove "msg" access, just uncomment
%\let\kbAissue\relax% this line.
   \ifx\kbAissue\undefined%
% Firstly we add the material to use the "msg" package for localization.
      \def\kb@issue#1#2{\kb@issue@[#1]#2\void}% The local \issuemsg macro.
                                      % which will call the real one;
                                      % #1 is the macro message required.
                                      % #2 is the message header + msg number
                                      %    such as "^^J -234-", just message 
                                      %    number (234) is kept. 
      \let\kbAissue\kb@issue%
      \def\kb@issue@[#1]#2-#3-#4\void{\issuemsg[#1]#3(french)}%
   \ifx\issuemsg\undefined\let\kbAissue\relax\let\typeouA\typeout\fi%
   \fi%
\fi%
\makeatother%
%
% For better debugging:
\ifx\IeC\undefined
\kbAissue% localise it.
\typeout{^^J-66- ERROR! This file can't be typeset without any input} 
   \typeouA{-66- encoding declaration (look at keyboard or inputenc packages.)}
\expandafter\stop% \usepackage[latin1]{keyboard} should be fine.
\fi
\let\FP\frenchpack\hyphenation{e-french} % anciennement French-Pro
\wlog{Formating \jobname\space with\space\FP\space(\frenchstyleid)}
%
%
\ifx\ProvidesFile\undefined\def\ProvidesFile#1[#2]{}\fi%
\ProvidesFile{french.tst}% 
        [2005/05/11 The torture test file for the package \FP]% **last mods**
\ifx\undefined\FmsG\def\FmsG{}\def\SmsG{}\fi
%
{\catcode`\<=\active\catcode`\>=\active%
% Je veux :
%\global\def<{\left\langle}\global\def>{\right\rangle}
% Et pour ne pas pouvoir avoir l'effet que localement, 
% je fais : 
\gdef<{\myinf}\gdef>{\mysup}
}
\label{nulllabel}% null \label for AmSTeX test \ref within a \ref
\iflatex\makeindex \makeglossary 
        \csname frhyphex\endcsname% load (again) the exceptions, outside babel
        \def\NL#1{\Sauter#1Lignes} 
        \begin{document}
        \makeatletter
        \ifx\babel@savevariable\undefined%
                             \let\FRENCH\frenchTeXmods% 
                        \else\def\FRENCH{\selectlanguage{french}}% pour babel
        \fi%
        \makeatother
        \csname onecolumn\endcsname % avoid writting \onecolumn 
                                    % (special effect in frencht.tex)
        \renewcommand{\thepage}{\roman{page}}%
        \ifx\documentclass\undefined\else% for 2e
        % As 2e doesn't accept \verb in arguments:
        \gdef\myverb|#1|{%\nonfrench
                         \texttt{#1}%
                         %\endnonfrench
                         \relax}%
        \fi
\else
        \let\FRENCH\frenchTeXmods% 
        \def\NL#1{\par} 
\fi
\ifx\myverb\undefined\let\myverb=\verb\fi%
% global here is just req. for TeX--XeT tests.
\global\let\myinf\inferieura% A no-op def
\global\let\mysup\superieura% for a temporary action
\ifx\undefined\english\let\english\relax\fi%
% Les \ldots sont $\ldots$ a cause de AmSLaTeX V1.1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\HyphDiff#1#2{{\setbox0=\vbox{%
                   \pretolerance=-1 \hyphenpenalty=-10000
                   \hsize=0pt \leftskip=0pt \rightskip=0pt \parfillskip=0pt
                   \parindent=0pt \hfuzz=\maxdimen \interlinepenalty=0
                   \clubpenalty=0 \widowpenalty=0 \brokenpenalty=0
                       \hskip 0pt #1}%
                   \setbox2=\hbox{}%
                   \setbox9=\vbox{\unvbox 0 \loop \unskip \setbox1=\lastbox
                                            \ifhbox 1 
                                                 \global\setbox 2 = \hbox{%
                                            \unhbox 1 \discretionary{}{}{}%
                                                           \unhbox 2}%
                                            \repeat}%
\setbox3\hbox{#2}\ifnum\wd2=\wd3\else
\kbAissue% localise it.
\typeout{-31- Wrong French Hyphenation\string! 
               Are you sure to run with a format ***********}
\typeouA{-31- in which the french patterns were 
                installed at initex time\string? ***********}
\ifECM\else%
\kbAissue% localise it.
\typeout{-32- if yes try to switch to T1 font 
             encoding (\noexpand\usepackage[T1]{fontenc})***}
\fi%
\showhyphens{#1}\typeout{(should be\string: #2) 
  \string<\string<======== *********************************}
\fi}}
\HyphDiff{�ventualit�}{�ven-tua-lit�}
\HyphDiff{d�gazonnage}{d�-ga-zon-nage}
\HyphDiff{chromosomique}{chro-mo-so-mique}
%%%%
\SmsG%
\typeout{V\'%
         erification de la sortie de caract\`%
         eres 8-bits \string:}
\message{L'\'% \typeout ne transforme pas en 8bits pour l'instant.
         et\'%
         e est l\`%
         a en ao\^%
         ut \string!} 
\iflatex%
\typeout{Essai de macro d'accentuation dans un ordre \string\showhyphens %
         \string:}
\showhyphens{Faut-il croire \`%
             a l'\'%
             ETERNIT\'%
             E ? \'%
             eludons ...}
\showhyphens{Ao\^%
             ut 2001 ou l'autre \`%
             ere ...}
\fi%
\FmsG%
%
\english% Title page is in english
\ifx\documentclass\undefined % Still Plain! so no \DeclareFontFamily
\else%
% To avoid "No file OMScmtt.fd" message 2004/10/29
\DeclareFontFamily{OMS}{cmtt}{\skewchar\font48 }
\DeclareFontShape{OMS}{cmtt}{m}{n}%
   {<->ssub*cmsy/m/n}{}
\DeclareFontShape{OMS}{cmtt}{m}{it}%
   {<->ssub*cmsy/m/n}{}
\DeclareFontShape{OMS}{cmtt}{m}{sl}%
   {<->ssub*cmsy/m/n}{}
\DeclareFontShape{OMS}{cmtt}{m}{sc}%
   {<->ssub*cmsy/m/n}{}
\DeclareFontShape{OMS}{cmtt}{bx}{n}%
   {<->ssub*cmsy/b/n}{}
\DeclareFontShape{OMS}{cmtt}{bx}{it}%
   {<->ssub*cmsy/b/n}{}
\DeclareFontShape{OMS}{cmtt}{bx}{sl}%
   {<->ssub*cmsy/b/n}{}
\DeclareFontShape{OMS}{cmtt}{bx}{sc}%
   {<->ssub*cmsy/b/n}{}
%%%%%%%%%%%%%%%%%%%%%%%
\fi% 
\makeatletter% for \f@encoding 
\title{\fbox{ \FP\ \LaTeX%
             \thanks{We are here in english, notice the problem when we use,
                     like in \texttt{frenchla}, a
                     {\mdseries\texttt{\textbackslash fnsymbol}}
                      in a box.\newline%
                     \indent \hspace*{0.5em}
                             Notice also that 
                             {\mdseries\texttt{\textbackslash backslash}}
                             can't be used.%
                    }%
            }\\ \ \\%
             Version \frenchstyleid\\ \ \\
             ``Torture'' Test (\jobname) \\ with
             \ifx\encodingdefault\undefined Unknown
              \else\ifx\f@encoding\undefined\encodingdefault{} 
                     \else\f@encoding{} \fi
             \fi Font Encoding\\\ }
  \author{Bernard {\sc Gaulle}%
          \thanks{Thanks to those good guys who helped me.\newline%
                  \indent\hspace*{0.5em}
                          This test note is also referred by a
                         {\mdseries\texttt{\textbackslash refmark}} call.
                  \label{title:thanks}% 
                 }%
          \\ \ \\ et...\refmark{title:thanks}%
         }%
% AmS \normalparindent no more exists 2000/06/15, so the code is removed.
%\makeatletter% Don't let AMS change \parindent
%\ifx\RIfM@\undefined\else\normalparindent=1em\parindent=\normalparindent\fi%
%\makeatother
\makeatother%
\date{Printed on \today} 
% As the titlepage is in English but the date in French we let \ier defined:
{\def\ier{ier}\maketitle}
\setcounter{page}{2}\thispagestyle{empty}
\cleardoublepage\french
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\onecolumn
\sommaire[4]
\bigskip 
\begin{center}
\noindent\fbox{%
\begin{minipage}[t]{0.5\textwidth}
\begin{center} \fbox{\parbox{5cm}{{\bf Remarque} : \\ la commande
\texttt{\backslash som\-maire}\label{pbverb}%
\footnote{Cette note a �t� demand�e depuis une minipage.}%
\footnote{Cette deuxi�me note aussi.} 
%%%%NB : \verb|\sommaire| ou \verb|\tableofcontents| produisent des HORREURS,
%%%%     lorsqu'ils ont utilises dans un \fbox, BUG LATEX !
 est un apport de \FP.\hfill}} 
\end{center}
\end{minipage}
}
\end{center}

{% Not a LaTeX redefinition : \def\thefootnote{\fnsymbol{footnote}}
\renewcommand{\thefootnote}{\fnsymbol{footnote}}%
Essai de note avec \verb|\fnsymbol|
\footnote{Note avec une �toile.}.

\def\thefootnote{\relax}
Essai de note de bas de page non num�rot�e
\footnote{Note non num�rot�e.}.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\cleardoublepage
\chapter*{\prefacename}

{\em Certains croient qu'une pr�face peut apporter de la valeur au livre,
moi je pense plut�t que cela apporte de la {\em valeur} 
� l'auteur...} (dans
tous les sens du terme).

\cleardoublepage

\twocolumn 
\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}%
\chapter*{Introduction}

\begin{motsclef}
french, style, francisation, francophonie, multilingue, 
english, option, extension. 
\end{motsclef}

\begin{resume} 
Ce document a �t� con�u
uniquement pour tester intensivement \FP\ (anciennement appel� 
option de style% 
   \glossary{� : ; style ? ! �}\index{� : ; style ? �}%
   \footnote{Cette note a pour but de faire appel � une macro
             \texttt{\backslash index} contenant des caract�res actifs.%
             \index{� : ; depuis la note de bas de page ? �}%
            } 
\index{french!Le point d'exclamation est un caract�re sp�cial de Makeindex}%
\index{<@{\tt\protect\inferieura} ({\tt\protect\backslash inferieura})}% 
\index{>@{\tt\protect\superieura} ({\tt\protect\backslash superieura})}%
\index{Magic di N'Konga (auteur c�l�bre)}%
 \texttt{FrenchPro}).  
\end{resume}

\bigskip Notez que les deux environnements \verb|resume| et \verb|motsclef|
(ainsi que \verb|keywords|)
sont des apports de \FP.

\bigskip Si le libell� � R�sum� � appara�t dans la partie
 anglaise, cela
signifie que \FP\ ne poss�dait pas de d�finition
d'\verb|\abstract| et donc l'a remplac� par \verb|\resume|. Cela signifie
aussi que les libell�s anglais n'ont pas �t� d�finis 
%(\verb|\captionnames|%
%\footnote{Une extension {\tt fenglish} est fournie conjointement avec
%\FP\ ; {\tt\backslash captionnames} y est d�fini. 
%Cette extension {\tt
%fenglish} est automatiquement appel�e par \FP\  dans le
%cas que nous avons cit�.}
% n'�tait pas d�fini par les extensions appel�es avant
% \FP).
Rappelez-vous aussi que \verb|\abstract| ne fait pas partie de la classe
de document \verb|book|.

Remarquez les diff�rences entre les num�ros de notes de bas de page en 
fran�ais et en anglais, ainsi que l'impression de ce m�me num�ro en
bas de la page.

\english\newpage
\begin{keywords} %???\relax% for AMS which has its own macro with #1
French, Style, Option, Package, French-Speaking usage, English, Multilingual.
\end{keywords}

\begin{abstract} The object of this paper is to test intensively \FP.
\end{abstract}
\NL1

\bigskip Notice that the three environments 
\verb|resume|, \verb|keywords| and \verb|motsclef|
are all introduced by \FP.

\bigskip Notice that if the abstract name printed here is not ``Abstract'' you
are using packages that have no \verb|\abstractname| defined for eng\-lish. 
 The english package defining such captions is loaded only 
if \verb|\captionsnames|%
\footnote{The {\tt fenglish} package is given with \FP,
so {\tt$\backslash$captionnames} are normally defined because 
\FP\ is calling automatically the {\tt fenglish} package in the 
pre\-viously cited case.} was
previously undefined.  (Remember also that as \verb|\abstract| is not defined
in the \verb|book| document class the \FP\ assumes it is a
\verb|\resume|.)

Notice the different typesetting of the footnote numbers in French and English
as well as the printing of that numbers before the footnote text.\vfill

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%\pagebreak
\french
\part{Ce qui marche est ici...}
\disallowuchyph% ce que je prefere...

\chapter{Avertissements}

Seul le document authentique qui est fourni par l'auteur
 sous une forme compos�e
constitue la r�f�rence. Cela veut dire que l'installateur de \FP\ 
sur un syst�me doit comparer son r�sultat 
(sous forme papier ou
fichier \verb|.pdf|) avec la forme authentique fournie par l'auteur.

\bigskip

\bigskip \FP\  a �t� con�u pour fonctionner 
avec la majorit� des formats bas�s sur \LaTeX{}
\footnote{Au si�cle dernier (XX\ieme), \FP\ �tait appel� � style 
\texttt{french} � et pouvait fonctionner en dehors de \LaTeX\ mais
l'effort pour assurer cette facilit� dans de trop nombreux formats
exotiques �tait totalement disproportionn� ; ceci a donc �t�
abandonn� (au moment de la sortie de \LaTeXe).}%
. 

\bigskip \AllTeX{} est mon logo ; il symbolise {\em tous les \TeX{}} ; on peut
l'imprimer correctement dans toutes les polices ({\em \AllTeX}, {\bf \AllTeX}, 
{\sf \AllTeX}, {\tt \AllTeX}, ...) gr�ce � la partie NFSS de \LaTeXe%
\footnote{Le document de r�f�rence ({\tt frenchrf})
a �t� produit avec NFSS. Ce document-ci a �t� compos� avec le format 
{\tt \fmtname}.}
.

\newpage\english Only the authentic author's document in a composed form is
the reference.  That means that the on site \FP\ installator must
compare his result (paper or \verb|.pdf| file) with the authentic form
provided by the author.
\NL2

\bigskip \FP\ was designed to work with all {\em formats\/} 
based on \LaTeX.

\bigskip \AllTeX{} is my logo ; it's a  symbol for expressing 
{\em all \TeX{}} ; one can print it correctly in all shapes
({\em \AllTeX}, {\bf \AllTeX}, 
{\sf \AllTeX}, {\tt \AllTeX}, etc.) due to the NFSS part of \LaTeXe%
\footnote{The
reference document was produced with NFSS of {\tt \fmtname}.}%
.

\french
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\chapter{La torture} 

\section{Le saviez-vous ?} Nos journaux, livres, revues,
articles scientifiques ou autres ont �t� (en gros) durant les trente
derni�res ann�es du vingti�me si�cle imprim�s 
par des machines d'origine
am�ricaine. Ainsi, petit � petit, nous perd�mes 
l'habitude de lire des
majuscules accentu�es parce que tout simplement les polices
 de caract�res
utilisables sur ces machines n'en comportaient pas.

L'usage de plus en plus g�n�ralis� de l'infor\-ma\-tique 
{\em am�ricaine} fit ainsi dispara�tre pendant un temps tous
 les accents de notre langue �crite.

De la m�me mani�re un certain nombre de 
{\em mauvaises habitudes} furent
prises quasiment inconsciemment tout simplement parce que les programmes
informatiques ne pouvaient pas faire autrement. Ainsi de nombreuses {\it
coquetteries} de notre typographie sont tomb�es dans l'oubli.

Saviez-vous par exemple qu'on n'imprime pas des guillemets comme ceci `` '' ni
m�me ` ' mais ainsi � � ? Nous nous autoriserons toutefois
 � utiliser dans
ce document ces guillemets %\noenglishquote 
(` ') que nous consid�rons comme
{\em techniques}.

\newpage\english \section{Did you know that?}
Our (french)
newspapers, books, magazines, scientific articles and other things have
been printed  the last thirty years (roughly)
of the twentiest century with american machines. So our
habits to read accented uppercase letters declined because they simply were
not included in the machinery.\NL2

Together with American computer usage growth, all french
diacritics disappeared from our french written language.\NL1

In a same way {\em bad
habits} took place, inconsciously, for the only reason that computer programs
could not do otherwise. So, a lot of  french typographic {\em coquetteries\/}
are largely forgotten.\NL1

 Did you know for example that we never typeset french
guillemets like this `` '' neither ` ' but%
{\makeatletter\def\GOfrench{T1}\ifx\GOfrench\f@encoding\else%
\footnote{We switched to \emph{French} here to be able %
          to print valid glyphs.}%
\fi} %
\begin{french}� and �\end{french}? Instead, we will
authorised ourselves to use (` ') in this document 
because we consider they are {\em technical} guillemets.
\french
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
*** Cet espace est laiss� intentionellement � blanc ***
\NL3
\section{Typographie fran�aise}
%\noenglishquote 
La typographie fran�aise est sp�cifique en ce qui concerne
l'utilisation des signes sui\-vants : 
`\verb|.| \verb|:| \verb|;| \verb|!| \verb|?| \verb|�| \verb|�|'. 

La r�partition des espaces dans une ligne se fait de fa�on 
�quitable entre les
mots (jamais � l'int�rieur des mots) et apr�s 
la ponctuation (c'est le
\verb|\frenchspacing| de \TeX{}) contrairement � la
 typographie anglaise.

Les `\verb|; ! ?|' doivent �tre pr�c�d�s d'une espace fine 
ins�cable.  C'est
ce que nous avons appliqu� dans \FP.  
Le cas du `\verb|?|'
a �t� trait� sp�cialement car l'espace fine ayant 
�t� jug�e trop grande (par
des sp�cialistes), a �t� r�duite tout en adjoignant une peu de 
{\em glue} d'extensibilit�.

En ce qui concerne le `\verb|:|', le code typogra\-phi\-que%
\footnote{Nous
avons choisi d'adopter les recommandations de l'imprimerie nationale
fran�aise.} pr�cise qu'il est pr�c�d� 
d'une espace {\em mot\/} 
ins�cable.
D'autres ont jug� que c'�tait inesth�tique et cela a �t� 
remplac� par une espace fine. 

Les guillemets fran�ais � doivent �tre suivis d'une espace mot 
ins�cable qui
a �t� remplac�e ici par une espace moindre. 
Les guillemets fermants �
sont, eux, pr�c�d�s de la m�me espace.

\SmsG%
Lorsque la ligne n'est pas assez remplie et qu'il existe un `:', les
typographes ont --~semble-\hbox{t-il}~-- l'habitude 
de r�partir largement les espaces autour
des deux points. C'est ce qui a �t� fait dans \FP\ qui
pourra �ventuellement produire une ligne : peu remplie\footnote{Le cas pr�sent� ici a �t� 
cr�� artificiellement et peut donc appara�tre exag�r� dans
certaines mises-en-pages.}%
\penalty-10000% 
 ou aussi bien une ligne se terminant ainsi : � {\em com\-me % \- pour fourier
font les pros\/} �
lorsqu'ils ne trouvent pas d'autre moyen mais il devrait s'agir que de cas
extr�mes. � noter que cela a pour avantage de r�duire les
\verb|over/under-full hbox| de fa�on significative.

Paragraphe de remplissage...\\ ...\\... pour v�rifier que le `:' ne 
termine ni la page ni la colonne. Ainsi : 

%\englishquote 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\begin{itemize} 
\item %qu'il s'agisse de verbatim ou d'une liste d'�l�ments 
les deux points et  le  texte qui suit  
sont  tous  deux sur la  m�me  page.
\end{itemize}
%\newpage % already done with the previous list
\FmsG%
\english

\smallskip

\section{French printing}

French printing use specific typographic rules specially in concern with 
the following: `. : ; ! ?' and french guillemets.

Interword spacing in a line is allways equal (and never modified inside a
word). It's the same way after punctuation (standard \verb|\frenchspacing|) as
opposed to the english typography.\NL1

All `; ! ?' are preceeded by a thin and uncuttable space. We apply this
automatically in \FP. (We have added few stretching {\em glue} to
the question mark).\NL2

Regarding the `:' we have not inserted an inter-word space but a thin space 
and also have added some glue.\NL2

\smallskip
French guillemets are processed the same way. \NL3

In an {\em underfull\/} line containing a `:' man has habits to share spaces
around the double points. This way used in \FP\ can also produce a
line with a ragged right, as shown in the french column. This technique
 reduce a lot of {\em overfull} and {\em underfull} {\tt hboxes} 
produced by \TeX{}.
\NL3

As shown also, \FP\ is reluctant to print a double point at the
end of a page or a column.\french%\noenglishquote
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\section[Dactylographie fran�aise]{Rappels concernant la \newline 
dactylographie}

Les habitudes de saisie c.-�-d. les habitudes dactylographiques,
 veulent que les signes suivants
`\verb|:| \verb|;| \verb|!| \verb|?| \verb|�|' 
soient toujours pr�c�d�s d'un blanc
(barre d'espace sur les claviers) et les \verb|�| toujours
suivis d'un blanc. \FP\ remplacera
automatiquement ce blanc (� la composition) par l'espace appropri�e.

{\moretolerance\moretolerance\moretolerance
Les guillemets fran�ais � (et respectivement �)...
\footnote{\tthyphenation Avec les options fournies 
telles \vers|A4| et  \vers|double|\-\vers|column| on obtient
 l� un \vers|overfull| \vers|hbox| difficilement r�ductible
de fa�on automatique mais je l'ai r�duit 
avec 3 \texttt{\backslash moretolerance}%
\notthyphenation.} 
\par}
%\nooverfullhboxmark

Les vrais guillemets fran�ais � (et respectivement �)
s'utilisent toujours doubl�s (\verb|�| et respectivement 
\verb|�|). Ainsi $<$ et $>$ ne 
sont que des signes math�matiques et n'ont pas
d'autre sens en fran�ais que : {\em inf�rieur �} et 
{\em sup�rieur �}.

Il est fortement conseill� de poursuivre
ces habitudes dactylographiques qui
contribuent aussi � �claircir le texte
saisi et donc ainsi � faciliter les
corrections ult�rieures.
\NL1

\subsection[Test de la ponctuation fran�aise 
            \mdseries`\protect\myverb|. : ; ! ?|']
{Test de la ponctuation \newline fran�aise 
            \mdseries`\protect\myverb|. : ; ! ?|'} 

Le deux points s'imprime comme ceci : s'il est pr�c�d� d'un blanc
(au moins un) sinon rien n'est chang� (par ex. 11:33). Notez 
l'espace apr�s le point terminant la phrase ; le point virgule
est aussi pr�c�d� d'une espace fine s'il n'est pas coll� 
au mot le pr�c�dant (comme dans cet exemple d� � une faute
de frappe; assez fr�quente).\\
{\moretolerance
Oh ! Quoi-donc ? Notez ici l'espacement utilis�
devant le `!' et le `?'. Il ne faut
pas oublier aussi de taper le blanc avant, sinon? tout est
%terriblement 
 coll�! Voyez-vous la diff�rence ? Bravo !
}

Mais pour les documents {\em mal\/} saisis (c.-�-d. sans blanc) il est
toujours possible de sp�cifier la sous-option \verb|\untypedspaces|
\untypedspaces pour obtenir une insertion automatique des espaces
manquants comme ici! o� il avait �t� saisi `\verb|ici!|'.
V�rifions pour les autres ponctuations :;? \typedspaces que nous 
n'obtenons pas :;? serr�es comme ici.

V�rification de l'espacement :

\noindent
\verb|  \typedspaces X~; Y ; Z;| = \typedspaces X~; Y ; Z;

\noindent
\verb|\untypedspaces X~; Y ; Z;| = \untypedspaces X~; Y ; Z; \typedspaces

\newpage\english
\section{French typing}
French typists have some habits. For example they type a space before `: ; ! ?
\verb|�|' and after \verb|�|. \FP\ replace automatically this
blank space by the appropriate spacing.

There is only one kind of quoting in French by the mean of guillemets which
are allways typed \verb|�| and \verb|�|. Usual english simple and double
quotes must be prohibited.

\subsection{\mdseries%
            \texttt{\textbackslash untypedspaces}}%
This control command offers the ability to repair automatically a document
badly typed i.e. in which spaces were not typed before french punctuation.
This bypass can help but is not the good way to use daily because there are
many cases where, for example, a double point must never be preceeded 
by a space.

Now we verify that the spacing is unchanged in English:

\noindent
\verb|  \typedspaces X~; Y ; Z;| = \typedspaces X~; Y ; Z;

\noindent
\verb|\untypedspaces X~; Y ; Z;| = \untypedspaces X~; Y ; Z; \typedspaces

\subsection{\mdseries%
            \texttt{\textbackslash wrongtypedspaces}}
A french typist may input  spaces before
punctuation as it is usual in French. These unfortunate space
 can be removed by simply letting \FP\ do it with* the control
sequence:

\begin{verbatim}
\letpunctuationactivefor
               \wrongtypedspaces
\end{verbatim}

\FRENCH% pour ne pas dire \french
\letpunctuationactivefor\wrongtypedspaces
\english
Let's try the previous example:\par
\noindent
\verb|  X~; Y ; Z;| =  X~; Y ; Z;

Now we say \verb|\nowrongtypedspaces|
\nowrongtypedspaces to come back to the normal
situation.

\vfill
\french
\nowrongtypedspaces% to be sure it is set when english text is skipped
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\csname StopFrenchLbT\endcsname% special case, temporary.

\section[Test des guillemets fran�ais, 7 (<%
                                          < >%
                                            >) et 8-bits (� �)]%
{Test des guillemets \newline fran�ais (� �)}
\hyphenation{nor-ma-le-ment}

Les guillemets fran�ais s'�crivent et se saisissent 
� normalement � comme ceci : 
\verb|� |{\tt nor}\-%
{\tt male}\-{\tt ment }\verb|�| 
 ou �ventuellement en italiques mais toujours
\bgroup% for frenchle
� \em normalement\/ � %
\egroup% for frenchle
; ici nous avons tap� au clavier :
\verb|� \em| {\tt normalement}\verb| �|.
Et en tapant par contre :\\ \verb|�\em| 
 {\tt anormale\-ment (sans espace)}\verb|�| \  on  obtient...
\bgroup% for frenchle
�\em anormale\-ment (sans espace)\/�.
\egroup% for frenchle
Re\-mar\-quez que les guillemets font office d'acco\-lades \TeX{} et que donc
les changements de polices sont restaur�s en sortant de la citation.

Pour les documents d�j� saisis {\em sans espace} << \FP\ >>
ins�rera syst�matiquement un espace � l'endroit
d�sir� si l'on a donn� la sous-option \verb|\untypedspaces|. 
\untypedspaces 
Et en tapant � nouveau 
\verb|�\em| {\tt anormale\-ment (sans espace)}\verb|�| on obtient
\bgroup% for frenchle
�\em anormalement (sans espace)\/�. 
\egroup% for frenchle
\typedspaces

Parfois on d�sirera remplacer syst�matiquement tous les 
guillemets anglais (`` et '') d'un texte par de vrais guillemets 
fran�ais, il
suffira alors de fournir l'�trange option :\\
\texttt{\backslash noenglishdoublequotes}\\
\noenglishdoublequotes pour obtenir : `` ''.

``  '' (m�me test en d�but de paragraphe).\englishdoublequotes
 
Lorsqu'une citation est faite dans un texte, celle-ci commence
toujours par des guillemets. � Cette citation peut se poursuivre sur
plusieurs paragraphes. 

Dans ce cas, le style %\verb|french| 
ins�rera syst�matiquement les guillemets n�cessaires 
en d�but de 
chaque paragraphe. �

Mais une citation peut aussi en contenir une autre. � Dans ce cas l'imprimerie
 nationale pr�cise dans   ses {\em R�gles typographiques} : 
\ancientguillemets
 � Lors\-que la premi�re citation est 
elle-m�me plac�e entre 
guillemets, chaque ligne de la seconde d�butera par un 
guillemet ouvrant. � 
Ce dispositif, comme on le voit, n'est pas  mis en �uvre ici
 (voir son application au paragraphe \ref{noeveryparguillemets}). 
 � La deuxi�me citation peut aussi...

se poursuivre sur un ou 
plusieurs paragra\-phes. � Notez bien qu'avant cette citation nous avons 
demand� les \verb|\ancientguillemets| 
pour produire ces guillemets fermants
en d�but de ligne. Le \verb|\todayguillemets| r�tablit la 
situation une fois
le deuxi�me niveau termin�. \todayguillemets

{\makeatletter\def\GOfrench{T1}\ifx\GOfrench\f@encoding
\enlargethispage{10pt}% increase probably due to EC fonts metrics?
\fi}
Il arrive que la fin d'une citation de deux\-i�me niveau 
co�ncide avec celle
du premier niveau.  � Dans ce cas il faudra coder, comme ici :\\
\verb|\endguillemets| 
� la place de ``\verb|�|'' \endguillemets. 

Deux tests : \fbox{\begin{guillemets} XXX \end{guillemets}}
et  \fbox{X \begin{guillemets} XXX \end{guillemets} X} servant �
v�rifier l'espacement quand on utilise \verb|\begin| et \verb|\end|.

Le paragraphe suivant va alors d�marrer de fa�on 
tout � fait normale...

On peut aussi coder :
\begin{verbatim}
\begin{guillemets}
Une citation...
\end{guillemets}
\end{verbatim}
ce qui donnera :
\begin{guillemets}
Une citation...
\end{guillemets}
et en tapant {\em � la \TeX} : \verb|\guillemets{}| \verb|Une citation...| 
\verb|\en|\vers|d|\-\vers|guillemets{}| nous devons  obtenir absolument la m�me chose :
\guillemets{} Une citation... \endguillemets{}

V�rifions maintenant l'espacement dans les diff�rents cas :

\noindent
\fbox{\parbox{2cm}{�X\dotfill X�}} \%\texttt{\backslash typedspaces}
 {\em sans blanc}

\noindent
\fbox{\parbox{2cm}{� X\dotfill X �}} \%\texttt{\backslash typedspaces} 
{\em normal}

\noindent\untypedspaces
\fbox{\parbox{2cm}{� X\dotfill X �}} \%\texttt{\backslash untypedspaces} 
{\em avec blanc}

\noindent
\fbox{\parbox{2cm}{�X\dotfill X�}} \%\texttt{\backslash untypedspaces} 
{\em sans blanc}
\typedspaces

\noindent
\fbox{\parbox{3cm}{A blabla bla blabla : � 
Ceci est mon test de c�sure �}} �...� reste possible.

\begin{flushleft}
 Ceci est � un test avec \verb|\raggedright| � qui 
--~th�oriquement~-- ne devrait plus nous poser de probl�me.
\end{flushleft}

\subsection{{\mdseries%
\texttt{\textbackslash noeveryparguillemets}}}\label{noeveryparguillemets}
Cette option permet de g�rer correctement les citations de second 
rang mais elle est tout � fait contraire
 au processus \verb|\everypar| cit� pr�c�demment gr�ce auquel
 les guillemets sont g�n�r�s automatiquement � chaque 
d�but de paragraphe.
Voici ce que produit l'option {\em normale\/} 
\texttt{\backslash every\-par\-guil\-lemets} sur le paragraphe suivant :

� Tout le monde s'accorde � trouver l�gitime la division : 
{\tt extra-ordinaire}. Le cas des mots com\-pos�s est le seul 
� rencontrer 
cette unanimit�. Dans les autres, les opinions sont tr�s partag�es.
 Frey est le plus cat�gorique : il n'admet de division selon la formation 
que pour des mots de composition compl�tement fran�aise, et la rejette 
sinon... Le {\em Code typographique}, tout en adoptant ce m�me point
 de vue � ... [reconna�t] n�anmoins que certains auteurs de travaux 
scientifiques pr�f�rent la division �ty\-mologique 
qui fait ressortir
 la racine grecque ou latine. � Quant � Gouriou, il �crit :
� On pr�f�rera cependant garder la coupure �tymologique
 chaque fois que les composants sont {\em ais�ment} re\-connaissables. � 
(L'italique est de Gouriou.) 
\marginpar{{\footnotesize Ici on a trich� avec des} \texttt{\backslash!}}
\!Telle \!est aussi \!l'opinion \!de \!Girodet �. 

Et voici l'effet de \verb|\noeveryparguillemets| :
\noeveryparguillemets

� Tout le monde s'accorde � trouver l�gitime la division : 
{\tt extra-ordinaire}. Le cas des mots com\-pos�s est le seul 
� rencontrer 
cette unanimit�. Dans les autres, les opinions sont tr�s partag�es.
 Frey est le plus cat�gorique : il n'admet de division selon la formation 
que pour des mots de composition compl�tement fran�aise, et la rejette 
sinon... Le {\em Code typo\-graphique}, tout en adoptant ce m�me point
 de vue � ... [reconna�t] n�anmoins que certains auteurs de travaux 
scientifiques pr�f�rent la division �ty\-mologique 
qui fait ressortir
 la racine grecque ou latine. � Quant � Gouriou, il �crit :
� On pr�f�rera cependant garder la coupure �tymologique
 chaque fois que les  composants sont {\em ais�ment} re\-connaissables. � 
(L'italique est de Gouriou.) 
Telle est aussi l'opinion de Girodet �. 
\everyparguillemets

Il faut noter que cette option impose que le paragraphe commence et se
termine par des guillemets. % sinon code \guillpar et \parguill
C'est pour cela que nous n'avons pas mis cette option par d�faut.

\subsubsection{Un test assez m�chant}
Voici un exemple d'utilisation dans un environement \verb|quotation|%
\footnote{Nous avons introduit \texttt{\backslash moretolerance} 
pour obtenir une composition correcte.} :
\begin{quotation}
\moretolerance\moretolerance\moretolerance
� Je ne peux mieux faire que de citer la d�finition qu'a donn�e
de la gravure un de nos ma�tres fondeurs, Fournier le Jeune :

� La scien\-ce du graveur, dit-il, consiste � conna�tre la figure
la plus parfaite que l'on puisse donner aux caract�res, les dimensions
qu'ils doivent avoir  et � les repr�senter sur l'acier pour les frapper
sur le cuivre afin d'en former des matrices qui perp�tuent des lettres
� l'infini par la fonte. \endguillemets
\end{quotation}

Le m�me exemple sans \verb|quotation|  :

� Je ne peux mieux faire que de citer la d�finition qu'a donn�e
de la gravure un de nos ma�tres fondeurs, Fournier le Jeune : 

� La scien\-ce du graveur, dit-il, consiste � con\-na�tre la figure
la plus parfaite que l'on puisse donner aux caract�res, les dimensions
qu'ils doivent avoir  et � les repr�senter sur l'acier pour les frapper
sur le cuivre afin d'en former des matrices qui perp�tuent des lettres
� l'infini par la fonte. \endguillemets
\bigskip

\noeveryparguillemets
Puis avec \verb|\noeveryparguillemets| (c.-�-d. sans \verb|quotation|) :

� Je ne peux mieux faire que de citer la d�finition qu'a donn�e
de la gravure un de nos ma�tres fondeurs, Fournier le Jeune : 

� La scien\-ce du graveur, dit-il, consiste � conna�\-tre la figure
la plus parfaite que l'on puisse donner aux caract�res, les dimensions
qu'ils doivent avoir  et � les repr�senter sur l'acier pour les frapper
sur le cuivre afin d'en former des matrices qui perp�tuent des lettres
� l'infini par la    % En cas d'arr�t � cet endroit : le format
fonte. \endguillemets%.fmt utilis� n'est prob. pas ds le bon codage !
\bigskip

Et enfin avec \verb|quotation|, voil� 
ce que cela peut donner\label{quotation} :
%%% La \marginpar suivante pose un pb de ``Lost Float'' qd elle est
%%% placee plus loin, pourquoi ?
\marginpar{{\footnotesize Il y a ici un probl�me � �tudier en 2 colonnes !}}
\begin{quotation}
� Je ne peux mieux faire que de citer la d�finition qu'a donn�e
de la gravure un de nos ma�tres fondeurs, Fournier le Jeune :

� La scien\-ce du graveur, dit-il, consis\-te � conna�tre la figure
la plus parfaite que l'on puisse donner aux caract�res, les dimensions
qu'ils doivent avoir  et � les repr�senter sur l'acier pour les frapper
sur le cuivre afin d'en former des matrices qui perp�tuent des lettres
� l'infini par la fonte.
 \endguillemets
\end{quotation}
\everyparguillemets
On notera ici les espaces inter-mots beaucoup plus {\em tol�rants}. C'est
la seule solution trouv�e pour arriver � imprimer 
quelque chose d'� peu
pr�s correct en double colonnage.

\vfill
Terminons la page en anglais pour tester le haut de page. Les guillemets
doivent �tre bons avec le codage T1.

\english
Let's complete the page with english text in order to test and show
how will be printed the header.
\french
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\onecolumn
\subsubsection{M�me test en \mdseries\texttt{\textbackslash onecolumn}}
Voici un exemple en environement \verb|quotation| :
\begin{quotation}
� Je ne peux mieux faire que de citer la d�finition qu'a donn�e
de la gravure un de nos ma�tres fondeurs, Fournier le Jeune :

� La scien\-ce du graveur, dit-il, consiste � conna�tre la figure
la plus parfaite que l'on puisse donner aux caract�res, les dimensions
qu'ils doivent avoir  et � les repr�senter sur l'acier pour les frapper
sur le cuivre afin d'en former des matrices qui perp�tuent des lettres
� l'infini par la fonte. \endguillemets
\end{quotation}

Le m�me exemple sans \verb|quotation|  :

� Je ne peux mieux faire que de citer la d�finition qu'a donn�e
de la gravure un de nos ma�tres fondeurs, Fournier le Jeune : 

� La scien\-ce du graveur, dit-il, consiste � conna�tre la figure
la plus parfaite que l'on puisse donner aux caract�res, les dimensions
qu'ils doivent avoir  et � les repr�senter sur l'acier pour les frapper
sur le cuivre afin d'en former des matrices qui perp�tuent des lettres
� l'infini par la fonte. \endguillemets
\bigskip

\noeveryparguillemets
Puis avec \verb|\noeveryparguillemets| (sans \verb|quotation|) :

� Je ne peux mieux faire que de citer la d�finition qu'a donn�e
de la gravure un de nos ma�tres fondeurs, Fournier le Jeune : 

� La scien\-ce du graveur, dit-il, consiste � conna�tre la figure
la plus parfaite que l'on puisse donner aux caract�res, les dimensions
qu'ils doivent avoir  et � les repr�senter sur l'acier pour les frapper
sur le cuivre afin d'en former des matrices qui perp�tuent des lettres
� l'infini par la fonte. \endguillemets
\bigskip

Et enfin avec \verb|quotation| :
\begin{quotation}
                    \let\bkORI\break
                    %\def\break{\bkORI\hbox to 0pt{/}}% for debug
                    %\ancientguillemets% for debug
� Je ne peux mieux faire que de citer la d�finition qu'a donn�
de la gravure un de nos ma�tres fondeurs, Fournier le Jeune : 

� La scien\-ce du graveur, dit-il, consiste � conna�tre la figure
la plus parfaite que l'on puisse donner aux caract�res, les dimensions
qu'ils doivent avoir  et � les repr�senter sur l'acier pour les frapper
sur le cuivre afin d'en former des matrices qui perp�tuent des lettres
� l'infini par la fonte. \endguillemets
\end{quotation}
\everyparguillemets

\subsubsection{Test de � stretchability �}

Les espaces doivent �tre �galement r�partis sur la ligne :

\medskip
\hbox to \hsize{etiord-gauche\footnote{En plain \TeX{} l'espacement est ici
\label{etiord}
                                       curieusement incorrect ! ...}
 � centre-ertnec � \hbox{}\footnote{... alors qu'il faudrait 
la m�me r�partition
                               de l'espace.}%
                               ehcuag-droite}
\medskip

\subsection{Test des commandes \mdseries\texttt{\textbackslash ifnum}}

\ifnum 1 < 3 1\verb| < |3 est VRAI, bien s�r ! 
       \else 1\verb| < |3 est FAUX ! \fi
comme 
\ifnum 3 > 1 3\verb| > |1 est aussi VRAI, bien s�r ! 
       \else 3\verb| > |1 est FAUX ! \fi

\medskip

\subsection{Test des commandes \mdseries\texttt{\textbackslash everypar}}

{J'ai cod� dans cette section \verb|\everypar{$++\,$}| : \everypar{$++\,$}

Paragraphe 1 � citation niveau 1

Paragraphe 2 � citation niveau 2

Paragraphe 3 fin citation niveau 2 � puis fin niveau 1 �

Paragraphe 4}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage% tjrs en 1 colonne
\hbox{}\ifx\itshape\undefined\else% avoid old frencht crash
\subsection{Test de fermeture pr�matur�e}

Il arrive que les guillemets soient ferm�s dans un environnement
plus int�rieur qui n'apparie donc pas  correctement les blocs.
Voici un exemple d'utilisation :

\begin{verbatim}
Ma�tre Corbeau dit � son clerc : � \itshape Cher coll�gue,

\begin{itemize}
\item Ah que vous �tes joli !
\item Ah que vous me semblez beau ! � \upshape  
et s'enfuit de ce pas...
\end{itemize}

\endguillemets
\textsf{Quel homme �trange, n'est-ce pas ?}
\end{verbatim}

Voici ce que cela donne comme composition :

\medskip
\bgroup% for frenchle
Ma�tre Corbeau dit � son clerc : � \itshape Cher coll�gue,

\SmsG%
\begin{itemize}
\item Ah que vous �tes joli !
\item Ah que vous me semblez beau ! � \upshape 
et s'enfuit de ce pas...
\end{itemize}
\FmsG%

\endguillemets
\egroup% for frenchle
\textsf{Quel homme �trange, n'est-ce pas ?}

\medskip
On notera plusieurs choses. Premi�rement il a fallu
r�tablir \verb|\upshape| apr�s les guillemets fermants,
du fait du mauvais appariement des blocs. Ensuite un message
sort indiquant une fermeture pr�matur�e des guillemets.
Cette fermeture restant incompl�te on note enfin que l'on a forc�
un \verb|\endguillemets| pour clore proprement et d�finitivement
l'environnement guillemets.

\subsection{\mdseries\texttt{\textbackslash everyparguillemetsremoved}}
\label{noeveryparguillemetsremoved}
Dans le m�me exemple nous pouvons aussi interdire la g�n�ration
automatique des guillemets ouvrants � chaque d�but de paragraphe ;
il faut alors saisir \verb|\everyparguillemetsremoved| :
\everyparguillemetsremoved

\medskip
\bgroup% for frenchle
Ma�tre Corbeau dit � son clerc : � \itshape Cher coll�gue,

\SmsG%
\begin{itemize}
\item Ah que vous �tes joli !
\item Ah que vous me semblez beau ! � \upshape 
et s'enfuit de ce pas...
\end{itemize}
\FmsG%

\endguillemets
\egroup% for frenchle
\textsf{Quel homme �trange, n'est-ce pas ?}

\medskip
Il suffit ensuite de r�tablir  \verb|\everyparguillemets|.
\everyparguillemets
\fi% ifx \itshape

\subsection{Test de l'espacement}
{\def\marque#1{\vbox{\halign{\hfil##\hfil\cr 
                               \llap{\vrule width4.5mm height.4pt}%
                               \rlap{\vrule width4.5mm height.4pt}\cr
                               \noalign{\vskip-1cm}%
                                   #1\cr}}}
 \Huge
 \def\ecartement{\fbox{a � \marque{\hbox{$|$}} � b}}
 \ecartement
}
% Difference de taille a voir entre les deux %%%%%%
\setbox7\hbox{\leftguillemets\ X}
\setbox8\hbox{X\ \rightguillemets}
\SmsG%
\message{Taille des boites page \thepage\space \string: 
         \the\wd7=\string?=\the\wd8}
\FmsG%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\onecolumn
\newpage
\hbox{}
\vfill
\centerline{\Large Page intentionnellement laiss�e blanche}
\vfill
\twocolumn
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage

\subsection{Guillemets interrompus}
Une citation peut �tre en anglais et donc se commencer par
\vers|� \|\vers|english| et se terminer par \vers|\|\vers|french �|. Ce cas
ne doit plus g�n�rer de message 
{\em fermeture de guillemets non ouverts} !
Voici le test, r�alis� ici
tout d'abord avec l'environnement \vers|nonfrench| :

\medskip
1 \fbox{� \begin{nonfrench}% LaTeX keeps space
          Text in English
          \end{nonfrench}% LaTeX keeps space
        �}


\medskip
Puis avec : \\
\verb|\begin{english}| ... \verb|\end{english}| :

\medskip
% bypass here our TeX--XeT emulation to avoid message: english environment
% ended by \end{guillemets}
\def\temp{\begingroup}
\ifx\beginL\temp
\else
{% local redef of english for plain and our specific test file
 \ifx\undefined\englishORI\else\let\english\englishORI\fi%
2 \fbox{� \begin{english}%  LaTeX keeps space
          Text in English 
          \end{english}%  LaTeX keeps space
        �}

\medskip
Et enfin  avec \verb|\|\verb|english| ... \verb|\endenglish| :

\medskip
3 \fbox{� {\csname english\endcsname
          Text in English
          \csname endenglish\endcsname}% space here to remove
        �}
}% local redef of english for plain test
\fi

\medskip
Ceci avait aussi pour but de tester ces possibilit�s de
changement de langage et de v�rifier l'espacement qui
devrait �tre ainsi :

\medskip
0 \fbox{� Text in English �}

\noenglishdoublequotes
\subsection{`` {\mdseries\texttt{\textbackslash noenglishdoublequotes}} ''}

Nous avons mis la commande \vers|\noenglish|\-\vers|doublequotes| juste avant
le titre de section de fa�on � remplacer les � quotes � anglaises
par des guillemets fran�ais dans ce titre.
Il s'agit de v�rifier aussi que la g�n�ration des fichiers auxiliaires
\verb|.aux| et \verb|.toc| ne pose pas de probl�me lorsque ces fichiers 
sont r�utilis�s. Bien s�r, si cette option n'est pas activ�e pour tout le
document, comme ici, on ne retrouvera pas les guillemets fran�ais
dans la table des mati�res.

\noenglishdoublequotes

\english% histoire de changer de langue ?
\french
%\newpage
\subsection%{� no-french guillemets �}
           {\mdseries\texttt{\textbackslash nofrenchguillemets}}
En codant \verb|\nofrenchguillemets|
\nofrenchguillemets on n'utilise plus
les guillemets programm�s dans l'extension {\tt french}. Si on les utilise
malgr� tout, le r�sultat d�pendra de la police. Ici nous utilisons la
police \fontname\font{} et nous obtenons : 

<%
 < en 7-bits >%
              >

et aussi :

� en 8-bits �. 

R�activons maintenant les guillemets avec la commande
\verb|\frenchguillemets|
\frenchguillemets et faisons le m�me test :

<%
 < en 7-bits >%
              >

et aussi :

� en 8-bits �. Voyez-vous ? 
\vfill
\subsection{Haut de page+guillemets}

\subsubsection{En 8-bits}
Il ne devrait pas y avoir de probl�me du tout. 
Car, puisqu'il s'agit d'un guillemet en 8-bits, cela doit
�tre forc�ment un vrai guillemet fran�ais. Mais, malheureusement,
{\em la solution pour l'impl�menter n'est pas encore trouv�e avec
le codage OT1}.
Le codage de fonte de ce document imprime : 
\nonfrench <%
           < >%
             >%
\endnonfrench{} 
 (doit �tre parfait en T1).

\subsubsection{En 7-bits}
En codage OT1 les guillemets 7-bits de haut de page ne peuvent �tre
bons sur cette page 
 {\bf QUE} parce que nous avons termin� la
page en fran�ais, sinon nous aurions eu :
\ifx\textexclamdown\undefined
    \def\textexclamdown{�}\def\textquestiondown{�}
\fi
\textexclamdown\textexclamdown{} et \textquestiondown\textquestiondown
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\hbox{ }\NL{24}

\subsection{Guillemets et maths}

L'�quation suivante ne doit plus produire le fameux message :

{\tt ! Argument of \backslash \string @genG % string pour amslatex
 has an extra % { pour emacs
 $\}$% c'est un \delimiter qui pose pb tq avec frencht d'ou mode math
.}

$$U^{k+1}=U^{k}- {<  g_{k},d_{k} >}$$
   
\section{D'autres guillemets}\label{autres}
Avec \FP\ il est possible de substituer automatiquement aux
guillemets `anglais' la forme  \noenglishquote `que voici' en donnant la
sous-option \verb|\noenglishquote|.
Mais attention, les apostrophes deviennent des accents 
comme dans : {\em il s'agit ici de l'exemple}
\englishquote qui aurait d� �tre imprim� : 
{\em il s'agit ici de l'exemple}.
Un usage intensif de cette option est plut�t � d�conseiller. 

\newpage
\english
\section{French guillemets}
Using french guillemets in an english document (\verb|�| and \verb|�|) will
give (depending of font encoding) that: � and �, it is normal!

As you can look in the previous columns, french guillemets have specific
rules. They are used for quotation when an author is cited or each time an
emphasis is needed. Normally, italic is not used inside a quoted french
text, excepted when you really want to show some wording.

When opened, each paragraph of the quoted text will start left
 with the opening french guillemets.

Another quotated text can take place inside a first level. This second level
citation is also very specific. Each line must start with guillemets. 

The style designer, from time to time, chose to apply here an ancient rule
by putting here closing guillemets.

The technical tools involved in \FP\ 
 disallow to have at the same time
the \verb|\everypar| possibility and the second level mechanism. 

\subsection{Guillemets and maths}

The following equation is always correct:

$$U^{k+1}=U^{k}- {<  g_{k},d_{k} >}$$

and never produce an error message.
\NL1
   
\section{Other guillemets}
With \FP\ it is possible to replace english guillemets by
diacritic caracters. But, be careful, all apostrophes will be diacritics too.
\french
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage 
\section{Trois petits points}
Les points de suspension sont : ... et non pas ceux de \TeX{} : $\ldots{}$
\noTeXdots
En codant \verb|\noTeXdots| les commandes \verb|\dots| ou \verb|\ldots| de
\LaTeX{} donneront : $\ldots{}$ Mais l'option par d�faut a �t�
volontairement maintenue au standard  (\verb|\TeXdots|) puisqu'il suffit
de ne pas les utiliser.\TeXdots

\section{Crochets}
IBM, en son temps, avait cr�� l'EBCDIC dans lequel ne figurait pas
les crochets ([ ]). C'est la raison pour laquelle les utilisateurs IBM
ont parfois substitu� $<$ et $>$ aux crochets.  La sous option
\verb|\EBCDICbrackets| \EBCDICbrackets
permet de les remplacer comme ici <automatiquement> par des crochets.
Mais faites attention, les doubles guillemets 
\verb|<|\verb|<| et \verb|>|\verb|>| % pour eviter la conversion 8bits
 ne donneront jamais des crochets mais � et � 
(sauf en mode \verb|verbatim|). On peut en g�n�ral
se contenter de \verb|< <| et \verb|> >| pour obtenir < < et > >. 
On revient  � la situation ant�rieure en tapant la commande suivante :
\verb|\normalbrackets|\normalbrackets. 

\section{D�bordements}
Nous venons de choisir  l'option  d'indication de d�bordement de ligne 
\verb|\overfullhboxmark| et nous voyons son
effet lorsque la ligne ne peut �tre coup�e gr�ce � l'impression
de la petite bo�te noire. 
%(cf. page \pageref{debordement}).
Cette option est activ�e au minimum pour une page enti�re. 
Ne pas sp�cifier l'option et son contraire sur la m�me page sinon
l'effet est inchang�.

\labelsinmargin
\section{\mdseries\texttt{\textbackslash labelsinmargin}}%
\label{labels: in: margin}
\FP\ offre la possibilit�, comme cela a �t� demand�
� partir de cette section, d'imprimer dans la marge le libell� des
�tiquettes utilis�es dans les ordres \verb|\label|. 
Cette option, utilisable
aussi en dehors du fran�ais, est la suivante :
\verb|\labelsinmargin|.

\newpage\english
\section{Three dots}
Usual and common \TeX{} and \LaTeX{} dots are not french dots.
\NL4

\section{Brackets}
An option is offered to replace \verb|<| and \verb|>| by brackets.
\NL{11}

\section{\mdseries\texttt{\textbackslash overfullhboxmark}}
The command \verb|\overfullhboxmark| print a black
box where your have an overfull \verb|hbox| i.e.\  when a line can't be
hyphenated. The default is \verb|\nooverfullhboxmark|.
\NL4

\section{Labels in margin}\label{labels are in margin}
An option allow you to print the labels you use in a page. These labels are
printed in margins.
\french
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\section{Des points sur...}
Inutile de mettre les points sur les i quand on accentue un i. Tout bon
�diteur de texte doit faire ce travail pour vous. Sinon il existe la 
sous-option \verb|\idotless| qui produira \idotless
\let\XX\^% Pour �viter une traduction �ventuelle en 8 bits
\XX{i} si on lui demande d'imprimer \verb|\^i|.
\iwithdot La valeur par d�faut
dans \FP\ est \verb|\iwithdot| qui donnera malgr� tout de
bons i accentu�s avec ML\TeX{} (�) s'ils sont saisis directement en 8 
bits (v�rifiez dans votre fichier source).

{\makeatletter\def\GOfrench{T1}\ifx\GOfrench\f@encoding
\section{Ponctuation et  mode \protect\linebreak % SPECIAL FONTES EC REELLES
         math�matique}
\else
\section{Ponctuation et  mode math�matique}
\fi}
Il s'agit de v�rifier que les modifications introduites 
par l'extension \FP\ 
ne posent aucun genre de probl�me en mode math�matique.
\\ Nous d�finissons une macro \verb|\test| :
\\  \verb|\def\test#1{#1}|\def\test#1{#1}
\\ pour voir si le mode math�matique peut �tre appel� 
sans probl�me en
argument de macro-instructions. L'appel de \verb|\test{$x''$}| ne doit
pas poser de probl�me%
\iflatex
, ni m�me \verb|\texttt{|\-\verb|[$x''=0$]}|
\\ Ainsi : \verb|\texttt{[$x''=0$]}|
\\donne : \texttt{[$x''=0$]} et
\else%
. \\Ainsi :
\fi
\\  \verb|$A':B''_1<C_{d'}>D^2\ et\,\ !n\ ?\ ;$|
\\  \verb|\test{$A':B''_1<C_{d'}$}|
\\donne : $A':B''_1<C_{d'}>D^2\ et\,\ !n\ ?\ ;$
\\\phantom{donne :} \test{$A':B''_1<C_{d'}$}
\\Avec \verb|\noenglishquote|\noenglishquote{} cela...
\\donne : $A':B''_1<C_{d'}>D^2\ et\,\ !n\ ?\ ;$
\\\phantom{donne :} \test{$A':B''_1<C_{d'}$}
\englishquote
\\ puis avec \verb|\noenglishdoublequotes| \noenglishdoublequotes et
`` mise en vedette '' :
$$%  \begin{displaymath}
            A':B''_1<C_{d'}>D^2\ et\,\ !n\ ?\ ;
$$%  \end{displaymath}
$$%  \begin{displaymath}
            \test{A':B''_1<C_{d'}}
$$%  \end{displaymath}
De m�me :
\begin{verbatim}
{\tt CALL SUBR($<$iopt$<$,ilopt$>%
                                 >$)}
\end{verbatim}
doit s'imprimer :\\
{\tt CALL SUBR($<$iopt$<$,ilopt$>%
                                 >$)}\\
sans produire le message d'erreur � Fermeture de guillemets non ouverts ! �.
\englishdoublequotes


\newpage\english
\section{An \i dotless}
Everybody knows that a french ``{\em i circonflexe}'' has no dot on it. 
(In my opinion it is a \TeX{} bug to leave the dot when a diacritic is
put on.) To suppress the dot automatically the best way is to use a well
programmed text editor. \FP\ offers another opportunity with
\verb|\idotless|.

\NL3

\section[Math mode and punctuation]{Math mode and \newline punctuation}
Here we verify that french modifications about punctation
does not introduce any problem in printing mathematics. 
\\ We define a new  macro \verb|\test| :
\\  \verb|\def\test#1{#1}|\def\test#1{#1}
\\ in order to see if there is no more problem when passing maths
inside a macro argument. Calling  \verb|\test{$x''$}| must not
introduce any problem%
\iflatex
, as well as \verb|\texttt{|\-\verb|[$x''=0$]}|
\NL1\\So: \verb|\texttt{[$x''=0$]}|
\\gives: \texttt{[$x''=0$]} and
\else%
. \NL1\\So:
\fi
\\\verb|$A':B''_1<C_{d'}>D^2\ et\,\ !n\ ?\ ;$|
\\\verb|\test{$A':B''_1<C_{d'}$}|
\\ gives: $A':B''_1<C_{d'}>D^2\ et\,\ !n\ ?\ ;$
\\\phantom{gives:} \test{$A':B''_1<C_{d'}$}
\\With \verb|\noenglishquote|\noenglishquote{} it$\ldots{}$
\\gives: $A':B''_1<C_{d'}>D^2\ et\,\ !n\ ?\ ;$
\\\phantom{gives:} \test{$A':B''_1<C_{d'}$}
\englishquote
\\ and with \verb|\noenglishdoublequotes|\noenglishdoublequotes{}  
in ``display'' math mode:
$$%  \begin{displaymath}
            A':B''_1<C_{d'}>D^2\ et\,\ !n\ ?\ ;
$$%  \end{displaymath}
$$%  \begin{displaymath}
            \test{A':B''_1<C_{d'}}
$$%  \end{displaymath}
\englishdoublequotes 
Also:
\ifx\documentclass\undefined\\ % Still Plain!
\else\\[-2\baselineskip] % to keep the same spacing as in French
\fi
\begin{verbatim}
{\tt CALL SUBR($<$iopt$<$,ilopt$>%
                                 >$)}
\end{verbatim}
must print:\\
%\SmsG%
{\tt CALL SUBR($<$iopt$<$,ilopt$>%
                                 >$)}\\
%\FmsG%
without producing the error message: 
``Fermeture de guillemets non ouverts !''.
\french
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
Pour ma part lorsque je d�sire des crochets que je n'ai pas
au clavier, je pr�f�re taper :\\
\verb|{\tt CALL SUBR(<iopt<,ilopt> >)}| et utiliser
l'option \verb|\EBCDICbrackets|\EBCDICbrackets{} :\\
{\tt CALL SUBR(<iopt<,ilopt> >)}

Cette option n'a pas d'effet en mode math�matique :
$$ 1233 < 1234 <%
                < 1235 >%
                        > 1234 > 1233 $$
\normalbrackets

\makeatletter% we should use \frac with AmS
\ifx\RIfM@\undefined%\ifx\csname amsmath.sty\endcsname\relax
     \long\def\text#1{#1}\long\def\frac#1#2{{#1\over#2}}
\fi
\makeatother

V�rifions aussi 
($x < {\frac{1}{3}} < {\frac{1}{2}} > {\frac{1}{4}}$) :
$$x <  \frac{1}{3}  < \frac{1}{2}   >  \frac{1}{4} $$
puis aussi :

 \text{\quad pour $|y| < \frac{111}{444}$}

\bigskip
La double ponctuation ne doit avoir aucun effet 
(visible) dans une formule en mode
math�matiques, est-ce bien le cas sur l'exemple ci-dessous :

{\LARGE $$a := b, (c!n=m) \textrm{ ; vrai ?}$$}

On notera que la partie texte de la formule a �t� saisie avec la
commande : \\
\verb|\textrm{ ; vrai ?}|\\
et que l'espacement fran�ais y a �t� appliqu�.

\iflatex
\subsection{Le cas de la virgule}
En standard \AllTeX{} (ou alors avec l'option sp�ciale 
\verb|\regularmathcomma| de \FP) le traitement de la virgule
est sp�cifique, ainsi quand on tape ce qui suit en mode
math�matique de mise en valeur :
\regularmathcomma%
\begin{versatim}
$$\textrm{La fonction}\ f(x,y)\ 
  \textrm{ou le Vecteur}\ V(x, y, z)$$
$$Total=1,255\,\$\ ou\ 1\,500,00\,\textrm{\euro}$$
\end{versatim}
on obtient des espacements apr�s les virgules,
qu'il y ait ou non des espaces dans le source \TeX\ :
$$\textrm{La fonction}\ f(x,y)\ 
  \textrm{ou le Vecteur}\ V(x, y, z)$$
$$Total=1,255\,\$\ ou\ 1\,500,00\,\textrm{\euro}$$
(ce qui montre une anomalie dans la composition
des nombres relatifs)
\frenchmathcomma
\fi

\newpage\english
When I have no brackets on my keyboard I prefer to type:\\
\verb|{\tt CALL SUBR(<iopt<,ilopt> >)}|\\ using
 the option \verb|\EBCDICbrackets| but the result in english
remains unchanged\EBCDICbrackets{}:\\
{\tt CALL SUBR(<iopt<,ilopt> >)}

And within math mode:
$$ 1233 < 1234 <%
                < 1235 >%
                        > 1234 > 1233 $$
\normalbrackets

\makeatletter% we should use \frac with AmS
\ifx\RIfM@\undefined%\ifx\csname amsmath.sty\endcsname\relax
     \long\def\text#1{#1}\long\def\frac#1#2{{#1\over#2}}
\fi
\makeatother

Let's verify also ($x < {\frac{1}{3}} < {\frac{1}{2}} > {\frac{1}{4}}$) :
$$x < \frac{1}{3} < \frac{1}{2} > \frac{1}{4}$$
and:

 \text{\quad pour $|y| < \frac{111}{444}$}

\bigskip
The ``double punctuation'' should not have any effect
in maths, which is obviously the case in the following
English example:
\NL1

{\LARGE $$a := b, (c!n=m) \textrm{ ; vrai ?}$$}

Though the text part of the formula has been typed
via a command: \\
\verb|\textrm{ ; vrai ?}|\\
the french spacing doesn't apply here.

\iflatex
\subsection{The comma case}
With \AllTeX{} standard (or with the special \FP\ 
\verb|\regularmathcomma| the processing of comma is really specific.
So, when you type in the following in display math mode:
\regularmathcomma%
\begin{verbatim}
$$\textrm{La fonction}\ f(x,y)\ 
  \textrm{ou le Vecteur}\ V(x, y, z)$$
$$Total=1,255\,\$\ ou\ 
      1\,500,00\,\textrm{\euro}$$
\end{verbatim}
you will get thin spaces after the commas,
no matter spaces are given or not in the \TeX\ source:
$$\textrm{La fonction}\ f(x,y)\ 
  \textrm{ou le Vecteur}\ V(x, y, z)$$
$$Total=1,255\,\$\ ou\ 1\,500,00\,\textrm{\euro}$$
(which shows a french typesetting error for
the relative numbers).
\frenchmathcomma
\fi%

\iflatex\french
\newpage
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Par contre avec \FP\ on n'obtient 
aucun espacement suppl�mentaire :
$$\textrm{La fonction}\ f(x,y)\ 
  \textrm{ou le Vecteur}\ V(x, y, z)$$
$$Total=1,255\,\$\ ou\ 1\,500,00\,\textrm{\euro}$$
cela est d� � l'option \verb|\frenchmathcomma| qui est
activ�e par d�faut avec \FP.
Mais cela montre alors une anomalie de composition
dans les listes $(x,y,z)$.

Si l'on veut des espaces il faut alors les indiquer
explicitement, comme cela est l'usage, plus
g�n�ralement, en mode math�matique :
\begin{versatim}
$$\textrm{La fonction}\ f(x,\,y)\ 
  \textrm{ou le Vecteur}\ V(x,\,y,\,z)$$
$$Total=1,255\,\$\ ou\ 1\,500,00\,\textrm{\euro}$$
\end{versatim}
ce qui donnera :
$$\textrm{La fonction}\ f(x,\,y)\ 
  \textrm{ou le Vecteur}\ V(x,\,y,\,z)$$
$$Total=1,255\,\$\ ou\ 1\,500,00\,\textrm{\euro}$$

\medskip

On notera que \FP\ ob�it � l'extension \texttt{icomma}
lorsque cette derni�re est charg�e avant \FP, mais
seulement en fran�ais.


\newpage\english
With the \FP\ package there is no space added
at all:
\frenchmathcomma%
$$\textrm{La fonction}\ f(x,y)\ 
  \textrm{ou le Vecteur}\ V(x, y, z)$$
$$Total=1,255\,\$\ ou\ 1\,500,00\,\textrm{\euro}$$
this is due to the option \verb|\frenchmathcomma| which is
defaultly activated in the \FP\ package.
People will then distinguish a typesetting error
in the lists $(x,y,z)$.

If you want spaces you should then give them to \TeX\
explicitely, as usually done, more generally in math mode:
\begin{verbatim}
$$\textrm{La fonction}\ f(x,\,y)\ 
  \textrm{ou le Vecteur}\ 
      V(x,\,y,\,z)$$
$$Total=1,255\,\$\ ou\ 
      1\,500,00\,\textrm{\euro}$$
\end{verbatim}
which will give:
$$\textrm{La fonction}\ f(x,\,y)\ 
  \textrm{ou le Vecteur}\ V(x,\,y,\,z)$$
$$Total=1,255\,\$\ ou\ 1\,500,00\,\textrm{\euro}$$
\fi

You should notice that \FP\ respect the choice of
the \texttt{icomma} package when that last one is loaded before
\FP; but it only applies in French.
\french
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\section{Mon antislash est \mdseries\texttt{\backslash}}

L'antislash n'existe pas dans toutes les polices en OT1.
Que vous utilisiez \verb|\backslash| ou \verb|\textbackslash|
vous obtiendrez la m�me chose, ainsi
en romain droit on obtient :

textbackslash=\textbackslash

backslash=\backslash

\noindent
mais avec la fonte tt on obtient :

{\tt
textbackslash=\textbackslash

backslash=\backslash
}
\NL2

\section{Notes de bas de page}

\iflatex\makeatletter\xdef\countSAVED{\the\c@footnote}\makeatother\fi
\long\def\XX{%
             Num�rotation normale\footnote{Une note normalement num�rot�e.}.
             {\setcounter{footnote}{0}
             \renewcommand{\thefootnote}{\fnsymbol{footnote}}
     
             Voici une note\footnote{Premi�re note.} 
             puis une autre\footnote{Deuxi�me note.}
             puis encore une autre\footnote{Troisi�me note.}
             }}

Nous comparons ici la composition des notes de bas de page
(avec et sans \verb|\fnsymbol|)
dans une langue et dans l'autre. Voyons ce que cela donne :

\XX

\newpage\english
\section{My antislash is \mdseries\texttt{\textbackslash}}

The antislash glyph doesn't exist in all OT1 font.
Whatever you use, \verb|\backslash| or \verb|\textbackslash|
you will obtain the same output, so
in upright roman you obtain:

textbackslash=\textbackslash

backslash=$\backslash$

\noindent
but with the tt font you obtain:

{\tt
textbackslash=\textbackslash

backslash=$\backslash$
}

\noindent
but \verb|\backslash| is only available in
math mode.

\section{Compared footnotes}

We compare the typesetting of footnotes 
(with and without \verb|\fnsymbol|)
in one language versus the other. Let's look at them.

\iflatex\makeatletter\c@footnote=\countSAVED\makeatother\fi

\XX
\iflatex\makeatletter\c@footnote=\countSAVED\makeatother\fi
\addtocounter{footnote}{1}
\NL1

\french
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage

\section{\mdseries\texttt{\textbackslash guillemetsinarrays}}

Avec \FP\ l'utilisation de guillemets � la 
fran�aise en mode texte dans les environnements \texttt{array} ou 
\texttt{eqnarray} est possible
mais il est n�cessaire de prot�ger les op�rateurs
inf�rieur (\texttt{<}) et sup�rieur (\texttt{>}) lorsqu'ils terminent
une colonne. On rajoute alors une paire d'accolades ou \verb|\relax| 
pour terminer la macro-commande :
\begin{verbatim}
$
\begin{array}{ccc}  
a  & \inferieura        &b\\ 
a  & \protect<          &b\\ 
a  & b                  &<\\       
a  & >{}                &c\\      
<{}& � �              &c\\     
<{}& \textrm{� text �}&c 
\end{array}
$
\end{verbatim}

\noindent ce qui donne : 

$
\begin{array}{ccc}
a  & \inferieura        &b\\ 
a  & \protect<          &b\\ 
a  & b                  &<\\       
a  & >{}                &c\\      
<{}& � �              &c\\     
<{}& \textrm{� text �}&c 
\end{array}
$

\medskip
On peut �viter d'avoir � modifier des tableaux existants et dans ce
cas on codera \verb|\no|\-\verb|guil|\-\verb|lemetsinarrays| :

\begin{verbatim}
\noguillemetsinarrays
$
\begin{array}{ccc}
a  & \inferieura        &b\\ 
a  & <                  &b\\ 
a  & b                  &<\\       
a  & >                  &c\\      
<  & � �              &c\\     
<  & \textrm{� text �}&c 
\end{array}
$
\end{verbatim}

\noindent ce qui donne alors :

\noguillemetsinarrays
$
\begin{array}{ccc}
a  & \inferieura        &b\\ 
a  & <                  &b\\ 
a  & b                  &<\\       
a  & >                  &c\\      
<  & � �              &c\\     
<  & \textrm{� text �}&c 
\end{array}
$
\guillemetsinarrays% reset default

\newpage\english
\section{Guillemets in arrays}
The \FP\ package allows people to print french guillemets
in \texttt{array} environments (but in text mode). This usually breaks
the code for \texttt{<} or \texttt{>} when they finish an array slot.
So you should protect them; like this:
\NL2

\begin{verbatim}
$
\begin{array}{ccc}
a  & \inferieura        &b\\ 
a  & \protect<          &b\\ 
a  & b                  &<\\       
a  & >{}                &c\\      
<{}& \textrm{� text �}&c 
\end{array}
$
\end{verbatim}
\NL1

\noindent which gives: 

$
\begin{array}{ccc}
a  & \inferieura        &b\\ 
a  & \protect<          &b\\ 
a  & b                  &<\\       
a  & >{}                &c\\      
<{}& \textrm{� text �}&c 
\end{array}
$
\NL1

\medskip

One can avoid to modify existing arrays and then just say
\verb|\noguillemetsinarrays| but this command is not
interesting in English because the problem doesn't exist
at all:

\begin{verbatim}
$
\begin{array}{ccc}
a  & \inferieura        &b\\ 
a  & <                  &b\\ 
a  & b                  &<\\       
a  & >                  &c\\      
<  & \textrm{<< text >> &c 
\end{array}
$
\end{verbatim}
\NL1

\noindent gives the following result:

\def\GOfrench{\let\ifCLA\iffalse}% To allow dmy and frencht to compile
\ifx\ifCLA\undefined\expandafter\GOfrench\fi% without error.
$
\begin{array}{ccc}
a  & \inferieura        &b\\ 
a  & 
\ifCLA\expandafter\protect\fi% To allow \ConstantLayout test file.
<                  &b\\ 
a  & b                  &<\\       
a  & 
\ifCLA\expandafter\protect\fi% To allow \ConstantLayout test file.
>                  &c\\      
\ifCLA\expandafter\protect\fi% To allow \ConstantLayout test file.
<  & \textrm{<< text >>}&c 
\end{array}
$
\NL1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage\french

\noguillemetsinarrays% for continuation of column
Cette commande est aussi valable  pour les environnements
\texttt{eqnarray} :

\begin{eqnarray}
a  & <                  &b\\ 
a  & >                  &c\\      
<  & � �              &c\\     
<  & \textrm{� text �}&c 
\end{eqnarray}

Pour terminer je r�tablis la valeur par d�faut :
\verb|\guillemetsinarrays| 
\guillemetsinarrays
et si j'essaye le m�me exemple j'obtiendrais
le message : \\
{\makeatletter\let\@PreserveBraces={% uggly hack for plain
\vers|! Argument of \@PreserveBraces has an|\\
\vers|extra }.|
}% closing hack.

\section{Guillemets verbatim}

Avec l'option \verb|\nofrenchguillemets| il est possible
--~si \FP\ travaille en codage de fonte du genre \texttt{T1} 
{\makeatletter\def\GOfrench{T1}\ifx\GOfrench\f@encoding\else
(mais ca ne semble pas �tre le cas ici)\fi}%
~--
\nofrenchguillemets
d'imprimer des guillemets 8-bits en verbatim : \verb|� �|.
\frenchguillemets

\iflatex
\section{Environnement guillemets exclus}

\begin{versatim}
\guillemets{} Je me suis dit que : 
� avec l'option [...] les  guillemets 
sont inop�rants. \endguillemets{}
\end{versatim}
\SmsG
\noeveryparguillemets
\guillemets{}
\verb|[\guillemets{}]| Je me suis dit que : 
� avec l'option \vers|\noevery|\-\vers|par|\-\vers|guillemets|
on ne doit pas avoir un environnement qui se termine avant la fin
du paragraphe. C'est pourquoi l'environnement \texttt{guillemets} 
n'est plus autoris� dans ce cadre.
D�sormais un message est �mis et ces environnements 
guillemets sont inop�rants. \endguillemets{}

On note que \verb|\guillemets{}| n'a aucun effet visible
et que le d�but de paragraphe est forc� aux premiers 
caract�res-guillemets ouvrants qui suivent. Le 
\verb|\endguillemets{}| de fin d'environnement ferme cependant
le paragraphe.

\guillemets [\verb|\guillemets{}|]\!
Ces environnements exclus dans le cadre de cette option
 peuvent �tre de premier ou 
/\guillemets{} deuxi�me \endguillemets{}/ niveau
comme ici (slashs). [\verb|\endguillemets{}|]
\endguillemets{}

\FmsG
\frenchguillemets
\fi%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage\english
Notice that with standard \LaTeX\ you obtain a message
saying that \verb|\guillemotleft| and \verb|\guillemotright|
are invalid in math mode when you try to use guillemets
in an \texttt{array} environement.
\NL{9}

\smallskip

\section{Verbatim Guillemets}

The 8bit french guillemets chars printed within
a verbatim environnement give here: \verb|� �|

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage\french
\section{Utilisation de la \mdseries\texttt{toc}}

Il n'est pas pr�vu de pouvoir composer une table des mati�res ou un
sommaire dans plus d'une langue.
On notera que \verb|\sommaire| est un apport de \FP.

\section{Fichiers {\mdseries\texttt{lof}} et {\mdseries\texttt{lot}}}
On v�rifie ici que la ponctuation fran�aise n'a pas cr�� 
d'ennui particulier.
Nous avons laiss� en blanc la figure \ref{x�:;!?�x} 
qui n'est qu'un simple
test. De m�me le tableau \ref{y`�:;!?�'y} n'est l� que pour 
cr�er une entr�e dans la liste des tableaux.

Le {\em caption} de la figure 
\ref{x�:;!?�x} 
 doit appara�tre com\-me ceci :
 {\it � essai � ;  2 cm ! pourquoi pas ?}
\begin{figure}[h]
\begin{center}
\begin{tabular}{|c|}
\hline
\ \hfill \ \\%\vspace*{2cm}
\ \\
\ Peu importe la figure...\\
\ \\
\ \\
\hline
\end{tabular}
\end{center}
\caption{� essai � ;  2 cm ! pourquoi pas ? 
         \protect\\ (cf. aussi le tableau \ref{frenchdactylo})}
\label{x�:;!?�x}
\end{figure}

Le {\em caption} du tableau
\ref{y`�:;!?�'y}
 doit �tre comme ceci :
{\it ` � essai � ;  2 cm ! pourquoi pas ? '}
\begin{table}[h]
\caption{` � essai � ;  2 cm ! pourquoi pas ? '  
         \protect\\ (cf. aussi le tableau \ref{frenchdactylo})}
\label{y`�:;!?�'y}

\begin{center}
\begin{tabular}{|c|}
\hline
\ \hfill \ \\
\ \\
\ Peu importe le tableau\footnote{Une note de tableau.}...\\
\ \\
\ \\
\hline
\end{tabular}
\end{center}
\end{table}

On notera les libell�s ({\sc Fig.} et {\sc Tab.}) plus confor\-mes �
l'usage fran�ais. Ne pas oublier non plus que les titres de tableaux sont
toujours plac�s, en fran�ais, avant ceux-ci contrairement aux figures.

\FP\ ne pr�voit pas que l'on puisse composer une 
partie des tables des figures (ou tableaux) en fran�ais et une autre
en anglais par exemple. Les fichiers \verb|.lof| et \verb|.lot| seront
donc compos�s enti�rement dans la langue pr�s�lectionn�e.

\newpage\english
\section{{\mdseries\texttt{toc}} file use}
No facility is given to typeset the \verb|.toc| in various languages.

Notice that \verb|\sommaire| is a new command brought up with this
package.

\section{{\mdseries\texttt{lof}} and {\mdseries\texttt{lot}} files}
Same test in English just to verify  that our french modifications
does not affect the text in English.

You will notice, of course, that the caption names are re-established
to their original values ({\bf figure} and {\bf table}).

The following figure (not referable) %(\ref{ex�:;!?�ex}) 
caption must look like:
� essai �;  2 cm! Why not?
\begin{figure}[h]
\begin{center}
\begin{tabular}{|c|}
\hline
\ \hfill \ \\
\ \\
\ No matter how is the figure$\ldots{}$\\
\ \\
\ \\
\hline
\end{tabular}
\end{center}
\caption{� essai �;  2 cm! Why not?
         \protect\\ (cf. also the table \ref{frenchdactylo})}
%\label{ex�:;!?�ex}% produit un missing \endcsname
\end{figure}

The {\em caption} of the table (not referable) %\ref{ey`�:;!?�'ey} 
must look like: 
` � essai �;  2 cm! Why not? '
\begin{table}[h]
\begin{center}
\begin{tabular}{|c|}
\hline
\ \hfill \ \\
\ \\
\ No matter how is the table\footnotemark% \footnotetext est perdu !
 $\ldots{}$\\
\ \\
\ \\
\hline
\end{tabular}
\end{center}
\caption{` � essai �;  2 cm! Why not? '
         \protect\\ (cf. also the table \ref{frenchdactylo})}
%\label{ey`�:;!?�'ey}% generates missing \endcsname
\end{table}\footnotetext{A note from a table.}
\NL1

Notice that we have here the standard caption names used by \LaTeX{}.

You can see in the French column the specific labels and places of caption
titles (under the figure but over the table).

Don't try to compose \verb|.lof| and \verb|.lot| files in more than one
language, it's not designed in this (stupid?) way!

\french
\begin{table*}[tb]
\caption{` � essai � ;  2 cm ! pourquoi pas ? '  
         (cf. aussi le tableau \ref{frenchdactylo})}
\label{2`�:;!?�'2}
\begin{center}
\begin{tabular}{|c|}
\hline
\ \hfill \ \\
\ \\
\ Peu importe le tableau sur deux colonnes%
\footnote{Une note de tableau.}...\\
\ \\
\ \\
\hline
\end{tabular}
\end{center}
\end{table*}

\newpage
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\section{Encore un tableau...}
Mais celui-ci est sur deux colonnes si l'option
\verb|twocolumn| est active. V�rifions simplement
que le traitement est le m�me qu'en une seule
colonne.

Le {\em caption} du tableau
\ref{2`�:;!?�'2}
 doit �tre comme ceci :
{\it ` � essai � ;  2 cm ! pourquoi pas ? '}

\section{\sloppy Encore {\mdseries\texttt{\textbackslash labelsinmargin}}}

� nouveau nous utilisons \verb|\labelsinmargin|
\labelsinmargin
pour v�rifier son fonctionnement dans une figure
et un titre de figure 

\begin{figure}[h]
\label{label de la figure}
\begin{center}
\begin{tabular}{|c|}
\hline
\ \hfill \ \\
\ \\
\ Peu importe la figure...\\
\ \\
\ \\
\hline
\end{tabular}
\end{center}
\caption{le titre de la figure avec label
\label{label du titre fig.}}
\end{figure}

M�me test avec un tableau :
\begin{table}[h]
\label{label du tableau}
\caption{le titre du tableau avec label\label{label du titre tab.}}
\begin{center}
\begin{tabular}{|c|}
\hline
\ \hfill \ \\
\ \\
\ Peu importe le tableau...\\
\ \\
\ \\
\hline
\end{tabular}
\end{center}
\end{table}

\sloppypar{
D�sactivons d�finitivement l'option 
avec \verb!\nolabelsinmargin!.
}
\nolabelsinmargin

\newpage\english
\NL8
\section{{\mdseries\texttt{\textbackslash labelsinmargin}} again}

Again we test \verb|\labelsinmargin|
\labelsinmargin
to verify that it is running within a figure
and in a figure's caption. 

\begin{figure}[h]
\label{label in a figure}
\begin{center}
\begin{tabular}{|c|}
\hline
\ \hfill \ \\
\ \\
\ No matter the figure$\ldots{}$\\
\ \\
\ \\
\hline
\end{tabular}
\end{center}
\caption{title with a label\label{label in fig. caption}}
\end{figure}

Same test with a table:
\begin{table}[h]
\label{label in a table}
\begin{center}
\begin{tabular}{|c|}
\hline
\ \hfill \ \\
\ \\
\ No matter the table$\ldots{}$\\
\ \\
\ \\
\hline
\end{tabular}
\end{center}
\caption{title with a label\label{label in a tab. caption}}
\end{table}

Disactivate definitely the option with \verb!\nolabelsinmargin!.
\nolabelsinmargin

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage\french

\section{Notes dans \mdseries\texttt{\textbackslash caption}}

Si une note dans un tableau doit �tre imprim�e � la fin du
tableau, une note dans un titre de tableau doit �tre
imprim�e en fin de page. Malheureusement \LaTeX{} perd
le texte des notes dans les environnements {\tt figure} et 
{\tt table}. L'ex\-ten\-sion \FP\ pr�vient l'utilisateur
que le texte doit �tre r�ins�r� � l'aide de \verb|\footnotetext|.

\begin{table}[h]

\SmsG%
\caption[Essai de footnote dans un caption de tableau]
        {L�gende\protect\footnote{Une note de bas de page.}}
\FmsG%

\begin{center}
\begin{tabular}{|c|}
\hline
\ \hfill \ \\
%\ \\
\ Peu importe le tableau...\\
%\ \\
\ \\
\hline
\end{tabular}
\end{center}
\end{table}
\footnotetext{Une note de bas de page.}

\section{{\mdseries\texttt{\textbackslash caption}} vide}

\begin{table}[h]
\caption{}
\begin{center}
\begin{tabular}{|c|}
\hline
\ \hfill \ \\
%\ \\
\ Tableau sans l�gende\\
%\ \\
\ \\
\hline
\end{tabular}
\end{center}
\end{table}

\section{\mdseries\texttt{\textbackslash nombre}}

Les nombres en fran�ais sont imprim�s correctement lorsque l'on
utilise \verb|\nombre|, ainsi :

\begin{verbatim}
\nombre{123 456,123 456}
\end{verbatim}
imprime \nombre{123 456,123 456} au lieu de la forme habituelle
 {\regularmathcomma $123 456,123 456$}
ou \mbox{123 456,123 456} suivant que l'on est en mode math
ou en mode texte.

On y voit des espaces fines � chaque millier et (normalement)
une virgule sans espace suppl�mentaire comme cela se produit
en mode math avec \TeX{} standard.

\section{Autre chose ?}
Non !

[espace libre utilisable]

\newpage\english

\section{Notes within \mdseries\texttt{\textbackslash caption}}

Normally in French we print table's footnotes at the end of the table
but it can't be the case when a footnote is called from a caption title.
But unfortunately footnote's text is lost when inside a \LaTeX{} figure
or table environnement, as shown here.
Thus {\tt french.sty} warn the user with the appropriate message, but
in English nothing is done. 

\begin{table}[h]
\begin{center}
\begin{tabular}{|c|}
\hline
\ \hfill \ \\
%\ \\
\ No matter the table$\ldots{}$\\
%\ \\
\ \\
\hline
\end{tabular}
\end{center}
\caption[footnote try within a table's caption]
        {Caption title\protect\footnote{A footnote page.}}

\end{table}
%\footnotetext{A footnote page.}

\section{Empty \mdseries\texttt{\textbackslash caption}}

\begin{table}[h]
\begin{center}
\begin{tabular}{|c|}
\hline
\ \hfill \ \\
%\ \\
\ Empty caption\\
%\ \\
\ \\
\hline
\end{tabular}
\end{center}
\caption{}
\end{table}

\section{\mdseries\texttt{\textbackslash nombre}}

French number should be correctly printed using
\verb|\nombre|, so :

\begin{verbatim}
\nombre{123 456,123 456}
\end{verbatim}
should not print as usual
$123 456,123 456$ nor \mbox{123 456,123 456}
(depending you are in math or in text mode)
but $123\,456{,}123\,456$.
\NL1

We see here thin spaces between each thousand part and no
(usual) space after the comma (as it is in math with standard
\TeX{}).

\smallskip

\section{Anything else?}

No!

\noindent
[free space to reuse]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage\french
\section{Le 1\protect\fup{er} paragraphe}
Notez bien que le 1\fup{er} paragraphe d'une section 
ne commence jamais au fer � gauche 
en fran�ais, comme vous le voyez ici.

Le deuxi�me paragraphe d�marre comme le premier...\footnote{%
La typographie du titre de section (1\fup{er}) est � noter ;
 {\tt mysmaller.sty} a �t� utilis� 
� la compilation de {\tt frenchrf} avec \LaTeX{}. 
Il existe aussi l'extension {\tt relsize} qui fonctionne
bien avec \FP.}

\section{Test des listes}\label{listes}

Voici un test d'�num�ration (\verb|itemize|) de \LaTeX{} :

\begin{itemize}
\item liste de niveau 1 ;
      \begin{itemize}
      \item incluant un niveau 2,
            \begin{itemize}
            \item mais aussi un niveau 3,
            \item peu utilis� ;
            \end{itemize}
      \item le niveau 2 se terminant ici ;
      \end{itemize}
\item suite de la liste de niveau 1 ;
\item dernier �l�ment de niveau 1.
\end{itemize}

On remarquera les deux choses suivantes : 
\primo les marqueurs sont identiques quel que soit
le niveau et \secundo aucun �l�ment ne commence par une majuscule.
\NL2

\section{D�finition de langue}

Cette partie n'a plus de sens (R. J.).
%On peut se d�finir une  langue comme par exemple le kathmandouais par : \\%
%\verb|\NouveauLangage[2]|\verb|{kathmandouais}|\\%
%\global% for TeX--XeT tests
%\def\kathmandouaisTeXmods{\empty}
%      \NouveauLangage[2]{kathmandouais} %
%et ensuite on peut �crire kathmandouais en tapant : 
%\verb|\kathmandouais|
%\SmsG%
%\kathmandouais%Message a ignorer si vous n'avez que 2 langues definies.
%bla... blabla... bla%
%\typeout{I AM WRITING KATMANDOUAIS, Ye\string! (language=\the\language)}%
%\FmsG%
%\footnote{Mais bien entendu les c�sures ne seront pas bonnes car elles
%seront faites � partir d'un language existant. On notera la typographie
%du num�ro de cette note saisie en {\em Katmandouais}.}
% et revenir au fran�ais par
%\verb|\french|\french%
%\footnote{Si le point qui suit n'est pas accol� au mot {\tt french}
%alors cela signifie que des {\em blank space} tra�nent dans 
%\FP.}.
%S'il n'y a  pas  de commande \verb|\kathmandouaisTeXmods| de d�finie 
%rien ne se passera
%vraiment, cela sera �quivalent � \verb|\relax|, seul un message 
%d'avertissement sera �mis.

\newpage\english
\section{First paragraph}
In English each paragraph is indented except the first one of a section,
subsection, etc. as you can see in this example.

Subsequent paragraphs start indented$\ldots{}$\NL1 

\section{Itemized lists}
Here is the same  french \verb|itemize| list:\NL1 

\begin{itemize}
\item liste de niveau 1;
      \begin{itemize}
      \item incluant un niveau 2,
            \begin{itemize}
            \item mais aussi un niveau 3,
            \item peu utilis� ;
            \end{itemize}
      \item le niveau 2 se terminant ici ;
      \end{itemize}
\item suite de la liste de niveau 1 ;
\item dernier �l�ment de niveau 1.
\end{itemize}

You can compare english and french lists.
Notice firstly that item markers are identical at each level and secondly
that each item never starts with an uppercase letter.

\section{Create a language}

This creation is now obsolete (R. J.).
%There is a new control sequence to allow {\em the creation} of new language:\\
%\verb|\NouveauLangage[n]{language}|\\
%This command is in fact used internally but it can be also used elsewhere 
%to define a new language which rules will be set by:\\
% \verb|\<language>TeXmods| (if defined.) The internal language number \verb|n|
%tells \TeX{} what hyphenation table is to use among those defined at
%\verb|INITEX| time.

\begin{table*}[th]% pour la page suivante
\begin{center}
\fbox{Attention : psfig est p�rim� ; il n'est utilis� ici  qu'� des fins de test. (B. G.)}\\[2ex]
\fbox{Puisque  psfig est p�rim� utilisons  graphicx et epstopdf  (R. J.)}               
\end{center}
\end{table*}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage\french
\section{Caract�res actifs}
Quelques jeux de macros doivent parfois �tre charg�s 
directement dans le document
et utilisent  les caract�res {\em actifs\/} de \FP. Il y
a alors conflit ouvert. Plusieurs solutions sont offertes, soit utiliser
l'ordre : \\
\verb|   \originalinput{fichier}|\\
 soit :
\begin{verbatim}
   \begin{nonfrench}
          ... macros-instructions...
   \end{nonfrench}
\end{verbatim}
%Nous avons adopt� la  deuxi�me solution ici : 
%
%\tthyphenation
%\begin{versatim}
%Saluons au passage Trevor Darrell, l'auteur de \verb|psfig| :
% \begin{nonfrench}
%   \let\psfig\undefined
%   \input mypsfig.sty
%   \begin{center}
%       \ \hbox{\vbox{\psfig{figure=%
%          myfigure.ps,height=1in}}}\  
%   \end{center}
% \end{nonfrench}
%\end{versatim}

%Saluons au passage Trevor Darrell, l'auteur de \verb|psfig| :
%\begin{nonfrench}
%   \let\psfig\undefined
%  \input mypsfig.sty
%  \begin{center}
%       \ \hbox{\vbox{\psfig{figure=%
%          myfigure.ps,height=1in}}}\  
%  \end{center}
%\end{nonfrench}
Mais attention n'utilisez pas en fran�ais un code que 
vous auriez charg� 
en anglais ou r�ciproquement !


L'extension \FP\ n'est plus compatible avec \verb|psfig|. 
Mais pour montrer quand m�me  l'image que Bernard Gaule voulait placer ici, la voici
ayant sous Linux remplac�
\texttt{myfigure.ps} en son expression encapsul�e \texttt{myfigure.eps}
par � \texttt{convert myfigure.ps myfigure.eps} �.\NL1
%L'ordre \texttt{convert} est une commande Linux.
%En voici l'exemple -- sans utiliser \verb|nonfrench| -- avec 
%\verb|\psdraft| : 
%   \let\psfig\undefined
%  \input mypsfig.sty
%  \psdraft

Saluons au passage Trevor Darrell, l'auteur de \verb|psfig| :  \begin{center}
       \ \hbox{\vbox{\includegraphics[height=1in]{myfigure.eps}}}
%{\psfig{figure=%
%          myfigure.ps,height=1in}}}\  
%       \ \hbox{\vbox{\psfig{figure=%
%          myfigure.ps,height=1in}}}\  
\NL1
  \end{center}
Voici le code modifi� :
\begin{verbatim}
%  \input mypsfig.sty
%  \psdraft
 \begin{center}
      \ \hbox{\vbox{\includegraphics%
  [height=1in]{myfigure.pdf}}}
%       \ \hbox{\vbox{\psfig{figure=%
%          myfigure.ps,height=1in}}}\  
  \end{center}
\end{verbatim}

\NL1
Comme vous le voyez l'appel � \texttt{mypsfig.sty} n'est plus n�cessaire.
Mais nous avions charg� \texttt{graphicx} et \texttt{epstopdf} dans les styles charg�s � la base.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage\english
\section{Active characters}
Codes that were designed for English might bring problems when used with  
\FP\ because few characters are {\em activated\/}. 
Few solutions are offered, either:\\
\verb|   \originalinput{file}|

or:
\begin{verbatim}
   \begin{nonfrench}
          ... macros-instructions...
   \end{nonfrench}
\end{verbatim}
%We used here the second solution:
%\begin{verbatim}
%Saluons au passage Trevor Darrell, 
%           l'auteur de \verb|psfig| :
% \begin{nonfrench}
%   \let\psfig\undefined
%   \input mypsfig.sty
%   \begin{center}
%       \ \hbox{\vbox{\psfig{figure=%
%          myfigure.ps,height=1in}}}\  
%   \end{center}
% \end{nonfrench}
%\end{verbatim}
%
%\notthyphenation
%%\begin{nonfrench}% inutile d'obtenir un message de warning
%   \let\psfig\undefined
%  \input mypsfig.sty
But be carefull, don't use in French a code that was loaded in English
or reciprocally!

The \FP\ extension is no more compatible with \verb|psfig|. 

But in order to show  the image that Bernard Gaule had in mind to place here, you can see it
after having converted with the  Linux command \texttt{convert myfigure.ps myfigure.eps} 
his original \texttt{myfigure.ps} in an encapsulated version \texttt{myfigure.eps}.

%\NL1
Saluons au passage Trevor Darrell, %
           l'auteur de \verb|psfig| :
  \begin{center}
       \ \hbox{\vbox{\includegraphics[height=1in]{myfigure.eps}}}
%       \ \hbox{\vbox{\psfig{figure=%
%          myfigure.ps,height=1in}}}\  
  \end{center}
\NL1
%%\end{nonfrench}
Here is the modified code:
\begin{verbatim}
%  \input mypsfig.sty
%  \psdraft
 \begin{center}
      \ \hbox{\vbox{\includegraphics%
   [height=1in]{myfigure.eps}}}
%       \ \hbox{\vbox{\psfig{figure=%
%          myfigure.ps,height=1in}}}\  
  \end{center}
\end{verbatim}
As you can see, a call to \texttt{mypsfig.sty} is no more necessary.
But \texttt{graphicx} and \texttt{epstopdf} have been loaded in the main module.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage\french

\section{Abr�viations}
\abbreviations 
Si on demande \verb|\abbreviations| alors on a  
acc�s � un fichier d'abr�\-via\-tions 
typo\-graphi\-ques fran�aises. 
Ainsi je saisis \verb|"monseigneur"| et j'imprime "monseigneur"\!.
De m�me, avec ML\TeX{} je saisis \verb|"deuxi�me"| 
(v�rifiez dans le
source que ce mot est bien cod� en 8bits) et j'imprime "deuxi�me"\!%
. %alors que le fichier d'abr�viations contient \verb|"deuxi\`|\verb|eme"|.
Ainsi il n'est plus vraiment indispensable de se rappeler que
l'abr�viation de madame est "madame" (et ma�tre : "ma�tre"\!).

Lorsqu'un mot ne figure pas dans le fichier d'abr�viations, il est alors 
imprim� tel que. Ainsi \verb|"GUTenberg"| imprimera 
\SmsG%
"GUTenberg".
\FmsG%
 Mais n'oubliez jamais le double guillemet fermant sinon vous obtiendrez
 un message du genre : 
\begin{versatim}
 Paragraph ended before \AbbrevName was complete.
\end{versatim}
 
Je peux aussi donner mon  fichier personnel d'abr�viations en codant :\\
\verb|\abreviations[mon_fichier_personnel]|

On retire ces possibilit�s par la commande \verb|\noabbreviations|.
N'oublions pas que le caract�re \verb|"|  sert normalement en \TeX{} 
comme en \LaTeX{} � exprimer les nombres en hexad�cimal.

\section{Monsieur s'abr�ge "Monsieur"}

Que je saisisse \verb|"Monsieur"| ou \verb|"monsieur"|
j'obtiens la m�me abr�viation : "Monsieur" ou "monsieur", respectivement.

Il n'en est pas toujours de m�me... ainsi lorsqu'on saisit
\verb|"Num�ro"| et \verb|"num�ro"| on obtient respectivement : 
"Num�ro" et "num�ro", car \verb|Num�ro|
est une entr�e dans le fichier des abbr�viations o� il est �crit
\verb|{Num�ro}|.

Il est d�sormais possible de placer une abr�viation dans un titre
de chapitre ou de section, comme le titre de cette section le
d�montre ; nous avons saisi :
\begin{verbatim} 
\section{Monsieur s'abr�ge "Monsieur"}
\end{verbatim}

\noabbreviations

\newpage\english

\section{Abbreviations}
The abbreviation facility offered in \FP\ is based on
an abbreviations file. When requested by \verb|\abbreviations| one
may call any \verb|"abbreviation"|. If this abbreviation is found in the
file it will be replaced by the typographic expansion, if not it will
be printed as is.\NL2

But never forget the ending double quotes otherwise you will obtain the
terrible message:
{\tt Paragraph} {\tt ended before} \texttt{\textbackslash AbbrevName} 
{\tt was complete.}
\NL4

You can have your own abbreviations file by calling:
\verb|\abreviations[my_file]|.\NL1

Saying \verb|\noabbreviations| this facility is lost. Remember that the
char \verb|"| is used normally in \TeX{} as in \LaTeX{} to start an
hexadecimal number.

But used in English, \verb|"monsieur"| will give "monsieur"%
\footnote{Notice the quoting!}.

\newpage\french
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\section{Autres macros utiles}
\verb|\fsc{KnUtH}| permet d'imprimer \fsc{KnUtH} et \verb|\lsc{SnCf}| 
donne \lsc{SnCf}. Cela doit aussi marcher si le mot commence par une
accentuation comme ici avec le mot \fsc{\'% a laisser tq a cause du 7bits
epinal} et m�me quand cette accentuation est plus loin dans
le mot comme ici dans \fsc{ANDR\'% a laisser tq a cause du 7bits
E}.

\bigskip
Voici une note%
\footnote{La note.\label{NOTE}}
de bas de page command�e par \verb|\footnote{La note.\label{NOTE}}|.
Je peux faire � nouveau appel � cette note\refmark{NOTE} 
 par l'ordre \verb|\refmark{NOTE}|.

\bigskip
Par analogie avec l'environnement \verb|verse| :
\begin{verse}
%\moretolerance % pour eviter un leger overfull hbox
1\iere{} ligne : cette ligne est bien trop longue, elle doit �tre coup�e autant de fois que n�cessaire...\\
2\ieme{} ligne : le test terrible de...\\%
3\ieme{} ligne : `ceci est le test des quotes'\\
\end{verse}
\tthyphenation
voici le m�me test (sans \verb|\\|)
avec l'environnement \vers|versatim| qui est 
un environnement \vers|verba|\-\vers|tim| compos� 
avec des coupures de lignes
comme l'est l'environnement \verb|verse| et dont les {\em quotes} peuvent
�tre imprim�es avec des accents si on pr�cise 
\vers|\noenglishquote| :
\noenglishquote
\begin{versatim}
1\iere{} ligne : cette ligne est bien trop longue,  elle doit �tre coup�e autant de fois que n�cessaire...
2\ieme{} ligne : le test terrible de \end{document} 
3\ieme{} ligne : `ceci est le test des quotes'
\end{versatim}
\englishquote

\allowuchyph
Et maintenant voici l'ordre r�duit \verb|\vers| qui 
s'utilise comme \verb|\verb| et doit permettre de couper une
longue cha�ne de caract�res \texttt{ver\-batim}. Celle-ci
sera coup�e par d�faut entre les mots (\vers|\notthyphe|\-\vers|nation|)
mais pourra l'�tre � l'int�rieur des mots si on pr�cise 
\tthyphenation \vers|\tthyphe|\-\vers|nation| comme ici : �
\vers|Longue Cha�ne De Caract�res � Couper Absolument| �.
Les mots commen�ant en majuscule ne pourront �tre coup�s
que si \vers|\uchyph=1|, valeur par d�faut dans \FP\ 
(\vers|\|\vers|allow|\-\vers|uchyph|) qui est utilis�e pour cette
partie uniquement.

\subsection*{Test de {\mdseries\texttt{\textbackslash fsc}} 
(\fsc{French CAPS})}
Ce paragraphe teste la protection de certaines macro-instructions.

\disallowuchyph\notthyphenation
\newpage\english
\section{Other useful macros}
French patronymic names are printed in small capitals with the first
letter in uppercase. That is done with the \verb|\fsc| macro.
Another macro \verb|\lsc| is available to print all the word(s) in small
capitals, specially usefull for trademark or companies names.

\LaTeX{} is at the current time unable to print a \verb|\ref| as
a footnotemark, the command \verb|\refmark| is able to do that.

Also, \LaTeX{} doesn't offer any {\tt verbatim} style able to
hyphenate lines. \FP\ is able to do this with the
environment {\tt versatim} or the \texttt{\textbackslash vers} order within a
line.

These environments allow to replace the {\tt tt} quoting
({\tt ` '}) by more realistic ones ({\tt\`{ } \'{ }}) with
the order \texttt{\textbackslash noenglishquote}. Of course this environment
produce nothing different from the standard \verb|verbatim| when 
used in \verb|\english|:
{\overfullrule=5pt

\hfuzz=30pt
\begin{versatim}
1\iere{} ligne : cette ligne est bien trop
2\ieme{} ligne : le test terrible de...
3\ieme{} ligne : `ceci est le test des...
\end{versatim}

\SmsG%

And now this a test of a long string within a \verb|\vers|: 
``\vers|Longue Cha�ne De Caract�res � Couper A|
This string would be hyphenated only if someone said
\verb|\tthyphenation| previously.
}

\FmsG%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage\french
\section{Accents et {\mdseries\tt tabbing}}
\FP\ apporte une solution pour pouvoir introduire
des lettres accentu�es dans un environnement \vers|tabbing| lorsque
le source \TeX{} est en 7bits ou utilise Ml\TeX{}
\footnote{%
Cette option est aussi utile d�sormais en T1 car les lettres accentu�es
sont traduites avec \FP, de fa�on interne, en 7-bits � la \TeX.
         }%
 ; c'est l'option par d�faut 
\vers|\|\vers|tabbing|\-\vers|accents|\tabbingaccents. L'exem\-ple :
\begin{tabbing}
Les TYPES : \=  Les matieres  \= Les genres \kill
Bidon :     \>   d'huile      \>$A'=B''$\` normal \\
Caisse :    \>   \`%
                   a outils     \> rustique \\
Toile :     \>   \a`%
                   a matelas    \> confort  
\end{tabbing}
\notabbingaccents
doit s'imprimer ainsi :
\begin{tabbing}
Les TYPES : \=  Les matieres  \= Les genres \kill
Bidon :     \>   d'huile      \>$A'=B''$\` normal \\
Caisse :    \>\a`a outils     \> rustique \\
Toile :     \>\a`a matelas    \> confort  \\
\end{tabbing}
\vspace*{-0.5\baselineskip}
Nous l'avions saisi comme suit :
\begin{versatim}
\begin{tabbing}
Les TYPES : \=  Les matieres  \= Les genres \kill
Bidon :     \>   d'huile      \>$A'=B''$\` normal \\
Caisse :    \>   \`%
                   a outils     \> rustique \\
Toile :     \>   \a`%
                   a matelas    \> confort  
\end{tabbing}
\end{versatim}

\section{Figurettes}
Le style \verb|french| propose un environnement sp�cial, appel� 
\verb|figurette|,
 pour placer les figures � l'enfroit exact o� 
ces figures se pr�sentent
dans le texte. Cela est particuli�rement utile pour des petites figures,
domaine o� \LaTeX{} n'est pas adapt� en standard. 
Pour r�aliser ceci :
  \begin{figurette}
        \center\fbox{essai}\endcenter% rajoute pour plain TeX
  \caption{Ceci est une figurette}
                 \label{figurette}
  \end{figurette}
Nous avons �crit :
\begin{verbatim}
  \begin{figurette}
        \center\fbox{essai}
  \caption{Ceci est une figurette}
                 \label{figurette}
  \end{figurette}
\end{verbatim}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage\english
\section{Diacritics \& {\mdseries\tt tabbing}}
There is no way in a \LaTeX{} \texttt{tabbing} to put diacritics on letters
as we use them usually. Here is how is printed the {\tt tabbing}
you can find in the french part:

\begin{tabbing}
Les TYPES : \=  Les matieres  \= Les genres \kill
Bidon :     \>   d'huile      \>$A'=B''$\` normal \\
Caisse :    \>   \`%
                   a outils     \> rustique \\
Toile :     \>   \`%
                   a matelas    \> confort  
\end{tabbing}

and that would normally be printed as follows:

\begin{tabbing}
Les TYPES : \=  Les matieres  \= Les genres \kill
Bidon :     \>   d'huile      \>$A'=B''$\` normal \\
Caisse :    \>\a`a outils     \> rustique \\
Toile :     \>\a`a matelas    \> confort  \\
\end{tabbing}

  \begin{figurette}
        \center\fbox{essai}\endcenter% rajoute pour plain TeX
  \caption{Originally a figurette}
        \label{engfig}
  \end{figurette}
\NL{4}

\section{Little figures}

\FP\ offers a special environment called
\verb|figurette| which allows to put little figures EXACTLY
where they appear in the text. This is a lack in the present
versions of \LaTeX{}. In English the environment \verb|figurette|
is replaced by an environment \verb|figure[h]|; look at figure
\ref{engfig} we tried to put here without success and we
typed like this:

\begin{verbatim}
  \begin{figurette}
        \center\fbox{essai}
  \caption{Originally a figurette}
        \label{engfig}
  \end{figurette}
\end{verbatim}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage\french
\ifx\drapeaufg\undefined\else
\section{Composition \protect\linebreak en drapeau}
� gauche on trouve une composition justifi�e standard \LaTeX.
Dessous, une composition avec l'environnement \texttt{drapeaufg}
propos� par l'extension \FP, il s'agit d'une composition
\emph{en drapeau, au fer} � gauche. � droite, il s'agit aussi d'une
composition \emph{en drapeau, au fer} � gauche mais cette fois-ci avec
l'environnement \texttt{drapeaufgIN}, sans coupure de mots, comme cela
est recommand� par l'imprimerie nationale.

\subsection{Tests ordinaires}
\textbf{\large Texte justifi� de r�f�rence}

\medskip
\def\GOfrench{\noindent{\fboxsep 0pt\fboxrule 0.2pt\fbox{\advance\hsize by -2pt
      \hbox{\vbox{\noindent
� Par ailleurs, les lignes n'occupant pas toute la
  justification (titres ou l�gendes le plus souvent) peuvent �tre
  \emph{centr�es} ou se pr�senter align�es verticalement
  par la gauche sur la
  marge de gauche de la page, ou \XX 
  verticalement par la droite sur la marge de
  droite de la page. On dira alors qu'elles sont compos�es
\emph{en drapeau, au fer} � gauche ou \emph{en drapeau, au fer} � droite.
Dans ce type de composition, les coupures de mots sont proscrites et les
rejets � la ligne devront ob�ir � une certaine logique souvent dict�e par le
sens. Ainsi on ne s�parera pas l'article du substantif, le pronom personnel
sujet de son verbe, l'adjectif num�ral du nom auquel il se \XX
rapporte, \etc. �
(r�gles Imprimerie Nationale, p~153)%
}}\hss}}}

\let\XX\relax
\GOfrench

\hbox{}

\textbf{\large Drapeau, au fer � gauche}

\medskip
\begin{drapeaufg}
\GOfrench
\end{drapeaufg}

\newpage
\enlargethispage{20pt}\hbox{}\smallskip

\hbox{}\smallskip\NL5
Dans ce dernier cas, des d�bordements dans la marge droite
sont possibles ; ils sont � traiter
au cas par cas par de simples coupures de lignes plac�es aux endroits
recommand�s par l'imprimerie nationale (selon texte encadr�). Le 
dernier texte est ainsi corrig�.\NL3\vspace*{-2.5pt}

\textbf{\large Drapeau � fg �, selon IN}

\medskip
\begin{drapeaufgIN}
\GOfrench
\end{drapeaufgIN}

\medskip
\textbf{\large Drapeau � fg IN �, corrig�}

\medskip
\let\XX\\
\begin{drapeaufgIN}
\GOfrench
\end{drapeaufgIN}

\newpage
\subsection{Tests en drapeau � fg �, aux limites}
Voici deux tests aux limites de la composition 
\emph{en drapeau, au fer} � gauche, sur une colonne
�troite (2cm) tout d'abord avec l'environnement
\texttt{drapeaufg} et ensuite avec la recommandation
de l'imprimerie nationale appliqu�e � 
\FP\ (ou interpr�t�e par l'environnement \texttt{drapeaufgIN}).

Les coefficients de laideur (\texttt{badness})
accept�s sont �lev�s, c'est la raison pour laquelle
aucun message d'\texttt{underfull hbox} 
(tout comme celui d'\texttt{overfull}) 
n'est �mis dans les deux cas
ci-dessous.

\bigskip

\def\temp{\noindent{\fboxsep 0pt\fboxrule 0.2pt\fbox{\advance\hsize by -2pt
      \hbox{\vbox{\noindent
 instit  instits
institut instituts
institution institutions
institutionnel institutionnels
institutionnelle institutionnelles 
institutionnellement
constitutionnellement
inconstitutionnellement
}}\hss}}}

\let\XX\relax
\parbox{2cm}{%
\begin{drapeaufg}
\hsize=2cm
\temp
\end{drapeaufg}
}
\hspace*{0.5cm}
\parbox{2cm}{%
\begin{drapeaufgIN}
\hsize=2cm
\temp
\end{drapeaufgIN}
}

\newpage
\subsection{Tests en drapeau � fd �, aux limites}
Nous effectuons ici les m�mes test mais avec
les environnements \texttt{drapeaufd} (fer � droite)
et \texttt{drapeaufdIN} (selon imprimerie nationale). 
En fait, l'environnement
\texttt{drapeaufd} est tout simplement
un \texttt{raggedleft}.
\NL{9}

\let\XX\relax
\parbox{2cm}{%
\begin{drapeaufd}
%\mbox{Avec \the\rightskip :}
\hsize=2cm
\temp
\end{drapeaufd}
}
\hspace*{0.5cm}
\parbox{2cm}{%
\begin{drapeaufdIN}
%\mbox{Avec \the\rightskip :}
\hsize=2cm
\temp
\end{drapeaufdIN}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\Large
\let\XX\relax
\subsection{Test � fd � classique}

\begin{drapeaufd}
\GOfrench
\end{drapeaufd}

\normalsize\bigskip

L'�il aiguis� sera troubl� car
les deux colonnes ne sont pas align�es horizontalement ;
cela est d� � la diff�rence de mat�riel � composer, au total, 
dans chacune des deux colonnes.

\vfill

\newpage
\Large	
\subsection{Test � fd � IN}
\begin{drapeaufdIN}
\GOfrench
\end{drapeaufdIN}

\normalsize\bigskip

Quelque soit le corps de la police (dans les limites
classiques de \LaTeX{}), avec cette largeur de colonne, 
on n'obtient pas de diff�rence
de mise en page entre les deux environnements. Les r�gles
de l'imprimerie nationale sont donc plus largement appliqu�es
dans ce cas.

\vfill
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\onecolumn
\newpage\french
\hbox{}
\vfill
\centerline{\Large Page intentionnellement laiss�e blanche}
\vfill
\twocolumn

\fi% on a saute si drapeaufg est inconnu (frencht)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage\french
\section{Lettrines}
\SmsG% lettrine reduite a 1 seule lettre !
Voici le test des lettrines propos�es en mode semi-automatique
avec \FP\ :

\bigskip
\verb|                  \flettrine{Quoi ?}|
\flettrine{Quoi ?} {Paris}
{sera toujours Paris}.  Ceci est une lettrine obtenue
gr�ce au coll�gue allemand E.~{\sc Scha\-l�ck} et
 aux diff�rents codes qu'il
m'a donn�s.

� Ici d�marre une lettrine dans une citation.

\bigskip
\lettrine{Paris}
{sera toujours Paris}.  Ceci est une lettrine obtenue
gr�ce au coll�gue allemand E.~{\sc Scha\-l�ck} et
 aux diff�rents codes qu'il
m'a donn�s.

\bigskip
\flettrine{Paris}
{sera toujours Paris}.  Ceci est une lettrine obtenue
gr�ce au coll�gue allemand E.~{\sc Scha\-l�ck} et
 aux diff�rents codes qu'il
m'a donn�s.

et la citation se termine ici. �

\bigskip
\verb|     \font\lettrinefont=cmr17 scaled|\\
{\font\lettrinefont=cmr17 scaled \magstep5
\verb|   \magstep5\lettrine[`` {Paris} '']|
\lettrine[`` {Paris} '']
{sera toujours Paris}.  Ceci est une lettrine obtenue
gr�ce au coll�gue allemand E.~{\sc Scha\-l�ck} et
 aux diff�rents codes qu'il
m'a donn�s.\par}

\bigskip
\verb|            \lettrine[� {Paris} �]|
\lettrine[� {Paris} �]
{sera toujours Paris}.  Ceci est une lettrine obtenue
gr�ce au coll�gue allemand E.~{\sc Scha\-l�ck} et
 aux diff�rents codes qu'il
m'a donn�s.

\bigskip
\verb|             \flettrine[� {Paris} ]|
\flettrine[� {Paris} ] 
{sera toujours Paris}.  Ceci est une lettrine obtenue
gr�ce au coll�gue allemand E.~{\sc Scha\-l�ck} et
 aux diff�rents codes qu'il
m'a donn�s. �

\bigskip
\tthyphenation\noindent
\vers|\|\vers|font\lettrinefont=cmti12 scaled| \!\vers| \magstep4\lettrine|
{\em \% v�rification d'italique.}
\font\lettrinefont=cmti12 scaled \magstep4\lettrine
Blalbla {\bf je blablate},  tu blablates,  ils blablatent, b... 
(ceci est l'exemple m�me de ce qu'il ne faut pas faire car ainsi
le mot n'est pas mis en petites capitales). Ceci avait pour but
de tester une police italique.

\bigskip
\lettrine{L'absurdit�} de cette lettrine...

\notthyphenation
\FmsG

\newpage\english

\section{Illuminated letters}

Look at the French part of this document because, in English,
these macros have no effect:

\bigskip
\verb|                  \flettrine{Quoi ?}|
\flettrine{Quoi ?} {Paris}
{sera toujours Paris}.  Ceci est une lettrine obtenue
gr�ce au coll�gue allemand E.~{\sc Scha\-l�ck} et
 aux diff�rents codes qu'il
m'a donn�s.

� Ici d�marre une lettrine dans une citation.

\bigskip
\lettrine{Paris}
{sera toujours Paris}.  Ceci est une lettrine obtenue
gr�ce au coll�gue allemand E.~{\sc Scha\-l�ck} et
 aux diff�rents codes qu'il
m'a donn�s.

\bigskip
\flettrine{Paris}
{sera toujours Paris}.  Ceci est une lettrine obtenue
gr�ce au coll�gue allemand E.~{\sc Scha\-l�ck} et
 aux diff�rents codes qu'il
m'a donn�s.

et la citation se termine ici. �

\bigskip
\verb|     \font\lettrinefont=cmr17 scaled|\\
{\font\lettrinefont=cmr17 scaled \magstep5
\verb|   \magstep5\lettrine[`` {Paris} '']|
\lettrine[`` {Paris} '']
{sera toujours Paris}.  Ceci est une lettrine obtenue
gr�ce au coll�gue allemand E.~{\sc Scha\-l�ck} et
 aux diff�rents codes qu'il
m'a donn�s.\par}

\bigskip
\verb|            \lettrine[� {Paris} �]|
\lettrine[� {Paris} �]
{sera toujours Paris}.  Ceci est une lettrine obtenue
gr�ce au coll�gue allemand E.~{\sc Scha\-l�ck} et
 aux diff�rents codes qu'il
m'a donn�s.

\bigskip
\verb|             \flettrine[� {Paris} ]|
\flettrine[� {Paris} ] 
{sera toujours Paris}.  Ceci est une lettrine obtenue
gr�ce au coll�gue allemand E.~{\sc Scha\-l�ck} et
 aux diff�rents codes qu'il
m'a donn�s. �

\bigskip
\noindent
\verb|\font\lettrinefont=cmti12 scaled| \verb| \magstep4\lettrine|
%{\em \% v�rification d'italique.}
\font\lettrinefont=cmti12 scaled \magstep4\lettrine
Blalbla {\bf je blablate},  tu blablates, ils blablatent, b... 
(ceci est l'exemple m�me de ce qu'il ne faut pas faire car ainsi
le mot n'est pas mis en petites capitales). Ceci avait pour but
de tester une police italique.

\bigskip
\lettrine{L'absurdit�} de cette lettrine...

\onecolumn\newpage%
\french
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  ===�� Il n'y a plus d'anglais au del� de cette limite ��===
\def\lastlinein#1{\expandafter\gdef\csname #1\endcsname{\relax}}
\lastlinein{english}% this is for frencht.tex
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage\french
\section{Lettrines automatiques ou non}

\bigskip
\lettrine{THIS IS A TEST} (a non-automatic one)
is a piece of text and some more and some more
and some more and some more and some more and some more and some more
and some more and some more and some more and some more and some more
and some more and some more.
                   
\bigskip
\flettrine{THIS IS A TEST} (a non-automatic one)
is a piece of text and some more and some more
and some more and some more and some more and some more and some more
and some more and some more and some more and some more and some more
and some more and some more.

\bigskip
\automaticlettrine

\lettrine{THIS IS A TEST} (a default automatic one)
is a piece of text and some more and some more
and some more and some more and some more and some more and some more
and some more and some more and some more and some more and some more
and some more and some more.

\bigskip
\flettrine{THIS IS A TEST} (a default automatic one)
is a piece of text and some more and some more
and some more and some more and some more and some more and some more
and some more and some more and some more and some more and some more
and some more and some more.


\bigskip
\def\lettrinefontname{cmr17}
\lettrine{THIS IS A TEST} (a cmr17 automatic one)
is a piece of text and some more and some more
and some more and some more and some more and some more and some more
and some more and some more and some more and some more and some more
and some more and some more.

\bigskip
\flettrine{THIS IS A TEST} (a cmr17 automatic one)
is a piece of text and some more and some more
and some more and some more and some more and some more and some more
and some more and some more and some more and some more and some more
and some more and some more.

\bigskip
\lettrine{Que vaut ce test ?} (en automatique)
is a piece of text and some more and some more
and some more and some more and some more and some more and some more
and some more and some more and some more and some more and some more
and some more and some more.

\bigskip
\noautomaticlettrine
\lettrine{THIS IS A TEST} (a non-automatic one)
is a piece of text and some more and some more
and some more and some more and some more and some more and some more
and some more and some more and some more and some more and some more
and some more and some more.
                   
\bigskip
\lettrine{Que vaut ce test ?} (non-automatique)
is a piece of text and some more and some more
and some more and some more and some more and some more and some more
and some more and some more and some more and some more and some more
and some more and some more.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\section{�num�rations}
L'espacement des �num�rations fran�aises est
 profond�ment modifi� avec \FP, pour s'en
convaincre voir le test des listes page \pageref{listes} ou
l'environnement \texttt{order} ci-apr�s.

\section{L'environnement � {\mdseries\texttt{order}} �}
Un environnement sp�cifique est propos�, il s'agit de l'environnement
\verb|order| pour \LaTeX{} dont voici un petit exemple :

\begin{order}
\item Bien regarder ;
\item l'espacement de chaque �l�ment est sp�cial ;
\item l'espacement vertical est aussi diff�rent.
\item A-D-O-P-T-E-Z \ \ L-E !
\end{order}

Ce prototype correspond bien aux �num�rations 
fran�aises  (je ne
parle pas uniquement des marqueurs  -- primo, secundo, \etc. -- 
mais aussi de la gestion des espaces). En voici un autre exemple
concret :
\NL1

Les guillemets entrent aussi en ligne de compte : � Je citerai
3 cas tr�s importants :
\begin{order}
\item le premier cas ;
\item le second ;
\item le dernier.
\end{order}
qui sont [...] �
\NL1

� noter que ce m�canisme de rajout des guillemets en d�but de 
chaque �l�ment de liste marche aussi avec un environnement 
comme \texttt{itemize}.

\expandafter\ifx\csname frenchTeXmods\endcsname\relax
            \space% ce test ne marche pas en LaTeX standard.
\else
     \ifx\frenchTeXmods\empty\space% ni en dummy french !
     \else
\section{Tests aux limites des guillemets anglais}

V�rifions qu'il est possible d'activer temporairement
quelques caract�res sans perturber le traitement. Exemple :

\begin{verbatim}
{\catcode`\'=\active\catcode`\'=\active
 `` Test guillemets anglais ''
}
\end{verbatim}

{\catcode`\'=\active\catcode`\'=\active
 `` Test guillemets anglais ''
}
     \fi
\fi

Un cas bien sp�cial avait �t� rencontr� avec l'extension \myverb|amstex|
qui utilisait une r�f�rence avec des math�matiques dans une autre 
r�f�rence, ce qui entrainait une boucle infinie avec \FP. Voici 
le test en question : 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% this code generates a loop with versions of french < V3,42 %%%%%%
\makeatletter
\def\r@ref{{\ref{nulllabel}$'$}}{1}
\makeatother
\ref{ref} = 1 $'$ % boucle garantie si < V3,42
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Autre test aux limites ?

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\section{� Autres tests �}
Nous sommes ici en une colonne.

\bigskip
Voici un test d'encadr� contenant le mode \verb|centering| : 
\begin{center}\fbox{%
\parbox{6cm}{\begin{center}Information : si vous voulez  me joindre,
mon t�l.  : 01 69 35 85 40. Je n'y suis qu'aux horaires de
bureau.\end{center}}%
     }\end{center}

Bon ?\footnote{L'objet de cette note de bas de page est 
de v�rifier l'espacement des inf�rieurs et sup�rieurs,
\primo en \texttt{\backslash tt} : 
\texttt{XXXX ===> <=== YYYY} et
\secundo en {\tt verbatim} : 
\myverb|french V4 < french V5 > frenchOLD|% 
.}

\begin{table*}[h]
\caption{Dactylographie et typographie compar�es}
\label{frenchdactylo}
\vspace*{1cm}
\huge
\begin{tabular}{|r|r|}
\hline
dactylographie\ \ \ \ \hfill & \ \ \ typographie\ \ \ \hfill\\
\hline
    \verb|use \dots or \ldots| \ & use \dots\ or $\ldots{}$\ \\
        \verb|utilisez...|     \           & utilisez...\  \\
        \verb|semi-colon;|     \           &  semi-colon;\ \\
        \verb|point-virgule ;| \           & point-virgule ;\  \\
        \verb|My god!|         \           & My god!\ \\
        \verb|Mon dieu !|      \           & Mon Dieu !\ \\
        \verb|Why not?|        \           & Why not?\ \\
        \verb|Pourquoi pas ?|  \           & Pourquoi pas ?\ \\
        \verb|``I say''|       \           & ``I say''\ \\
        \verb|� Je dis �|    \           & � Je dis �\ \\
        \verb|He said: Yes|    \           & He said: Yes\ \\
        \verb|Il dit : non|    \           & Il dit : non\ \\
        \verb|$1\,234,567$|    \           & $1\,234,567$\ \\
        \verb|$f(x,\,y)$|      \           & $f(x,\,y)$\ \\
\hline
\end{tabular}
\normalsize
\end{table*}

\newpage
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ifx\itshape\undefined\else% avoid old frencht crash
\subsection{Test des guillemets dans un \mdseries\texttt{\backslash edef}}

Les guillemets peuvent �tre appel�s dans une d�finition de macro
telle que \verb|\edef| mais comme les guillemets ne sont pas expansibles
enti�rement il a donc fallu arriver � r�aliser une d�finition acceptable.

Ainsi \verb|\edef\testedef{� essai �}|
\edef\testedef{� essai �}
donnera la curieuse d�finition suivante : \\
\hbox{}\hfill\texttt{\meaning\testedef} ; \\
elle reste compl�tement expansible (dans certaines conditions)
ou pas du tout (comme ici appel�e en tt on obtiendra 
le r�sultat suivant : \texttt{\testedef}).
\fi

\subsection{{\mdseries\tt <{}} et {\mdseries\tt >{}} red�finis}

Mes utilisateurs sont terribles ! Ils veulent le beurre, l'argent du
beurre et aussi la fermi�re... S'ils codent 
\verb9\def\truc<#1|#2>{/#1 OU #2/}9
 ils veulent pouvoir obtenir
/Essai OU Erreur/ en saisissant \verb9\truc<Essai|Erreur>9. Faisons
l'essai r�el :
{\def\truc<#1|#2>{/#1 OU #2/} \truc<Essai|Erreur>}.

Encore plus fort : nous voulons avoir une notation de Backus-Naur 
c'est-�-dire des \verb|\rangle| et \verb|\langle|. Voici la 
d�finition que nous avons entr�e avant le \verb|\begin{document}| :
\begin{verbatim}
{\catcode`\<=\active\catcode`\>=\active%
\global\def<{\left\langle}\global\def>{\right\rangle}
}
\end{verbatim}

Pour tester l'efficacit� de ces macros il suffit alors de faire
par exemple :
\begin{verbatim}
� $<assignement>$ �
\end{verbatim}
� condition que l'option \verb|\frenchguillemets| soit
active (en maths).

Essayons cela : 
% en fait il faut reactiver cela maintenant :
{%
 \gdef\myinf{\left\langle}%
 \gdef\mysup{\right\rangle}%
� $\frenchguillemets% on a \nofrenchguillemets avec AmSTeX
   <assignement>$ �.
}%
% Remettre ici pour frenchle
\global\let\myinf\inferieura% A no-op def
\global\let\mysup\superieura% for a temporary action

\subsection{\mdseries\texttt{\textbackslash special}}
L'inclusion d'une commande \verb|\special| est ici test�e :\\
{%%%%%%%%%%%% attention : commentaires impossible dans cette partie.
 \catcode`\%=12
 \texttt{\backslash special}\verb|{ps:|{\tt %%%
                                     }\verb| Texte bidon {`�manuel:C;!?�'}}|
 \special{ps:%%% 
                 Texte bidon {`�manuel:C;!?�'}}
}

\subsection{{\mdseries\texttt{\textbackslash refmark}} dans un tableau}

O� l'on reparle encore de \verb|\refmark|...

La note \ref{bas} est r�f�renc�e depuis le tableau ci-dessous, tout comme
les notes du tableau lui-m�me.

  \begin{table}[htbp]
    \begin{center}
      \begin{tabular}{|c|l|}
        \hline
        Lettre & Utilisation\\
        \hline
        {\tt h} & petit blabla gentil et anodin \refmark{bas}\\
        {\tt l} & ici reblabla assez moyen\refmark{bas}$^,$\refmark{refnote}\\
        {\tt L} & autre grand grand grand blabla 
                  \footnote{La note du tableau � refmark �.\label{refnote}}\\
        \hline
      \end{tabular}
      \caption{Le titre du tableau.}
  \end{center}
\end{table}

En dehors du tableau on peut faire appel\footnote{La note de page.\label{bas}}
� une note qui est, par contre, r�f�renc�e dans le tableau. Tout cela
est r�alis� gr�ce � l'ordre \verb|\refmark| introduit par l'extension
\FP.

\subsection{{\mdseries\texttt{\textbackslash nombre}} en argument}

Voici un test simple permettant de valider \verb|\nombre| lorsqu'il
est en argument d'une macro-instruction :

\begin{verbatim}
\noindent
1\,234 un nombre simple !\\
$*$\\
\nombre{1 234} un nombre simple !\\
\nombre{1 234,5} avec une d�cimale.\\
\texttt{\nombre{1 234,56} avec fonte tt.}\\
\emph{\nombre{1 234,567} en mode emphas�.}\\
\nombre{1 234,567 8} avec encore une d�cimale.
\end{verbatim}

Il faut noter que l'ordre \verb|\nombre| est toujours compos� en mode
math�matique ce qui force l'utilisation des fontes math�matiques. 
Tout changement de fonte doit donc �tre pr�cis� de fa�on ad hoc.
Par ailleurs, la composition n'est garantie que si l'option
\verb|\nofiles| n'a pas �t� indiqu�e en d�but de document.
Voici ce que ce test donne :

\noindent
1\,234 un nombre simple !\\
$*$\\
\nombre{1 234} un nombre simple !\\
\nombre{1 234,5} avec une d�cimale.\\
\texttt{\nombre{1 234,56} avec fonte tt.}\\
\emph{\nombre{1 234,567} en mode emphas�.}\\
\nombre{1 234,567 8} avec encore une d�cimale.

\ifx\documentclass\undefined % Still Plain! so no \DeclareFontFamily
\else%
\subsection{{\mdseries\texttt{\textbackslash label}} en mode math}

Il s'agit ici de tester la commande \verb|\label| dans un environnement
\verb|equation| :

\begin{verbatim}
V�rifions le num�ro de l'�quation \ref{labelequation} ci-dessous :
\begin{equation}\label{labelequation}
V_{Lm}=\frac{L}{t_p}
\end{equation}
\end{verbatim}

Voici le r�sultat du test :

V�rifions le num�ro de l'�quation \ref{labelequation} ci-dessous :
\begin{equation}\label{labelequation}
V_{Lm}=\frac{L}{t_p}
\end{equation}
\fi

\csname TexteComplementaire\endcsname

\subsection{Bibliographie}
Voyons maintenant la bibliographie.
Dans \cite{`�manuel:Gaulle;!?�'} on trouvera...
\nocite{`�merci:Ronan;!?�'} 
Par contre  
\cite[pp.1--3, X \& consorts]{�blabla�} 
est beaucoup plus fourni en exemples et commentaires... Mais dans 
\cite[p. 25 \S~13 {{\it et seq.}}]{`�torture:Gaulle;!?�'} 
toutes ces informations
sont plus d�taill�es.

Ce qui suit n'est pas un exemple de belle bibliographie, juste une
v�rification de bon fonctionnement.

\bibliographystyle{plain}

\begin{thebibliography}{Knuth 99}

\section*{Bibliographie dans le document}

\bibitem[Knuth 99]{�blabla�} Le \TeX book ou la  �  bible � 
         des gourous \TeX
\bibitem{`�manuel:Gaulle;!?�'} B. {\sc Gaulle}, {\em 
         Le r�sultat d'une � {\em dure} � journ�e de travail !}
\bibitem{`�merci:Ronan;!?�'} R. {\sc Keryell}, {\em 
         Le gentil normalien qui m'a beaucoup aid� gr�ce � sa th�se...}
\bibitem{`�torture:Gaulle;!?�'} B. {\sc Gaulle}, {\em 
         Notice d'utilisation du style french}, 1991-1999.
\bibitem{`�tortureFP:Gaulle;!?�'} B. {\sc Gaulle}, {\em 
         Notice d'utilisation de l'extension \FP\ pour \LaTeX}, 2000-20xx.
\end{thebibliography}

\ifx\documentclass\undefined % Still Plain! so skip
\else%
\section*{\phantom{\normalsize[Knuth 99]}Bibliographie en dehors du document}

Avec certaines extensions de bibliographie il peut s'av�rer utile
de prot�ger les caract�res actifs � l'int�rieur m�me de la base
de donn�es bibliographique.

\bibliography{testbib}
\fi%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\listoffigures
\listoftables
\glossary{Fa�on cordon bleu}
\glossaires
\section*{Glossaire des mots techniques}
\printglossary[\jobname.glo]

\noindent -- magnification

\noindent -- caract�res sp�ciaux : \NL1

{\huge%\frenchmacros n'est pas utile ici
\begin{tabular}{|c|c|}
\hline
Pour imprimer ceci & Saisir cela\\ \hline
\at                & \verb|\at|\\ \hline
\texttt{\vert}     & \verb|\texttt{\vert}|\\ \hline
\tilde             & \verb|\tilde|\\ \hline
\texttt{\backslash}& \verb|\texttt{\backslash}|\\ \hline
\chap              & \verb|\chap|\\ \hline
\degre             & \verb|\degre| \\ \hline
\degres            & \verb|\degres| \\ \hline
\normalsize
1\ier{} �tage      & \verb|1\ier{} �tage| \\ \hline
\normalsize
(2\ieme\!)         & \verb|(2\ieme\!)| \\ \hline
\primo             & \verb|\primo|\\ \hline
\secundo)          & \verb|\secundo)|\\ 
\hline
\end{tabular}
} \NL1

On notera que le caract�re \verb|\degre| n'est pas le signe typographique
usuellement utilis� pour exprimer 
des degr�s mais que \verb|\degres| est
plus conforme � la tradition. On remarque bien les diff�rences entre
\verb|\primo| et \verb|\secundo)| 
(la forme parenth�s�e n'est pas valable
en {\em belle} typographie fran�aise).
\primo... \secundo... \tertio... \quarto...
\primo)... \secundo)... \tertio)... \quarto)...

\section*{Glossaire argotique}
Le pied

\printindex

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\part{Ce qui ne marche pas (bien)...}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\chapter{Quelques questions � �tudier}

Cette partie ne comporte que des � anomalies � que l'auteur esp�re
r�soudre d'ici quelque temps, 
gr�ce � votre aide... peut �tre ? 

En fait il ne reste vraiment
pas grand chose � r�gler mais ce sont probablement des
vieux probl�mes sacr�ment compliqu�s.

\section{Le � 2 points �}
Le � 2 points � a une f�cheuse tendance 
� rester en bas de page lorsqu'il est
suivi d'un {\tt verbatim}. Il serait souhaitable d'en trouver la raison.

\section{Les guillemets}

Le probl�me avec \verb|quotation| page \pageref{quotation}.

%Et la perte d'informations
%dans le cas de  \verb|\noeveryparguillemets| lorsque l'on d�marre
%une citation dans un paragraphe d�j� commenc�.
%
%Vraiment tr�s {\em fragile} ce \verb|\noeveryparguillemets| ! (

Voir le cas des notes
de bas de page ou en marge qui produis(ai ?)ent des d�sastres
avec \verb|\noeveryparguillemets|.

\section{Le cas des extensions mal �crites ...}

... ne se r�sout souvent que par la modification de l'extension en question.
Cela a �t� le cas de nombreuses extensions depuis le d�but de \frenchname{} 
et j'ai bien peur que cela continue \emph{�ternellement}%  (et � propos : qui me succ�dera ?)
. 
Ici Bernard Gaulle ajoutait (d�j� en 2002) : � et � propos : qui me succ�dera ? �.
Nous pensons que  le groupe de travail autour du projet e-french r�pond � sa question.

Certains cas sont insolubles, par exemple : 
l'extension \verb|here.sty| 
red�finissait � au vol � 
l'ordre \LaTeX{} \verb|\table| au lieu
de modifier l'existant ; cela posait un r�el probl�me � FrenchPro
qui se base sur la modification d'une commande \verb|\table|
existante. Heureusement ce style p�rim� peut �tre remplac�
avantageusement par \verb|float|.

Notons qu'aujourd'hui avec les diverses variantes de \texttt{float}, 
ce probl�me n'existe plus (comme bien d'autres d'ailleurs).

\chapter{Am�liorations � envisager}

\section{Index et bibliographie}
Deux th�mes qui n'ont que tr�s peu �t� abord�s.

\section{Abr�viations}
Il est f�cheux d'avoir � conna�tre quelles sont les mots
abr�geables pour pouvoir demander leur abr�viation ; autant les saisir
correctement d�s le d�but...

Faut-il arr�ter la composition \LaTeX{} quand une abr�viation 
n'est pas trouv�e ? 

Faut-il offrir la possibilit� de lister toutes les abr�viations ?

\annexes
\hsize=18cm
%
%\chapter{Copyright}
%\Mylisting{copyrigh.tex}
%
%\chapter{Le fichier \mdseries{\tt language.dat}}
%\Mylisting{language.dat}

\chapter{Le fichier \mdseries{\tt frabbrev.tex}}
\Mylisting{frabbrev.tex}

% retire pour mettre french.cmd 98/06
%\chapter{Le fichier \mdseries{\tt french.dmy}}
%My\listing{french.dmy}

\chapter{Le fichier \mdseries{\tt french.cmd}}
\Mylisting{french.cmd}

\chapter{Le fichier \mdseries{\tt french.chk}}
\Mylisting{french.chk}
%
%\chapter{Un style english (\mdseries{\tt fenglish})}
%\Mylisting{fenglish_doc}

%\chapter{Le code de l'extension \FP}
%
%\Mylisting{french_doc.txt}

\newpage
\hsize=15cm
\abbreviations\noenglishdoublequotes
\tableofcontents
\noabbreviations\englishdoublequotes% remove options set for toc.

\english %=\relax if english text (see \lastlinein)
\endinput
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
