# $NetBSD: Makefile,v 1.64 2018/02/25 12:25:48 taca Exp $
#

DISTNAME=	groonga-9.1.1
CATEGORIES=	textproc
MASTER_SITES=	http://packages.groonga.org/source/groonga/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://groonga.org/
COMMENT=	Fulltext search engine and column store
LICENSE=	gnu-lgpl-v2.1

GNU_CONFIGURE=	yes
USE_LANGUAGES=	c c++
USE_LIBTOOL=	yes
USE_TOOLS+=	gmake pkg-config

EXTRACT_USING=	bsdtar

.include "options.mk"

CONFIGURE_ARGS+=	--sysconfdir=${PKG_SYSCONFBASEDIR}
CONFIGURE_ARGS+=	--localstatedir=${VARBASE}
CONFIGURE_ARGS+=	--with-onigmo=system

PKGCONFIG_OVERRIDE+=	groonga.pc.in

PKG_SYSCONFSUBDIR=	${PKGBASE}

BUILD_DEFS+=		VARBASE

EXAMPLE_CONF_DIR=	share/examples/${PKGBASE}

INSTALL_MAKE_FLAGS+=	sysconfdir=${PREFIX}/share/examples

CONF_FILES+=		${EXAMPLE_CONF_DIR}/groonga.conf \
			${PKG_SYSCONFDIR}/groonga.conf
CONF_FILES+=		${EXAMPLE_CONF_DIR}/synonyms.tsv \
			${PKG_SYSCONFDIR}/synonyms.tsv

OWN_DIRS+=		${VARBASE}/log/${PKGBASE}

CHECK_WRKREF_SKIP+=		bin/groonga
CHECK_INTERPRETER_SKIP+=	share/groonga/examples/*
CHECK_PORTABILITY_SKIP+=	vendor/ngx_mruby-source/update-devkit-subtree
CHECK_PORTABILITY_SKIP+=	vendor/ngx_mruby-source/update-mruby-subtree

.include "../../devel/editline/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
.include "../../textproc/onigmo/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
