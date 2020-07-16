Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F0A2226C3
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 16 Jul 2020 17:20:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jw5gM-0007DT-Iu
	for lists+kgdb-bugreport@lfdr.de; Thu, 16 Jul 2020 15:20:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jw5gK-0007D2-4B
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Jul 2020 15:20:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bt894HzKEOa1juEk1zUwT+0wI2k83kLqjbCs4ktmwwU=; b=IZ5uP60RSpnTzH71X11/WO04BN
 VQZLhFICgj8zbHFRQsjnPYtUGxybw1Q6dEYLMRvvv8gyfeWqonI1kl0lbu9oJNsuUKzWicp9HzFgA
 QBd9pvFM3cePhT26uXbSMZXPuFsf8oBkvpgqltrVv3ZLcYkJ79yhYarZdL8/sQ/0Lbpk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Bt894HzKEOa1juEk1zUwT+0wI2k83kLqjbCs4ktmwwU=; b=S9A+ERPMT0Vv+0ow1U8UP6YNPz
 J9wyXuVLnuI0SpXmxON/5F2ZCR5+3v3pJzYjwet62fLdrgpP43KrC7MSdakvpcw0pJlHWzJxHBfe1
 EMHhN3ZBdRVortH7ZiVAG6zv2WaO+zwLSjUBPGqB7v+gMgNDL3JJXVYQUyw4AfQQ+o1s=;
Received: from mail-wr1-f65.google.com ([209.85.221.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jw5gC-0035KD-75
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Jul 2020 15:20:19 +0000
Received: by mail-wr1-f65.google.com with SMTP id k6so7494233wrn.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 16 Jul 2020 08:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bt894HzKEOa1juEk1zUwT+0wI2k83kLqjbCs4ktmwwU=;
 b=fxPQnWz59Up3zrl0RzjlzsOI92Vi4xDMdkMXTsmF5eF0O69S/9QxQx9W5N0gO6uQYd
 KMdRrpjWnQyRnQJhnI6HgyildgntrisyLJWqjKqgeKOSYhViY94se2D0JSclNyQnA7db
 /fQRmh33E3YqGzdcKag+knbWwqpO2rA1HbbXG8iZ20YU/Zz9EcyhlYo/iDnsTKFSEgz8
 +BRuUnqW73/9iSuxSWWRFjGUnIRJA12dw1cdtZODQbLbyaGOD2jj2/KVPM8esB70T8Xm
 8d31C4aC+oKfEyti14BQW7FsyMfy65bFrwItW48j94uqHi2wA1eBpeyR9pj7QXhoSVIG
 5u8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bt894HzKEOa1juEk1zUwT+0wI2k83kLqjbCs4ktmwwU=;
 b=A38+UkLmM0Yf1MX5kPwqyfMUQi8NKm8Uifkd0D/PnLu9mRpmTsxrkYiOZO+QOvVKi0
 NuOD3d3EH0PN7eYiid0Ock1bovJls2hBNTQv58TvANZ2Pya/M5qDLd6JJ3eqfq9icksp
 WgiGD5ePeqRofbANbXGdOIv2FXTscT3LCDoJKWKIOMCKiWLf2YvGQ9t3/dpV2RvCek3R
 ++1q2bgf58VLYWQDp+ugxPnksj5E8TP3J5WFyaZzStwJtEq9uMhxXLr312uz4lmc+QHB
 X/K37Kof76wnRCgrPFl+kQQsPkmWfWSNvBjXnk/ZsLRav4MbMLGCssOXcb+Sq9dpw52H
 kd9g==
X-Gm-Message-State: AOAM530Gg7MIVoe9MIiT4RuCn7FSSTBx8/BJQYnELa9ThFez6Vry9r/I
 Xt7xe86BmRHCMBhPjLtqPgLw6w==
X-Google-Smtp-Source: ABdhPJxL8ueR/OcnC3ZDGghtoI6P4Ks6MOUOjDetInyQZqPmjy2evPI+PENXwSQ2/p8MNK4GuK8RpA==
X-Received: by 2002:adf:f14c:: with SMTP id y12mr5460591wro.30.1594912805876; 
 Thu, 16 Jul 2020 08:20:05 -0700 (PDT)
Received: from wychelm.lan
 (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id u17sm9877687wrp.70.2020.07.16.08.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 08:20:05 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Douglas Anderson <dianders@chromium.org>
Date: Thu, 16 Jul 2020 16:19:41 +0100
Message-Id: <20200716151943.2167652-2-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200716151943.2167652-1-daniel.thompson@linaro.org>
References: <20200716151943.2167652-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jw5gC-0035KD-75
Subject: [Kgdb-bugreport] [PATCH v2 1/3] kgdb: Honour the kprobe blocklist
 when setting breakpoints
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

Currently kgdb has absolutely no safety rails in place to discourage or
prevent a user from placing a breakpoint in dangerous places such as
the debugger's own trap entry/exit and other places where it is not safe
to take synchronous traps.

Introduce a new config symbol KGDB_HONOUR_BLOCKLIST and modify the
default implementation of kgdb_validate_break_address() so that we use
the kprobe blocklist to prohibit instrumentation of critical functions
if the config symbol is set. The config symbol dependencies are set to
ensure that the blocklist will be enabled by default if we enable KGDB
and are compiling for an architecture where we HAVE_KPROBES.

Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 include/linux/kgdb.h      | 18 ++++++++++++++++++
 kernel/debug/debug_core.c |  4 ++++
 kernel/debug/kdb/kdb_bp.c |  9 +++++++++
 lib/Kconfig.kgdb          | 14 ++++++++++++++
 4 files changed, 45 insertions(+)

diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
index 529116b0cabe..7caba4604edc 100644
--- a/include/linux/kgdb.h
+++ b/include/linux/kgdb.h
@@ -16,6 +16,7 @@
 #include <linux/linkage.h>
 #include <linux/init.h>
 #include <linux/atomic.h>
+#include <linux/kprobes.h>
 #ifdef CONFIG_HAVE_ARCH_KGDB
 #include <asm/kgdb.h>
 #endif
@@ -323,6 +324,23 @@ extern int kgdb_nmicallin(int cpu, int trapnr, void *regs, int err_code,
 			  atomic_t *snd_rdy);
 extern void gdbstub_exit(int status);
 
+/*
+ * kgdb and kprobes both use the same (kprobe) blocklist (which makes sense
+ * given they are both typically hooked up to the same trap meaning on most
+ * architectures one cannot be used to debug the other)
+ *
+ * However on architectures where kprobes is not (yet) implemented we permit
+ * breakpoints everywhere rather than blocking everything by default.
+ */
+static inline bool kgdb_within_blocklist(unsigned long addr)
+{
+#ifdef CONFIG_KGDB_HONOUR_BLOCKLIST
+	return within_kprobe_blacklist(addr);
+#else
+	return false;
+#endif
+}
+
 extern int			kgdb_single_step;
 extern atomic_t			kgdb_active;
 #define in_dbg_master() \
diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 9e5934780f41..133a361578dc 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -188,6 +188,10 @@ int __weak kgdb_validate_break_address(unsigned long addr)
 {
 	struct kgdb_bkpt tmp;
 	int err;
+
+	if (kgdb_within_blocklist(addr))
+		return -EINVAL;
+
 	/* Validate setting the breakpoint and then removing it.  If the
 	 * remove fails, the kernel needs to emit a bad message because we
 	 * are deep trouble not being able to put things back the way we
diff --git a/kernel/debug/kdb/kdb_bp.c b/kernel/debug/kdb/kdb_bp.c
index d7ebb2c79cb8..ec4940146612 100644
--- a/kernel/debug/kdb/kdb_bp.c
+++ b/kernel/debug/kdb/kdb_bp.c
@@ -306,6 +306,15 @@ static int kdb_bp(int argc, const char **argv)
 	if (!template.bp_addr)
 		return KDB_BADINT;
 
+	/*
+	 * This check is redundant (since the breakpoint machinery should
+	 * be doing the same check during kdb_bp_install) but gives the
+	 * user immediate feedback.
+	 */
+	diag = kgdb_validate_break_address(template.bp_addr);
+	if (diag)
+		return diag;
+
 	/*
 	 * Find an empty bp structure to allocate
 	 */
diff --git a/lib/Kconfig.kgdb b/lib/Kconfig.kgdb
index ffa7a76de086..9d0d408f81b1 100644
--- a/lib/Kconfig.kgdb
+++ b/lib/Kconfig.kgdb
@@ -19,6 +19,20 @@ menuconfig KGDB
 
 if KGDB
 
+config KGDB_HONOUR_BLOCKLIST
+	bool "KGDB: use kprobe blocklist to prohibit unsafe breakpoints"
+	depends on HAVE_KPROBES
+	select KPROBES
+	default y
+	help
+	  If set to Y the debug core will use the kprobe blocklist to
+	  identify symbols where it is unsafe to set breakpoints.
+	  In particular this disallows instrumentation of functions
+	  called during debug trap handling and thus makes it very
+	  difficult to inadvertently provoke recursive trap handling.
+
+	  If unsure, say Y.
+
 config KGDB_SERIAL_CONSOLE
 	tristate "KGDB: use kgdb over the serial console"
 	select CONSOLE_POLL
-- 
2.25.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
