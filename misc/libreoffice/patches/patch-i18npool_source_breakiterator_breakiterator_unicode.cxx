$NetBSD: patch-i18npool_source_breakiterator_breakiterator_unicode.cxx,v 1.1 2018/04/19 18:07:03 mrg Exp $

add missing ICU namespace needed for icu 61.

--- i18npool/source/breakiterator/breakiterator_unicode.cxx.orig	2018-03-29 08:04:09.000000000 -0700
+++ i18npool/source/breakiterator/breakiterator_unicode.cxx	2018-04-17 18:08:53.324063212 -0700
@@ -37,6 +37,7 @@
 using namespace ::com::sun::star;
 using namespace ::com::sun::star::i18n;
 using namespace ::com::sun::star::lang;
+using namespace U_ICU_NAMESPACE;
 
 namespace i18npool {
 
