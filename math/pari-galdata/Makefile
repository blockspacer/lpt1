# $NetBSD: Makefile,v 1.13 2019/05/10 22:55:23 mef Exp $

DISTNAME=		galdata
PKGNAME=		pari-galdata-2.2
CATEGORIES=		math
MASTER_SITES=		https://pari.math.u-bordeaux.fr/pub/pari/packages/
EXTRACT_SUFX=		.tgz

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://pari.math.u-bordeaux.fr/
COMMENT=		Galois group data for pari

DEPENDS+=		pari>=2.2.7:../../math/pari

WRKSRC=			${WRKDIR}/data/galdata

DIST_SUBDIR=		pari-2.2

NO_BUILD=		yes
INSTALLATION_DIRS=	share/pari/galdata

do-install:
	${INSTALL_DATA} ${WRKSRC}/* ${DESTDIR}${PREFIX}/share/pari/galdata

.include "../../mk/bsd.pkg.mk"
