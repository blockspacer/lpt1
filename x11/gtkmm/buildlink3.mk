# $NetBSD: buildlink3.mk,v 1.49 2019/07/21 22:24:17 wiz Exp $

BUILDLINK_TREE+=	gtkmm

.if !defined(GTKMM_BUILDLINK3_MK)
GTKMM_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.gtkmm+=	gtkmm>=2.22.0
BUILDLINK_ABI_DEPENDS.gtkmm+=	gtkmm>=2.24.5nb8
BUILDLINK_PKGSRCDIR.gtkmm?=	../../x11/gtkmm

BUILDLINK_INCDIRS.gtkmm=	include/gtkmm-2.4 lib/gtkmm-2.4/include

.include "../../devel/atkmm/buildlink3.mk"
.include "../../devel/pangomm/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.endif # GTKMM_BUILDLINK3_MK

BUILDLINK_TREE+=	-gtkmm
