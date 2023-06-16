Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E051733442
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 16 Jun 2023 17:07:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qAB38-0003sG-GN
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 16 Jun 2023 15:07:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1qAB36-0003sA-Rc
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 16 Jun 2023 15:07:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0vz7qhAyl74VsxsNh5bGUnpGlGlXH8vzFldgZ94xKqY=; b=Od8xrDvn/yju1C3YF3eQTPa66x
 Ok3UL+NzCDHF+TrTaLzduDb1+7sEQPKZcU4taqp00oWKfxeGfrpsaw9S0Yi4/v/CHCfar+8wfHUAC
 PCrGGE6NXXDisGhUyTZ45EzrD8Hg+xgZyas2zuZpjAg2Ghx4YE1jANBXiJZ3s+d0OUjY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0vz7qhAyl74VsxsNh5bGUnpGlGlXH8vzFldgZ94xKqY=; b=f00R6w0wR2n3u2Ttr92wt2jIml
 L9VjfPNN8f2/E+PTOi9S2EA9+UbGEyJip9bUMdJxoayIb1Eaffvky+n4QAQT7Q6NuQfaTRm2jVf+U
 rpshtTTBcdOw2wteq8V9EILQKszvMGC2YHegll80QQClGK8wb6ZXQB16JspI5zMWFNsE=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qAB34-0000xK-2w for kgdb-bugreport@lists.sourceforge.net;
 Fri, 16 Jun 2023 15:07:39 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id CE1CC21DE1;
 Fri, 16 Jun 2023 15:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1686928051; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0vz7qhAyl74VsxsNh5bGUnpGlGlXH8vzFldgZ94xKqY=;
 b=abwGQypFA3jaC2EHrSNXkg3CTeIpPVXv7SkO0DvSlAXp+Zk2PVKOCVBFwIkTriazQIksUR
 cLn4SEh0WeUqlwBxwA3T8bairLIxCokm1HdGa2Yk7k6T1A4dmj/NIErLNMrRTp4gU3pgIJ
 i21S8fUGEgqcqx6mPBF3OZTs29zgdSw=
Received: from alley.suse.cz (unknown [10.100.208.146])
 by relay2.suse.de (Postfix) with ESMTP id 094EB2C141;
 Fri, 16 Jun 2023 15:07:30 +0000 (UTC)
To: Andrew Morton <akpm@linux-foundation.org>,
 Douglas Anderson <dianders@chromium.org>
Date: Fri, 16 Jun 2023 17:06:17 +0200
Message-Id: <20230616150618.6073-6-pmladek@suse.com>
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
 Content preview:  The HAVE_ prefix means that the code could be enabled. Add
 another variable for HAVE_HARDLOCKUP_DETECTOR_SPARC64 without this prefix.
 It will be set when it should be built. It will make it compatible [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qAB34-0000xK-2w
Subject: [Kgdb-bugreport] [PATCH v2 5/6] watchdog/sparc64: Define
 HARDLOCKUP_DETECTOR_SPARC64
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

The HAVE_ prefix means that the code could be enabled. Add another
variable for HAVE_HARDLOCKUP_DETECTOR_SPARC64 without this prefix.
It will be set when it should be built. It will make it compatible
with the other hardlockup detectors.

Before, it is far from obvious that the SPARC64 variant is actually used:

$> make ARCH=sparc64 defconfig
$> grep HARDLOCKUP_DETECTOR .config
CONFIG_HAVE_HARDLOCKUP_DETECTOR_BUDDY=y
CONFIG_HAVE_HARDLOCKUP_DETECTOR_SPARC64=y

After, it is more clear:

$> make ARCH=sparc64 defconfig
$> grep HARDLOCKUP_DETECTOR .config
CONFIG_HAVE_HARDLOCKUP_DETECTOR_BUDDY=y
CONFIG_HAVE_HARDLOCKUP_DETECTOR_SPARC64=y
CONFIG_HARDLOCKUP_DETECTOR_SPARC64=y

Signed-off-by: Petr Mladek <pmladek@suse.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 arch/sparc/Kconfig.debug | 7 ++++++-
 include/linux/nmi.h      | 4 ++--
 kernel/watchdog.c        | 2 +-
 lib/Kconfig.debug        | 2 +-
 4 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/sparc/Kconfig.debug b/arch/sparc/Kconfig.debug
index 4903b6847e43..37e003665de6 100644
--- a/arch/sparc/Kconfig.debug
+++ b/arch/sparc/Kconfig.debug
@@ -16,10 +16,15 @@ config FRAME_POINTER
 	default y
 
 config HAVE_HARDLOCKUP_DETECTOR_SPARC64
-	depends on HAVE_NMI
 	bool
+	depends on HAVE_NMI
+	select HARDLOCKUP_DETECTOR_SPARC64
 	help
 	  Sparc64 hardlockup detector is the last one developed before adding
 	  the common infrastructure for handling hardlockup detectors. It is
 	  always built. It does _not_ use the common command line parameters
 	  and sysctl interface, except for /proc/sys/kernel/nmi_watchdog.
+
+config HARDLOCKUP_DETECTOR_SPARC64
+	bool
+	depends on HAVE_HARDLOCKUP_DETECTOR_SPARC64
diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index 7ee6c35d1f05..515d6724f469 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -9,7 +9,7 @@
 #include <asm/irq.h>
 
 /* Arch specific watchdogs might need to share extra watchdog-related APIs. */
-#if defined(CONFIG_HAVE_HARDLOCKUP_DETECTOR_ARCH) || defined(CONFIG_HAVE_HARDLOCKUP_DETECTOR_SPARC64)
+#if defined(CONFIG_HAVE_HARDLOCKUP_DETECTOR_ARCH) || defined(CONFIG_HARDLOCKUP_DETECTOR_SPARC64)
 #include <asm/nmi.h>
 #endif
 
@@ -92,7 +92,7 @@ static inline void hardlockup_detector_disable(void) {}
 #endif
 
 /* Sparc64 has special implemetantion that is always enabled. */
-#if defined(CONFIG_HARDLOCKUP_DETECTOR) || defined(CONFIG_HAVE_HARDLOCKUP_DETECTOR_SPARC64)
+#if defined(CONFIG_HARDLOCKUP_DETECTOR) || defined(CONFIG_HARDLOCKUP_DETECTOR_SPARC64)
 void arch_touch_nmi_watchdog(void);
 #else
 static inline void arch_touch_nmi_watchdog(void) { }
diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index babd2f3c8b72..a2154e753cb4 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -29,7 +29,7 @@
 
 static DEFINE_MUTEX(watchdog_mutex);
 
-#if defined(CONFIG_HARDLOCKUP_DETECTOR) || defined(CONFIG_HAVE_HARDLOCKUP_DETECTOR_SPARC64)
+#if defined(CONFIG_HARDLOCKUP_DETECTOR) || defined(CONFIG_HARDLOCKUP_DETECTOR_SPARC64)
 # define WATCHDOG_HARDLOCKUP_DEFAULT	1
 #else
 # define WATCHDOG_HARDLOCKUP_DEFAULT	0
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index e94664339e28..f285e9cf967a 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1052,7 +1052,7 @@ config HAVE_HARDLOCKUP_DETECTOR_BUDDY
 #
 config HARDLOCKUP_DETECTOR
 	bool "Detect Hard Lockups"
-	depends on DEBUG_KERNEL && !S390 && !HAVE_HARDLOCKUP_DETECTOR_SPARC64
+	depends on DEBUG_KERNEL && !S390 && !HARDLOCKUP_DETECTOR_SPARC64
 	depends on HAVE_HARDLOCKUP_DETECTOR_PERF || HAVE_HARDLOCKUP_DETECTOR_BUDDY || HAVE_HARDLOCKUP_DETECTOR_ARCH
 	imply HARDLOCKUP_DETECTOR_PERF
 	imply HARDLOCKUP_DETECTOR_BUDDY
-- 
2.35.3



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
