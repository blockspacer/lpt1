# $NetBSD: Makefile,v 1.30 2019/09/02 13:19:54 adam Exp $

PKGNAME=		libpreludedb-python-${VERSION}
PKGREVISION=		18
COMMENT=		Python bindings for LibPreludeDB libraries

.include "../../security/libpreludedb/Makefile.common"

CONFIGURE_ARGS+=	--with-perl=no
CONFIGURE_ARGS+=	--with-mysql=no
CONFIGURE_ARGS+=	--with-postgresql=no
CONFIGURE_ARGS+=	--with-sqlite3=no

PY_PATCHPLIST=		yes
BUILD_DIRS=		bindings

PYTHON_VERSIONS_ACCEPTED=	27 # not yet ported as of 0.9.24.1

.include "../../lang/python/extension.mk"
.include "../../security/libpreludedb/buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
