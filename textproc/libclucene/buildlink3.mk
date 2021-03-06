# $NetBSD: buildlink3.mk,v 1.15 2019/08/22 12:23:49 ryoon Exp $

BUILDLINK_TREE+=	libclucene

.if !defined(LIBCLUCENE_BUILDLINK3_MK)
LIBCLUCENE_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libclucene+=	libclucene>=2.2.0
BUILDLINK_ABI_DEPENDS.libclucene?=	libclucene>=2.3.3.4nb15
BUILDLINK_PKGSRCDIR.libclucene?=	../../textproc/libclucene
.endif # LIBCLUCENE_BUILDLINK3_MK

.include "../../devel/boost-headers/buildlink3.mk"
BUILDLINK_TREE+=	-libclucene
