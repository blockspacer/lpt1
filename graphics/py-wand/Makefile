# $NetBSD: Makefile,v 1.3 2020/01/02 09:07:46 mef Exp $

VERSION=	0.5.8
DISTNAME=	wand-${VERSION}
PKGNAME=        ${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_GITHUB:=emcconville/}
GITHUB_PROJECT= Wand

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://docs.wand-py.org/
COMMENT= 	Ctypes-based simple ImageMagick binding for Python
LICENSE=	mit

EGG_NAME=	Wand-${VERSION}
PKGCONFIG_OVERRIDE+=	Wand.pc.in

DEPENDS+=	ImageMagick-[0-9]*:../../graphics/ImageMagick

post-install:
	${MV}	${DESTDIR}${PREFIX}/README.rst	${DESTDIR}${PREFIX}/${PYSITELIB}/wand

.include "../../lang/python/application.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
