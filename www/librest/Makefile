# $NetBSD: Makefile,v 1.33 2019/11/04 22:09:56 rillig Exp $

DISTNAME=	librest-0.6
PKGREVISION=	28
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_GITHUB:=GNOME/librest/archive/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/GNOME/librest/
COMMENT=	Library for "RESTful" web services
LICENSE=	gnu-gpl-v2

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_TOOLS+=	pkg-config autoconf automake
WRKSRC=		${WRKDIR}/${PKGBASE}-${DISTNAME}

PKGCONFIG_OVERRIDE+=	rest.pc.in gtk-doc.pc.in

pre-configure:
	(cd ${WRKSRC}; ./autogen.sh)

.include "../../devel/glib2/buildlink3.mk"
.include "../../textproc/gtk-doc/buildlink3.mk"
.include "../../net/libsoup/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
