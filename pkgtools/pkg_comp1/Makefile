# $NetBSD: Makefile,v 1.1 2017/02/12 10:48:55 jmmv Exp $

PKGNAME=	pkg_comp1-1.38
PKGREVISION=	1
CATEGORIES=	pkgtools

MAINTAINER=	pkgsrc-users@NetBSD.org
COMMENT=	Build packages inside a chroot jail
LICENSE=	modified-bsd

CONFLICTS=	pkg_comp-[0-9]*

ONLY_FOR_PLATFORM=	NetBSD-*-*

WRKSRC=		${WRKDIR}
NO_BUILD=	YES

INSTALLATION_DIRS=	${PKGMANDIR}/man8 sbin

do-extract:
	${CP} ${FILESDIR}/pkg_comp.sh ${WRKSRC}/
	${CP} ${FILESDIR}/pkg_comp.8 ${WRKSRC}/

SUBST_CLASSES+=		conf
SUBST_STAGE.conf=	do-configure
SUBST_FILES.conf=	pkg_comp.sh
SUBST_VARS.conf=	MAKE PKG_INFO_CMD PKG_ADD_CMD

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/pkg_comp.sh ${DESTDIR}${PREFIX}/sbin/pkg_comp
	${INSTALL_MAN} ${WRKSRC}/pkg_comp.8 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man8/pkg_comp.8

.include "../../mk/bsd.pkg.mk"
