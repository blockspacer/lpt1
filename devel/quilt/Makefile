# $NetBSD: Makefile,v 1.25 2019/11/03 10:39:29 rillig Exp $
#

DISTNAME=	quilt-0.66
PKGREVISION=	1
CATEGORIES=	devel scm
MASTER_SITES=	http://download.savannah.gnu.org/releases/quilt/

MAINTAINER=	jmmv@NetBSD.org
HOMEPAGE=	http://savannah.nongnu.org/projects/quilt
COMMENT=	Tools to manage series of patches

GNU_CONFIGURE=	yes
USE_TOOLS+=	bash:run gettext-tools gmake msgfmt perl:run gsed

.include "../../mk/bsd.prefs.mk"

.if ${OPSYS} == "Linux"
CONFIGURE_ARGS+=	--with-cp=${CP}
CONFIGURE_ARGS+=	--with-date=${DATE}
CONFIGURE_ARGS+=	--with-sed=${SED}
.  if exists(/usr/bin/patch)
CONFIGURE_ARGS+=	--with-patch=/usr/bin/patch
.  else
DEPENDS+=		patch>=2.4:../../devel/patch
CONFIGURE_ARGS+=	--with-patch=${PREFIX}/bin/gpatch
.  endif
.else
DEPENDS+=		coreutils-[0-9]*:../../sysutils/coreutils
DEPENDS+=		patch>=2.4:../../devel/patch

.  if ${OPSYS} == "OpenBSD"
DEPENDS+=		grep-[0-9]*:../../textproc/grep
CONFIGURE_ARGS+=	--with-grep=${PREFIX}/bin/ggrep
.  endif

CONFIGURE_ARGS+=	--with-cp=${PREFIX}/bin/gcp
CONFIGURE_ARGS+=	--with-date=${PREFIX}/bin/gdate
CONFIGURE_ARGS+=	--with-patch=${PREFIX}/bin/gpatch
CONFIGURE_ARGS+=	--with-sed=${PREFIX}/bin/gsed
.endif

CONFIGURE_ARGS+=	--with-sendmail=/usr/sbin/sendmail
CONFIGURE_ARGS+=	--without-rpmbuild
CONFIGURE_ARGS+=	--without-getopt

INSTALL_MAKE_FLAGS+=	BUILD_ROOT=${DESTDIR:Q} etcdir=${PREFIX}/share/examples/quilt

CONFIGURE_ARGS+=	--with-bash=${BASH}

SUBST_CLASSES+=		etc
SUBST_MESSAGE.etc=	Fixing path to configuration file.
SUBST_STAGE.etc=	pre-configure
SUBST_SED.etc=		-e 's,/etc/quilt,${PKG_SYSCONFDIR}/quilt,g'
SUBST_FILES.etc=	bin/* doc/* po/*

.include "../../mk/bsd.pkg.mk"
