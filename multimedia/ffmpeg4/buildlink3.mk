# $NetBSD: buildlink3.mk,v 1.4 2019/08/06 07:51:33 adam Exp $

BUILDLINK_TREE+=	ffmpeg4

.if !defined(FFMPEG4_BUILDLINK3_MK)
FFMPEG4_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.ffmpeg4+=	ffmpeg4>=4.0
BUILDLINK_ABI_DEPENDS.ffmpeg4+=	ffmpeg4>=4.2
BUILDLINK_PKGSRCDIR.ffmpeg4?=	../../multimedia/ffmpeg4

pkgbase := ffmpeg4
.include "../../mk/pkg-build-options.mk"

.include "../../mk/bsd.fast.prefs.mk"

.if !empty(PKG_BUILD_OPTIONS.ffmpeg4:Mav1)
.  include "../../multimedia/libaom/buildlink3.mk"
.endif

.if !empty(PKG_BUILD_OPTIONS.ffmpeg4:Mfreetype)
.  include "../../graphics/freetype2/buildlink3.mk"
.endif

.if !empty(PKG_BUILD_OPTIONS.ffmpeg4:Mfontconfig)
.  include "../../fonts/fontconfig/buildlink3.mk"
.endif

.if !empty(PKG_BUILD_OPTIONS.ffmpeg4:Mtheora)
.  include "../../multimedia/libtheora/buildlink3.mk"
.endif

.if !empty(PKG_BUILD_OPTIONS.ffmpeg4:Mxvid)
.  include "../../multimedia/xvidcore/buildlink3.mk"
.endif

.if !empty(PKG_BUILD_OPTIONS.ffmpeg4:Mx264)
.  include "../../multimedia/x264-devel/buildlink3.mk"
.endif

.if !empty(PKG_BUILD_OPTIONS.ffmpeg4:Mlibvpx)
.  include "../../multimedia/libvpx/buildlink3.mk"
.endif

.if !empty(PKG_BUILD_OPTIONS.ffmpeg4:Mvaapi)
.  include "../../multimedia/libva/buildlink3.mk"
.endif

.if !empty(PKG_BUILD_OPTIONS.ffmpeg4:Mvdpau)
.  include "../../multimedia/libvdpau/buildlink3.mk"
.endif

BUILDLINK_INCDIRS.ffmpeg4+=		include/ffmpeg4
BUILDLINK_LIBDIRS.ffmpeg4+=		lib/ffmpeg4

.include "../../archivers/bzip2/buildlink3.mk"
.include "../../archivers/xz/buildlink3.mk"
.include "../../devel/libgetopt/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.endif # FFMPEG4_BUILDLINK3_MK

BUILDLINK_TREE+=	-ffmpeg4
