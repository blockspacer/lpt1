# $NetBSD: Makefile,v 1.13 2019/11/04 22:10:11 rillig Exp $
#

.include "../../www/phraseanet/Makefile.common"

MODNAME=			phrasea2
PKGREVISION=			2
PECL_VERSION=			${VERS}
EXTRACT_ELEMENTS=		${DISTNAME}/bin/src/php_phrasea2
EXTRACT_SUFX=			.tar.gz
USE_LANGUAGES=			c c++

PHP_VERSIONS_ACCEPTED=	56

.include "../../lang/php/ext.mk"

# php/ext.mk trashes these, preventing the package from building,
# so set them back again afterwards. grr
DISTNAME=	phraseanet-v${VERS}-linux
DIST_SUBDIR=	#empty

# This seems to now be needed though it wasn't before...
WRKSRC=	${WRKDIR}/${DISTNAME}/bin/src/php_phrasea2

.include "../../mk/mysql.buildlink3.mk"
.include "../../devel/libuuid/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
