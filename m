Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C561B31A4
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 21 Apr 2020 23:15:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jR0F0-0007c3-1f
	for lists+kgdb-bugreport@lfdr.de; Tue, 21 Apr 2020 21:15:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jR0Ez-0007bi-03
 for kgdb-bugreport@lists.sourceforge.net; Tue, 21 Apr 2020 21:15:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mJYvH0CE4/wZqoor5a8GmQPL/6GeWa4KAGNJ8Y7uZEA=; b=D7sxDOC9nvQtzQsrEXkivx4nIy
 p3HXCH4/pP23R7cnFWdb3EiadUCbKgCMAYgoYzSp+szdkOAXuhRKiqIUDN+fxj4J6HOlOBqIAO5iy
 wG9T8+cWf9PxiDCbDt2pTJ6aIUt5kB9SSniKav3jRMcQOPxp2q1ZrVvBkQrB7+fSWrWE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mJYvH0CE4/wZqoor5a8GmQPL/6GeWa4KAGNJ8Y7uZEA=; b=ElpYBQ2j2r3Ga7jROaBaZLLSS3
 8VHnZwwB/Ld2GAWu6KFgU1G6M3QYbHl8FV6Mm0Rwr8kMb1a+zl9GQ5YKxV35Q1uJ1SXUw9I8S+1b6
 rywwrfVEOhQkoc2OTYOGHryFtGilfu0/vIXBwYOiLwCB0I9H18P6bb9k+OEgG9GH+5K4=;
Received: from mail-pf1-f196.google.com ([209.85.210.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jR0Er-008sI3-3D
 for kgdb-bugreport@lists.sourceforge.net; Tue, 21 Apr 2020 21:15:36 +0000
Received: by mail-pf1-f196.google.com with SMTP id w65so7184229pfc.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 21 Apr 2020 14:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mJYvH0CE4/wZqoor5a8GmQPL/6GeWa4KAGNJ8Y7uZEA=;
 b=kJd+C8iy2SgY/FLRXeSVkJO+nnv/1XJy9qd6f5ZyeBeyuC32MXYg2CH+onXXoLPo1r
 3EdZjhqsCb9jR3VQqZmIzjos5lIINXu+31S8eaG4KH8oHBIImlJnPftFei+NhUHvL4LV
 W1hnG7L8iG0ikcFUJamvna3SSc1bFgLHEMFjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mJYvH0CE4/wZqoor5a8GmQPL/6GeWa4KAGNJ8Y7uZEA=;
 b=pEV1Q5Ker8jIccPAAqhmy58PCteONGToLPm5TrEeAcf5vLopMfAGOqp/KuWEPnsF5x
 /+g70/nfUM7eONEyyFNxzdRNksPGduIShw4CW1z3KsOVhb+2qpf3JLCTeQc/cfGzvFsb
 pztTDKQtv2MZlvhIH1youwupcYJIrOlWzh/GQfwd7kr7Mw/rAlV0FtZ0CmZAdmmnhYVV
 RUKQIkeU8DxLg9Sty/r+4JNxgXL0YzydZjtyqMG2oe9vLrYeQQ+ePi14NrHlItRwCiZ1
 S9Z7nB6rxyimdarbpst7+6yPsqFKupnWzuS4Pn+lwbcxOd//6Mz9kyMhqdKWBSMJGUvb
 6qZA==
X-Gm-Message-State: AGi0PubL8TUVknab5EDwY2vUSltbYf/mCZ7SCDkT717qtQyuFxJoUDf+
 1KP/5zRcbasorhZxoryBJ1x1AQ==
X-Google-Smtp-Source: APiQypKrAIjcvppHX3VAMktxpR9SjBHsIStBZJyRzzJ6SK0xC6kDonOdrw5X4atf+9cmrdmnE7gllQ==
X-Received: by 2002:a62:7b03:: with SMTP id w3mr17166118pfc.313.1587503723328; 
 Tue, 21 Apr 2020 14:15:23 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id c1sm3287880pfo.152.2020.04.21.14.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 14:15:22 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 gregkh@linuxfoundation.org
Date: Tue, 21 Apr 2020 14:14:42 -0700
Message-Id: <20200421141234.v2.4.I3113aea1b08d8ce36dc3720209392ae8b815201b@changeid>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
In-Reply-To: <20200421211447.193860-1-dianders@chromium.org>
References: <20200421211447.193860-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.196 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jR0Er-008sI3-3D
Subject: [Kgdb-bugreport] [PATCH v2 4/9] kgdb: Delay "kgdbwait" to
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
Cc: x86@kernel.org, Matt Mullins <mmullins@fb.com>, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net, jslaby@suse.com, agross@kernel.org,
 bjorn.andersson@linaro.org, mingo@redhat.com, bp@alien8.de,
 linux-serial@vger.kernel.org, hpa@zytor.com, Nadav Amit <namit@vmware.com>,
 tglx@linutronix.de, Rick Edgecombe <rick.p.edgecombe@intel.com>,
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
re-enable super early debugging, they can implement the weak function
kgdb_arch_can_debug_early() to return true.  We'll do this for x86 to
start.  It should be noted that dbg_late_init() is still called quite
early in the system.

Note that this patch doesn't affect when kgdb runs its init.  If kgdb
is set to initialize early it will still initialize when parsing
early_params's.  This patch _only_ inhibits the initial breakpoint
from "kgdbwait".  This means:

* Without any extra patches arm64 platforms will at least catch
  crashes after kgdb inits.
* arm platforms will catch crashes (and could handle a hardcoded
  kgdb_breakpoint()) any time after early_trap_init() runs, even
  before dbg_late_init().

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
---

Changes in v2: None

 arch/x86/kernel/kgdb.c    |  5 +++++
 include/linux/kgdb.h      | 22 ++++++++++++++++++++++
 kernel/debug/debug_core.c | 29 +++++++++++++++++++----------
 3 files changed, 46 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kernel/kgdb.c b/arch/x86/kernel/kgdb.c
index c44fe7d8d9a4..60c47787c588 100644
--- a/arch/x86/kernel/kgdb.c
+++ b/arch/x86/kernel/kgdb.c
@@ -673,6 +673,11 @@ void kgdb_arch_late(void)
 	}
 }
 
+bool kgdb_arch_can_debug_early(void)
+{
+	return true;
+}
+
 /**
  *	kgdb_arch_exit - Perform any architecture specific uninitalization.
  *
diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
index b072aeb1fd78..7371517aeacc 100644
--- a/include/linux/kgdb.h
+++ b/include/linux/kgdb.h
@@ -226,6 +226,28 @@ extern int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt);
  */
 extern void kgdb_arch_late(void);
 
+/**
+ *	kgdb_arch_can_debug_early - Check if OK to break before dbg_late_init()
+ *
+ *	If an architecture can definitely handle entering the debugger when
+ *	early_param's are parsed then it can override this function to return
+ *	true.  Otherwise if "kgdbwait" is passed on the kernel command line it
+ *	won't actually be processed until dbg_late_init() just after the call
+ *	to kgdb_arch_late() is made.
+ *
+ *	NOTE: Even if this returns false we will still try to register kgdb to
+ *	handle breakpoints and crashes when early_params's are parsed, we just
+ *	won't act on the "kgdbwait" parameter until dbg_late_init().  If you
+ *	get a crash and try to drop into kgdb somewhere between these two
+ *	places you might or might not end up being able to use kgdb depending
+ *	on exactly how far along the architecture has initted.
+ *
+ *	ALSO: dbg_late_init() is actually still fairly early in the system
+ *	boot process.
+ *
+ *	Return: true if platform can handle kgdb early.
+ */
+extern bool kgdb_arch_can_debug_early(void);
 
 /**
  * struct kgdb_arch - Describe architecture specific values.
diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 950dc667c823..8f178239856d 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -950,16 +950,32 @@ void kgdb_panic(const char *msg)
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
 
+bool __weak kgdb_arch_can_debug_early(void)
+{
+	return false;
+}
+
 void __init dbg_late_init(void)
 {
 	dbg_is_early = false;
 	if (kgdb_io_module_registered)
 		kgdb_arch_late();
 	kdb_init(KDB_INIT_FULL);
+
+	if (kgdb_io_module_registered && kgdb_break_asap)
+		kgdb_initial_breakpoint();
 }
 
 static int
@@ -1055,14 +1071,6 @@ void kgdb_schedule_breakpoint(void)
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
@@ -1099,7 +1107,8 @@ int kgdb_register_io_module(struct kgdb_io *new_dbg_io_ops)
 	/* Arm KGDB now. */
 	kgdb_register_callbacks();
 
-	if (kgdb_break_asap)
+	if (kgdb_break_asap &&
+	    (!dbg_is_early || kgdb_arch_can_debug_early()))
 		kgdb_initial_breakpoint();
 
 	return 0;
@@ -1169,7 +1178,7 @@ static int __init opt_kgdb_wait(char *str)
 	kgdb_break_asap = 1;
 
 	kdb_init(KDB_INIT_EARLY);
-	if (kgdb_io_module_registered)
+	if (kgdb_io_module_registered && kgdb_arch_can_debug_early())
 		kgdb_initial_breakpoint();
 
 	return 0;
-- 
2.26.1.301.g55bc3eb7cb9-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
