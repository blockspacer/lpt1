# $NetBSD: Makefile,v 1.6 2019/09/26 10:36:33 prlw1 Exp $

.include "../../devel/py-gobject3/Makefile.common"

PKGNAME=	py-${DISTNAME:S/^py//:S/-/3-common-/}
PKGREVISION=	1

COMMENT=	Python version independent files for glib2 gobject bindings

SUBST_CLASSES+=			configurepc
SUBST_STAGE.configurepc=	do-configure
SUBST_MESSAGE.configurepc=	Create .pc file
SUBST_FILES.configurepc=	pygobject-3.0.pc.in
SUBST_SED.configurepc=		-e 's,@prefix@,${PREFIX},'
SUBST_SED.configurepc+=		-e 's,@exec_prefix@,$${prefix},'
SUBST_SED.configurepc+=		-e 's,@includedir@,$${prefix}/include,'
SUBST_SED.configurepc+=		-e 's,@datarootdir@,$${prefix}/share,'
SUBST_SED.configurepc+=		-e 's,@datadir@,$${datarootdir},'
SUBST_SED.configurepc+=		-e 's,@VERSION@,${PKGVERSION_NOREV},'

INSTALLATION_DIRS+=	include/pygobject-3.0 lib/pkgconfig

do-build:

do-install:
	${INSTALL_DATA} ${WRKSRC}/gi/pygobject.h \
		${DESTDIR}${PREFIX}/include/pygobject-3.0/pygobject.h
	${INSTALL_DATA} ${WRKSRC}/pygobject-3.0.pc.in \
		${DESTDIR}${PREFIX}/lib/pkgconfig/pygobject-3.0.pc

.include "../../mk/bsd.pkg.mk"
