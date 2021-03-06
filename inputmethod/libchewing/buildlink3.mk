# $NetBSD: buildlink3.mk,v 1.20 2019/04/03 00:32:48 ryoon Exp $

BUILDLINK_TREE+=	libchewing

.if !defined(LIBCHEWING_BUILDLINK3_MK)
LIBCHEWING_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libchewing+=	libchewing>=0.5.0
BUILDLINK_ABI_DEPENDS.libchewing+=	libchewing>=0.5.1nb8
BUILDLINK_PKGSRCDIR.libchewing?=	../../inputmethod/libchewing

.include "../../databases/sqlite3/buildlink3.mk"
.endif # LIBCHEWING_BUILDLINK3_MK

BUILDLINK_TREE+=	-libchewing
