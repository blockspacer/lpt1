$NetBSD: patch-perl_TrapReceiver_Makefile.PL,v 1.1 2016/06/06 14:11:35 he Exp $

Adopt FreeBSD's patch to make this build with perl 5.24, ref.
https://svnweb.freebsd.org/ports/head/net-mgmt/net-snmp/files/patch-perl5.23?view=co
https://rt.perl.org/Public/Bug/Display.html?id=125907#txn-1363270
https://bugs.gentoo.org/show_bug.cgi?id=582368

--- perl/TrapReceiver/Makefile.PL.orig	2014-12-08 20:23:22.000000000 +0000
+++ perl/TrapReceiver/Makefile.PL
@@ -1,3 +1,4 @@
+package TrapReceiver;
 use ExtUtils::MakeMaker;
 require 5;
 use Config;
@@ -107,7 +108,7 @@ sub InitMakeParams {
     else {
 	$opts = NetSNMPGetOpts();
 	$Params{'LDDLFLAGS'} = "$Config{lddlflags} " . `$opts->{'nsconfig'} --ldflags`;
-	$Params{'LIBS'} = '-lnetsnmptrapd ' . `$opts->{'nsconfig'} --base-agent-libs`;
+	$Params{'LIBS'} = '-Wl,--no-copy-dt-needed-entries -lnetsnmptrapd ' . `$opts->{'nsconfig'} --base-agent-libs`;
 	chomp($Params{'LIBS'});
 	if (!$ENV{'NETSNMP_CCFLAGS'}) {
 	    $Params{'CCFLAGS'} = `$opts->{'nsconfig'} --cflags`;
