# $NetBSD: Makefile,v 1.38 2019/11/02 22:56:54 rillig Exp $

DISTNAME=	kasumi-2.5
PKGREVISION=	28
CATEGORIES=	inputmethod japanese
MASTER_SITES=	${MASTER_SITE_OSDN:=kasumi/41436/}

MAINTAINER=	pkgsrc-users@NetBSD.org
#HOMEPAGE=	http://kasumi.osdn.jp/
COMMENT=	Dictionary management tool for anthy
LICENSE=	gnu-gpl-v2

USE_TOOLS+=		pkg-config
USE_X11=		yes
USE_PKGLOCALEDIR=	yes
GNU_CONFIGURE=		yes
USE_LANGUAGES=		c c++

BUILDLINK_API_DEPENDS.gtk2+=	gtk2+>=2.6

.include "../../inputmethod/anthy/buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../converters/libiconv/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
