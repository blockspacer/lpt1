# $NetBSD: buildlink3.mk,v 1.6 2019/04/03 00:33:10 ryoon Exp $

BUILDLINK_TREE+=	libical

.if !defined(LIBICAL_BUILDLINK3_MK)
LIBICAL_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libical+=	libical>=0.42
BUILDLINK_ABI_DEPENDS.libical+=	libical>=3.0.4nb2
BUILDLINK_PKGSRCDIR.libical?=	../../time/libical

.include "../../textproc/icu/buildlink3.mk"
.endif # LIBICAL_BUILDLINK3_MK

BUILDLINK_TREE+=	-libical
