Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 269BD4C6EA0
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 28 Feb 2022 14:54:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nOgTw-0000a6-9Z
	for lists+kgdb-bugreport@lfdr.de; Mon, 28 Feb 2022 13:54:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sumit.garg@linaro.org>) id 1nOgTu-0000Zw-6w
 for kgdb-bugreport@lists.sourceforge.net; Mon, 28 Feb 2022 13:54:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WEy1zCQgDzZI0KWybQkh1tiSD7E5/9VujlwkP39Po4I=; b=gaiz0ftt6QjBeMKSA/+QL8bbUD
 Kzzq+FsPaJ7mS+ub4sl4z0074c0s3tmQIm5RgbyggzJbxwQcE3HyBctYdFI256q6bPseUcV3P5Ncl
 3eLEt3b85NLRgu4fcUvQxZzupzQpkhK0nEUtIlDI4RKXRrhPKoqEA9MxGZtAf/lGn2kM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=WEy1zCQgDzZI0KWybQkh1tiSD7E5/9VujlwkP39Po4I=; b=g
 1xHL2TfJcwGSeWvIN6cyaYlsgaoM0dYb1urwaaTJVQzJgEnMX0iHmlhAXANvp7b9pV15xSmi40X5s
 NASPxfXfxc4ePCbR8fXT0tluOvQMXG4Ss3Lk4H23sKyu09q32HlbOpLYxjTvi0DeqLKc/Ldy5Ztk2
 AZZ27sxzoNt/jhiw=;
Received: from mail-pj1-f43.google.com ([209.85.216.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nOgTo-0000Jm-9r
 for kgdb-bugreport@lists.sourceforge.net; Mon, 28 Feb 2022 13:54:28 +0000
Received: by mail-pj1-f43.google.com with SMTP id
 j10-20020a17090a94ca00b001bc2a9596f6so11385991pjw.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 28 Feb 2022 05:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WEy1zCQgDzZI0KWybQkh1tiSD7E5/9VujlwkP39Po4I=;
 b=S7MP84cNFACuxNfvhM7fJy4miwUvj6rX8/O5d5P3Tguai+qxHva7T8Sa+44kR26m4K
 rQg8xhy/dDkRLc8YoC0FocXWrtH+dOw2OKCYxNxZfQbib7HWrLHl+LCGckPX8KhY9RAL
 dznVnRIp37gF/yAOvrR3d9p0ZYjYxxUwX5i+jknC6gS10myUOCeukvn5ihIYJ3d/vKP7
 6zGy3YLCOuTUN6OEIHGLTSI6kTk6ceOn2JpoabZcQph2qZjVG4s4ef2a4KnG9tvyoNHp
 4A901AASZCniir/7Zb9MBw2Rah0hn8CFMhmF9N1cP/wLbl+y66SiFqJLA+QN+PWEXKre
 qQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WEy1zCQgDzZI0KWybQkh1tiSD7E5/9VujlwkP39Po4I=;
 b=2rDtd1RpXXj6WFHevFk134XAxEJGy6yid3JErZZSTBuK+N0MKPC0TPRCvtXJXxDTIF
 XPKlrDoKoZL+qadg80htoQBmXUJ9KoFqfJpivPcl3jrOIxcFhIFZpyDo8Rx/KZXq6GFa
 p5lZlGavcxWBuiXt04p7L0vjqqNQR5x3vqoLiSA/JULpqPQSLkqRtge1jgx81dmi8Da8
 uHFf8e961s3V7pCw5l/akcvLBVgGTmeJolzTVVaKm5S11zzJKwPnlVbEzsyzx1lnCflH
 uBIYjBHP+2Ymroq9BWZZCo9BiaLxQ1AZEMcCi2OdA0BkX4KUuVl2MbuZeVApqr9n2BwS
 TtQA==
X-Gm-Message-State: AOAM532G4zDY5FFCR2APx6hmlsSwl/zj8yWm4wkEFnJMgW3JJnKOgrob
 +F7l9tWFSdSfJKiVFZ6HyXzluA==
X-Google-Smtp-Source: ABdhPJxndjCL6DuOrGcZ40lddkjyZWeCgJNEwhO3fREhBQx7ptcnk3zS+oVQVdJ71WNlar0BPJv41A==
X-Received: by 2002:a17:90a:fef:b0:1bc:1465:c4e9 with SMTP id
 102-20020a17090a0fef00b001bc1465c4e9mr16919511pjz.119.1646056458698; 
 Mon, 28 Feb 2022 05:54:18 -0800 (PST)
Received: from localhost.localdomain
 ([2401:4900:1c2a:216d:26eb:507e:a508:58b5])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a056a00088900b004e03b051040sm13894746pfj.112.2022.02.28.05.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 05:54:18 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: linux-serial@vger.kernel.org,
	hasegawa-hitomi@fujitsu.com
Date: Mon, 28 Feb 2022 19:24:08 +0530
Message-Id: <20220228135408.1452882-1-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
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
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.43 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.43 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nOgTo-0000Jm-9r
Subject: [Kgdb-bugreport] [RFT v3] tty/sysrq: Make sysrq handler NMI aware
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
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 jason.wessel@windriver.com, kgdb-bugreport@lists.sourceforge.net,
 jirislaby@kernel.org
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

Hi Hitomi Hasegawa,

Give this patch a try with diagnostic pseudo NMI interrupt on A64FX and
let me know if it works for you. Also, feel free to include this patch
along with your driver patch.

-Sumit

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

 drivers/tty/sysrq.c       | 45 ++++++++++++++++++++++++++++++++++++++-
 include/linux/sysrq.h     |  1 +
 kernel/debug/debug_core.c |  1 +
 3 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index bbfd004449b5..40cd492fe6ec 100644
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
@@ -566,6 +573,32 @@ static void __sysrq_put_key_op(int key, const struct sysrq_key_op *op_p)
 		sysrq_key_table[i] = op_p;
 }
 
+static int sysrq_nmi_key = -1;
+
+static void sysrq_do_irq_work(struct irq_work *work)
+{
+	const struct sysrq_key_op *op_p;
+	int orig_suppress_printk;
+
+	orig_suppress_printk = suppress_printk;
+	suppress_printk = 0;
+
+	rcu_sysrq_start();
+	rcu_read_lock();
+
+	op_p = __sysrq_get_key_op(sysrq_nmi_key);
+	if (op_p)
+		op_p->handler(sysrq_nmi_key);
+
+	rcu_read_unlock();
+	rcu_sysrq_end();
+
+	suppress_printk = orig_suppress_printk;
+	sysrq_nmi_key = -1;
+}
+
+static DEFINE_IRQ_WORK(sysrq_irq_work, sysrq_do_irq_work);
+
 void __handle_sysrq(int key, bool check_mask)
 {
 	const struct sysrq_key_op *op_p;
@@ -573,6 +606,10 @@ void __handle_sysrq(int key, bool check_mask)
 	int orig_suppress_printk;
 	int i;
 
+	/* Skip sysrq handling if one already in progress */
+	if (sysrq_nmi_key != -1)
+		return;
+
 	orig_suppress_printk = suppress_printk;
 	suppress_printk = 0;
 
@@ -596,7 +633,13 @@ void __handle_sysrq(int key, bool check_mask)
 		if (!check_mask || sysrq_on_mask(op_p->enable_mask)) {
 			pr_info("%s\n", op_p->action_msg);
 			console_loglevel = orig_log_level;
-			op_p->handler(key);
+
+			if (in_nmi() && !op_p->nmi_safe) {
+				sysrq_nmi_key = key;
+				irq_work_queue(&sysrq_irq_work);
+			} else {
+				op_p->handler(key);
+			}
 		} else {
 			pr_info("This sysrq operation is disabled.\n");
 			console_loglevel = orig_log_level;
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
