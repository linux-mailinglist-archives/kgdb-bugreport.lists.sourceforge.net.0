Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C065F1D22B7
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 14 May 2020 01:07:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jZ0Sv-0004K7-Ii
	for lists+kgdb-bugreport@lfdr.de; Wed, 13 May 2020 23:07:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jZ0Su-0004K0-Dk
 for kgdb-bugreport@lists.sourceforge.net; Wed, 13 May 2020 23:07:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yMogoehN6gd8yEcUzfto82bogvcHTiAGCMH4pO/0ves=; b=ka/CUcf8loXoTlwykpX8YtZOIe
 kVfNM0eCEkIcK5o6cGHp6/HlRkSU+5GQ3oD6Mz+Y7mbXpvyZfzDF07EIEgSUWD9B/K7aYTvd4f0GC
 nDxgYszrwNaoGKF0G+Yvu3gwsOgkFKQkjjIBwTSsMFxUBBC2SJXB43GL6vbi9G0Xtrxw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=yMogoehN6gd8yEcUzfto82bogvcHTiAGCMH4pO/0ves=; b=P
 pMH1WlueZCHP1L7jGBLou1KjrxZwUuokOvW1xvgJCHaX92cbO19f3sVta1chESTUASjNQgPaRcVoX
 kqngSUo3fKBZHtZaJVgpJq1z6kJCw1XB6eDVW+yzE1+SnjNGlN7Nd1h0ARbK/ZIDivAWxAQg0hcq1
 CxKd0RUKxSBtbyxQ=;
Received: from mail-pg1-f194.google.com ([209.85.215.194])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jZ0Ss-0099xr-1Y
 for kgdb-bugreport@lists.sourceforge.net; Wed, 13 May 2020 23:07:04 +0000
Received: by mail-pg1-f194.google.com with SMTP id f4so402036pgi.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 13 May 2020 16:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yMogoehN6gd8yEcUzfto82bogvcHTiAGCMH4pO/0ves=;
 b=TVjmeJRT30wG3o5oee/nQvtjayTS9UEmO1IKTN3/YROyngl0ARUX+gqTeIneHeojqM
 gYBxNYwyp5blo8Rorot/HCMhVM8Rsy7slg+/x8RdQoCiT11cFofCu+3DTSKptK731mBX
 yq4/rABaceMa8DkAadYUlzIg9W0ocTQiCTsT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yMogoehN6gd8yEcUzfto82bogvcHTiAGCMH4pO/0ves=;
 b=WA8m4Lb8R3kMwOiBFVWRSaoU5MKBSGI9tTasaHg4IeMpMQKLC837XNZ4pTcGT15uCH
 amV3q8DKfVlQCbkuy9vq7uDmDeMEQvTyopI1s3C9XVXYgn57Y6tQuk0aTvZP4XZtZS8K
 gDhnP2ApNiysUL6io1+XZqwpbiL108C2/mmRawymUI0ccsv/ty77Bk+2YLnLDZa/EBSB
 z4qEiftD6uPGK51Drxb3loQXJGHUy+ypUhMOfrO8YypYl+cLanD0UBUFTU1kgZnRLWn6
 0GViIO6dA+h5ibhFiq5wZtLltUMbFEXMcfYPgWbJ/+pZOeggIbt2TrSbf9u60Mb9aPzs
 0dsg==
X-Gm-Message-State: AOAM5325iAerXIKhsSbg9ZuIuhh5p2H1jua15Q1hdeKMXj5O9xk7dN/h
 1yV5n/6xkiUnNbXukUhOJUhJiQ==
X-Google-Smtp-Source: ABdhPJzzVabiFt1inZIi4trNKtrwiawtGgHCOPmCLYH5yl1Fukr15nZDmHm+dhqQ3Y059dh1zVOT2w==
X-Received: by 2002:a63:3545:: with SMTP id c66mr1444745pga.82.1589411216357; 
 Wed, 13 May 2020 16:06:56 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id d184sm513936pfc.130.2020.05.13.16.06.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 16:06:55 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>
Date: Wed, 13 May 2020 16:06:37 -0700
Message-Id: <20200513160501.1.I0b5edf030cc6ebef6ab4829f8867cdaea42485d8@changeid>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.194 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jZ0Ss-0099xr-1Y
Subject: [Kgdb-bugreport] [PATCH] arm64: Call debug_traps_init() from
 trap_init() to help early kgdb
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Enrico Weigelt <info@metux.net>, kgdb-bugreport@lists.sourceforge.net,
 jinho lim <jordan.lim@samsung.com>, linux-kernel@vger.kernel.org,
 Alexios Zavras <alexios.zavras@intel.com>, James Morse <james.morse@arm.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 liwei391@huawei.com, Dave Martin <Dave.Martin@arm.com>,
 Allison Randal <allison@lohutok.net>, Masami Hiramatsu <mhiramat@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

A new kgdb feature will soon land (kgdb_earlycon) that lets us run
kgdb much earlier.  In order for everything to work properly it's
important that the break hook is setup by the time we process
"kgdbwait".

Right now the break hook is setup in debug_traps_init() and that's
called from arch_initcall().  That's a bit too late since
kgdb_earlycon really needs things to be setup by the time the system
calls dbg_late_init().

We could fix this by adding call_break_hook() into early_brk64() and
that works fine.  However, it's a little ugly.  Instead, let's just
add a call to debug_traps_init() straight from trap_init().  There's
already a documented dependency between trap_init() and
debug_traps_init() and this makes the dependency more obvious rather
than just relying on a comment.

NOTE: this solution isn't early enough to let us select the
"ARCH_HAS_EARLY_DEBUG" KConfig option that is introduced by the
kgdb_earlycon patch series.  That would only be set if we could do
breakpoints when early params are parsed.  This patch only enables
"late early" breakpoints, AKA breakpoints when dbg_late_init() is
called.  It's expected that this should be fine for most people.

It should also be noted that if you crash you can still end up in kgdb
earlier than debug_traps_init().  Since you don't need breakpoints to
debug a crash that's fine.

Suggested-by: Will Deacon <will@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
---
This replaces the patch ("arm64: Add call_break_hook() to
early_brk64() for early kgdb") in my recent kgdb series [1].  If I end
up re-posting that series again I'll include this patch as a
replacement, but I'm sending it separately to avoid spamming a pile of
people another time with a 12-patch series.

Note that, because it doesn't select the "ARCH_HAS_EARLY_DEBUG"
KConfig option it could be landed standalone.  However, it's still
probably better to land together with that patch series.

If the kgdb_earlycon patch series lands without this patch then
kgdbwait + kgdb_earlycon won't work well on arm64, but there would be
no other bad side effects.

If this patch lands without the kgdb_earlycon patch series then there
will be no known problems.

[1] https://lore.kernel.org/r/20200507130644.v4.5.I22067ad43e77ddfd4b64c2d49030628480f9e8d9@changeid

 arch/arm64/include/asm/debug-monitors.h | 2 ++
 arch/arm64/kernel/debug-monitors.c      | 4 +---
 arch/arm64/kernel/traps.c               | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/debug-monitors.h b/arch/arm64/include/asm/debug-monitors.h
index 7619f473155f..e5ceea213e39 100644
--- a/arch/arm64/include/asm/debug-monitors.h
+++ b/arch/arm64/include/asm/debug-monitors.h
@@ -125,5 +125,7 @@ static inline int reinstall_suspended_bps(struct pt_regs *regs)
 
 int aarch32_break_handler(struct pt_regs *regs);
 
+void debug_traps_init(void);
+
 #endif	/* __ASSEMBLY */
 #endif	/* __ASM_DEBUG_MONITORS_H */
diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
index 48222a4760c2..15e80c876d46 100644
--- a/arch/arm64/kernel/debug-monitors.c
+++ b/arch/arm64/kernel/debug-monitors.c
@@ -376,15 +376,13 @@ int aarch32_break_handler(struct pt_regs *regs)
 }
 NOKPROBE_SYMBOL(aarch32_break_handler);
 
-static int __init debug_traps_init(void)
+void __init debug_traps_init(void)
 {
 	hook_debug_fault_code(DBG_ESR_EVT_HWSS, single_step_handler, SIGTRAP,
 			      TRAP_TRACE, "single-step handler");
 	hook_debug_fault_code(DBG_ESR_EVT_BRK, brk_handler, SIGTRAP,
 			      TRAP_BRKPT, "ptrace BRK handler");
-	return 0;
 }
-arch_initcall(debug_traps_init);
 
 /* Re-enable single step for syscall restarting. */
 void user_rewind_single_step(struct task_struct *task)
diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index cf402be5c573..8408e8670f2e 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -1047,11 +1047,11 @@ int __init early_brk64(unsigned long addr, unsigned int esr,
 	return bug_handler(regs, esr) != DBG_HOOK_HANDLED;
 }
 
-/* This registration must happen early, before debug_traps_init(). */
 void __init trap_init(void)
 {
 	register_kernel_break_hook(&bug_break_hook);
 #ifdef CONFIG_KASAN_SW_TAGS
 	register_kernel_break_hook(&kasan_break_hook);
 #endif
+	debug_traps_init();
 }
-- 
2.26.2.645.ge9eca65c58-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
