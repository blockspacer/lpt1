# $NetBSD: Makefile.php,v 1.7 2019/03/31 20:48:18 wiz Exp $
# used by lang/php56/Makefile
# used by www/ap-php/Makefile
# used by www/php-fpm/Makefile

.include "../../lang/php56/Makefile.common"

DISTINFO_FILE=	${.CURDIR}/../../lang/php56/distinfo
PATCHDIR=	${.CURDIR}/../../lang/php56/patches

USE_LIBTOOL=		YES
USE_LANGUAGES=		c c++
GNU_CONFIGURE=		YES
BUILD_DEFS+=		VARBASE
PLIST_VARS+=		dtrace

CONFIGURE_ENV+=		EXTENSION_DIR="${PREFIX}/${PHP_EXTENSION_DIR}"

.include "../../mk/bsd.prefs.mk"

CONFIGURE_ARGS+=	--with-config-file-path=${PKG_SYSCONFDIR}
CONFIGURE_ARGS+=	--with-config-file-scan-dir=${PKG_SYSCONFDIR}/php.d
CONFIGURE_ARGS+=	--sysconfdir=${PKG_SYSCONFDIR}
CONFIGURE_ARGS+=	--localstatedir=${VARBASE}

CONFIGURE_ARGS+=	--with-regex=system

CONFIGURE_ARGS+=	--without-mysql
CONFIGURE_ARGS+=	--without-iconv
CONFIGURE_ARGS+=	--without-pear
CONFIGURE_ARGS+=	--without-sqlite3
#CONFIGURE_ARGS+=	--without-intl

CONFIGURE_ARGS+=	--disable-posix
CONFIGURE_ARGS+=	--disable-opcache
CONFIGURE_ARGS+=	--disable-pdo
CONFIGURE_ARGS+=	--disable-json

CONFIGURE_ARGS+=	--enable-cgi
CONFIGURE_ARGS+=	--enable-mysqlnd
CONFIGURE_ARGS+=	--enable-xml
CONFIGURE_ARGS+=	--with-libxml-dir=${PREFIX}
.include "../../textproc/libxml2/buildlink3.mk"

PKG_OPTIONS_VAR=	PKG_OPTIONS.${PHP_PKG_PREFIX}
PKG_SUPPORTED_OPTIONS+=	inet6 ssl maintainer-zts readline disable-filter-url
PKG_SUGGESTED_OPTIONS+=	inet6 ssl

.if ${OPSYS} == "SunOS" || ${OPSYS} == "Darwin" || ${OPSYS} == "FreeBSD"
PKG_SUPPORTED_OPTIONS+=	dtrace
.endif

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Minet6)
CONFIGURE_ARGS+=	--enable-ipv6
.else
CONFIGURE_ARGS+=	--disable-ipv6
.endif

.if !empty(PKG_OPTIONS:Mssl)
.  include "../../security/openssl/buildlink3.mk"
.  if ${OPSYS} == "SunOS"
CONFIGURE_ARGS+=	--with-openssl=yes
LIBS.SunOS+=		-lcrypto
.  else
CONFIGURE_ARGS+=	--with-openssl=${BUILDLINK_PREFIX.openssl}
.  endif
PATCH_SITES+=		http://zettasystem.com/
PATCHFILES+=		PHP-5.6.31-OpenSSL-1.1.0-compatibility-20170801.patch
PATCH_DIST_STRIP=	-p1
.else
CONFIGURE_ARGS+=	--without-openssl
.endif

.if !empty(PKG_OPTIONS:Mmaintainer-zts)
CONFIGURE_ARGS+=	--enable-maintainer-zts
.endif

.if !empty(PKG_OPTIONS:Mreadline)
USE_GNU_READLINE=	yes
.include "../../mk/readline.buildlink3.mk"
CONFIGURE_ARGS.readline+=	--with-readline=${BUILDLINK_PREFIX.readline}
CONFIGURE_ARGS.readlinke+=	--without-libedit
CONFIGURE_ENV.readline+=	READLINE_DIR=${BUILDLINK_DIR}
CONFIGURE_ARGS.editline+=	--with-libedit=${BUILDLINK_PREFIX.editline}
CONFIGURE_ARGS.editline+=	--without-readline
CONFIGURE_ENV.editline+=	LIBEDIT_DIR=${BUILDLINK_DIR}
CONFIGURE_ARGS+=	${CONFIGURE_ARGS.${READLINE_TYPE}}
CONFIGURE_ENV+=		${CONFIGURE_ENV.${READLINE_TYPE}}
.else
CONFIGURE_ARGS+=	--without-readline
CONFIGURE_ARGS+=	--without-libedit
.endif

.if !empty(PKG_OPTIONS:Mdtrace)
PLIST.dtrace=		yes
CONFIGURE_ARGS+=	--enable-dtrace

# See https://bugs.php.net/bug.php?id=61268
INSTALL_MAKE_FLAGS+=	-r
.endif

.if !empty(PKG_OPTIONS:Mdisable-filter-url)
CFLAGS+=		-DDISABLE_FILTER_URL
.endif

DL_AUTO_VARS=		yes
.include "../../mk/dlopen.buildlink3.mk"
