# $NetBSD: Makefile,v 1.18 2012/10/08 12:42:22 asau Exp $
#

DISTNAME=	NovaWM-0.8_alpha
PKGNAME=	novawm-0.8
PKGREVISION=	2
CATEGORIES=	wm
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=novawm/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://novawm.sourceforge.net/
COMMENT=	Nova window manager

GNU_CONFIGURE=	YES
USE_LANGUAGES=	c c++
USE_TOOLS+=	gmake

post-extract:
	chmod u+w ${WRKSRC}/.xvpics
	chmod u+w ${WRKSRC}/novawm_dmgr/xpm/.xvpics
	chmod u+w ${WRKSRC}/src/xpm/.xvpics

.include "../../x11/libXpm/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
