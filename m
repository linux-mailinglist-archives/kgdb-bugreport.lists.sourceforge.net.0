Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 449484C6503
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 28 Feb 2022 09:49:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nObig-0006Lr-A2
	for lists+kgdb-bugreport@lfdr.de; Mon, 28 Feb 2022 08:49:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sumit.garg@linaro.org>) id 1nObif-0006LM-AW
 for kgdb-bugreport@lists.sourceforge.net; Mon, 28 Feb 2022 08:49:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZxNL+6dFD7T+5PW30Lk1xBn67D6XIaHvNpgoJ9NTjy4=; b=JjJvaYJ57tSNr6inZNGC/PkMY/
 7inFmSYmyscfWRl8eEPQmajNQUDkyfuB10PPYhV4oQVkKRSn/Y88roiEm1UuHgMpd4jvWFsmU1hC+
 iJvYPdyKj006vQEkKJVwBHFxWEQqdhQVTGY/gFhnW+0AyBRS6si8OdiEwmE0Gu/gXjLA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ZxNL+6dFD7T+5PW30Lk1xBn67D6XIaHvNpgoJ9NTjy4=; b=f
 KvUUafITLwV8M97pMqLVRYHsAgJaaqN6yvKHvC1TO3Q+DL8adtKkrOjIB6hZuvt//+rQ9QPHmG3o3
 zdbGrjILdZt0ZcoZ2p7+KAcs9XWIbCK8lxxZIQq6e5mJ6DH2Z0ZOP7XW2eIx6WokrOZWLtI19xoXS
 YgVvMB0nGevs8tx8=;
Received: from mail-pj1-f46.google.com ([209.85.216.46])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nObiW-00HWo5-O8
 for kgdb-bugreport@lists.sourceforge.net; Mon, 28 Feb 2022 08:49:23 +0000
Received: by mail-pj1-f46.google.com with SMTP id m22so10547811pja.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 28 Feb 2022 00:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZxNL+6dFD7T+5PW30Lk1xBn67D6XIaHvNpgoJ9NTjy4=;
 b=fs35vFB0KRl92VpZ4zCPh94kK4QKFghxT9dVjb5ad76lIBj83DksQT0xkjHAohL1lL
 ZJ4qKIzIK0EGDMQgcSqKYC5C+lT5R0hyLvdYKaFzHJjlNdtvFEHD3W/Nfx94Gxsm5xdU
 T5GEwy4R0eCYZjZtfUQLsDQ9McL+nQ1dG7goYSjG+dOrIjpFue8azpofI1ovdWFuGRwG
 XhvsDve7ML9WXfvST/SV2ddLSuChTKlRT/wTIaluxmP84DIXTrVW36zAW2tYUlFWVVH4
 RA/eeY/vZOM2x62hynwaRF+SP9UB9OS3aZWCk81YRpT13r+lU8Tcs1ojrXJLtkOQXS3C
 DPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZxNL+6dFD7T+5PW30Lk1xBn67D6XIaHvNpgoJ9NTjy4=;
 b=7oft/LXJv9nMIzFb0i7BXCJ2RD4+gxJECX30sPZPqgVNX7SCCMAC1fhbh7C1WghAGD
 RD3OiZvKMQsimZTdQkDZW9adedkxu9SRIfhr6Mix2m8MRf3NKAvsEpkilxDRyzEZ+iug
 fLFjchiGApYPvns3WZ8bAEkSIQq6BoBKPrRXMKLT179pSJEVvoOep5s7C13O9PjmsgN+
 GrdBc2H+Ic2WmpqPvi7zgCZ1EeFpwLKV+sB9RTwBh2DOdvYA+cBEvgrloDA4wCeMuCac
 cpM0sIbAkNwcnixuulKkAVh5xqO5hFnWp1kSBZRKYk3xsONBupGk2sQu8jGFWBFSOS3G
 UM9g==
X-Gm-Message-State: AOAM533vhf208VATYEcOKt/gk+NLei+434+i4wPFCK4DHb9Oo2bqd/PQ
 +VNoXqrSXKlNqybxp3oM5rgOBG+i6maOWg==
X-Google-Smtp-Source: ABdhPJzR7JD8YnimuiOOh4J+PNunyKkQl5Z0ZeuTGsNr86JH+xMIyio++QJKgFkdr+mgmQTEYhgvhQ==
X-Received: by 2002:a05:6a00:ad0:b0:4e1:2d96:2ab0 with SMTP id
 c16-20020a056a000ad000b004e12d962ab0mr20194923pfl.3.1646034841458; 
 Sun, 27 Feb 2022 23:54:01 -0800 (PST)
Received: from localhost.localdomain
 ([2401:4900:1c2a:216d:26eb:507e:a508:58b5])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a62f206000000b004e152bc0527sm12115388pfh.153.2022.02.27.23.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 23:54:00 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: linux-serial@vger.kernel.org,
	hasegawa-hitomi@fujitsu.com
Date: Mon, 28 Feb 2022 13:23:51 +0530
Message-Id: <20220228075351.1412452-1-sumit.garg@linaro.org>
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
 no trust [209.85.216.46 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.46 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nObiW-00HWo5-O8
Subject: [Kgdb-bugreport] [RFT v2] tty/sysrq: Make sysrq handler NMI aware
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

Changes in v2:
- Rebased to 5.17-rc5.
- Separate this patch from complete patch-set [1] as its relevant for
  other diagnostic NMI interrupts [2] as well apart from uart NMI
  interrupts.
- Incorporated suggestions from Doug.

[1] https://lore.kernel.org/linux-arm-kernel/CAFA6WYOWHgmYYt=KGXDh2hKiuy_rQbJfi279ev0+s-Qh7L21kA@mail.gmail.com/t/#m2b5006f08581448020eb24566927a104d0b95c44
[2] https://lore.kernel.org/all/Yhi0rrkSR63ZhjX1@kroah.com/T/

 drivers/tty/sysrq.c       | 51 ++++++++++++++++++++++++++++++++++++++-
 include/linux/sysrq.h     |  1 +
 kernel/debug/debug_core.c |  1 +
 3 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index bbfd004449b5..0ce944591036 100644
--- a/drivers/tty/sysrq.c
+++ b/drivers/tty/sysrq.c
@@ -51,6 +51,8 @@
 #include <linux/syscalls.h>
 #include <linux/of.h>
 #include <linux/rcupdate.h>
+#include <linux/irq_work.h>
+#include <linux/kfifo.h>
 
 #include <asm/ptrace.h>
 #include <asm/irq_regs.h>
@@ -112,6 +114,7 @@ static const struct sysrq_key_op sysrq_loglevel_op = {
 	.help_msg	= "loglevel(0-9)",
 	.action_msg	= "Changing Loglevel",
 	.enable_mask	= SYSRQ_ENABLE_LOG,
+	.nmi_safe	= true,
 };
 
 #ifdef CONFIG_VT
@@ -159,6 +162,7 @@ static const struct sysrq_key_op sysrq_crash_op = {
 	.help_msg	= "crash(c)",
 	.action_msg	= "Trigger a crash",
 	.enable_mask	= SYSRQ_ENABLE_DUMP,
+	.nmi_safe	= true,
 };
 
 static void sysrq_handle_reboot(int key)
@@ -172,6 +176,7 @@ static const struct sysrq_key_op sysrq_reboot_op = {
 	.help_msg	= "reboot(b)",
 	.action_msg	= "Resetting",
 	.enable_mask	= SYSRQ_ENABLE_BOOT,
+	.nmi_safe	= true,
 };
 
 const struct sysrq_key_op *__sysrq_reboot_op = &sysrq_reboot_op;
@@ -219,6 +224,7 @@ static const struct sysrq_key_op sysrq_showlocks_op = {
 	.handler	= sysrq_handle_showlocks,
 	.help_msg	= "show-all-locks(d)",
 	.action_msg	= "Show Locks Held",
+	.nmi_safe	= true,
 };
 #else
 #define sysrq_showlocks_op (*(const struct sysrq_key_op *)NULL)
@@ -291,6 +297,7 @@ static const struct sysrq_key_op sysrq_showregs_op = {
 	.help_msg	= "show-registers(p)",
 	.action_msg	= "Show Regs",
 	.enable_mask	= SYSRQ_ENABLE_DUMP,
+	.nmi_safe	= true,
 };
 
 static void sysrq_handle_showstate(int key)
@@ -328,6 +335,7 @@ static const struct sysrq_key_op sysrq_ftrace_dump_op = {
 	.help_msg	= "dump-ftrace-buffer(z)",
 	.action_msg	= "Dump ftrace buffer",
 	.enable_mask	= SYSRQ_ENABLE_DUMP,
+	.nmi_safe	= true,
 };
 #else
 #define sysrq_ftrace_dump_op (*(const struct sysrq_key_op *)NULL)
@@ -566,6 +574,37 @@ static void __sysrq_put_key_op(int key, const struct sysrq_key_op *op_p)
 		sysrq_key_table[i] = op_p;
 }
 
+#define SYSRQ_NMI_FIFO_SIZE	2
+static DEFINE_KFIFO(sysrq_nmi_fifo, int, SYSRQ_NMI_FIFO_SIZE);
+
+static void sysrq_do_nmi_work(struct irq_work *work)
+{
+	const struct sysrq_key_op *op_p;
+	int orig_suppress_printk;
+	int key;
+
+	orig_suppress_printk = suppress_printk;
+	suppress_printk = 0;
+
+	rcu_sysrq_start();
+	rcu_read_lock();
+
+	if (kfifo_peek(&sysrq_nmi_fifo, &key)) {
+		op_p = __sysrq_get_key_op(key);
+		if (op_p)
+			op_p->handler(key);
+	}
+
+	rcu_read_unlock();
+	rcu_sysrq_end();
+
+	suppress_printk = orig_suppress_printk;
+
+	kfifo_reset_out(&sysrq_nmi_fifo);
+}
+
+static DEFINE_IRQ_WORK(sysrq_nmi_work, sysrq_do_nmi_work);
+
 void __handle_sysrq(int key, bool check_mask)
 {
 	const struct sysrq_key_op *op_p;
@@ -573,6 +612,10 @@ void __handle_sysrq(int key, bool check_mask)
 	int orig_suppress_printk;
 	int i;
 
+	/* Skip sysrq handling if one already in progress */
+	if (!kfifo_is_empty(&sysrq_nmi_fifo))
+		return;
+
 	orig_suppress_printk = suppress_printk;
 	suppress_printk = 0;
 
@@ -596,7 +639,13 @@ void __handle_sysrq(int key, bool check_mask)
 		if (!check_mask || sysrq_on_mask(op_p->enable_mask)) {
 			pr_info("%s\n", op_p->action_msg);
 			console_loglevel = orig_log_level;
-			op_p->handler(key);
+
+			if (in_nmi() && !op_p->nmi_safe) {
+				kfifo_put(&sysrq_nmi_fifo, key);
+				irq_work_queue(&sysrq_nmi_work);
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
