Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD2D27A43B
	for <lists+kgdb-bugreport@lfdr.de>; Sun, 27 Sep 2020 23:16:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kMe20-0002Z4-Jd
	for lists+kgdb-bugreport@lfdr.de; Sun, 27 Sep 2020 21:16:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1kMe1y-0002Yw-D6
 for kgdb-bugreport@lists.sourceforge.net; Sun, 27 Sep 2020 21:16:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dlej/lv7oVkXNfjhU3o8F709/Rsr6/sqjZB7q+Bb9kY=; b=hFaLG6JS7w/xbng9qAo/rjpPoc
 GLnlmM1P4AshIhSUAr+Pj5IoNtOJ8j//T3ANEglZ387gnu4InhUhKFawNmr430K0RVzenqrc/GSDt
 duQNi8pxpe24TZJxaDLdXYcbGgk5hqrDuUXRP3a7CvpMGRbBbkI1rL2MW/pQxvvjNVQM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dlej/lv7oVkXNfjhU3o8F709/Rsr6/sqjZB7q+Bb9kY=; b=F7yFYdKbP1q7Zth2VglZAgXuHT
 5bfP674Rbg0gLQhtwXPgmKAau/31YedGMZGrJvUzJBTA5JqWg9dfoUraaA4F3CO9nq9iyYChwDqmY
 B6Rn/gSQJ/pGOg0va05JFIWfg09N7r7NhEWPXHfIhVh4jqKiidYQJlvXQ8HdqCmtyOhs=;
Received: from mail-wm1-f67.google.com ([209.85.128.67])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kMe1t-00Ah7R-Sb
 for kgdb-bugreport@lists.sourceforge.net; Sun, 27 Sep 2020 21:16:26 +0000
Received: by mail-wm1-f67.google.com with SMTP id v12so4938294wmh.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sun, 27 Sep 2020 14:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dlej/lv7oVkXNfjhU3o8F709/Rsr6/sqjZB7q+Bb9kY=;
 b=jjIs/ShxEUKGd7uwSXED4AjI2tzuzQz/UDxHA4VMAJF2qD1a0V0jAAB2AWYdaDBYAC
 I2AELKianFoU4dmp7Nun+Ui2jfnrme9WZnOviAv+3g1ucd6BpKMy2L8Y8ggKrsYa3Xlp
 Am8eUlB+uiZ82P9xc9wWfb2/GxLifoUXmLzwLrzFc8ch5l5c91ZPwDLBBGD0C3oUBY/Y
 8CVEJKRaNTzHxbsA0mOSz4Mq9cMM7h9xZeMD7nxDMIaIc0D3FcNx1pi0p/xA40X8TnZN
 zQrTAH1rMR2lD9gfgU0r9I4w6Ca1CIwFgyOnB1/G8jhMrJMmRh7ptCB3PUJanTYDyQud
 D4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dlej/lv7oVkXNfjhU3o8F709/Rsr6/sqjZB7q+Bb9kY=;
 b=kDmLCPBml0zOtmPDremTlJO4voMUl7KcM5kU/5k6obACIKZcgHiztWS+vZo3GfPFtg
 VYvVRIcJOAJrwUQI9YCTlA2a8CFqglebZIrT7q7LV3qXy8imp0v7Gxels/mducpPdotu
 oKqMecJYQWAtW1brg+JGAuNWu1pT/sCtjyU+BSxCLrJP0HZzA9lj5R4mpzJ8fDGGsg4P
 ielEKk5r2kN07oeps0YWwboAcSGEJjpmVu0h+ZZLJFo1d0KvpWCa+b4ZmNXtZKsFSp8y
 xy0la2mCbvkPDkbuQGeFImbWB/WdBpBJfmQAd793xjZ3yB5IBNC8PLsyrk1LBEx//6c2
 ofUg==
X-Gm-Message-State: AOAM5320NVUl6XLuR2pLX2UU5EShNywi4D1jY7LmxvNe5cZU5/h30XT6
 /Y22cZgdEuNLwVd4yFNDuZ+X8Q==
X-Google-Smtp-Source: ABdhPJybjs2360ZXFdycpun4TnffqLBoF2b3BVpvb5RBACJB4L8AP9d14d9i8h6KCHKK5li6jLs2cA==
X-Received: by 2002:a1c:4c06:: with SMTP id z6mr8202363wmf.40.1601241375471;
 Sun, 27 Sep 2020 14:16:15 -0700 (PDT)
Received: from wychelm.lan
 (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id s17sm11396676wrr.40.2020.09.27.14.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2020 14:16:14 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Douglas Anderson <dianders@chromium.org>
Date: Sun, 27 Sep 2020 22:15:29 +0100
Message-Id: <20200927211531.1380577-2-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200927211531.1380577-1-daniel.thompson@linaro.org>
References: <20200927211531.1380577-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.5 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.67 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.67 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kMe1t-00Ah7R-Sb
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
Reviewed-by: Masami Hiramatsu <mhiramat@kernel.org>
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 include/linux/kgdb.h      | 18 ++++++++++++++++++
 kernel/debug/debug_core.c |  4 ++++
 kernel/debug/kdb/kdb_bp.c |  9 +++++++++
 lib/Kconfig.kgdb          | 15 +++++++++++++++
 4 files changed, 46 insertions(+)

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
index 256f2486f9bd..05dae05b6cc9 100644
--- a/lib/Kconfig.kgdb
+++ b/lib/Kconfig.kgdb
@@ -24,6 +24,21 @@ menuconfig KGDB
 
 if KGDB
 
+config KGDB_HONOUR_BLOCKLIST
+	bool "KGDB: use kprobe blocklist to prohibit unsafe breakpoints"
+	depends on HAVE_KPROBES
+	depends on MODULES
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
