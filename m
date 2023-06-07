Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC8672645E
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  7 Jun 2023 17:25:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q6v2o-0001gh-PX
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 07 Jun 2023 15:25:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1q6v2n-0001gW-1m
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 07 Jun 2023 15:25:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1rVxOeo4RLBDL5GE2Lf9QZE9fzvk64IDwLTus852i6o=; b=BwHvkde+g1tr9XMZniIboFpwBx
 2TyKLBzzljXyPniwJvSsTq9ybubnHL9/ytWYnr8vBb5LTTycghBaoTw/3O0mN1ck9Xsl/iEW7J6t4
 r7elWuGvMOc9fieoz+VI/6LI9wawKFWOU7opbAepHA8GAXWxviSD/3GWkxJsCOt/Pie0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1rVxOeo4RLBDL5GE2Lf9QZE9fzvk64IDwLTus852i6o=; b=J3B1yu0LzvcWehg4h7gnXinFoV
 MoC4TYO28oCCKVAui4hn2NTmUGJvMLOcaf3kHtVBQWD0ik/bb1aFKkyiE/BCDkCdHomKCXC+a87+g
 cTm71eBHLC3V5vCGeVLSBuEU8jtRT7+d9Iu9FX/k8oRhQ6I5mquWCA/r8YduXxeq5PCw=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q6v2k-00DqFx-8t for kgdb-bugreport@lists.sourceforge.net;
 Wed, 07 Jun 2023 15:25:52 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 1201821A0F;
 Wed,  7 Jun 2023 15:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1686151544; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1rVxOeo4RLBDL5GE2Lf9QZE9fzvk64IDwLTus852i6o=;
 b=bMFhXmKFPG/jj84oi9qQQtQ4h5fHR3MVqZfcRZwxLBGRLcQ6l6RT8Ryrjoii+w69lQLhMB
 Hd21yM/yX538nlKd/anmDhThlhU/jaBUC56LHhqbpvEn+ooHtP2QJHrMoPZu18+fE4cPRx
 Qljz7ZuIpPtLtzEgTLcqdOnd2X2d/Sk=
Received: from alley.suse.cz (unknown [10.100.201.202])
 by relay2.suse.de (Postfix) with ESMTP id 7E49B2C141;
 Wed,  7 Jun 2023 15:25:43 +0000 (UTC)
To: Andrew Morton <akpm@linux-foundation.org>,
 Douglas Anderson <dianders@chromium.org>
Date: Wed,  7 Jun 2023 17:24:29 +0200
Message-Id: <20230607152432.5435-5-pmladek@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230607152432.5435-1-pmladek@suse.com>
References: <20230607152432.5435-1-pmladek@suse.com>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: HAVE_NMI_WATCHDOG is always enabled when SPARC64 is enabled.
 The sparc64 implementation is special. It does not support the generic
 hardlockup
 related Kconfig values, command line parameters, and sysc [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q6v2k-00DqFx-8t
Subject: [Kgdb-bugreport] [PATCH 4/7] watchdog/hardlockup: Enable
 HAVE_NMI_WATCHDOG only on sparc64
X-BeenThere: kgdb-bugreport@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: kgdb bugs suggestions <kgdb-bugreport.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
From: Petr Mladek via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: Petr Mladek <pmladek@suse.com>, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-perf-users@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

HAVE_NMI_WATCHDOG is always enabled when SPARC64 is enabled. The sparc64
implementation is special. It does not support the generic hardlockup
related Kconfig values, command line parameters, and sysctl interface.
Instead it is enabled/disabled by the top-level watchdog interface
that is common for both softlockup and hardlockup detectors.

As a result, sparc64 needs special treating in Kconfig and source
files. The checks are a bit complicated because HAVE_NMI_WATCHDOG is
automatically set when HAVE_HARDLOCKUP_DETECTOR_ARCH is set.
But HAVE_HARDLOCKUP_DETECTOR_ARCH is set when the arch specific
implementation uses the generic hardlockup detector related
Kconfig variables, command line parameters, and sysctl interface.

The motivation probably was to avoid changes in the code when
the powerpc64-specific watchdog introduced HAVE_HARDLOCKUP_DETECTOR_ARCH.
It probably allowed to re-use some existing checks for HAVE_NMI_WATCHDOG.

But it actually made things pretty complicated. For example,
the following check was needed in HARDLOCKUP_DETECTOR config variable:

   depends on ((HAVE_HARDLOCKUP_DETECTOR_PERF || HAVE_HARDLOCKUP_DETECTOR_BUDDY) && !HAVE_NMI_WATCHDOG) || HAVE_HARDLOCKUP_DETECTOR_ARCH

The inverted logic makes things easier:

  + HAVE_NMI_WATCHDOG is used only on sparc64. It is clear when
    the sparc64 specific watchdog is used.

  + HAVE_HARDLOCKUP_DETECTOR_ARCH is basically compatible with
    the generic watchdogs. As a result, the common code
    is marked by ifdef CONFIG_HARDLOCKUP_DETECTOR.

As a result:

  + Some conditions are easier.

  + Some conditions use HAVE_HARDLOCKUP_DETECTOR_ARCH instead of
    HAVE_NMI_WATCHDOG.

Note that HARDLOCKUP_DETECTOR_PREFER_BUDDY, HARDLOCKUP_DETECTOR_PERF,
and HARDLOCKUP_DETECTOR_BUDDY might depend only on
HAVE_HARDLOCKUP_DETECTOR_ARCH. They depend on HARDLOCKUP_DETECTOR
and it is not longer enabled when HAVE_NMI_WATCHDOG is set.

Note that asm/nmi.h still has to be included for all arch-specific
watchdogs. It declares more functions that are used in another
arch specific code which includes only linux/nmi.h.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 arch/Kconfig        |  7 +------
 include/linux/nmi.h |  5 ++---
 lib/Kconfig.debug   | 16 +++++++---------
 3 files changed, 10 insertions(+), 18 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 13c6e596cf9e..57f15babe188 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -404,10 +404,9 @@ config HAVE_NMI_WATCHDOG
 	depends on HAVE_NMI
 	bool
 	help
-	  The arch provides its own hardlockup detector implementation instead
+	  Sparc64 provides its own hardlockup detector implementation instead
 	  of the generic perf one.
 
-	  Sparc64 defines this variable without HAVE_HARDLOCKUP_DETECTOR_ARCH.
 	  It does _not_ use the command line parameters and sysctl interface
 	  used by generic hardlockup detectors. Instead it is enabled/disabled
 	  by the top-level watchdog interface that is common for both softlockup
@@ -415,7 +414,6 @@ config HAVE_NMI_WATCHDOG
 
 config HAVE_HARDLOCKUP_DETECTOR_ARCH
 	bool
-	select HAVE_NMI_WATCHDOG
 	help
 	  The arch provides its own hardlockup detector implementation instead
 	  of the generic ones.
@@ -423,9 +421,6 @@ config HAVE_HARDLOCKUP_DETECTOR_ARCH
 	  It uses the same command line parameters, and sysctl interface,
 	  as the generic hardlockup detectors.
 
-	  HAVE_NMI_WATCHDOG is selected to build the code shared with
-	  the sparc64 specific implementation.
-
 config HAVE_PERF_REGS
 	bool
 	help
diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index b9e816bde14a..800196c78f65 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -9,7 +9,7 @@
 #include <asm/irq.h>
 
 /* Arch specific watchdogs might need to share extra watchdog-related APIs. */
-#if defined(CONFIG_HAVE_NMI_WATCHDOG)
+#if defined(CONFIG_HAVE_HARDLOCKUP_DETECTOR_ARCH) || defined(CONFIG_HAVE_NMI_WATCHDOG)
 #include <asm/nmi.h>
 #endif
 
@@ -92,8 +92,7 @@ static inline void hardlockup_detector_disable(void) {}
 #endif
 
 /* Sparc64 has special implemetantion that is always enabled. */
-#if defined(CONFIG_HARDLOCKUP_DETECTOR) || \
-    (defined(CONFIG_HAVE_NMI_WATCHDOG) && !defined(CONFIG_HAVE_HARDLOCKUP_DETECTOR_ARCH))
+#if defined(CONFIG_HARDLOCKUP_DETECTOR) || defined(CONFIG_HAVE_NMI_WATCHDOG)
 void arch_touch_nmi_watchdog(void);
 #else
 static inline void arch_touch_nmi_watchdog(void) { }
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index d201f5d3876b..4b4aa0f941f9 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1050,15 +1050,13 @@ config HAVE_HARDLOCKUP_DETECTOR_BUDDY
 #	sparc64: has a custom implementation which is not using the common
 #		hardlockup command line options and sysctl interface.
 #
-# Note that HAVE_NMI_WATCHDOG is used to distinguish the sparc64 specific
-# implementaion. It is automatically enabled also for other arch-specific
-# variants which set HAVE_HARDLOCKUP_DETECTOR_ARCH. It makes the check
-# of avaialable and supported variants quite tricky.
+# Note that HAVE_NMI_WATCHDOG is set when the sparc64 specific implementation
+# is used.
 #
 config HARDLOCKUP_DETECTOR
 	bool "Detect Hard Lockups"
-	depends on DEBUG_KERNEL && !S390
-	depends on ((HAVE_HARDLOCKUP_DETECTOR_PERF || HAVE_HARDLOCKUP_DETECTOR_BUDDY) && !HAVE_NMI_WATCHDOG) || HAVE_HARDLOCKUP_DETECTOR_ARCH
+	depends on DEBUG_KERNEL && !S390 && !HAVE_NMI_WATCHDOG
+	depends on HAVE_HARDLOCKUP_DETECTOR_PERF || HAVE_HARDLOCKUP_DETECTOR_BUDDY || HAVE_HARDLOCKUP_DETECTOR_ARCH
 	imply HARDLOCKUP_DETECTOR_PERF
 	imply HARDLOCKUP_DETECTOR_BUDDY
 	select LOCKUP_DETECTOR
@@ -1079,7 +1077,7 @@ config HARDLOCKUP_DETECTOR_PREFER_BUDDY
 	bool "Prefer the buddy CPU hardlockup detector"
 	depends on HARDLOCKUP_DETECTOR
 	depends on HAVE_HARDLOCKUP_DETECTOR_PERF && HAVE_HARDLOCKUP_DETECTOR_BUDDY
-	depends on !HAVE_NMI_WATCHDOG
+	depends on !HAVE_HARLOCKUP_DETECTOR_ARCH
 	default n
 	help
 	  Say Y here to prefer the buddy hardlockup detector over the perf one.
@@ -1096,7 +1094,7 @@ config HARDLOCKUP_DETECTOR_PERF
 	bool
 	depends on HARDLOCKUP_DETECTOR
 	depends on HAVE_HARDLOCKUP_DETECTOR_PERF && !HARDLOCKUP_DETECTOR_PREFER_BUDDY
-	depends on !HAVE_NMI_WATCHDOG
+	depends on !HAVE_HARDLOCKUP_DETECTOR_ARCH
 	select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
 
 config HARDLOCKUP_DETECTOR_BUDDY
@@ -1104,7 +1102,7 @@ config HARDLOCKUP_DETECTOR_BUDDY
 	depends on HARDLOCKUP_DETECTOR
 	depends on HAVE_HARDLOCKUP_DETECTOR_BUDDY
 	depends on !HAVE_HARDLOCKUP_DETECTOR_PERF || HARDLOCKUP_DETECTOR_PREFER_BUDDY
-	depends on !HAVE_NMI_WATCHDOG
+	depends on !HAVE_HARDLOCKUP_DETECTOR_ARCH
 	select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
 
 #
-- 
2.35.3



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
