# $NetBSD: Makefile,v 1.18 2019/11/04 21:12:55 rillig Exp $
#

DISTNAME=		tpm-1.1b
PKGNAME=		${DISTNAME:S/tpm/libtcpa/}
PKGREVISION=		7
CATEGORIES=		security
MASTER_SITES=		${HOMEPAGE}
DISTFILES=		${DISTNAME}${EXTRACT_SUFX} tcpa_man_20031210.tgz

MAINTAINER=		schmonz@NetBSD.org
HOMEPAGE=		http://www.research.ibm.com/gsal/tcpa/
COMMENT=		TCPA libraries and test programs from IBM

WRKSRC=			${WRKDIR}/TPM

SITES.tcpa_man_20031210.tgz=	http://www.citi.umich.edu/u/rwash/projects/trusted/

BUILD_DIRS=		libtcpa examples
INSTALLATION_DIRS=	bin lib ${PKGMANDIR}/man3 share/doc/${PKGBASE}

do-install:
	${INSTALL_DATA} ${WRKSRC}/libtcpa/libtcpa.a ${DESTDIR}${PREFIX}/lib
	for f in tcpa_demo takeown createkey loadkey evictkey signfile	\
		verifyfile sealfile unsealfile; do			\
		${INSTALL_PROGRAM} ${WRKSRC}/examples/$${f} ${DESTDIR}${PREFIX}/bin; \
	done
	for f in ${WRKDIR}/tcpa_man/*.3; do			\
		${INSTALL_MAN} $${f} ${DESTDIR}${PREFIX}/${PKGMANDIR}/man3;	\
	done
	${INSTALL_DATA} ${WRKSRC}/libtcpa/License ${DESTDIR}${PREFIX}/share/doc/${PKGBASE}
	${INSTALL_DATA} ${WRKSRC}/README ${DESTDIR}${PREFIX}/share/doc/${PKGBASE}

BUILDLINK_API_DEPENDS.openssl+=	openssl<1.1
BUILDLINK_ABI_DEPENDS.openssl+=	openssl<1.1
.include "../../security/openssl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
