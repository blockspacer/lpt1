# $NetBSD: Makefile,v 1.41 2019/07/21 22:25:09 wiz Exp $
#

DISTNAME=	ibus-input-pad-1.4.2
PKGREVISION=	12
CATEGORIES=	inputmethod
MASTER_SITES=	https://github.com/fujiwarat/ibus-input-pad/releases/download/${PKGVERSION_NOREV}/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/fujiwarat/input-pad/wiki
COMMENT=	Input Pad for IBus
LICENSE=	gnu-gpl-v2

GNU_CONFIGURE=		yes
USE_LIBTOOL=		yes
USE_PKGLOCALEDIR=	yes
USE_TOOLS+=		gmake pkg-config intltool msgfmt xgettext msgmerge

CONFIGURE_ARGS+=	--disable-maintainer-mode

.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
.include "../../inputmethod/ibus/buildlink3.mk"
.include "../../inputmethod/input-pad/buildlink3.mk"
.include "../../x11/gtk3/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
