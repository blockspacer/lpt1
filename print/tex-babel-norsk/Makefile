# $NetBSD: Makefile,v 1.2 2019/12/06 20:18:55 markd Exp $

DISTNAME=	babel-norsk
PKGNAME=	tex-${DISTNAME}-2.0i
TEXLIVE_REV=	30281

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://ctan.org/pkg/babel-norsk
COMMENT=	Babel support for Norwegian
LICENSE=	lppl-1.3c

DEPENDS+=	tex-babel>=3.9l:../../print/tex-babel

TEXLIVE_UNVERSIONED=	yes
.include "../../print/texlive/package.mk"
.include "../../mk/bsd.pkg.mk"
