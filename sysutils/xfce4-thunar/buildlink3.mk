# $NetBSD: buildlink3.mk,v 1.46 2019/07/21 22:24:12 wiz Exp $

BUILDLINK_TREE+=	xfce4-thunar

.if !defined(XFCE4_THUNAR_BUILDLINK3_MK)
XFCE4_THUNAR_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.xfce4-thunar+=	xfce4-thunar>=1.8.0
BUILDLINK_ABI_DEPENDS.xfce4-thunar+=	xfce4-thunar>=1.8.7nb1
BUILDLINK_PKGSRCDIR.xfce4-thunar?=	../../sysutils/xfce4-thunar

.include "../../graphics/libexif/buildlink3.mk"
.include "../../graphics/png/buildlink3.mk"
.include "../../x11/xfce4-exo/buildlink3.mk"
.include "../../x11/xfce4-panel/buildlink3.mk"
.endif	# XFCE4_THUNAR_BUILDLINK3_MK

BUILDLINK_TREE+=	-xfce4-thunar
