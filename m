Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA97D27A43E
	for <lists+kgdb-bugreport@lfdr.de>; Sun, 27 Sep 2020 23:16:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kMe2A-0002a6-LV
	for lists+kgdb-bugreport@lfdr.de; Sun, 27 Sep 2020 21:16:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1kMe28-0002Zt-W7
 for kgdb-bugreport@lists.sourceforge.net; Sun, 27 Sep 2020 21:16:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N+Ii1nMTxqQ3KB5diZSPJLBE7AzX1vOzJWQZljPq00k=; b=Ee7UPtF4tLAV4bsCN+495s4mFp
 RhlCa0A6ZBYZgHmmdg+HJZX7dUsY5PEw4dSmv02zZGp95Cf4sFsjOGVH6ndBRLPxsrfnLZElCXVbs
 afYwHjmHiTAD1LyuJHKmMfEUFLYNrKNR5m8cxTd/v4tq4EpDDrNuJEv0SlRgPJDogIIk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N+Ii1nMTxqQ3KB5diZSPJLBE7AzX1vOzJWQZljPq00k=; b=lBkoPv3j2y8TUkD3ZogQgCide4
 tmHo6xZxiyH4UrGTWz8tkaaeVArMeExbkAErhjex6mnY/GCg+Eh0dXQbtDu9pkQ2f9uP6tO0u2rED
 Uio72ivJI8qEowwYJFdR9VEwcG/UrY8NuT29TUxRuyQ+xR2rJaJ9nHGjlMVO1XHFzlmM=;
Received: from mail-wm1-f68.google.com ([209.85.128.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kMe22-00843T-9o
 for kgdb-bugreport@lists.sourceforge.net; Sun, 27 Sep 2020 21:16:36 +0000
Received: by mail-wm1-f68.google.com with SMTP id e2so4943324wme.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sun, 27 Sep 2020 14:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N+Ii1nMTxqQ3KB5diZSPJLBE7AzX1vOzJWQZljPq00k=;
 b=IzRe0iLcxGVxSWG941aMsPrFaGDAlhFd/0DWKmNS7I3+k9Rs8UszLqf+776SaffdkQ
 iw8OT30UVGAn4LNed6pEQ18id6nyCzVVhe0MGBnPpbUFH5LyDb6nZi6qX0Zp+XTFBv3k
 pTlcZFBfouoLSmyfldSWnGJIXWszAxX3W9VxhfdjwHqAiPX/NOBwgOE0ZiOBaRfRK31v
 JSHtqJ0NsNUS4GOCiXkcOOLuDUGEe1DSRdbhjxsD6FqoqhOHqYaX94MepxMpRD32J8Hc
 sew+85FHUwqbGlAnZLy59HlBvg1ci53RzlzkZvuBhtyomo+bu9hOmtIblasPwvfuMnDG
 r3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N+Ii1nMTxqQ3KB5diZSPJLBE7AzX1vOzJWQZljPq00k=;
 b=US9LN0tjsIcS9l9nnxv0/RdqSrd4AIidRI5CiW4j2LLNR7TKMla8LEtrNHTOloXPr0
 sJKfk4737o5OsVZB81iVv0HYc46D7ZGtEO6bcKeD9hrR6ib1zCUoq7X3WYZZdz+wN6Au
 eEy4JAyYTvZmTj6uYy1/rp8iQeDZzOyN7TU2wc9aryjuSMgCBYF46UM/1cL+zoFI1zW8
 9SJUcJhXphvncQ4zC5eOar9f2mgZ8oRlfht3SC89EUL8wQc8HD8XQyhGrh36fn8f2C9+
 Wd/LxB0LvffWORP+qOSGn0hsXQbMJKwU+aGnMM7yLzqhkgnEk0cGkE32YM0s/r8R4gLD
 k9gQ==
X-Gm-Message-State: AOAM531nTqq5r9lc4hGQ4dd5C6jac4AcNQ7CkYR+zsyy77wDgBQUuMSS
 p1cZ2I2HcVLu3rMFE4cXmhDvIw==
X-Google-Smtp-Source: ABdhPJwi5Uve1dX5mSII74NP7BohO0vivBIUiywg2rM9zTvrjEX3Q5fG1U53TK3YqXK9dTZdIaQk+A==
X-Received: by 2002:a7b:c4d1:: with SMTP id g17mr8161345wmk.167.1601241376739; 
 Sun, 27 Sep 2020 14:16:16 -0700 (PDT)
Received: from wychelm.lan
 (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id s17sm11396676wrr.40.2020.09.27.14.16.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2020 14:16:16 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Douglas Anderson <dianders@chromium.org>
Date: Sun, 27 Sep 2020 22:15:30 +0100
Message-Id: <20200927211531.1380577-3-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200927211531.1380577-1-daniel.thompson@linaro.org>
References: <20200927211531.1380577-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.5 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.68 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.68 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kMe22-00843T-9o
Subject: [Kgdb-bugreport] [PATCH v3 2/3] kgdb: Add NOKPROBE labels on the
 trap handler functions
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, pmladek@suse.com,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 patches@linaro.org, linux-kernel@vger.kernel.org, sergey.senozhatsky@gmail.com,
 Masami Hiramatsu <mhiramat@kernel.org>, will@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Currently kgdb honours the kprobe blocklist but doesn't place its own
trap handling code on the list. Add labels to discourage attempting to
use kgdb to debug itself.

Not every functions that executes from the trap handler needs to be
marked up: relatively early in the trap handler execution (just after
we bring the other CPUs to a halt) all breakpoints are replaced with
the original opcodes. This patch marks up code in the debug_core that
executes between trap entry and the breakpoints being deactivated
and, also, code that executes between breakpoint activation and trap
exit.

To be clear these changes are not sufficient to make recursive trapping
impossible since cover all the library calls made during kgdb's
entry/exit logic. However going much further whilst we are sharing the
kprobe blocklist risks reducing the capabilities of kprobe and this
would be a bad trade off (especially so given kgdb's users are currently
conditioned to avoid recursive traps).

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 kernel/debug/debug_core.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index b1277728a835..faa1f99ce65a 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -177,12 +177,14 @@ int __weak kgdb_arch_set_breakpoint(struct kgdb_bkpt *bpt)
 				 arch_kgdb_ops.gdb_bpt_instr, BREAK_INSTR_SIZE);
 	return err;
 }
+NOKPROBE_SYMBOL(kgdb_arch_set_breakpoint);
 
 int __weak kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt)
 {
 	return copy_to_kernel_nofault((char *)bpt->bpt_addr,
 				  (char *)bpt->saved_instr, BREAK_INSTR_SIZE);
 }
+NOKPROBE_SYMBOL(kgdb_arch_remove_breakpoint);
 
 int __weak kgdb_validate_break_address(unsigned long addr)
 {
@@ -212,6 +214,7 @@ unsigned long __weak kgdb_arch_pc(int exception, struct pt_regs *regs)
 {
 	return instruction_pointer(regs);
 }
+NOKPROBE_SYMBOL(kgdb_arch_pc);
 
 int __weak kgdb_arch_init(void)
 {
@@ -222,6 +225,7 @@ int __weak kgdb_skipexception(int exception, struct pt_regs *regs)
 {
 	return 0;
 }
+NOKPROBE_SYMBOL(kgdb_skipexception);
 
 #ifdef CONFIG_SMP
 
@@ -243,6 +247,7 @@ void __weak kgdb_call_nmi_hook(void *ignored)
 	 */
 	kgdb_nmicallback(raw_smp_processor_id(), get_irq_regs());
 }
+NOKPROBE_SYMBOL(kgdb_call_nmi_hook);
 
 void __weak kgdb_roundup_cpus(void)
 {
@@ -276,6 +281,7 @@ void __weak kgdb_roundup_cpus(void)
 			kgdb_info[cpu].rounding_up = false;
 	}
 }
+NOKPROBE_SYMBOL(kgdb_roundup_cpus);
 
 #endif
 
@@ -302,6 +308,7 @@ static void kgdb_flush_swbreak_addr(unsigned long addr)
 	/* Force flush instruction cache if it was outside the mm */
 	flush_icache_range(addr, addr + BREAK_INSTR_SIZE);
 }
+NOKPROBE_SYMBOL(kgdb_flush_swbreak_addr);
 
 /*
  * SW breakpoint management:
@@ -329,6 +336,7 @@ int dbg_activate_sw_breakpoints(void)
 	}
 	return ret;
 }
+NOKPROBE_SYMBOL(dbg_activate_sw_breakpoints);
 
 int dbg_set_sw_break(unsigned long addr)
 {
@@ -392,6 +400,7 @@ int dbg_deactivate_sw_breakpoints(void)
 	}
 	return ret;
 }
+NOKPROBE_SYMBOL(dbg_deactivate_sw_breakpoints);
 
 int dbg_remove_sw_break(unsigned long addr)
 {
@@ -513,6 +522,7 @@ static int kgdb_io_ready(int print_wait)
 	}
 	return 1;
 }
+NOKPROBE_SYMBOL(kgdb_io_ready);
 
 static int kgdb_reenter_check(struct kgdb_state *ks)
 {
@@ -560,6 +570,7 @@ static int kgdb_reenter_check(struct kgdb_state *ks)
 
 	return 1;
 }
+NOKPROBE_SYMBOL(kgdb_reenter_check);
 
 static void dbg_touch_watchdogs(void)
 {
@@ -567,6 +578,7 @@ static void dbg_touch_watchdogs(void)
 	clocksource_touch_watchdog();
 	rcu_cpu_stall_reset();
 }
+NOKPROBE_SYMBOL(dbg_touch_watchdogs);
 
 static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
 		int exception_state)
@@ -798,6 +810,7 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
 
 	return kgdb_info[cpu].ret_state;
 }
+NOKPROBE_SYMBOL(kgdb_cpu_enter);
 
 /*
  * kgdb_handle_exception() - main entry point from a kernel exception
@@ -842,6 +855,7 @@ kgdb_handle_exception(int evector, int signo, int ecode, struct pt_regs *regs)
 		arch_kgdb_ops.enable_nmi(1);
 	return ret;
 }
+NOKPROBE_SYMBOL(kgdb_handle_exception);
 
 /*
  * GDB places a breakpoint at this function to know dynamically loaded objects.
@@ -876,6 +890,7 @@ int kgdb_nmicallback(int cpu, void *regs)
 #endif
 	return 1;
 }
+NOKPROBE_SYMBOL(kgdb_nmicallback);
 
 int kgdb_nmicallin(int cpu, int trapnr, void *regs, int err_code,
 							atomic_t *send_ready)
@@ -901,6 +916,7 @@ int kgdb_nmicallin(int cpu, int trapnr, void *regs, int err_code,
 #endif
 	return 1;
 }
+NOKPROBE_SYMBOL(kgdb_nmicallin);
 
 static void kgdb_console_write(struct console *co, const char *s,
    unsigned count)
-- 
2.25.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
