Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AC81BCE8E
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 28 Apr 2020 23:22:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jTXg0-0004jM-2s
	for lists+kgdb-bugreport@lfdr.de; Tue, 28 Apr 2020 21:22:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jTXfz-0004jE-4f
 for kgdb-bugreport@lists.sourceforge.net; Tue, 28 Apr 2020 21:21:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Zwcs/NkLq95zqZaSm8RhNaZwqTrfyhuCZH3pwbYiBUo=; b=KihcVeLxUa54y1FsCUuy278ofd
 90BZdc/957Jd6nZ7s7F0izrTuu43OajapH4pjXPWR9S2ebDUwnrm0BZ9gaftNtURP3lj3BD0ge+H+
 gheWVBzu7fhO3XhESl5Myfg5eGfPA+sHlRVG1WJXAd6/XgrKsmjpRSaHdDf2WB7QqTrA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Zwcs/NkLq95zqZaSm8RhNaZwqTrfyhuCZH3pwbYiBUo=; b=PMOldvPDfayJxq6mAhO3ybpxQ7
 aJXy5VqohgJoIRi91t7rOH0DILVeLnuTPjC8qp7Nf0m+FcYcee8E7bg3O/TDqawArdyw+ElNiSwi/
 welhbxgDG9OJTSH3sqfc2mpNL6rENi0j3nFoq2l3lbKxadtX2ohASgoc/cTgzzz21Ehw=;
Received: from mail-pf1-f196.google.com ([209.85.210.196])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jTXfw-00FVBb-V4
 for kgdb-bugreport@lists.sourceforge.net; Tue, 28 Apr 2020 21:21:58 +0000
Received: by mail-pf1-f196.google.com with SMTP id p25so11422987pfn.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 28 Apr 2020 14:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zwcs/NkLq95zqZaSm8RhNaZwqTrfyhuCZH3pwbYiBUo=;
 b=Uk3WzHwDQPuAQdpIeHcxfPluBGirtEqb2OpNTAv0EwZaAVY9vxBaSbCo3JuH7ABsB0
 pXmIIGfPWYh4IxQ+qPvD4IpnhltewOD+ccywdEDiXkzvM67szc120HCBLhUMYYODpYKh
 AC4/ZsGE47AzZ0nNDjWxQRF8T3KL1QjkEtlTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zwcs/NkLq95zqZaSm8RhNaZwqTrfyhuCZH3pwbYiBUo=;
 b=T0556HaXYVx9cYy4qtNpMp3gpLtvRdITx8Sl+gTTfk90FeQ4Blthf18kMwBHsgvGMp
 UECzTBHSH8MUzhSZ+amii/XqSC4aj3gU6gvsmyiz95T6b5lBZG5XR/AtytM9S1uNvl/G
 ymi8ZrNii01mXAKe3Hd466M3jmw2X2RtLAiBenkuZfQpE9pKQ3zLTToZ9dvjUO9XCPnD
 /JI7F+aF6wXQMVVOvkw0rQQskDZUrIy9DXC0MjwAkrXOzq+LdG4lRxhgVzXQgCaITlgj
 2ln0z2U/jAs1z2dD0EDym7uFSuNdc9LQx1Axq9NYNtEfVEesbIw8CLrsw1419CnnHbtb
 6/Mw==
X-Gm-Message-State: AGi0PublCzyY6JC8TiQu/gegfaxgp53P5bemzUHts3m9GyLdQkEGjChh
 qurJEtkCiOJ4UAT4MhzbLPkP//MrJmhVsg==
X-Google-Smtp-Source: APiQypKrcWKCXbPnKuIz5kKKz4UPRY/n/60CfjhMiPWwkXMN7SJz6L6xsYIXtxYuS+Wm/4tEYJsYrg==
X-Received: by 2002:a17:902:a585:: with SMTP id
 az5mr17296667plb.334.1588108463389; 
 Tue, 28 Apr 2020 14:14:23 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id 18sm2988202pjf.30.2020.04.28.14.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 14:14:22 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 gregkh@linuxfoundation.org
Date: Tue, 28 Apr 2020 14:13:44 -0700
Message-Id: <20200428141218.v3.4.I3113aea1b08d8ce36dc3720209392ae8b815201b@changeid>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
In-Reply-To: <20200428211351.85055-1-dianders@chromium.org>
References: <20200428211351.85055-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.196 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jTXfw-00FVBb-V4
Subject: [Kgdb-bugreport] [PATCH v3 04/11] kgdb: Delay "kgdbwait" to
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
Cc: x86@kernel.org, Andrew Morton <akpm@linux-foundation.org>, corbet@lwn.net,
 kgdb-bugreport@lists.sourceforge.net, hpa@zytor.com,
 Krzysztof Kozlowski <krzk@kernel.org>, bjorn.andersson@linaro.org,
 agross@kernel.org, bp@alien8.de, linux-serial@vger.kernel.org,
 catalin.marinas@arm.com, jslaby@suse.com, tglx@linutronix.de, will@kernel.org,
 mingo@redhat.com, linux-kernel@vger.kernel.org
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

Changes in v3:
- Change boolean weak function to KConfig.

Changes in v2: None

 arch/x86/Kconfig          |  1 +
 kernel/debug/debug_core.c | 25 +++++++++++++++----------
 lib/Kconfig.kgdb          | 18 ++++++++++++++++++
 3 files changed, 34 insertions(+), 10 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 1197b5596d5a..4b8c4c15a59d 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -60,6 +60,7 @@ config X86
 	select ARCH_HAS_ACPI_TABLE_UPGRADE	if ACPI
 	select ARCH_HAS_DEBUG_VIRTUAL
 	select ARCH_HAS_DEVMEM_IS_ALLOWED
+	select ARCH_HAS_EARLY_DEBUG
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
2.26.2.303.gf8c07b1a785-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
