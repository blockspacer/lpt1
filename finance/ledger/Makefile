# $NetBSD: Makefile,v 1.15 2019/08/22 12:23:06 ryoon Exp $

DISTNAME=	ledger-3.1.3
PKGREVISION=	3
CATEGORIES=	finance
MASTER_SITES=	${MASTER_SITE_GITHUB:=ledger/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	base@atomicules.co.uk
HOMEPAGE=	https://ledger-cli.org/
COMMENT=	Double-entry accounting system for command-line
LICENSE=	modified-bsd

USE_CMAKE=	yes
USE_LANGUAGES=	c++ c
GCC_REQD+=	4.8

CMAKE_ARGS+=	-DUSE_PYTHON27_COMPONENT=ON

.include "options.mk"

REPLACE_PYTHON+=	contrib/getquote-uk.py acprep python/demo.py
REPLACE_PYTHON+=	test/DocTests.py test/LedgerHarness.py
REPLACE_PYTHON+=	test/convert.py test/RegressTests.py test/convert.py
REPLACE_PYTHON+=	tools/genuuid

.include "../../devel/boost-headers/buildlink3.mk"
.include "../../devel/boost-libs/buildlink3.mk"
.include "../../devel/editline/buildlink3.mk"
.include "../../devel/gmp/buildlink3.mk"
.include "../../lang/python/tool.mk"
.include "../../math/mpfr/buildlink3.mk"
.include "../../lang/python/application.mk"
.include "../../mk/bsd.pkg.mk"
