# $NetBSD: Makefile,v 1.168 2019/11/27 22:32:27 adam Exp $

.include "Makefile.common"

COMMENT=	Cross platform make

USE_TOOLS+=		gmake
GCC_REQD+=		4.8
HAS_CONFIGURE=		yes
CONFIGURE_SCRIPT=	bootstrap

BUILD_TARGET=		default_target

CONFIGURE_HAS_MANDIR=	no
CONFIGURE_ARGS+=	--mandir=/${PKGMANDIR}
CONFIGURE_ARGS+=	--docdir=/share/doc/cmake-${CMAKE_API}
CONFIGURE_ARGS+=	--parallel=${MAKE_JOBS:U1}
CONFIGURE_ARGS+=	--prefix=${PREFIX}
CONFIGURE_ARGS+=	--system-libs
# jsoncpp requires cmake to build, so use the one provided with cmake
CONFIGURE_ARGS+=	--no-system-jsoncpp

LDFLAGS.Darwin+=	-framework CoreServices # for LSOpenCFURLRef()
LDFLAGS.SunOS+=		-lsocket -lnsl

PLIST_SUBST+=		CMAKE_API=${CMAKE_API}

# for Source/cmDependsJavaParser.cxx
UNLIMIT_RESOURCES=	datasize

# as of 2.4.6, x11 and fortran tests fail in pkgsrc
TEST_TARGET=		test

SUBST_CLASSES+=		cmake
SUBST_STAGE.cmake=	pre-configure
SUBST_MESSAGE.cmake=	Fixing LOCALBASE and X11 paths.
SUBST_FILES.cmake+=	Modules/FindX11.cmake
SUBST_FILES.cmake+=	Modules/Platform/UnixPaths.cmake
SUBST_VARS.cmake=	LOCALBASE X11BASE

pre-configure:
	${CP} ${FILESDIR}/Source_Checks_cm_cxx_cbegin.cxx ${WRKSRC}/Source/Checks/cm_cxx_cbegin.cxx
	${CP} ${FILESDIR}/Source_Checks_cm_cxx_cend.cxx ${WRKSRC}/Source/Checks/cm_cxx_cend.cxx
	${CP} ${FILESDIR}/Source_Checks_cm_cxx_size_t.cxx ${WRKSRC}/Source/Checks/cm_cxx_size_t.cxx
	${RM} -f ${WRKSRC}/Modules/*.orig ${WRKSRC}/Modules/Compiler/*.orig ${WRKSRC}/Modules/Platform/*.orig
	${LN} -f ${WRKSRC}/Modules/Platform/OpenBSD.cmake ${WRKSRC}/Modules/Platform/MirBSD.cmake
.for lang in C CXX Fortran
	${LN} -f ${WRKSRC}/Modules/Platform/SunOS-GNU-${lang}.cmake \
	    ${WRKSRC}/Modules/Platform/SunOS-Clang-${lang}.cmake
.endfor

USE_CURSES=		wsyncup

BUILDLINK_API_DEPENDS.libarchive+=	libarchive>=3.3.3
.include "../../archivers/libarchive/buildlink3.mk"
.include "../../devel/libexecinfo/buildlink3.mk"
BUILDLINK_AUTO_DIRS.libuv=	rpath
.include "../../devel/libuv/buildlink3.mk"
.include "../../misc/rhash/buildlink3.mk"
.include "../../textproc/expat/buildlink3.mk"
.include "../../www/curl/buildlink3.mk"
.include "../../mk/curses.buildlink3.mk"

.if !exists(${BUILDLINK_INCDIRS.curses}/form.h) && \
     exists(${BUILDLINK_INCDIRS.curses}/ncurses/form.h)
CFLAGS+=	-I${BUILDLINK_INCDIRS.curses}/ncurses
CXXFLAGS+=	-I${BUILDLINK_INCDIRS.curses}/ncurses
.endif

.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
