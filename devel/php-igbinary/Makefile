# $NetBSD: Makefile,v 1.4 2016/09/11 17:03:25 taca Exp $

MODNAME=	igbinary
PECL_VERSION=	1.2.1
CATEGORIES=	devel

MAINTAINER=	mbowie@buzmo.com
HOMEPAGE=	https://github.com/igbinary/igbinary
COMMENT=	Binary serialization for PHP
LICENSE=	modified-bsd

BUILD_DEPENDS+=	re2c>=0.13.0.4:../../devel/re2c

PHP_VERSIONS_ACCEPTED=	56

USE_LANGUAGES=		c c++
USE_TOOLS+=		gsed
CONFIGURE_ARGS+=	--enable-${MODNAME}
USE_LIBTOOL=		yes

.include "../../lang/php/ext.mk"
.include "../../mk/bsd.pkg.mk"
