# $NetBSD: Makefile,v 1.20 2019/12/06 20:23:02 markd Exp $

DISTNAME=	pgf
PKGNAME=	tex-${DISTNAME}-3.1.4
CATEGORIES=	print graphics
TEXLIVE_REV=	51626

MAINTAINER=	minskim@NetBSD.org
HOMEPAGE=	http://ctan.org/pkg/pgf
COMMENT=	PostScript and PDF graphics systems for TeX
LICENSE=	lppl-1.3c

DEPENDS+=	tex-graphics-[0-9]*:../../print/tex-graphics
DEPENDS+=	tex-latex-bin>=2009nb1:../../print/tex-latex-bin
DEPENDS+=	tex-ms-[0-9]*:../../print/tex-ms
DEPENDS+=	tex-tools-[0-9]*:../../print/tex-tools
DEPENDS+=	tex-xcolor-[0-9]*:../../print/tex-xcolor
DEPENDS+=	tex-xkeyval-[0-9]*:../../print/tex-xkeyval

TEXLIVE_UNVERSIONED=	yes
.include "../../print/texlive/package.mk"
.include "../../mk/bsd.pkg.mk"
