# $NetBSD: Makefile,v 1.37 2019/11/03 10:39:28 rillig Exp $

VERSION=	7.4.1
DISTNAME=	pcre-${VERSION}
PKGNAME=	pcre-ocaml-${VERSION}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=mmottl/}

MAINTAINER=	jaapb@NetBSD.org
HOMEPAGE=	https://github.com/mmottl/pcre-ocaml
COMMENT=	Perl compatible regular expressions for OCaml
LICENSE=	gnu-lgpl-v2.1

WRKSRC=	${WRKDIR}/pcre-ocaml-${VERSION}

OCAML_USE_DUNE=		yes
OPAM_INSTALL_FILES=	pcre
USE_TOOLS=		pax

.include "../../mk/bsd.prefs.mk"
.include "../../mk/ocaml.mk"

EGDIR=			${PREFIX}/share/examples/pcre-ocaml
INSTALLATION_DIRS+=	${EGDIR}
OCAML_FINDLIB_DIRS=	pcre

post-install:
	cd ${WRKSRC}/examples && pax -rw -pm . ${DESTDIR}${EGDIR}

.include "../../devel/ocaml-base/buildlink3.mk"
.include "../../devel/ocaml-configurator/buildlink3.mk"
.include "../../devel/ocaml-stdio/buildlink3.mk"
.include "../../devel/pcre/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
