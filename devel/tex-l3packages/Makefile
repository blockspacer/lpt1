# $NetBSD: Makefile,v 1.12 2019/12/06 19:18:34 markd Exp $

DISTNAME=	l3packages
PKGNAME=	tex-${DISTNAME}-2019.51546
TEXLIVE_REV=	51546

MAINTAINER=	minskim@NetBSD.org
HOMEPAGE=	https://ctan.org/pkg/l3packages
COMMENT=	High-level LaTeX3 concepts
LICENSE=	lppl-1.3c

DEPENDS+=	tex-amsmath-[0-9]*:../../print/tex-amsmath
DEPENDS+=	tex-graphics-[0-9]*:../../print/tex-graphics
DEPENDS+=	tex-l3kernel-[0-9]*:../../devel/tex-l3kernel
DEPENDS+=	tex-latex-[0-9]*:../../print/tex-latex

TEXLIVE_UNVERSIONED=	yes
.include "../../print/texlive/package.mk"
.include "../../mk/bsd.pkg.mk"
