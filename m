Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 281A81EF8E1
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  5 Jun 2020 15:22:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jhCJ2-0003Fe-Vi
	for lists+kgdb-bugreport@lfdr.de; Fri, 05 Jun 2020 13:22:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jhCIt-0003Eq-3f
 for kgdb-bugreport@lists.sourceforge.net; Fri, 05 Jun 2020 13:22:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B90P5vlRjcmc/HwmlTNh5ez1pbs9ga7qbMLqz94WeAc=; b=JwuaY9Z/ytXiM+iCHUXO61LGPA
 51XGBZcrwiC29iUQJfk/pDaFynF5D9mCrBtTfTXCf0F3ExI3jP5AnQQ75CmOHGMXaHHCW/56wUQ2V
 KBn9/8jzx/nnMVd1ns+424a8n6k0ZFrXEhaJFVwjoaosMJnOQt4Uaz1K3/EDfIQJ1StU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B90P5vlRjcmc/HwmlTNh5ez1pbs9ga7qbMLqz94WeAc=; b=VGSomMP4J9h7xDGJN3obCbphOb
 mhtRHuPdY/KTB0QfwJZWliDAuw3ChQogSLl8EyPAfjiTwCPHvIisCAkREZEs6gBLpZMZvwlOzWA54
 5vtuxhxCvnpNZUKeGZfCmRCUxv91yvZolrNsH5qMt9qJSTMkoaQE1NgbVWQ6EBDYFkfQ=;
Received: from mail-wm1-f65.google.com ([209.85.128.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jhCIq-00Ct79-7Z
 for kgdb-bugreport@lists.sourceforge.net; Fri, 05 Jun 2020 13:22:35 +0000
Received: by mail-wm1-f65.google.com with SMTP id d128so9102040wmc.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 05 Jun 2020 06:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B90P5vlRjcmc/HwmlTNh5ez1pbs9ga7qbMLqz94WeAc=;
 b=YTkZfuzam21k+uBt0acIuHPSgWol4t9gl77sHHb0fCSWzBFXoGCJliwFNTqsttd+AF
 qtG/4YyJse4VKAOpBl7G1blPNzVVKsKoDWzWj4UXjvgAdw8JX29fx0ejWQy08+oKs5Dv
 WprF3Nft8aVQ16a1n1ccsooduEpWognLe1f1P8GiXz3fGs+n1sDxlY2j7pTVqemseUk0
 kG/3KCz5+UlMh7EARDuudE7NV3tPDG1JBMqeRXYWUEOL5BhuPEHCfG3rWnS6tzJHeorJ
 7I8gAiNYwQcv0fx+jJ28f7Z/rJlJDa7HfKq4aPIFZYnKik7nbdG4smPYqqGN7o3UF27Q
 jS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B90P5vlRjcmc/HwmlTNh5ez1pbs9ga7qbMLqz94WeAc=;
 b=YGLkH21iDXQjtIhY7HcgggIfpXwoQZIticCpN2aHxU4XNmo5auG6BQzObI00bXFrcZ
 G8UYyDfXSKGu7phUdOQ1AMHtrTZFjNS5+Ky/wk7rw0DbKAYXg8TwcgqBdZVVki3HIZ+8
 TvwfMsIrgARHCSHK1/JEdKpXjtNrTOKPB074DIL9brJgYtseovBteGJ0mbbnYZ3cFoiE
 PjdDjoM/7q6+ufokArN2mcvkNGiR62mmz3ie+0W6fBCkhHZBEIwWeYd2sojw1tHRYTYp
 xjJ2tSYnyyietQdg4PbQHZJAQU3ySiyyDKyuZPC5oKGKAKqxNz/7cRsMIPufUP2eLkYm
 iCDQ==
X-Gm-Message-State: AOAM531zn6e7geJMkqm7+stn1nNbq9fEvZKXvxjjMXK+VOYAndOFW1Cs
 4uXa8iXyYG3kARUufFR3Dh2Uiw==
X-Google-Smtp-Source: ABdhPJyIAgP4Nu6MeJ5AZk9gWIJ9ycHXjBABtQl48AzXyVO5HV3VWQMGZqu06mldUl+jLuwYIcLGMg==
X-Received: by 2002:a1c:2bc2:: with SMTP id r185mr2853782wmr.49.1591363345886; 
 Fri, 05 Jun 2020 06:22:25 -0700 (PDT)
Received: from wychelm.lan
 (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id 1sm11419211wmz.13.2020.06.05.06.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 06:22:25 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Douglas Anderson <dianders@chromium.org>
Date: Fri,  5 Jun 2020 14:21:29 +0100
Message-Id: <20200605132130.1411255-4-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200605132130.1411255-1-daniel.thompson@linaro.org>
References: <20200605132130.1411255-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jhCIq-00Ct79-7Z
Subject: [Kgdb-bugreport] [RFC PATCH 3/4] kgdb: Add NOKPROBE labels on the
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
 will@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Currently kgdb honours the kprobe blacklist but doesn't place its own
trap handling code on the list. Add macros to discourage attempting to
use kgdb to debug itself.

These changes do not make it impossible to provoke recursive trapping
since they do not cover all the calls that can be made on kgdb's entry
logic. However going much further whilst we are sharing the kprobe
blacklist risks reducing the capabilities of kprobe and this is a bad
trade off (especially so given kgdb's users are currently conditioned to
avoid recursive traps).

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 kernel/debug/debug_core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 4a2df4509fe1..21d1d91da4bb 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -184,6 +184,7 @@ int __weak kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt)
 	return probe_kernel_write((char *)bpt->bpt_addr,
 				  (char *)bpt->saved_instr, BREAK_INSTR_SIZE);
 }
+NOKPROBE_SYMBOL(kgdb_arch_remove_breakpoint);
 
 int __weak kgdb_validate_break_address(unsigned long addr)
 {
@@ -321,6 +322,7 @@ static void kgdb_flush_swbreak_addr(unsigned long addr)
 	/* Force flush instruction cache if it was outside the mm */
 	flush_icache_range(addr, addr + BREAK_INSTR_SIZE);
 }
+NOKPROBE_SYMBOL(kgdb_flush_swbreak_addr);
 
 /*
  * SW breakpoint management:
@@ -411,6 +413,7 @@ int dbg_deactivate_sw_breakpoints(void)
 	}
 	return ret;
 }
+NOKPROBE_SYMBOL(dbg_deactivate_sw_breakpoints);
 
 int dbg_remove_sw_break(unsigned long addr)
 {
@@ -567,6 +570,7 @@ static int kgdb_reenter_check(struct kgdb_state *ks)
 
 	return 1;
 }
+NOKPROBE_SYMBOL(kgdb_reenter_check);
 
 static void dbg_touch_watchdogs(void)
 {
@@ -801,6 +805,7 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
 
 	return kgdb_info[cpu].ret_state;
 }
+NOKPROBE_SYMBOL(kgdb_cpu_enter);
 
 /*
  * kgdb_handle_exception() - main entry point from a kernel exception
@@ -845,6 +850,7 @@ kgdb_handle_exception(int evector, int signo, int ecode, struct pt_regs *regs)
 		arch_kgdb_ops.enable_nmi(1);
 	return ret;
 }
+NOKPROBE_SYMBOL(kgdb_handle_exception);
 
 /*
  * GDB places a breakpoint at this function to know dynamically loaded objects.
@@ -879,6 +885,7 @@ int kgdb_nmicallback(int cpu, void *regs)
 #endif
 	return 1;
 }
+NOKPROBE_SYMBOL(kgdb_nmicallback);
 
 int kgdb_nmicallin(int cpu, int trapnr, void *regs, int err_code,
 							atomic_t *send_ready)
@@ -904,6 +911,7 @@ int kgdb_nmicallin(int cpu, int trapnr, void *regs, int err_code,
 #endif
 	return 1;
 }
+NOKPROBE_SYMBOL(kgdb_nmicallin);
 
 static void kgdb_console_write(struct console *co, const char *s,
    unsigned count)
@@ -1204,7 +1212,6 @@ noinline void kgdb_breakpoint(void)
 	atomic_dec(&kgdb_setting_breakpoint);
 }
 EXPORT_SYMBOL_GPL(kgdb_breakpoint);
-NOKPROBE_SYMBOL(kgdb_breakpoint);
 
 static int __init opt_kgdb_wait(char *str)
 {
-- 
2.25.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
