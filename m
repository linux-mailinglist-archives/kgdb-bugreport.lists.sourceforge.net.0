Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B594268BA0
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 14 Sep 2020 15:02:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kHo7g-0004Uk-7R
	for lists+kgdb-bugreport@lfdr.de; Mon, 14 Sep 2020 13:02:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1kHo7e-0004UL-4l
 for kgdb-bugreport@lists.sourceforge.net; Mon, 14 Sep 2020 13:02:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NBc+524mNMySIXGyBF0ZKFskAXcAly2eLLkxj4mn+0Q=; b=I4t36+T9jkcT93Q+14by4G0Z7u
 tn+QtehIXFLj/evWgazAWT8DvDleUb5eW6slAOkPJzvZngRKkGdCrHg84kqHwaxSranVNH32fyHBH
 BnAbz5kZoIr43L5FLp4vJeqG7uYMyM9vygKC/fvsiwCscRGDaE/ag2Pr67tc2VpaAqZs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NBc+524mNMySIXGyBF0ZKFskAXcAly2eLLkxj4mn+0Q=; b=WtKERJZU0B8MSg1pRGzg9EPizl
 QGok1Q9xDvCo0LYLyitT50Bmgr5ywBFJE8QuBPUbmlVhL0fNQ6sYrDnlKm614AyrSUJSW8UsQzwgf
 upUjkjfb79BMGdaaTnYUHn9t+pJ9iBTEI0+pQgzKEgVdLuJcH7I4JA4UvszRHwoK+mDk=;
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kHo7W-008PXJ-D9
 for kgdb-bugreport@lists.sourceforge.net; Mon, 14 Sep 2020 13:02:18 +0000
Received: by mail-wr1-f68.google.com with SMTP id t10so18667663wrv.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 14 Sep 2020 06:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NBc+524mNMySIXGyBF0ZKFskAXcAly2eLLkxj4mn+0Q=;
 b=wW//ZSe6q99e6l33yqQ0bv9yrvassnq7qwZRgFmB3tl5KWNCuLqKteAKnwijt+a7M4
 RSOJCituZMcaXRkqRQ+SRT6J4ASyMHxdQFmS0L5pfONjKlLWGM+zXRYRhQT/7Vn9Xkxw
 1aIZa7RfhcW39YkRlDXTFvXugx0sEaAKqJGvaN+UVce/RUL+FahnGAm2Iyop8CYrrqZx
 bk8iZ5tUfH+ksOynOz+ZqTp7aa8Qm5MMTOSsq09VpPAI9wOpC0jz6sSRG45t+kGtsJCE
 mVNE6KEkrQTEeNSJRDmweR9U7pDvTGTCHcKTdrLTfkkmuyrlKyYey17h6QfKd1CDKBcW
 H4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NBc+524mNMySIXGyBF0ZKFskAXcAly2eLLkxj4mn+0Q=;
 b=mxBxCYCAAqTbnXb2Sg8hO8HtxFNHNn1/KVdqZA/0MeR6TgFsBJ2G3d0DKCE99cXtuA
 1ju5ifAGhSPrnG0fXL49St9u+DnM3Qfrxd+PhWN4vjTe3MfK0AsalG3BGNgCCqg594O4
 rIEJpXonyx1B8hWEwiJs3sPLs4AiCqT/mA1ZUx/nhqLtSM3qSTY0/L6xWxKO0bvQPh/Z
 LgylBmr3t/NthQdkDhPE8ij5jsVjF5dECMp1Ufma8R3YPdDFi3i//b7LxeORlnm2/APr
 YQA4iz20lTdHqgXrvra44MpOcHS1nzxEpNyILI89ohOhLbhDDiG4CGPxP0veMd9pdd86
 2fbQ==
X-Gm-Message-State: AOAM531Hmx8wlmrYYuIkIY2OXGVORvnhmrgpar6tM1kwRxcymB+8s96C
 HkSp0TBo4Qoe1iaeO6itEKMVFA==
X-Google-Smtp-Source: ABdhPJx0l/sd/ukowq4I6JNlM0FlvEF8p/b6PwzlqUyLsn2dcKfjzKGIpoDUNVbkTK7sLhad++59xw==
X-Received: by 2002:adf:9b8b:: with SMTP id d11mr8024287wrc.71.1600088524074; 
 Mon, 14 Sep 2020 06:02:04 -0700 (PDT)
Received: from wychelm.lan
 (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id t6sm23420983wre.30.2020.09.14.06.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 06:02:03 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Douglas Anderson <dianders@chromium.org>
Date: Mon, 14 Sep 2020 14:01:42 +0100
Message-Id: <20200914130143.1322802-3-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200914130143.1322802-1-daniel.thompson@linaro.org>
References: <20200914130143.1322802-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.68 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kHo7W-008PXJ-D9
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
 kernel/debug/debug_core.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index b1277728a835..9618c1e2faf6 100644
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
@@ -302,6 +304,7 @@ static void kgdb_flush_swbreak_addr(unsigned long addr)
 	/* Force flush instruction cache if it was outside the mm */
 	flush_icache_range(addr, addr + BREAK_INSTR_SIZE);
 }
+NOKPROBE_SYMBOL(kgdb_flush_swbreak_addr);
 
 /*
  * SW breakpoint management:
@@ -329,6 +332,7 @@ int dbg_activate_sw_breakpoints(void)
 	}
 	return ret;
 }
+NOKPROBE_SYMBOL(dbg_activate_sw_breakpoints);
 
 int dbg_set_sw_break(unsigned long addr)
 {
@@ -392,6 +396,7 @@ int dbg_deactivate_sw_breakpoints(void)
 	}
 	return ret;
 }
+NOKPROBE_SYMBOL(dbg_deactivate_sw_breakpoints);
 
 int dbg_remove_sw_break(unsigned long addr)
 {
@@ -560,6 +565,7 @@ static int kgdb_reenter_check(struct kgdb_state *ks)
 
 	return 1;
 }
+NOKPROBE_SYMBOL(kgdb_reenter_check);
 
 static void dbg_touch_watchdogs(void)
 {
@@ -567,6 +573,7 @@ static void dbg_touch_watchdogs(void)
 	clocksource_touch_watchdog();
 	rcu_cpu_stall_reset();
 }
+NOKPROBE_SYMBOL(dbg_touch_watchdogs);
 
 static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
 		int exception_state)
@@ -798,6 +805,7 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
 
 	return kgdb_info[cpu].ret_state;
 }
+NOKPROBE_SYMBOL(kgdb_cpu_enter);
 
 /*
  * kgdb_handle_exception() - main entry point from a kernel exception
@@ -842,6 +850,7 @@ kgdb_handle_exception(int evector, int signo, int ecode, struct pt_regs *regs)
 		arch_kgdb_ops.enable_nmi(1);
 	return ret;
 }
+NOKPROBE_SYMBOL(kgdb_handle_exception);
 
 /*
  * GDB places a breakpoint at this function to know dynamically loaded objects.
@@ -876,6 +885,7 @@ int kgdb_nmicallback(int cpu, void *regs)
 #endif
 	return 1;
 }
+NOKPROBE_SYMBOL(kgdb_nmicallback);
 
 int kgdb_nmicallin(int cpu, int trapnr, void *regs, int err_code,
 							atomic_t *send_ready)
@@ -901,6 +911,7 @@ int kgdb_nmicallin(int cpu, int trapnr, void *regs, int err_code,
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
