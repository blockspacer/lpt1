# $NetBSD: Makefile,v 1.68 2019/11/06 14:34:31 wiz Exp $

PKGREVISION= 1
.include "Makefile.common"

COMMENT=	Intelligent Input Bus

DEPENDS+=	${PYPKGPREFIX}-gobject3-[0-9]*:../../devel/py-gobject3
BUILD_DEPENDS+=	cldr-emoji-annotation>=35.12.14971.0:../../textproc/cldr-emoji-annotation
BUILD_DEPENDS+=	unicode-character-database>=12.0.0:../../textproc/unicode-character-database
BUILD_DEPENDS+=	unicode-emoji>=12.0:../../textproc/unicode-emoji

GNU_CONFIGURE=			yes
USE_LIBTOOL=			yes
USE_TOOLS+=			pkg-config intltool msgfmt gmake msgmsrge
USE_LANGUAGES=			c c++
USE_PKGLOCALEDIR=		yes

GETTEXT_TOOLS_REQD=	0.19.7

GCONF_SCHEMAS+=		ibus.schemas
PKGCONFIG_OVERRIDE+=	ibus-1.0.pc.in

CONFIGURE_ARGS+=	--sysconfdir=${PKG_SYSCONFBASEDIR}
CONFIGURE_ARGS+=	--localedir=${PREFIX}/${PKGLOCALEDIR}/locale
CONFIGURE_ARGS+=	--enable-dconf
CONFIGURE_ARGS+=	--enable-gtk2
CONFIGURE_ARGS+=	--enable-gtk3
CONFIGURE_ARGS+=	--enable-surrounding-text
CONFIGURE_ARGS+=	--enable-introspection=yes
CONFIGURE_ARGS+=	--with-python=${PYTHONBIN}
CONFIGURE_ARGS+=	--with-unicode-emoji-dir=${PREFIX}/share/unicode/emoji
CONFIGURE_ARGS+=	--with-emoji-annotation-dir=${PREFIX}/share/unicode/cldr/common/annotations
CONFIGURE_ARGS+=	--with-ucd-dir=${PREFIX}/share/unicode/ucd

SUBST_CLASSES+=		dbus
SUBST_STAGE.dbus=	post-configure
SUBST_FILES.dbus=	src/ibusshare.c
SUBST_SED.dbus=		-e 's,/var/lib/dbus/machine-id,${VARBASE}/db/dbus/machine-id,g'

BUILD_DEFS+=	PKG_SYSCONFBASE VARBASE
MANCOMPRESSED=	yes

INSTALL_MAKE_FLAGS+=	sysconfdir=${PREFIX}/share/examples/ibus
MAKE_DIRS+=		${PKG_SYSCONFDIR}/dconf/db/ibus.d
MAKE_DIRS+=		${PKG_SYSCONFDIR}/dconf/profile
CONF_FILES+=		${PREFIX}/share/examples/ibus/dconf/db/ibus.d/00-upstream-settings \
			${PKG_SYSCONFDIR}/dconf/db/ibus.d/00-upstream-settings
CONF_FILES+=		${PREFIX}/share/examples/ibus/dconf/profile/ibus \
			${PKG_SYSCONFDIR}/dconf/profile/ibus

.include "../../mk/compiler.mk"
.if !empty(CC_VERSION:Mgcc-4.1.[0-9]*)
BUILDLINK_TRANSFORM+=	rm:-Wno-unused-but-set-variable
.endif

.include "../../devel/glib2/schemas.mk"
.include "../../devel/dconf/database.mk"
.include "../../devel/dconf/buildlink3.mk"
BUILDLINK_API_DEPENDS.gobject-introspection+=	gobject-introspection>=0.9.6
BUILDLINK_DEPMETHOD.gobject-introspection+=	build
.include "../../devel/gobject-introspection/buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
BUILDLINK_API_DEPENDS.glib2+=		glib2>=2.26.0
.include "../../devel/glib2/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
BUILDLINK_DEPMETHOD.vala+=	build
.include "../../lang/vala/buildlink3.mk"
PY_PATCHPLIST=	yes
.include "../../sysutils/dbus/buildlink3.mk"
.include "../../sysutils/libnotify/buildlink3.mk"
.include "../../textproc/iso-codes/buildlink3.mk"
GTK2_IMMODULES=	yes
.include "../../x11/gtk2/modules.mk"
.include "../../x11/gtk2/buildlink3.mk"
GTK3_IMMODULES=	yes
.include "../../x11/gtk3/modules.mk"
.include "../../x11/gtk3/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
.include "../../lang/python/application.mk"
.include "../../lang/python/extension.mk"
.include "../../mk/bsd.pkg.mk"
