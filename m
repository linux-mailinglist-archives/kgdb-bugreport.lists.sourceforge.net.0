Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3B2726461
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  7 Jun 2023 17:26:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q6v2x-0002FC-Ne
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 07 Jun 2023 15:26:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1q6v2w-0002Eo-0q
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 07 Jun 2023 15:26:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=67NrrjqknF8ncefZ0/QwRO7Z+UALOwaMyCh2wgbmdCE=; b=A9XnUaEsRB9T8tAMRovWCoUmmM
 qwFFLiyk0eWyLzA5WvE2NbOgBE+1yTH81PeWPsIkTEik2sKIx6QVvFxeHf9oIMjWvnOv6e+QmUZ/J
 fwEidFkU+xypLbf58Z5kumO6nrxmjfAnpW/npAyWP7it8X/I79Glu/NczAlPWoOZV3Kg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=67NrrjqknF8ncefZ0/QwRO7Z+UALOwaMyCh2wgbmdCE=; b=Y7b2oRIKUsxLqG3SQ2eHgb4ybZ
 MKvSHuUE+okeMVx2Gn7csqhIScqGLOhFdDOqlbzexd7ei2S9KG0/pLRNBqzxcsByD/C59f9buQctj
 KNbIgYkYMH1thzjXqTOuqPf6TeeovdXaW5/eVa8lr/RsNW3LpNHssPCUESFbdRlciBeY=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q6v2v-0003N2-01 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 07 Jun 2023 15:26:02 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id BB34221A0E;
 Wed,  7 Jun 2023 15:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1686151554; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=67NrrjqknF8ncefZ0/QwRO7Z+UALOwaMyCh2wgbmdCE=;
 b=RPVtsD20oF7xKx9lHHkuVEYOaHH0NVotS8ERgMRbGiYv9sNENCvHxcl86EgPfu4tpZlaES
 +bFIrLcaRZhUB+SRGKrqLJyXd/vLcuFZa8QN85IWEttGngspIYlqL5HmN4sh3PRvAUaZ2t
 vbu4DP4Wz2gOPmFgeP4Pm/pLgoanLy0=
Received: from alley.suse.cz (unknown [10.100.201.202])
 by relay2.suse.de (Postfix) with ESMTP id 337092C141;
 Wed,  7 Jun 2023 15:25:54 +0000 (UTC)
To: Andrew Morton <akpm@linux-foundation.org>,
 Douglas Anderson <dianders@chromium.org>
Date: Wed,  7 Jun 2023 17:24:30 +0200
Message-Id: <20230607152432.5435-6-pmladek@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230607152432.5435-1-pmladek@suse.com>
References: <20230607152432.5435-1-pmladek@suse.com>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The configuration variable HAVE_NMI_WATCHDOG has a generic
 name but it is selected only for SPARC64. It should _not_ be used in general
 because it is not integrated with the other hardlockup detectors. Namely,
 it does not support the hardlockup specific command line parameters and systcl
 interface. I [...] 
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
X-Headers-End: 1q6v2v-0003N2-01
Subject: [Kgdb-bugreport] [PATCH 5/7] watchdog/sparc64: Rename
 HAVE_NMI_WATCHDOG to HAVE_HARDLOCKUP_WATCHDOG_SPARC64
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
 arch/Kconfig             | 12 ------------
 arch/sparc/Kconfig       |  2 +-
 arch/sparc/Kconfig.debug | 12 ++++++++++++
 include/linux/nmi.h      |  4 ++--
 kernel/watchdog.c        |  2 +-
 lib/Kconfig.debug        |  5 +----
 6 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 57f15babe188..6517e5477459 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -400,18 +400,6 @@ config HAVE_HARDLOCKUP_DETECTOR_PERF
 	  The arch chooses to use the generic perf-NMI-based hardlockup
 	  detector. Must define HAVE_PERF_EVENTS_NMI.
 
-config HAVE_NMI_WATCHDOG
-	depends on HAVE_NMI
-	bool
-	help
-	  Sparc64 provides its own hardlockup detector implementation instead
-	  of the generic perf one.
-
-	  It does _not_ use the command line parameters and sysctl interface
-	  used by generic hardlockup detectors. Instead it is enabled/disabled
-	  by the top-level watchdog interface that is common for both softlockup
-	  and hardlockup detectors.
-
 config HAVE_HARDLOCKUP_DETECTOR_ARCH
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
index 6b2bec1888b3..b6695303b8d4 100644
--- a/arch/sparc/Kconfig.debug
+++ b/arch/sparc/Kconfig.debug
@@ -14,3 +14,15 @@ config FRAME_POINTER
 	bool
 	depends on MCOUNT
 	default y
+
+config HAVE_HARDLOCKUP_DETECTOR_SPARC64
+	depends on HAVE_NMI
+	bool
+	help
+	  Sparc64 provides its own hardlockup detector implementation instead
+	  of the generic perf one.
+
+	  It does _not_ use the command line parameters and sysctl interface
+	  used by generic hardlockup detectors. Instead it is enabled/disabled
+	  by the top-level watchdog interface that is common for both softlockup
+	  and hardlockup detectors.
diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index 800196c78f65..7ee6c35d1f05 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -9,7 +9,7 @@
 #include <asm/irq.h>
 
 /* Arch specific watchdogs might need to share extra watchdog-related APIs. */
-#if defined(CONFIG_HAVE_HARDLOCKUP_DETECTOR_ARCH) || defined(CONFIG_HAVE_NMI_WATCHDOG)
+#if defined(CONFIG_HAVE_HARDLOCKUP_DETECTOR_ARCH) || defined(CONFIG_HAVE_HARDLOCKUP_DETECTOR_SPARC64)
 #include <asm/nmi.h>
 #endif
 
@@ -92,7 +92,7 @@ static inline void hardlockup_detector_disable(void) {}
 #endif
 
 /* Sparc64 has special implemetantion that is always enabled. */
-#if defined(CONFIG_HARDLOCKUP_DETECTOR) || defined(CONFIG_HAVE_NMI_WATCHDOG)
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
index 4b4aa0f941f9..2d8d8ce7c2d7 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1050,12 +1050,9 @@ config HAVE_HARDLOCKUP_DETECTOR_BUDDY
 #	sparc64: has a custom implementation which is not using the common
 #		hardlockup command line options and sysctl interface.
 #
-# Note that HAVE_NMI_WATCHDOG is set when the sparc64 specific implementation
-# is used.
-#
 config HARDLOCKUP_DETECTOR
 	bool "Detect Hard Lockups"
-	depends on DEBUG_KERNEL && !S390 && !HAVE_NMI_WATCHDOG
+	depends on DEBUG_KERNEL && !S390 && !HAVE_HARDLOCKUP_DETECTOR_SPARC64
 	depends on HAVE_HARDLOCKUP_DETECTOR_PERF || HAVE_HARDLOCKUP_DETECTOR_BUDDY || HAVE_HARDLOCKUP_DETECTOR_ARCH
 	imply HARDLOCKUP_DETECTOR_PERF
 	imply HARDLOCKUP_DETECTOR_BUDDY
-- 
2.35.3



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
