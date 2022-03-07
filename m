Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4084D4CFC36
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Mar 2022 12:04:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nRB9m-0007wI-WA
	for lists+kgdb-bugreport@lfdr.de; Mon, 07 Mar 2022 11:04:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sumit.garg@linaro.org>) id 1nRB9e-0007vq-3W
 for kgdb-bugreport@lists.sourceforge.net; Mon, 07 Mar 2022 11:03:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JFEOo1tcEco00+Nvk7m320IFPXwMdnmT4rBSqgHwb9U=; b=XcPYmwehG+NpX6ATtfBRCQGiHX
 mTh9E0DYulw9aKESPD5n7BOXc/Zfi9ZWlBS73LSZ6ORL0GoEWC5X4MKkz2rMwaMpHohKvlwQOmY08
 vrMa7KaF09xNdLZWpB4ZHhrwBSaHoibd4N/rO3kqxxGFj6xf7gPADvF3ipauxm/qr2Xk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JFEOo1tcEco00+Nvk7m320IFPXwMdnmT4rBSqgHwb9U=; b=W
 PO1wJkeakOlpVI0sh1LOCQFmuUB5L3iVk953QJyX1Pis5ZOnGySdTxyH8NSWI2uFOQvJCmfX3e/yO
 mkSN4vByaF7iEfCFFmeH9qcSA5k/RnT5w5vTNqCphMl/fkSADqL74oAS2WpmsID3lzs2MHt3x8d5P
 HxgJtMOd6UUCuZEE=;
Received: from mail-pj1-f52.google.com ([209.85.216.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nRB9W-0005YK-KF
 for kgdb-bugreport@lists.sourceforge.net; Mon, 07 Mar 2022 11:03:50 +0000
Received: by mail-pj1-f52.google.com with SMTP id
 ge19-20020a17090b0e1300b001bcca16e2e7so16275337pjb.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 07 Mar 2022 03:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JFEOo1tcEco00+Nvk7m320IFPXwMdnmT4rBSqgHwb9U=;
 b=qtjDbzotyaVzeWfh9ZP2lKirFOAUTh9U/lRfK/AmyUHC81BOUQqRWV8uYCpRv45zF/
 JfuELtkYJkfkeBsnkNyb8dSw5o0huILMLDVO1CneisVMVdzYZp/KPIHiPffB7jNk2y7g
 7qyMbiP+ZcgwqY03j2iV6pztEiry52W4y6m3vGeh+ccjyh55cthC36FA9t/+YbMF5ueK
 A2JLckHy3vDz9ECpC+g5tiA3F/I6nZlnFG5BHEUusdCqvxPTit5boDlsMSM0/QLfegx9
 g92RR3KXXqWVJ/Twx7BOxF8eaSreXTIq8xxN1/uSlLTZHQdvtbmc+BKtR2ukBE4PkzPm
 22Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JFEOo1tcEco00+Nvk7m320IFPXwMdnmT4rBSqgHwb9U=;
 b=I/FomnZIHxJsoXswwoB1SY79/AduqwXA5ahc3UisuHZS6eoVGys0voicNu5sK+aori
 zif6ULeF7QMFfTMfP5eEKt49pYgDNq38DSHww9Qz4KG1buQ1+Id3UUL0D7j3rAavoZLe
 D870OarpygCtDF8iHEgaVaOghSiqGIAqwprC3BrBf0aOixbo9LXYEjtK+HIhERLT4tIM
 hXmFuI2hQtSqXh7I/VC4izxdk5A+R2CYMro9/k4wf87ldNAIlFpyGgLqcign6H1wLFoN
 r38yJSPBaph3ZHt9QZmIp8qogAc4jJITIGa5ehc1ByHG10EFNVevrplgiYjLkgzOqQxq
 /VzA==
X-Gm-Message-State: AOAM531HS0V48oAW/BP2Qg9nzyZUWLMaFIJw+Hq65QFNHuuZn084SCMu
 L0oCuoXj4JJXq1+cFFRmdfrq+w==
X-Google-Smtp-Source: ABdhPJzQWuDyPVOZV8+vb7zFRV1bqqY/2Jkp1Y9YhwzRyLVg+CvO8Hap3qvd2yxJOHBDSbBx85jL6Q==
X-Received: by 2002:a17:90b:216:b0:1bc:5d68:e7aa with SMTP id
 fy22-20020a17090b021600b001bc5d68e7aamr12283884pjb.57.1646651020984; 
 Mon, 07 Mar 2022 03:03:40 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1c2a:216d:d967:c5a7:5da:6441])
 by smtp.gmail.com with ESMTPSA id
 mw7-20020a17090b4d0700b001b8baf6b6f5sm12390121pjb.50.2022.03.07.03.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 03:03:40 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: linux-serial@vger.kernel.org, hasegawa-hitomi@fujitsu.com,
 dianders@chromium.org
Date: Mon,  7 Mar 2022 16:33:28 +0530
Message-Id: <20220307110328.2557655-1-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Allow a magic sysrq to be triggered from an NMI context. This
 is done via marking some sysrq actions as NMI safe. Safe actions will be
 allowed to run from NMI context whilst that cannot run from an NM [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.52 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.52 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1nRB9W-0005YK-KF
Subject: [Kgdb-bugreport] [RFT v4] tty/sysrq: Make sysrq handler NMI aware
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
Cc: daniel.thompson@linaro.org, arnd@arndb.de, peterz@infradead.org,
 kgdb-bugreport@lists.sourceforge.net, jason.wessel@windriver.com,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Allow a magic sysrq to be triggered from an NMI context. This is done
via marking some sysrq actions as NMI safe. Safe actions will be allowed
to run from NMI context whilst that cannot run from an NMI will be queued
as irq_work for later processing.

The major use-case is to add NMI debugging capabilities to the kernel
in order to debug scenarios such as:
- Primary CPU is stuck in deadlock with interrupts disabled and hence
  doesn't honor serial device interrupt. So having magic sysrq triggered
  as an NMI is helpful for debugging.
- Always enabled NMI based magic sysrq irrespective of whether the serial
  TTY port is active or not.
- Apart from UART interrupts, it allows magic sysrq to be triggered from
  a diagnostic NMI interrupt on systems such as A64FX.

A particular sysrq handler is only marked as NMI safe in case the handler
isn't contending for any synchronization primitives as in NMI context
they are expected to cause deadlocks. Note that the debug sysrq do not
contend for any synchronization primitives. It does call kgdb_breakpoint()
to provoke a trap but that trap handler should be NMI safe on
architectures that implement an NMI.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---

Changes in v4:
- Use atomic operations for sysrq key variable to gracefully handle
  concurrent sysrq entry on multiple CPUs.
- Rename sysrq_nmi_key to sysrq_key as it isn't anymore specific to NMI
  context.
- Addressed other misc. comments from Doug.

Changes in v3:
- Extend commit message to include use-cases.
- Get rid of redundant kfifo stuff.
- Incorporate other misc. feedback from Peter Z.

Changes in v2:
- Rebased to 5.17-rc5.
- Separate this patch from complete patch-set [1] as its relevant for
  other diagnostic NMI interrupts [2] as well apart from uart NMI
  interrupts.
- Incorporated suggestions from Doug.

[1] https://lore.kernel.org/linux-arm-kernel/CAFA6WYOWHgmYYt=KGXDh2hKiuy_rQbJfi279ev0+s-Qh7L21kA@mail.gmail.com/t/#m2b5006f08581448020eb24566927a104d0b95c44
[2] https://lore.kernel.org/all/Yhi0rrkSR63ZhjX1@kroah.com/T/

 drivers/tty/sysrq.c       | 50 ++++++++++++++++++++++++++++++++++++++-
 include/linux/sysrq.h     |  1 +
 kernel/debug/debug_core.c |  1 +
 3 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index bbfd004449b5..005c9f9e0004 100644
--- a/drivers/tty/sysrq.c
+++ b/drivers/tty/sysrq.c
@@ -51,6 +51,7 @@
 #include <linux/syscalls.h>
 #include <linux/of.h>
 #include <linux/rcupdate.h>
+#include <linux/irq_work.h>
 
 #include <asm/ptrace.h>
 #include <asm/irq_regs.h>
@@ -112,6 +113,7 @@ static const struct sysrq_key_op sysrq_loglevel_op = {
 	.help_msg	= "loglevel(0-9)",
 	.action_msg	= "Changing Loglevel",
 	.enable_mask	= SYSRQ_ENABLE_LOG,
+	.nmi_safe	= true,
 };
 
 #ifdef CONFIG_VT
@@ -159,6 +161,7 @@ static const struct sysrq_key_op sysrq_crash_op = {
 	.help_msg	= "crash(c)",
 	.action_msg	= "Trigger a crash",
 	.enable_mask	= SYSRQ_ENABLE_DUMP,
+	.nmi_safe	= true,
 };
 
 static void sysrq_handle_reboot(int key)
@@ -172,6 +175,7 @@ static const struct sysrq_key_op sysrq_reboot_op = {
 	.help_msg	= "reboot(b)",
 	.action_msg	= "Resetting",
 	.enable_mask	= SYSRQ_ENABLE_BOOT,
+	.nmi_safe	= true,
 };
 
 const struct sysrq_key_op *__sysrq_reboot_op = &sysrq_reboot_op;
@@ -219,6 +223,7 @@ static const struct sysrq_key_op sysrq_showlocks_op = {
 	.handler	= sysrq_handle_showlocks,
 	.help_msg	= "show-all-locks(d)",
 	.action_msg	= "Show Locks Held",
+	.nmi_safe	= true,
 };
 #else
 #define sysrq_showlocks_op (*(const struct sysrq_key_op *)NULL)
@@ -291,6 +296,7 @@ static const struct sysrq_key_op sysrq_showregs_op = {
 	.help_msg	= "show-registers(p)",
 	.action_msg	= "Show Regs",
 	.enable_mask	= SYSRQ_ENABLE_DUMP,
+	.nmi_safe	= true,
 };
 
 static void sysrq_handle_showstate(int key)
@@ -328,6 +334,7 @@ static const struct sysrq_key_op sysrq_ftrace_dump_op = {
 	.help_msg	= "dump-ftrace-buffer(z)",
 	.action_msg	= "Dump ftrace buffer",
 	.enable_mask	= SYSRQ_ENABLE_DUMP,
+	.nmi_safe	= true,
 };
 #else
 #define sysrq_ftrace_dump_op (*(const struct sysrq_key_op *)NULL)
@@ -566,12 +573,46 @@ static void __sysrq_put_key_op(int key, const struct sysrq_key_op *op_p)
 		sysrq_key_table[i] = op_p;
 }
 
+static atomic_t sysrq_key = ATOMIC_INIT(-1);
+
+static void sysrq_do_irq_work(struct irq_work *work)
+{
+	const struct sysrq_key_op *op_p;
+	int orig_suppress_printk;
+	int key = atomic_read(&sysrq_key);
+
+	orig_suppress_printk = suppress_printk;
+	suppress_printk = 0;
+
+	rcu_sysrq_start();
+	rcu_read_lock();
+
+	op_p = __sysrq_get_key_op(key);
+	if (op_p)
+		op_p->handler(key);
+
+	rcu_read_unlock();
+	rcu_sysrq_end();
+
+	suppress_printk = orig_suppress_printk;
+	atomic_set(&sysrq_key, -1);
+}
+
+static DEFINE_IRQ_WORK(sysrq_irq_work, sysrq_do_irq_work);
+
 void __handle_sysrq(int key, bool check_mask)
 {
 	const struct sysrq_key_op *op_p;
 	int orig_log_level;
 	int orig_suppress_printk;
 	int i;
+	bool irq_work = false;
+
+	/* Skip sysrq handling if one already in progress */
+	if (atomic_cmpxchg(&sysrq_key, -1, key) != -1) {
+		pr_warn("Skip sysrq key: %i as one already in progress\n", key);
+		return;
+	}
 
 	orig_suppress_printk = suppress_printk;
 	suppress_printk = 0;
@@ -596,7 +637,11 @@ void __handle_sysrq(int key, bool check_mask)
 		if (!check_mask || sysrq_on_mask(op_p->enable_mask)) {
 			pr_info("%s\n", op_p->action_msg);
 			console_loglevel = orig_log_level;
-			op_p->handler(key);
+
+			if (in_nmi() && !op_p->nmi_safe)
+				irq_work = irq_work_queue(&sysrq_irq_work);
+			else
+				op_p->handler(key);
 		} else {
 			pr_info("This sysrq operation is disabled.\n");
 			console_loglevel = orig_log_level;
@@ -623,6 +668,9 @@ void __handle_sysrq(int key, bool check_mask)
 	rcu_sysrq_end();
 
 	suppress_printk = orig_suppress_printk;
+
+	if (!irq_work)
+		atomic_set(&sysrq_key, -1);
 }
 
 void handle_sysrq(int key)
diff --git a/include/linux/sysrq.h b/include/linux/sysrq.h
index 3a582ec7a2f1..630b5b9dc225 100644
--- a/include/linux/sysrq.h
+++ b/include/linux/sysrq.h
@@ -34,6 +34,7 @@ struct sysrq_key_op {
 	const char * const help_msg;
 	const char * const action_msg;
 	const int enable_mask;
+	const bool nmi_safe;
 };
 
 #ifdef CONFIG_MAGIC_SYSRQ
diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index da06a5553835..53b56114f59b 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -978,6 +978,7 @@ static const struct sysrq_key_op sysrq_dbg_op = {
 	.handler	= sysrq_handle_dbg,
 	.help_msg	= "debug(g)",
 	.action_msg	= "DEBUG",
+	.nmi_safe	= true,
 };
 #endif
 
-- 
2.25.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
