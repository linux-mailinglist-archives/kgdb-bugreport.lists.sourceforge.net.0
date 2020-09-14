Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 223FB268B9E
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 14 Sep 2020 15:02:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kHo7c-0000oq-Qa
	for lists+kgdb-bugreport@lfdr.de; Mon, 14 Sep 2020 13:02:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1kHo7b-0000og-Rn
 for kgdb-bugreport@lists.sourceforge.net; Mon, 14 Sep 2020 13:02:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o2bHvryZQLWnkv+dYNHBTXO/DsrmPeloLYjVsFFfptI=; b=htD9X1xh+k22sLy/Q+Muays7nr
 yJIZjE40nUhoMMkRGvDAjxf237/gTRx4xac6Ji3Vlthdy8heUGjpgQSXaSGoGe+NBvM2RiPzfp22h
 w9e7dTkqdp/hDZYE5d07YW9R7YLs5HDps0QJkoOxImzaKsYwW98U/yuqVAq1zEcZXlTs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o2bHvryZQLWnkv+dYNHBTXO/DsrmPeloLYjVsFFfptI=; b=ei6do74Uv/Aa/ENd4WTcewwst6
 pZEJVnHMhkwOZ8HqkhiGu8bzdwWsaXG9QurRZC5DTAKuj/Aqp3iG1VqNC8+oZwM8gM1EfsSbRG2d1
 CwkDBImGnrxnub5KrMFr1JIXbVOUOGrc8XBrmtLG6yyxb2xpwG7LespHR6EDe6IiyXZA=;
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kHo7V-008PXH-Bk
 for kgdb-bugreport@lists.sourceforge.net; Mon, 14 Sep 2020 13:02:15 +0000
Received: by mail-wr1-f68.google.com with SMTP id c18so18612724wrm.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 14 Sep 2020 06:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o2bHvryZQLWnkv+dYNHBTXO/DsrmPeloLYjVsFFfptI=;
 b=pE2cCoB4QzQ08cjcZxpQf2kst5TzIrF2i5trDOAzUpy2s9zeuwAQ/Nx3IFBR9z/hXZ
 2kKNmcYp5d1ZihOljX+hxl3qNDCb0lc8Y8Mvobr9D5EKagkgH1aB9uVQ4CVdYdrRXoY9
 zP42ixjTX6ZAvclvIg6i9jBtf+RZtIOUlXhRiQGMhIh6IQswvzUWCBLGVz5emnKjak20
 xWGDPxKFgvhvznguBIIQHlgs/TWGbKxGF3WaYWx6vOR+btYNXEM835N65nlXsV2u7cKK
 6jmc2/2qvjDCEsfykogJZ0sLkaEOgM775yi8SXaX/hwGEy+nY/bxXpLvhpQMUaWpAXrk
 KYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o2bHvryZQLWnkv+dYNHBTXO/DsrmPeloLYjVsFFfptI=;
 b=saqbxGWiyF6JA16UMXGtkc8W7h7tf7LSH9cwzK0zB+8QLYVD2kxugptbN548/KJVwo
 yurTMZbplpCyKK6i/HqI7jGuQpGFf14ktyrBYQN1pKX2g6mjD7JsD04DKEfDysZuU/oO
 bVHpECg5FjiVlfKru4h7tV3DDaqsXG9xf0LeQZtcc18Z8oc+OfJyYqSzELNj5TWIMcJt
 Ucs2/SeKj79TXoDd6AdZEaVFAnVxs4sfmqiqcCu9IMjJ9GXDr8GzusjA4v7jA1wzE6gF
 DgNEdiiqGmp5KWcxA/0GSlWi1mfM86IAWfO39+88vXVrUUsDCUwpo5/uc4fqkeH0u4UN
 w2hQ==
X-Gm-Message-State: AOAM5325qCtczFLJvC3O0NOjsyZOV//6hDXQZfJjcIoAcU1RnKtoKWhW
 pIJNvqVSG6Ix0lre2ZTGdwJThw==
X-Google-Smtp-Source: ABdhPJxZK4XsK2KPeAGMEzC3inVIZOP5soww3+m9A+K0lTdvS3ROedJ839p6WuCHWNrJ0H7MDRhGdw==
X-Received: by 2002:a05:6000:1c8:: with SMTP id
 t8mr15767631wrx.3.1600088522936; 
 Mon, 14 Sep 2020 06:02:02 -0700 (PDT)
Received: from wychelm.lan
 (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id t6sm23420983wre.30.2020.09.14.06.02.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 06:02:02 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Douglas Anderson <dianders@chromium.org>
Date: Mon, 14 Sep 2020 14:01:41 +0100
Message-Id: <20200914130143.1322802-2-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200914130143.1322802-1-daniel.thompson@linaro.org>
References: <20200914130143.1322802-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kHo7V-008PXH-Bk
Subject: [Kgdb-bugreport] [PATCH v3 1/3] kgdb: Honour the kprobe blocklist
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
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 include/linux/kgdb.h      | 18 ++++++++++++++++++
 kernel/debug/debug_core.c |  4 ++++
 kernel/debug/kdb/kdb_bp.c |  9 +++++++++
 lib/Kconfig.kgdb          | 14 ++++++++++++++
 4 files changed, 45 insertions(+)

diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
index 477b8b7c908f..0d6cf64c8bb1 100644
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
@@ -335,6 +336,23 @@ extern int kgdb_nmicallin(int cpu, int trapnr, void *regs, int err_code,
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
index b16dbc1bf056..b1277728a835 100644
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
index 256f2486f9bd..713c17fe789c 100644
--- a/lib/Kconfig.kgdb
+++ b/lib/Kconfig.kgdb
@@ -24,6 +24,20 @@ menuconfig KGDB
 
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
