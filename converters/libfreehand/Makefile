# $NetBSD: Makefile,v 1.32 2019/08/22 12:22:55 ryoon Exp $

DISTNAME=	libfreehand-0.1.1
PKGREVISION=	24
CATEGORIES=	converters
MASTER_SITES=	http://dev-www.libreoffice.org/src/
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	ryoon@NetBSD.org
HOMEPAGE=	http://dev-www.libreoffice.org/src/
COMMENT=	Library for Adobe/Macromedia drawings
LICENSE=	mpl-2.0

TOOL_DEPENDS+=	gperf-[0-9]*:../../devel/gperf

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_TOOLS+=	perl:build pkg-config
USE_LANGUAGES=	c c++

CONFIGURE_ARGS+=	--without-docs
.include "../../mk/compiler.mk"
.if !empty(PKGSRC_COMPILER:Mclang)
CXXFLAGS+=	-Wno-error=deprecated-register
.endif

PKGCONFIG_OVERRIDE+=	libfreehand.pc.in

.include "../../converters/libwpd/buildlink3.mk"
.include "../../converters/libwpg/buildlink3.mk"
.include "../../converters/librevenge/buildlink3.mk"
.include "../../graphics/lcms2/buildlink3.mk"
.include "../../textproc/icu/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
