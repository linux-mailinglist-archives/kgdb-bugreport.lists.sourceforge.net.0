Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E7E2226CA
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 16 Jul 2020 17:20:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jw5gh-0004EE-Jo
	for lists+kgdb-bugreport@lfdr.de; Thu, 16 Jul 2020 15:20:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jw5gf-0004Dn-QD
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Jul 2020 15:20:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ay69b5loZmqipTP77uDUcCD3CMZjdEh7hP0bruwli1k=; b=GbyNclNX13klj4KZMZOwm1b18T
 ZRxCHpsj9vkbo06ir+PYfYEn9PXCe9rUN0/sZ14aSMSbqC3z0Md5VZQZ4ujzjSJ3lrksZc1sUg9TU
 kMy/pfDSrjyH3hjdLJx9yzkmBh15KBatQMeSGUiUspnsi6KBZbPs8QJSJDcOykUupVmY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ay69b5loZmqipTP77uDUcCD3CMZjdEh7hP0bruwli1k=; b=knez6tJN5D0OypXdYv2bXsbkt8
 RmsIJcbjHpg/pqWEfFKpgsVzEMSkNh0tUy8N3sqBtchL2ChRJZSD09Y3LeB2NYiVNX92X3/Xbdgxd
 SeGGPR2s+iCw3e1jEVNaeMmZ1LY9AS5UakOLbZLJa+Xtm0zPFHQ9tULAJbkijQQ3hxQA=;
Received: from mail-wm1-f65.google.com ([209.85.128.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jw5gL-00656e-U2
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Jul 2020 15:20:40 +0000
Received: by mail-wm1-f65.google.com with SMTP id q15so10667366wmj.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 16 Jul 2020 08:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ay69b5loZmqipTP77uDUcCD3CMZjdEh7hP0bruwli1k=;
 b=d0RdbT8MqbY1ZnJgHeIEd2m0zeXY1i+Lj+PmqGKQmqaLAJiZKpFm3oxosLkai3MZ0S
 9GSppOaArDiTYBQvupivke+FSk3+Cg0P1TwPggyBEFA8P2wxtI30qV6Y7JyAOlakSWrI
 7XT1YjyZjvfmUCiUFYRAy0BjbJXCYgz1uFTdgl7DUv/IAVH7i1uRm+edatyqJ7NVoblc
 JvKimwXgxv4KzksqAgPh/JXDw+DSf64M4xeWMlQ9bYXHSivCfwoxQFDZJLmqnaay/7Vk
 4zxaoCVUrydKo2k8oILHDbWI30tA8KvW6RT2eovrOz6JbQEb01y+dmuMDVMqA/Je4xhZ
 aoXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ay69b5loZmqipTP77uDUcCD3CMZjdEh7hP0bruwli1k=;
 b=e5OktfN3eMkf62OueaIjK2wvkaD9L0PoByKfXyoOtQIjQgCsU1g/3ck9wlzsAn0WVE
 0+4kxQqBjKX+gKwUhyFyk2jUIQwVbSp+6a1ONXiRh3G3vWJnsGWpSHZSWAl8Or98QCwy
 XeseCbZWaokPUhXe5myxVEyUcwP4sSLtOERzOnerZnR4dC01z503fQQjdSvb71qb6hgW
 Qs+cdmwvIWRjrDbOD4ITwP3vf4WjnSdgHrweeVi0sOZe+O3VZ7yYtCwU5fe64N2P0TUa
 BYee6Y4wzBNbxz0nIdvu9gAd3RW41HOm/yztIDiR3cD9yrvQ/kWw7XvECLO0QO+m6j94
 28gA==
X-Gm-Message-State: AOAM531FLtxhjX7ZFxMQhYL1KzdW1NFcFQRDoP8DCnNwbM9s1hFMarM5
 bIORjKpvlfpuIdzEkwt07joz8A==
X-Google-Smtp-Source: ABdhPJytl8835REhXfZSH+IBujrm7NkmVewsF6kxmqbPplKu/iOWB6yHc9BFpHQOHY51qHxdg66EWQ==
X-Received: by 2002:a7b:c208:: with SMTP id x8mr4851699wmi.49.1594912808280;
 Thu, 16 Jul 2020 08:20:08 -0700 (PDT)
Received: from wychelm.lan
 (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id u17sm9877687wrp.70.2020.07.16.08.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 08:20:07 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Douglas Anderson <dianders@chromium.org>
Date: Thu, 16 Jul 2020 16:19:43 +0100
Message-Id: <20200716151943.2167652-4-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200716151943.2167652-1-daniel.thompson@linaro.org>
References: <20200716151943.2167652-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.65 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1jw5gL-00656e-U2
Subject: [Kgdb-bugreport] [PATCH v2 3/3] kgdb: Add NOKPROBE labels on the
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

These changes do not make it impossible to provoke recursive trapping
since they do not cover all the calls that can be made on kgdb's entry
logic. However going much further whilst we are sharing the kprobe
blocklist risks reducing the capabilities of kprobe and this would be a
bad trade off (especially so given kgdb's users are currently conditioned
to avoid recursive traps).

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 kernel/debug/debug_core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 4b59bcc90c5d..b056afb1beec 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -183,6 +183,7 @@ int __weak kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt)
 	return copy_to_kernel_nofault((char *)bpt->bpt_addr,
 				  (char *)bpt->saved_instr, BREAK_INSTR_SIZE);
 }
+NOKPROBE_SYMBOL(kgdb_arch_remove_breakpoint);
 
 int __weak kgdb_validate_break_address(unsigned long addr)
 {
@@ -315,6 +316,7 @@ static void kgdb_flush_swbreak_addr(unsigned long addr)
 	/* Force flush instruction cache if it was outside the mm */
 	flush_icache_range(addr, addr + BREAK_INSTR_SIZE);
 }
+NOKPROBE_SYMBOL(kgdb_flush_swbreak_addr);
 
 /*
  * SW breakpoint management:
@@ -405,6 +407,7 @@ int dbg_deactivate_sw_breakpoints(void)
 	}
 	return ret;
 }
+NOKPROBE_SYMBOL(dbg_deactivate_sw_breakpoints);
 
 int dbg_remove_sw_break(unsigned long addr)
 {
@@ -573,6 +576,7 @@ static int kgdb_reenter_check(struct kgdb_state *ks)
 
 	return 1;
 }
+NOKPROBE_SYMBOL(kgdb_reenter_check);
 
 static void dbg_touch_watchdogs(void)
 {
@@ -811,6 +815,7 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
 
 	return kgdb_info[cpu].ret_state;
 }
+NOKPROBE_SYMBOL(kgdb_cpu_enter);
 
 /*
  * kgdb_handle_exception() - main entry point from a kernel exception
@@ -855,6 +860,7 @@ kgdb_handle_exception(int evector, int signo, int ecode, struct pt_regs *regs)
 		arch_kgdb_ops.enable_nmi(1);
 	return ret;
 }
+NOKPROBE_SYMBOL(kgdb_handle_exception);
 
 /*
  * GDB places a breakpoint at this function to know dynamically loaded objects.
@@ -889,6 +895,7 @@ int kgdb_nmicallback(int cpu, void *regs)
 #endif
 	return 1;
 }
+NOKPROBE_SYMBOL(kgdb_nmicallback);
 
 int kgdb_nmicallin(int cpu, int trapnr, void *regs, int err_code,
 							atomic_t *send_ready)
@@ -914,6 +921,7 @@ int kgdb_nmicallin(int cpu, int trapnr, void *regs, int err_code,
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
