# $NetBSD: cmake.mk,v 1.17 2019/09/02 02:23:03 rillig Exp $
#
# This file handles packages that use CMake as their primary build
# system. For more information about CMake, see http://www.cmake.org/.
#
# Package-settable variables:
#
# CMAKE_DEPENDENCIES_REWRITE
#	A list of files (XXX: variable name) relative to WRKSRC in
#	which, after configuring the package, buildlink3 dependencies
#	are resolved to the real ones.
#
# CMAKE_MODULE_PATH_OVERRIDE
#	A list of files relative to WRKSRC in which the CMAKE_MODULE_PATH
#	variable is adjusted to include the path from the pkgsrc wrappers.
#	The file ${WRKSRC}/CMakeLists.txt is always appended to this list.
#
# CMAKE_PKGSRC_BUILD_FLAGS
#	If set to yes, disable compiler optimization flags associated
#	with the CMAKE_BUILD_TYPE setting (for pkgsrc these come in from
#	the user via variables like CFLAGS).  The default is yes, but you can
#	set it to no for pkgsrc packages that do not use a compiler to avoid
#	cmake "Manually-specified variables were not used by the project"
#	warnings associated with this variable.
#
# CMAKE_PREFIX_PATH
#	A list of directories to add the CMAKE_PREFIX_PATH cmake variable.
#	If a package installs its contents in ${PREFIX}/package instead of
#	${PREFIX} and it installs cmake modules there 
#	"CMAKE_PREFIX_PATH += ${PREFIX}/package" should be in its 
#	buildlink3.mk so that packages that depend on it can find its 
#	cmake modules if they use cmake to build.
#
# CMAKE_USE_GNU_INSTALL_DIRS
#	If set to yes, set GNU standard installation directories with pkgsrc
#	configured settings.  The default is yes.
#
# CMAKE_INSTALL_PREFIX
#	Destination directory to install software. The default is ${PREFIX}.
#

_CMAKE_DIR=	${BUILDLINK_DIR}/share/cmake/Modules

CMAKE_USE_GNU_INSTALL_DIRS?=	yes

CMAKE_INSTALL_PREFIX?=	${PREFIX}

CMAKE_ARGS+=	-DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_INSTALL_PREFIX}
.if empty(CMAKE_PKGSRC_BUILD_FLAGS:M[nN][oO])
CMAKE_ARGS+=    -DCMAKE_PKGSRC_BUILD_FLAGS:BOOL=TRUE
.endif
.if ${OPSYS} != "Darwin"
CMAKE_ARGS+=	-DCMAKE_NO_BUILTIN_CHRPATH:BOOL=YES
.else
CMAKE_ARGS+=	-DCMAKE_SKIP_RPATH:BOOL=FALSE
CMAKE_ARGS+=	-DCMAKE_INSTALL_NAME_DIR:PATH=${PREFIX}/lib
.endif
.if defined(CMAKE_USE_GNU_INSTALL_DIRS) && empty(CMAKE_USE_GNU_INSTALL_DIRS:M[nN][oO])
CMAKE_ARGS+=	-DCMAKE_INSTALL_LIBDIR:PATH=lib
CMAKE_ARGS+=	-DCMAKE_INSTALL_MANDIR:PATH=${PKGMANDIR}
.  if defined(INFO_FILES)
CMAKE_ARGS+=	-DCMAKE_INSTALL_INFODIR:PATH=${PKGINFODIR}
.  endif
.  if defined(USE_PKGLOCALEDIR) && empty(USE_PKGLOCALEDIR:M[nN][oO])
CMAKE_ARGS+=	-DCMAKE_INSTALL_LOCALEDIR:PATH=${PKGLOCALEDIR}/locale
.  endif
.endif

.if defined(CMAKE_PREFIX_PATH)
CMAKE_ARGS+=-DCMAKE_PREFIX_PATH:PATH=${CMAKE_PREFIX_PATH:ts;:Q}
.endif

CMAKE_ARGS+=	-DCMAKE_FIND_ROOT_PATH:PATH=${BUILDLINK_BASEDIR:Q}
CMAKE_ARGS+=	-DPKGSRC_BUILDLINK_BASEDIR:PATH=${BUILDLINK_BASEDIR:Q}

### The cmake function export_library_dependencies() writes out
### library dependency info to a file and this may contain buildlink
### paths.
### cmake-dependencies-rewrite modifies any such files, listed in
### ${CMAKE_DEPENDENCIES_REWRITE} (relative to ${WRKSRC}) to have the
### real dependencies
###

do-configure-post-hook: __cmake-dependencies-rewrite
__cmake-dependencies-rewrite: .PHONY
	@${STEP_MSG} "Rewrite cmake Dependencies files"
.if defined(CMAKE_DEPENDENCIES_REWRITE) && !empty(CMAKE_DEPENDENCIES_REWRITE)
	${RUN} \
	cd ${WRKSRC};							\
	for file in ${CMAKE_DEPENDENCIES_REWRITE}; do			\
		${TEST} -f "$$file" || continue;			\
		${AWK} -f ${PKGSRCDIR}/mk/configure/cmake-rewrite.awk ${BUILDLINK_DIR} $$file > $$file.override; \
		${MV} -f $$file.override $$file;			\
	done
.endif

### simple unwrapp function for CMake
### XXX: need to implement full unwrap same as in wrapper/bsd.wrapper.mk

SUBST_CLASSES+=			_unwrap-cmake
SUBST_STAGE._unwrap-cmake=	post-build
SUBST_MESSAGE._unwrap-cmake=	Unwrapping CMake files to be installed
SUBST_FILES._unwrap-cmake=	${UNWRAP_CMAKE_FILES}
SUBST_SED._unwrap-cmake=	-e 's,${BUILDLINK_BASEDIR},,g'
