Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FD7733443
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 16 Jun 2023 17:07:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qAB38-0003JT-1O
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 16 Jun 2023 15:07:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1qAB2t-0003JM-O2
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 16 Jun 2023 15:07:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=twlKMlvODP2VduqJ32dfq71Qfg7IQtgpe2dMlRpFW1o=; b=RQPlP13ZxCXXYu4NARM1Qvx0S0
 bR+D6fKKkmDHArHbuhYe8EeqP+65Nxzh+IzpKnOYk1hzGDfzrJXiZzvjwCFw8hfDqLHhoYJBsYwXg
 gMEge/+2adB7XR83Q1FiGCakOhNTfQqtifp0bHxLxCkmuqsCukpySz6GEptA1FiOFZNk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=twlKMlvODP2VduqJ32dfq71Qfg7IQtgpe2dMlRpFW1o=; b=B10kIuo3lA2X0MScCnXzeVWFnW
 v1Y14hWBuF9W7VWjjzJMpLmD6SfPwht5l3t4Fi7kdoC0h+bIv3PvYFnnzP+GK24kGNMLwurXtkWBL
 Iaif+aEiMQpf6i15h5plYg0OnDcWXUnjyHFwY/kX+u9ds93Ys9JIyF1CgUiLnZivp5fM=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qAB2t-005sub-0O for kgdb-bugreport@lists.sourceforge.net;
 Fri, 16 Jun 2023 15:07:28 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id C32461F461;
 Fri, 16 Jun 2023 15:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1686928040; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=twlKMlvODP2VduqJ32dfq71Qfg7IQtgpe2dMlRpFW1o=;
 b=JYl4ynP2ihi+uJD9bTl7SabJfmXEonDsmKRRumkbSzYLtjBlgeScK98evK5lgk6F8RXnU5
 7zo5VDtPs/+aTQPMKgauZmrtCrUJ87ysaIVMmzF1NgcmF8Cozj4M7P/dCy8Ljy0Lol12rb
 cWrJssF/fbznortZR1uDLJFMFx66k40=
Received: from alley.suse.cz (unknown [10.100.208.146])
 by relay2.suse.de (Postfix) with ESMTP id 46F332C141;
 Fri, 16 Jun 2023 15:07:20 +0000 (UTC)
To: Andrew Morton <akpm@linux-foundation.org>,
 Douglas Anderson <dianders@chromium.org>
Date: Fri, 16 Jun 2023 17:06:16 +0200
Message-Id: <20230616150618.6073-5-pmladek@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230616150618.6073-1-pmladek@suse.com>
References: <20230616150618.6073-1-pmladek@suse.com>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  There are several hardlockup detector implementations and
 several Kconfig values which allow selection and build of the preferred one.
 CONFIG_HARDLOCKUP_DETECTOR was introduced by the commit 23637d477c1f53acb
 ("lockup_detector: Introduce CONFIG_HARDLOCKUP_DETECTOR") in v2.6.36. It
 was a preparation step for introducing the new generi [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qAB2t-005sub-0O
Subject: [Kgdb-bugreport] [PATCH v2 4/6] watchdog/hardlockup: Make
 HAVE_NMI_WATCHDOG sparc64-specific
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

There are several hardlockup detector implementations and several Kconfig
values which allow selection and build of the preferred one.

CONFIG_HARDLOCKUP_DETECTOR was introduced by the commit 23637d477c1f53acb
("lockup_detector: Introduce CONFIG_HARDLOCKUP_DETECTOR") in v2.6.36.
It was a preparation step for introducing the new generic perf hardlockup
detector.

The existing arch-specific variants did not support the to-be-created
generic build configurations, sysctl interface, etc. This distinction
was made explicit by the commit 4a7863cc2eb5f98 ("x86, nmi_watchdog:
Remove ARCH_HAS_NMI_WATCHDOG and rely on CONFIG_HARDLOCKUP_DETECTOR")
in v2.6.38.

CONFIG_HAVE_NMI_WATCHDOG was introduced by the commit d314d74c695f967e105
("nmi watchdog: do not use cpp symbol in Kconfig") in v3.4-rc1. It replaced
the above mentioned ARCH_HAS_NMI_WATCHDOG. At that time, it was still used
by three architectures, namely blackfin, mn10300, and sparc.

The support for blackfin and mn10300 architectures has been completely
dropped some time ago. And sparc is the only architecture with the historic
NMI watchdog at the moment.

And the old sparc implementation is really special. It is always built on
sparc64. It used to be always enabled until the commit 7a5c8b57cec93196b
("sparc: implement watchdog_nmi_enable and watchdog_nmi_disable") added
in v4.10-rc1.

There are only few locations where the sparc64 NMI watchdog interacts
with the generic hardlockup detectors code:

  + implements arch_touch_nmi_watchdog() which is called from the generic
    touch_nmi_watchdog()

  + implements watchdog_hardlockup_enable()/disable() to support
    /proc/sys/kernel/nmi_watchdog

  + is always preferred over other generic watchdogs, see
    CONFIG_HARDLOCKUP_DETECTOR

  + includes asm/nmi.h into linux/nmi.h because some sparc-specific
    functions are needed in sparc-specific code which includes
    only linux/nmi.h.

The situation became more complicated after the commit 05a4a95279311c3
("kernel/watchdog: split up config options") and commit 2104180a53698df5
("powerpc/64s: implement arch-specific hardlockup watchdog") in v4.13-rc1.
They introduced HAVE_HARDLOCKUP_DETECTOR_ARCH. It was used for powerpc
specific hardlockup detector. It was compatible with the perf one
regarding the general boot, sysctl, and programming interfaces.

HAVE_HARDLOCKUP_DETECTOR_ARCH was defined as a superset of
HAVE_NMI_WATCHDOG. It made some sense because all arch-specific
detectors had some common requirements, namely:

  + implemented arch_touch_nmi_watchdog()
  + included asm/nmi.h into linux/nmi.h
  + defined the default value for /proc/sys/kernel/nmi_watchdog

But it actually has made things pretty complicated when the generic
buddy hardlockup detector was added. Before the generic perf detector
was newer supported together with an arch-specific one. But the buddy
detector could work on any SMP system. It means that an architecture
could support both the arch-specific and buddy detector.

As a result, there are few tricky dependencies. For example,
CONFIG_HARDLOCKUP_DETECTOR depends on:

  ((HAVE_HARDLOCKUP_DETECTOR_PERF || HAVE_HARDLOCKUP_DETECTOR_BUDDY) && !HAVE_NMI_WATCHDOG) || HAVE_HARDLOCKUP_DETECTOR_ARCH

The problem is that the very special sparc implementation is defined as:

  HAVE_NMI_WATCHDOG && !HAVE_HARDLOCKUP_DETECTOR_ARCH

Another problem is that the meaning of HAVE_NMI_WATCHDOG is far from clear
without reading understanding the history.

Make the logic less tricky and more self-explanatory by making
HAVE_NMI_WATCHDOG specific for the sparc64 implementation. And rename it to
HAVE_HARDLOCKUP_DETECTOR_SPARC64.

Note that HARDLOCKUP_DETECTOR_PREFER_BUDDY, HARDLOCKUP_DETECTOR_PERF,
and HARDLOCKUP_DETECTOR_BUDDY may conflict only with
HAVE_HARDLOCKUP_DETECTOR_ARCH. They depend on HARDLOCKUP_DETECTOR
and it is not longer enabled when HAVE_NMI_WATCHDOG is set.

Signed-off-by: Petr Mladek <pmladek@suse.com>

watchdog/sparc64: Rename HAVE_NMI_WATCHDOG to HAVE_HARDLOCKUP_WATCHDOG_SPARC64

The configuration variable HAVE_NMI_WATCHDOG has a generic name but
it is selected only for SPARC64.

It should _not_ be used in general because it is not integrated with
the other hardlockup detectors. Namely, it does not support the hardlockup
specific command line parameters and systcl interface. Instead, it is
enabled/disabled together with the softlockup detector by the global
"watchdog" sysctl.

Rename it to HAVE_HARDLOCKUP_WATCHDOG_SPARC64 to make the special
behavior more clear.

Also the variable is set only on sparc64. Move the definition
from arch/Kconfig to arch/sparc/Kconfig.debug.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 arch/Kconfig             | 18 ------------------
 arch/sparc/Kconfig       |  2 +-
 arch/sparc/Kconfig.debug |  9 +++++++++
 include/linux/nmi.h      |  5 ++---
 kernel/watchdog.c        |  2 +-
 lib/Kconfig.debug        | 15 +++++----------
 6 files changed, 18 insertions(+), 33 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 77e5af5fda3f..6517e5477459 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -400,23 +400,8 @@ config HAVE_HARDLOCKUP_DETECTOR_PERF
 	  The arch chooses to use the generic perf-NMI-based hardlockup
 	  detector. Must define HAVE_PERF_EVENTS_NMI.
 
-config HAVE_NMI_WATCHDOG
-	depends on HAVE_NMI
-	bool
-	help
-	  The arch provides its own hardlockup detector implementation instead
-	  of the generic ones.
-
-	  Sparc64 defines this variable without HAVE_HARDLOCKUP_DETECTOR_ARCH.
-	  It is the last arch-specific implementation which was developed before
-	  adding the common infrastructure for handling hardlockup detectors.
-	  It is always built. It does _not_ use the common command line
-	  parameters and sysctl interface, except for
-	  /proc/sys/kernel/nmi_watchdog.
-
 config HAVE_HARDLOCKUP_DETECTOR_ARCH
 	bool
-	select HAVE_NMI_WATCHDOG
 	help
 	  The arch provides its own hardlockup detector implementation instead
 	  of the generic ones.
@@ -424,9 +409,6 @@ config HAVE_HARDLOCKUP_DETECTOR_ARCH
 	  It uses the same command line parameters, and sysctl interface,
 	  as the generic hardlockup detectors.
 
-	  HAVE_NMI_WATCHDOG is selected to build the code shared with
-	  the sparc64 specific implementation.
-
 config HAVE_PERF_REGS
 	bool
 	help
diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 8535e19062f6..7297f69635cb 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -33,7 +33,7 @@ config SPARC
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select GENERIC_PCI_IOMAP
 	select HAS_IOPORT
-	select HAVE_NMI_WATCHDOG if SPARC64
+	select HAVE_HARDLOCKUP_DETECTOR_SPARC64 if SPARC64
 	select HAVE_CBPF_JIT if SPARC32
 	select HAVE_EBPF_JIT if SPARC64
 	select HAVE_DEBUG_BUGVERBOSE
diff --git a/arch/sparc/Kconfig.debug b/arch/sparc/Kconfig.debug
index 6b2bec1888b3..4903b6847e43 100644
--- a/arch/sparc/Kconfig.debug
+++ b/arch/sparc/Kconfig.debug
@@ -14,3 +14,12 @@ config FRAME_POINTER
 	bool
 	depends on MCOUNT
 	default y
+
+config HAVE_HARDLOCKUP_DETECTOR_SPARC64
+	depends on HAVE_NMI
+	bool
+	help
+	  Sparc64 hardlockup detector is the last one developed before adding
+	  the common infrastructure for handling hardlockup detectors. It is
+	  always built. It does _not_ use the common command line parameters
+	  and sysctl interface, except for /proc/sys/kernel/nmi_watchdog.
diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index b9e816bde14a..7ee6c35d1f05 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -9,7 +9,7 @@
 #include <asm/irq.h>
 
 /* Arch specific watchdogs might need to share extra watchdog-related APIs. */
-#if defined(CONFIG_HAVE_NMI_WATCHDOG)
+#if defined(CONFIG_HAVE_HARDLOCKUP_DETECTOR_ARCH) || defined(CONFIG_HAVE_HARDLOCKUP_DETECTOR_SPARC64)
 #include <asm/nmi.h>
 #endif
 
@@ -92,8 +92,7 @@ static inline void hardlockup_detector_disable(void) {}
 #endif
 
 /* Sparc64 has special implemetantion that is always enabled. */
-#if defined(CONFIG_HARDLOCKUP_DETECTOR) || \
-    (defined(CONFIG_HAVE_NMI_WATCHDOG) && !defined(CONFIG_HAVE_HARDLOCKUP_DETECTOR_ARCH))
+#if defined(CONFIG_HARDLOCKUP_DETECTOR) || defined(CONFIG_HAVE_HARDLOCKUP_DETECTOR_SPARC64)
 void arch_touch_nmi_watchdog(void);
 #else
 static inline void arch_touch_nmi_watchdog(void) { }
diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 437c198933cf..babd2f3c8b72 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -29,7 +29,7 @@
 
 static DEFINE_MUTEX(watchdog_mutex);
 
-#if defined(CONFIG_HARDLOCKUP_DETECTOR) || defined(CONFIG_HAVE_NMI_WATCHDOG)
+#if defined(CONFIG_HARDLOCKUP_DETECTOR) || defined(CONFIG_HAVE_HARDLOCKUP_DETECTOR_SPARC64)
 # define WATCHDOG_HARDLOCKUP_DEFAULT	1
 #else
 # define WATCHDOG_HARDLOCKUP_DEFAULT	0
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index a0b0c4decb89..e94664339e28 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1050,15 +1050,10 @@ config HAVE_HARDLOCKUP_DETECTOR_BUDDY
 #	sparc64: has a custom implementation which is not using the common
 #		hardlockup command line options and sysctl interface.
 #
-# Note that HAVE_NMI_WATCHDOG is used to distinguish the sparc64 specific
-# implementaion. It is automatically enabled also for other arch-specific
-# variants which set HAVE_HARDLOCKUP_DETECTOR_ARCH. It makes the check
-# of avaialable and supported variants quite tricky.
-#
 config HARDLOCKUP_DETECTOR
 	bool "Detect Hard Lockups"
-	depends on DEBUG_KERNEL && !S390
-	depends on ((HAVE_HARDLOCKUP_DETECTOR_PERF || HAVE_HARDLOCKUP_DETECTOR_BUDDY) && !HAVE_NMI_WATCHDOG) || HAVE_HARDLOCKUP_DETECTOR_ARCH
+	depends on DEBUG_KERNEL && !S390 && !HAVE_HARDLOCKUP_DETECTOR_SPARC64
+	depends on HAVE_HARDLOCKUP_DETECTOR_PERF || HAVE_HARDLOCKUP_DETECTOR_BUDDY || HAVE_HARDLOCKUP_DETECTOR_ARCH
 	imply HARDLOCKUP_DETECTOR_PERF
 	imply HARDLOCKUP_DETECTOR_BUDDY
 	select LOCKUP_DETECTOR
@@ -1079,7 +1074,7 @@ config HARDLOCKUP_DETECTOR_PREFER_BUDDY
 	bool "Prefer the buddy CPU hardlockup detector"
 	depends on HARDLOCKUP_DETECTOR
 	depends on HAVE_HARDLOCKUP_DETECTOR_PERF && HAVE_HARDLOCKUP_DETECTOR_BUDDY
-	depends on !HAVE_NMI_WATCHDOG
+	depends on !HAVE_HARLOCKUP_DETECTOR_ARCH
 	help
 	  Say Y here to prefer the buddy hardlockup detector over the perf one.
 
@@ -1095,7 +1090,7 @@ config HARDLOCKUP_DETECTOR_PERF
 	bool
 	depends on HARDLOCKUP_DETECTOR
 	depends on HAVE_HARDLOCKUP_DETECTOR_PERF && !HARDLOCKUP_DETECTOR_PREFER_BUDDY
-	depends on !HAVE_NMI_WATCHDOG
+	depends on !HAVE_HARDLOCKUP_DETECTOR_ARCH
 	select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
 
 config HARDLOCKUP_DETECTOR_BUDDY
@@ -1103,7 +1098,7 @@ config HARDLOCKUP_DETECTOR_BUDDY
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
