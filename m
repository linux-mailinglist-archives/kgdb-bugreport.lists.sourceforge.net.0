Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D4772646A
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  7 Jun 2023 17:26:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q6v3I-0002Fo-BW
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 07 Jun 2023 15:26:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1q6v3G-0002Fi-ND
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 07 Jun 2023 15:26:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UpwWRWvSJqy3T03ZY2JlbzZD9kWCp/NCykWW9d7sd1g=; b=CVNcOnqrIsXw1oTtgQrIr7f5mH
 MXqzg9dSu0Ay3ShMW3pggl1ZHonZKpxnEYQwORT9ScF0zHACvGjpN7k+AgwQ0TBCjphHg0AmnWCs0
 sYn4+ZeiWfLP999vZaSd/UQLc3tH56iZmw1S+dkiQ/3t4LkxMiht9ltLNdQLJAmL/XCI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UpwWRWvSJqy3T03ZY2JlbzZD9kWCp/NCykWW9d7sd1g=; b=ddic20gQtCHuqrGRPPJRMuHg3j
 4htfXuExndzqh5vV2zB+G7TKjsjPp7X68Tc02deriIDM21xWaPaYt78ECYcBcmq13g0vp6aWyO86I
 TYBrE0+hyfDtcjcJrMuybC9e4R00AqDNSK7esYF9utOU7hynd7P7RBY8XVJpebXDt6k4=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q6v3G-00DqHc-73 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 07 Jun 2023 15:26:22 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 02A9B21A11;
 Wed,  7 Jun 2023 15:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1686151576; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UpwWRWvSJqy3T03ZY2JlbzZD9kWCp/NCykWW9d7sd1g=;
 b=ror0Tusl1A4DBNmBYTkOot8hbHrSVjNcZ9FY2pwERAt1+clj7LJkXRHFWMQ/23qz+0TP6T
 L0Y2STOeyZIftm9lb1yBJvu8qGmXXlOBCaK3kgHnHLaI2SmmyG+svuxj+aX4dSbodUZupp
 j9a3mj67Hm7ygPMkrSlCW5O0X/eWAyU=
Received: from alley.suse.cz (unknown [10.100.201.202])
 by relay2.suse.de (Postfix) with ESMTP id 823902C141;
 Wed,  7 Jun 2023 15:26:15 +0000 (UTC)
To: Andrew Morton <akpm@linux-foundation.org>,
 Douglas Anderson <dianders@chromium.org>
Date: Wed,  7 Jun 2023 17:24:32 +0200
Message-Id: <20230607152432.5435-8-pmladek@suse.com>
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
 Content preview:  The HAVE_ prefix means that the code could be enabled. Add
 another variable for HAVE_HARDLOCKUP_DETECTOR_ARCH without this prefix. It
 will be set when it should be built. It will make it compatible wi [...] 
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
X-Headers-End: 1q6v3G-00DqHc-73
Subject: [Kgdb-bugreport] [PATCH 7/7] watchdog/hardlockup: Define
 HARDLOCKUP_DETECTOR_ARCH
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
variable for HAVE_HARDLOCKUP_DETECTOR_ARCH without this prefix.
It will be set when it should be built. It will make it compatible
with the other hardlockup detectors.

The change allows to clean up dependencies of PPC_WATCHDOG
and HAVE_HARDLOCKUP_DETECTOR_PERF definitions for powerpc.

As a result HAVE_HARDLOCKUP_DETECTOR_PERF has the same dependencies
on arm, x86, powerpc architectures.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 arch/powerpc/Kconfig | 5 ++---
 include/linux/nmi.h  | 2 +-
 lib/Kconfig.debug    | 9 +++++++++
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 539d1f03ff42..987e730740d7 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -90,8 +90,7 @@ config NMI_IPI
 
 config PPC_WATCHDOG
 	bool
-	depends on HARDLOCKUP_DETECTOR
-	depends on HAVE_HARDLOCKUP_DETECTOR_ARCH
+	depends on HARDLOCKUP_DETECTOR_ARCH
 	default y
 	help
 	  This is a placeholder when the powerpc hardlockup detector
@@ -240,7 +239,7 @@ config PPC
 	select HAVE_GCC_PLUGINS			if GCC_VERSION >= 50200   # plugin support on gcc <= 5.1 is buggy on PPC
 	select HAVE_GENERIC_VDSO
 	select HAVE_HARDLOCKUP_DETECTOR_ARCH	if PPC_BOOK3S_64 && SMP
-	select HAVE_HARDLOCKUP_DETECTOR_PERF	if PERF_EVENTS && HAVE_PERF_EVENTS_NMI && !HAVE_HARDLOCKUP_DETECTOR_ARCH
+	select HAVE_HARDLOCKUP_DETECTOR_PERF	if PERF_EVENTS && HAVE_PERF_EVENTS_NMI
 	select HAVE_HW_BREAKPOINT		if PERF_EVENTS && (PPC_BOOK3S || PPC_8xx)
 	select HAVE_IOREMAP_PROT
 	select HAVE_IRQ_TIME_ACCOUNTING
diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index 515d6724f469..ec808ebd36ba 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -9,7 +9,7 @@
 #include <asm/irq.h>
 
 /* Arch specific watchdogs might need to share extra watchdog-related APIs. */
-#if defined(CONFIG_HAVE_HARDLOCKUP_DETECTOR_ARCH) || defined(CONFIG_HARDLOCKUP_DETECTOR_SPARC64)
+#if defined(CONFIG_HARDLOCKUP_DETECTOR_ARCH) || defined(CONFIG_HARDLOCKUP_DETECTOR_SPARC64)
 #include <asm/nmi.h>
 #endif
 
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 116904e65d9f..97853ca54dc7 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1056,6 +1056,7 @@ config HARDLOCKUP_DETECTOR
 	depends on HAVE_HARDLOCKUP_DETECTOR_PERF || HAVE_HARDLOCKUP_DETECTOR_BUDDY || HAVE_HARDLOCKUP_DETECTOR_ARCH
 	imply HARDLOCKUP_DETECTOR_PERF
 	imply HARDLOCKUP_DETECTOR_BUDDY
+	imply HARDLOCKUP_DETECTOR_ARCH
 	select LOCKUP_DETECTOR
 
 	help
@@ -1102,6 +1103,14 @@ config HARDLOCKUP_DETECTOR_BUDDY
 	depends on !HAVE_HARDLOCKUP_DETECTOR_ARCH
 	select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
 
+config HARDLOCKUP_DETECTOR_ARCH
+	bool
+	depends on HARDLOCKUP_DETECTOR
+	depends on HAVE_HARDLOCKUP_DETECTOR_ARCH
+	help
+	  The arch-specific implementation of the hardlockup detector is
+	  available.
+
 #
 # Both the "perf" and "buddy" hardlockup detectors count hrtimer
 # interrupts. This config enables functions managing this common code.
-- 
2.35.3



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
