# $NetBSD: Makefile,v 1.16 2019/07/21 22:25:09 wiz Exp $

DISTNAME=	ibus-kkc-1.5.22
PKGREVISION=	9
CATEGORIES=	inputmethod japanese
MASTER_SITES=	https://github.com/ueno/ibus-kkc/releases/download/v${PKGVERSION_NOREV}/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/ueno/ibus-kkc
COMMENT=	Japanese KKC input method for ibus
LICENSE=	gnu-gpl-v2

DEPENDS+=	skk-jisyo-[0-9]*:../../inputmethod/skk-jisyo
DEPENDS+=	libkkc-data-[0-9]*:../../misc/libkkc-data

GNU_CONFIGURE=		yes
USE_LIBTOOL=		yes
USE_LANGUAGES=		c c++
USE_PKGLOCALEDIR=	yes
USE_TOOLS+=		gmake intltool msgfmt pkg-config

CONFIGURE_ARGS+=	--with-skkdic=${LOCALBASE}/share/skk

.include "../../converters/libkkc/buildlink3.mk"
.include "../../inputmethod/ibus/buildlink3.mk"
.include "../../x11/gtk3/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
