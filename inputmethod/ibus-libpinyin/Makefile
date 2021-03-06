# $NetBSD: Makefile,v 1.17 2019/12/28 12:32:09 wiz Exp $

DISTNAME=	ibus-libpinyin-1.11.1
CATEGORIES=	inputmethod chinese
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=libpinyin/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/libpinyin/ibus-libpinyin/
COMMENT=	Intelligent Pinyin engine based on libpinyin for IBus
LICENSE=	gnu-gpl-v2

GNU_CONFIGURE=	yes
USE_TOOLS+=	gmake msgfmt pkg-config
USE_LANGUAGES=	c c++
USE_LIBTOOL=	yes

GETTEXT_TOOLS_REQD=	0.19.7

.include "options.mk"

.include "../../mk/bsd.prefs.mk"
.include "../../mk/compiler.mk"

.if (!empty(PKGSRC_COMPILER:Mgcc) && (empty(CC_VERSION:Mgcc-[0-3].*) && empty(CC_VERSION:Mgcc-4.[0-3].*))) || !empty(PKGSRC_COMPILER:Mclang)
CONFIGURE_ARGS+=	--disable-boost
.else
CONFIGURE_ARGS+=	--enable-boost
CONFIGURE_ARGS+=	--with-boost=${BUILDLINK_PREFIX.boost-headers}
.include "../../devel/boost-headers/buildlink3.mk"
.endif

.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../databases/sqlite3/buildlink3.mk"
.include "../../inputmethod/ibus/buildlink3.mk"
.include "../../textproc/libpinyin/buildlink3.mk"
.include "../../x11/gtk3/buildlink3.mk"
.include "../../lang/python/application.mk"
.include "../../devel/glib2/schemas.mk"
.include "../../mk/bsd.pkg.mk"
