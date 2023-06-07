Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF58072645A
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  7 Jun 2023 17:25:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q6v2c-0002E9-Bg
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 07 Jun 2023 15:25:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1q6v2a-0002E3-SF
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 07 Jun 2023 15:25:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l8vq7Ephty8waJliBJyToxWKbVnmNFOZqyFjlNhMVAM=; b=hTar3SAQpIwrtt6Qf1UAZKo+aU
 oVlpHX6VL8tvmCHa5EXpJuUZ4jx2L6Pc+K9xvlOLXTyqDOejOv/2H4QAdnVdoq4UpCtcfj5J+lbUz
 UKiSWnag87oDBqpqPUwNg56ZxuoNtXhMqTcBDCWIv596qllOm93uoKi9I8eBrXA6vhuc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=l8vq7Ephty8waJliBJyToxWKbVnmNFOZqyFjlNhMVAM=; b=QOdC6Ft9VUPWmPYDDmxzU6sqn9
 +l7Mx0NLUAJx/civbwoflc1SflNqo2NT2TVTuiFLgF66eMPDLxkeOxMNO+yt3qGYX/IiVtaMyfyiU
 fa2fjkKzzzDlkPTyiU3SrI1GElKVRrFZJsJ5bJF5OlBd3bxO/HEEGvPCeZfEi81/hMCA=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q6v2Z-0003M8-In for kgdb-bugreport@lists.sourceforge.net;
 Wed, 07 Jun 2023 15:25:40 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 5568A21A0C;
 Wed,  7 Jun 2023 15:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1686151533; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l8vq7Ephty8waJliBJyToxWKbVnmNFOZqyFjlNhMVAM=;
 b=gA5Hi+3kyRX21TQe8S6G+s8HAKZvfHKZet7d2TjeVuuH8g6gfZ+ixa/NNn3Qyu68bUF8fT
 Car8xAaK+QF9YQD+3ovPkwsUZPIM412RGEmPLiMtc1xH65tsGYwoIAEmbKIUlgwcSB7H9N
 m7sDAhxWGz6g4N0KcSa2PtxIjiiCt/c=
Received: from alley.suse.cz (unknown [10.100.201.202])
 by relay2.suse.de (Postfix) with ESMTP id D10862C141;
 Wed,  7 Jun 2023 15:25:32 +0000 (UTC)
To: Andrew Morton <akpm@linux-foundation.org>,
 Douglas Anderson <dianders@chromium.org>
Date: Wed,  7 Jun 2023 17:24:28 +0200
Message-Id: <20230607152432.5435-4-pmladek@suse.com>
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
 Content preview:  arch_touch_nmi_watchdog() needs a different implementation
 for various hardlockup detector implementations. And it does nothing when
 any hardlockup detector is not build at all. arch_touch_nmi_watchdog() has
 to be declared in linux/nmi.h. It is done directly in this header file for
 the perf and buddy detectors. And it is done in the included asm/linux.h
 for arch specific dete [...] 
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
X-Headers-End: 1q6v2Z-0003M8-In
Subject: [Kgdb-bugreport] [PATCH 3/7] watchdog/hardlockup: Declare
 arch_touch_nmi_watchdog() only in linux/nmi.h
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

arch_touch_nmi_watchdog() needs a different implementation for various
hardlockup detector implementations. And it does nothing when
any hardlockup detector is not build at all.

arch_touch_nmi_watchdog() has to be declared in linux/nmi.h. It is done
directly in this header file for the perf and buddy detectors. And it
is done in the included asm/linux.h for arch specific detectors.

The reason probably is that the arch specific variants build the code
using another conditions. For example, powerpc64/sparc64 builds the code
when CONFIG_PPC_WATCHDOG is enabled.

Another reason might be that these architectures define more functions
in asm/nmi.h anyway.

However the generic code actually knows the information. The config
variables HAVE_NMI_WATCHDOG and HAVE_HARDLOCKUP_DETECTOR_ARCH are used
to decide whether to build the buddy detector.

In particular, CONFIG_HARDLOCKUP_DETECTOR is set only when a generic
or arch-specific hardlockup detector is built. The only exception
is sparc64 which ignores the global HARDLOCKUP_DETECTOR switch.

The information about sparc64 is a bit complicated. The hardlockup
detector is built there when CONFIG_HAVE_NMI_WATCHDOG is set and
CONFIG_HAVE_HARDLOCKUP_DETECTOR_ARCH is not set.

People might wonder whether this change really makes things easier.
The motivation is:

  + The current logic in linux/nmi.h is far from obvious.
    For example, arch_touch_nmi_watchdog() is defined as {} when
    neither CONFIG_HARDLOCKUP_DETECTOR_COUNTS_HRTIMER nor
    CONFIG_HAVE_NMI_WATCHDOG is defined.

  + The change synchronizes the checks in lib/Kconfig.debug and
    in the generic code.

  + It is a step that will help cleaning HAVE_NMI_WATCHDOG related
    checks.

The change should not change the existing behavior.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 arch/powerpc/include/asm/nmi.h |  2 --
 arch/sparc/include/asm/nmi.h   |  1 -
 include/linux/nmi.h            | 13 ++++++++++---
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/nmi.h b/arch/powerpc/include/asm/nmi.h
index 43bfd4de868f..ce25318c3902 100644
--- a/arch/powerpc/include/asm/nmi.h
+++ b/arch/powerpc/include/asm/nmi.h
@@ -3,11 +3,9 @@
 #define _ASM_NMI_H
 
 #ifdef CONFIG_PPC_WATCHDOG
-extern void arch_touch_nmi_watchdog(void);
 long soft_nmi_interrupt(struct pt_regs *regs);
 void watchdog_hardlockup_set_timeout_pct(u64 pct);
 #else
-static inline void arch_touch_nmi_watchdog(void) {}
 static inline void watchdog_hardlockup_set_timeout_pct(u64 pct) {}
 #endif
 
diff --git a/arch/sparc/include/asm/nmi.h b/arch/sparc/include/asm/nmi.h
index 90ee7863d9fe..920dc23f443f 100644
--- a/arch/sparc/include/asm/nmi.h
+++ b/arch/sparc/include/asm/nmi.h
@@ -8,7 +8,6 @@ void nmi_adjust_hz(unsigned int new_hz);
 
 extern atomic_t nmi_active;
 
-void arch_touch_nmi_watchdog(void);
 void start_nmi_watchdog(void *unused);
 void stop_nmi_watchdog(void *unused);
 
diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index b5d0b7ab52fb..b9e816bde14a 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -7,6 +7,8 @@
 
 #include <linux/sched.h>
 #include <asm/irq.h>
+
+/* Arch specific watchdogs might need to share extra watchdog-related APIs. */
 #if defined(CONFIG_HAVE_NMI_WATCHDOG)
 #include <asm/nmi.h>
 #endif
@@ -89,12 +91,17 @@ extern unsigned int hardlockup_panic;
 static inline void hardlockup_detector_disable(void) {}
 #endif
 
-#if defined(CONFIG_HARDLOCKUP_DETECTOR_COUNTS_HRTIMER)
+/* Sparc64 has special implemetantion that is always enabled. */
+#if defined(CONFIG_HARDLOCKUP_DETECTOR) || \
+    (defined(CONFIG_HAVE_NMI_WATCHDOG) && !defined(CONFIG_HAVE_HARDLOCKUP_DETECTOR_ARCH))
 void arch_touch_nmi_watchdog(void);
+#else
+static inline void arch_touch_nmi_watchdog(void) { }
+#endif
+
+#if defined(CONFIG_HARDLOCKUP_DETECTOR_COUNTS_HRTIMER)
 void watchdog_hardlockup_touch_cpu(unsigned int cpu);
 void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs);
-#elif !defined(CONFIG_HAVE_NMI_WATCHDOG)
-static inline void arch_touch_nmi_watchdog(void) { }
 #endif
 
 #if defined(CONFIG_HARDLOCKUP_DETECTOR_PERF)
-- 
2.35.3



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
