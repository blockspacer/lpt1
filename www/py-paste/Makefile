# $NetBSD: Makefile,v 1.24 2019/12/03 17:27:53 adam Exp $

DISTNAME=	Paste-3.2.3
PKGNAME=	${PYPKGPREFIX}-${DISTNAME:tl}
CATEGORIES=	www python
MASTER_SITES=	${MASTER_SITE_PYPI:=P/Paste/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://pythonpaste.readthedocs.io/
COMMENT=	Middleware for Python WSGI applications
LICENSE=	mit

DEPENDS+=	${PYPKGPREFIX}-six>=1.4.0:../../lang/py-six
BUILD_DEPENDS+=	${PYPKGPREFIX}-test-runner-[0-9]*:../../devel/py-test-runner

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
