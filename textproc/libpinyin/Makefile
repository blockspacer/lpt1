# $NetBSD: Makefile,v 1.6 2016/02/26 12:17:18 jperkin Exp $

DISTNAME=	libpinyin-2.3.0
CATEGORIES=	textproc chinese
MASTER_SITES=	https://github.com/libpinyin/libpinyin/releases/download/${PKGVERSION_NOREV}/ \
		${MASTER_SITE_SOURCEFORGE:=libpinyin/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/libpinyin/libpinyin/
COMMENT=	Library to deal with pinyin
LICENSE=	gnu-gpl-v3

GNU_CONFIGURE=	yes
USE_TOOLS+=	gmake pkg-config
USE_LANGUAGES=	c99 c++11
USE_LIBTOOL=	yes

PKGCONFIG_OVERRIDE+=	libpinyin.pc.in

BUILDLINK_TRANSFORM.Darwin+=	rm:-Wl,--version-script=./libpinyin.ver
BUILDLINK_TRANSFORM.SunOS+=	rm:-Wl,--version-script=./libpinyin.ver

.include "options.mk"

TEST_TARGET=	check

.include "../../devel/glib2/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
