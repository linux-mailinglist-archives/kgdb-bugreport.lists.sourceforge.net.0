Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5131C9BEF
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  7 May 2020 22:16:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jWmwE-0001Qi-IL
	for lists+kgdb-bugreport@lfdr.de; Thu, 07 May 2020 20:16:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jWmwB-0001QJ-P8
 for kgdb-bugreport@lists.sourceforge.net; Thu, 07 May 2020 20:16:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uuDcjL1lMEnT6UzawnshM4BBkOj2mm+JgyKl0NONsQA=; b=hLhXq5iuC5Kxi2w1ubO0+WvKUm
 INcUeU0HcaGuBg1+428Jj0NK/y6iarkUlHvt7FYs1VX/iLZpgIGekqz0jsIz2ONqiHdXpuvG0PlP0
 MOmMRxcvp0qA2nhfkxVxTYU57n3GwWKUlOHP+zh0qPGFOgL2NE5DEPxgyCu8fo+Lgkl8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uuDcjL1lMEnT6UzawnshM4BBkOj2mm+JgyKl0NONsQA=; b=hNIYXVTxsvyaALs+W61J2jvp4V
 xrtMWrFhOCokJaoTmyFab5nHmrqf9PBIDvGRfS9GbmZxqXFdik7CFbY282nmT6igjAvEd/wEabjXL
 ZH4M29PYXkIcvDI5wM6mhNl7aouPtGsX83z1t0ZbIRF3jq+wz0FDYa4wsNmKCrAk7/8Y=;
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jWmw9-00Edlj-O3
 for kgdb-bugreport@lists.sourceforge.net; Thu, 07 May 2020 20:16:07 +0000
Received: by mail-oi1-f195.google.com with SMTP id a2so6187339oia.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 07 May 2020 13:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uuDcjL1lMEnT6UzawnshM4BBkOj2mm+JgyKl0NONsQA=;
 b=Q5+IRrWRWyi5L8PfQ/eJCsNxGRlvbzAdl9s8NMOwoAqI7y+LiJXu1mvDmW4TYS1Ekl
 LX9yEtMPPaIY/Qc89M+pZYPKxLZSAF0hYtmynCE5hY4+ztzWoOCENDLH8yOG6sy3HK5K
 3NevT8J/ulR++Yy7/9cO7LhzsSy7B5UHml2xM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uuDcjL1lMEnT6UzawnshM4BBkOj2mm+JgyKl0NONsQA=;
 b=hArmqxpvcPvuqk+ElW0aXBSwDOl6eQV6+R/zjSN41LzmdcG/DiPvBDiMY2pizPllZQ
 xb+GykQiRz9WkvCa/aBBo3Vq/aC7XKj2oiNiPKiZdNkQLXL4MxhaofWlyOA6dCITgHeN
 d9k4dtXHTm2RTHpAUcupkmvqjAkpG5nk9+zYZ8kmhkWXe4uwbyjf8XeIeNwi+Io+2gSb
 bU8Ns6O68s9ZlP0H1McG1gE7TxaJT91v5hH+aEDLFdDLesDumPrGfeGJMKQD2839WAeR
 eoqYhPWan8QPCCFgU23+ibPxxSEsevPbEy9qGsB6kZS9wS8FIU//AElmnvEtpEZLHH7T
 QlRA==
X-Gm-Message-State: AGi0PuYSM/SuKH4C0RHSdHR3+xKEwi+e0fWUCSopicc7vapMxTFwM9X3
 kuFoTS2d6sp85yGc7zxBTvuVlfsuAjFmBw==
X-Google-Smtp-Source: APiQypIISFH9N6wzShnBcBnOWr7t6p/LFtLUinuD9fbqlLIWQCPAR+3GPh2cBw5yXxb5kcz2T14XBA==
X-Received: by 2002:a17:90b:3443:: with SMTP id
 lj3mr1939202pjb.38.1588882145171; 
 Thu, 07 May 2020 13:09:05 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id d203sm5547601pfd.79.2020.05.07.13.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 13:09:04 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 gregkh@linuxfoundation.org
Date: Thu,  7 May 2020 13:08:42 -0700
Message-Id: <20200507130644.v4.4.I3113aea1b08d8ce36dc3720209392ae8b815201b@changeid>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
In-Reply-To: <20200507200850.60646-1-dianders@chromium.org>
References: <20200507200850.60646-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.195 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWmw9-00Edlj-O3
Subject: [Kgdb-bugreport] [PATCH v4 04/12] kgdb: Delay "kgdbwait" to
 dbg_late_init() by default
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
Cc: x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
 kgdb-bugreport@lists.sourceforge.net, jslaby@suse.com, agross@kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, bjorn.andersson@linaro.org,
 mingo@redhat.com, bp@alien8.de, linux-serial@vger.kernel.org, hpa@zytor.com,
 tglx@linutronix.de, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Using kgdb requires at least some level of architecture-level
initialization.  If nothing else, it relies on the architecture to
pass breakpoints / crashes onto kgdb.

On some architectures this all works super early, specifically it
starts working at some point in time before Linux parses
early_params's.  On other architectures it doesn't.  A survey of a few
platforms:

a) x86: Presumably it all works early since "ekgdboc" is documented to
   work here.
b) arm64: Catching crashes works; with a simple patch breakpoints can
   also be made to work.
c) arm: Nothing in kgdb works until
   paging_init() -> devicemaps_init() -> early_trap_init()

Let's be conservative and, by default, process "kgdbwait" (which tells
the kernel to drop into the debugger ASAP at boot) a bit later at
dbg_late_init() time.  If an architecture has tested it and wants to
re-enable super early debugging, they can select the
ARCH_HAS_EARLY_DEBUG KConfig option.  We'll do this for x86 to start.
It should be noted that dbg_late_init() is still called quite early in
the system.

Note that this patch doesn't affect when kgdb runs its init.  If kgdb
is set to initialize early it will still initialize when parsing
early_param's.  This patch _only_ inhibits the initial breakpoint from
"kgdbwait".  This means:

* Without any extra patches arm64 platforms will at least catch
  crashes after kgdb inits.
* arm platforms will catch crashes (and could handle a hardcoded
  kgdb_breakpoint()) any time after early_trap_init() runs, even
  before dbg_late_init().

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---

Changes in v4:
- Add "if KGDB" to "select ARCH_HAS_EARLY_DEBUG" in Kconfig.

Changes in v3:
- Change boolean weak function to KConfig.

Changes in v2: None

 arch/x86/Kconfig          |  1 +
 kernel/debug/debug_core.c | 25 +++++++++++++++----------
 lib/Kconfig.kgdb          | 18 ++++++++++++++++++
 3 files changed, 34 insertions(+), 10 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 1197b5596d5a..5f44955ee21c 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -60,6 +60,7 @@ config X86
 	select ARCH_HAS_ACPI_TABLE_UPGRADE	if ACPI
 	select ARCH_HAS_DEBUG_VIRTUAL
 	select ARCH_HAS_DEVMEM_IS_ALLOWED
+	select ARCH_HAS_EARLY_DEBUG		if KGDB
 	select ARCH_HAS_ELF_RANDOMIZE
 	select ARCH_HAS_FAST_MULTIPLIER
 	select ARCH_HAS_FILTER_PGPROT
diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 950dc667c823..503c1630ca76 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -950,6 +950,14 @@ void kgdb_panic(const char *msg)
 	kgdb_breakpoint();
 }
 
+static void kgdb_initial_breakpoint(void)
+{
+	kgdb_break_asap = 0;
+
+	pr_crit("Waiting for connection from remote gdb...\n");
+	kgdb_breakpoint();
+}
+
 void __weak kgdb_arch_late(void)
 {
 }
@@ -960,6 +968,9 @@ void __init dbg_late_init(void)
 	if (kgdb_io_module_registered)
 		kgdb_arch_late();
 	kdb_init(KDB_INIT_FULL);
+
+	if (kgdb_io_module_registered && kgdb_break_asap)
+		kgdb_initial_breakpoint();
 }
 
 static int
@@ -1055,14 +1066,6 @@ void kgdb_schedule_breakpoint(void)
 }
 EXPORT_SYMBOL_GPL(kgdb_schedule_breakpoint);
 
-static void kgdb_initial_breakpoint(void)
-{
-	kgdb_break_asap = 0;
-
-	pr_crit("Waiting for connection from remote gdb...\n");
-	kgdb_breakpoint();
-}
-
 /**
  *	kgdb_register_io_module - register KGDB IO module
  *	@new_dbg_io_ops: the io ops vector
@@ -1099,7 +1102,8 @@ int kgdb_register_io_module(struct kgdb_io *new_dbg_io_ops)
 	/* Arm KGDB now. */
 	kgdb_register_callbacks();
 
-	if (kgdb_break_asap)
+	if (kgdb_break_asap &&
+	    (!dbg_is_early || IS_ENABLED(CONFIG_ARCH_HAS_EARLY_DEBUG)))
 		kgdb_initial_breakpoint();
 
 	return 0;
@@ -1169,7 +1173,8 @@ static int __init opt_kgdb_wait(char *str)
 	kgdb_break_asap = 1;
 
 	kdb_init(KDB_INIT_EARLY);
-	if (kgdb_io_module_registered)
+	if (kgdb_io_module_registered &&
+	    IS_ENABLED(CONFIG_ARCH_HAS_EARLY_DEBUG))
 		kgdb_initial_breakpoint();
 
 	return 0;
diff --git a/lib/Kconfig.kgdb b/lib/Kconfig.kgdb
index 933680b59e2d..ffa7a76de086 100644
--- a/lib/Kconfig.kgdb
+++ b/lib/Kconfig.kgdb
@@ -124,4 +124,22 @@ config KDB_CONTINUE_CATASTROPHIC
 	  CONFIG_KDB_CONTINUE_CATASTROPHIC == 2. KDB forces a reboot.
 	  If you are not sure, say 0.
 
+config ARCH_HAS_EARLY_DEBUG
+	bool
+	default n
+	help
+	  If an architecture can definitely handle entering the debugger
+	  when early_param's are parsed then it select this config.
+	  Otherwise, if "kgdbwait" is passed on the kernel command line it
+	  won't actually be processed until dbg_late_init() just after the
+	  call to kgdb_arch_late() is made.
+
+	  NOTE: Even if this isn't selected by an architecture we will
+	  still try to register kgdb to handle breakpoints and crashes
+	  when early_param's are parsed, we just won't act on the
+	  "kgdbwait" parameter until dbg_late_init().  If you get a
+	  crash and try to drop into kgdb somewhere between these two
+	  places you might or might not end up being able to use kgdb
+	  depending on exactly how far along the architecture has initted.
+
 endif # KGDB
-- 
2.26.2.645.ge9eca65c58-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
