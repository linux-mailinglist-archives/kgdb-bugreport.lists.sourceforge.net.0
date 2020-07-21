Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7B7227FB0
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 21 Jul 2020 14:11:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jxr73-0008HU-Ed
	for lists+kgdb-bugreport@lfdr.de; Tue, 21 Jul 2020 12:11:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jxr71-0008Fo-5c
 for kgdb-bugreport@lists.sourceforge.net; Tue, 21 Jul 2020 12:11:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bmoIA6JVwOy+6GP1zUPLm+Haa8V9hMBSF82Ea7A25DQ=; b=A7y30kjhyC2RLfWFSI6Y8W8muq
 oZgQwT0AE8XdSz5UrGMZpVOZdToDZI0vkKKhMhOWLMV5alLU6fXqDHJYUJE+N3N67fegYxKX9WoHO
 TY9VJMREOFy/PaFRMdz2cCUDxfr9CBBO1/uLfjTz3SAzu1YtXHL1zq45VNxDIvwwuYFM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bmoIA6JVwOy+6GP1zUPLm+Haa8V9hMBSF82Ea7A25DQ=; b=nVovLRmVomO/RQk+C+9OGCLHcv
 PstrA5UOqIBfYMB2ANUD3GIevqRjABBnmFOdzcJcdPF4X2uTU/XLItICcfE8XJI+ZnHYDegI2S9YA
 7toQ5hf1WPL1KdAHmIeL5ubhZq/1qtyZliwsS/9NGhDlI9XDWjCw/PnIXTYVIzhcNIQY=;
Received: from mail-pf1-f194.google.com ([209.85.210.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jxr6w-00C1wA-Tu
 for kgdb-bugreport@lists.sourceforge.net; Tue, 21 Jul 2020 12:11:08 +0000
Received: by mail-pf1-f194.google.com with SMTP id m9so10645446pfh.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 21 Jul 2020 05:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bmoIA6JVwOy+6GP1zUPLm+Haa8V9hMBSF82Ea7A25DQ=;
 b=TyepKXn7OaYUQtt4hFJbFIHF5h+u+fprOJj4OSkj62VZU3n8u0j9yYrT7NHtWxi/an
 1b6b+9jU7D0O5dJMcoD2rqrFEj6sjq4HohRlHi1aWwa0ExNHUO6Az2x8gABX2q50szu/
 ZxKtmbi++l+NcrXL+hJgpevYLiU+XRaZ6UD2IzAUwrWQg9q1I4XAONLFu92YCQHfqU/Q
 dQ5tPt9ebLwtmoiVmPkO6qOOZKyJ7NpqggfM5bR/3nR8jSIxytunTjxLTpQCnIVdMlpr
 9/bIAOd1nr6zAEsHFPnA7mnoQ64IyInDUaDo159KyWXHggP9Q/+yfjHhXGangDK7tsJh
 MPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bmoIA6JVwOy+6GP1zUPLm+Haa8V9hMBSF82Ea7A25DQ=;
 b=FA2uuAxSeE/iDzeN1Auaa3dFGwBK0pIcJE0wC73Vua9xC6dmtY0Q4qiXNCxoZ/wmR6
 YmI3InOyC40dtY4L0bkTrYMPWlNNjsYFjNDqJ1msnzXmwGDzBcTqsZTs/zYieKtnScEp
 A0TWGYDblkdBexqTt+PF9MsP/g4L9eMN6QOVPyS7DWxwvBSbQI6BwUiyd6713liwOlQ2
 1oTGWOP1kuSq6N6k2xfwe5GcPUZYCv+dN7snxWruKqkLD/KctSYZ5VKmI02UB9bgRCP5
 VZWGpOgOAoRhK5A65cOOUFCXi1VKjgU6hSfPMxMAxr3R2SlZJtQC630FseqxIiXvw+0B
 XCRg==
X-Gm-Message-State: AOAM5319NZiCOeCZilb2uJUBwkrUszbqeQpZQQTUaAmLF3JUVYoEtjYw
 btF7jbGwKqK8+5tbwcrO80cWSA==
X-Google-Smtp-Source: ABdhPJx//Ilc8MIFF8alHzz3aukyRgaFhVVxqz29Ai3h7DB0QotUS2/ezSTlrD7mrAWkwoDkQznv6Q==
X-Received: by 2002:aa7:9a07:: with SMTP id w7mr22724654pfj.251.1595333454186; 
 Tue, 21 Jul 2020 05:10:54 -0700 (PDT)
Received: from localhost.localdomain ([117.210.211.74])
 by smtp.gmail.com with ESMTPSA id w9sm20601992pfq.178.2020.07.21.05.10.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Jul 2020 05:10:53 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: gregkh@linuxfoundation.org, daniel.thompson@linaro.org,
 dianders@chromium.org, linux-serial@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net
Date: Tue, 21 Jul 2020 17:40:09 +0530
Message-Id: <1595333413-30052-2-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595333413-30052-1-git-send-email-sumit.garg@linaro.org>
References: <1595333413-30052-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.194 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jxr6w-00C1wA-Tu
Subject: [Kgdb-bugreport] [RFC 1/5] tty/sysrq: Make sysrq handler NMI aware
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
Cc: jslaby@suse.com, linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
 jason.wessel@windriver.com, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

In a future patch we will add support to the serial core to make it
possible to trigger a magic sysrq from an NMI context. Prepare for this
by marking some sysrq actions as NMI safe. Safe actions will be allowed
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
 drivers/tty/sysrq.c       | 33 ++++++++++++++++++++++++++++++++-
 include/linux/sysrq.h     |  1 +
 kernel/debug/debug_core.c |  1 +
 3 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index 7c95afa9..8017e33 100644
--- a/drivers/tty/sysrq.c
+++ b/drivers/tty/sysrq.c
@@ -50,6 +50,8 @@
 #include <linux/syscalls.h>
 #include <linux/of.h>
 #include <linux/rcupdate.h>
+#include <linux/irq_work.h>
+#include <linux/kfifo.h>
 
 #include <asm/ptrace.h>
 #include <asm/irq_regs.h>
@@ -111,6 +113,7 @@ static const struct sysrq_key_op sysrq_loglevel_op = {
 	.help_msg	= "loglevel(0-9)",
 	.action_msg	= "Changing Loglevel",
 	.enable_mask	= SYSRQ_ENABLE_LOG,
+	.nmi_safe	= true,
 };
 
 #ifdef CONFIG_VT
@@ -157,6 +160,7 @@ static const struct sysrq_key_op sysrq_crash_op = {
 	.help_msg	= "crash(c)",
 	.action_msg	= "Trigger a crash",
 	.enable_mask	= SYSRQ_ENABLE_DUMP,
+	.nmi_safe	= true,
 };
 
 static void sysrq_handle_reboot(int key)
@@ -170,6 +174,7 @@ static const struct sysrq_key_op sysrq_reboot_op = {
 	.help_msg	= "reboot(b)",
 	.action_msg	= "Resetting",
 	.enable_mask	= SYSRQ_ENABLE_BOOT,
+	.nmi_safe	= true,
 };
 
 const struct sysrq_key_op *__sysrq_reboot_op = &sysrq_reboot_op;
@@ -217,6 +222,7 @@ static const struct sysrq_key_op sysrq_showlocks_op = {
 	.handler	= sysrq_handle_showlocks,
 	.help_msg	= "show-all-locks(d)",
 	.action_msg	= "Show Locks Held",
+	.nmi_safe	= true,
 };
 #else
 #define sysrq_showlocks_op (*(const struct sysrq_key_op *)NULL)
@@ -289,6 +295,7 @@ static const struct sysrq_key_op sysrq_showregs_op = {
 	.help_msg	= "show-registers(p)",
 	.action_msg	= "Show Regs",
 	.enable_mask	= SYSRQ_ENABLE_DUMP,
+	.nmi_safe	= true,
 };
 
 static void sysrq_handle_showstate(int key)
@@ -326,6 +333,7 @@ static const struct sysrq_key_op sysrq_ftrace_dump_op = {
 	.help_msg	= "dump-ftrace-buffer(z)",
 	.action_msg	= "Dump ftrace buffer",
 	.enable_mask	= SYSRQ_ENABLE_DUMP,
+	.nmi_safe	= true,
 };
 #else
 #define sysrq_ftrace_dump_op (*(const struct sysrq_key_op *)NULL)
@@ -538,6 +546,23 @@ static void __sysrq_put_key_op(int key, const struct sysrq_key_op *op_p)
                 sysrq_key_table[i] = op_p;
 }
 
+#define SYSRQ_NMI_FIFO_SIZE	64
+static DEFINE_KFIFO(sysrq_nmi_fifo, int, SYSRQ_NMI_FIFO_SIZE);
+
+static void sysrq_do_nmi_work(struct irq_work *work)
+{
+	const struct sysrq_key_op *op_p;
+	int key;
+
+	while (kfifo_out(&sysrq_nmi_fifo, &key, 1)) {
+		op_p = __sysrq_get_key_op(key);
+		if (op_p)
+			op_p->handler(key);
+	}
+}
+
+static DEFINE_IRQ_WORK(sysrq_nmi_work, sysrq_do_nmi_work);
+
 void __handle_sysrq(int key, bool check_mask)
 {
 	const struct sysrq_key_op *op_p;
@@ -568,7 +593,13 @@ void __handle_sysrq(int key, bool check_mask)
 		if (!check_mask || sysrq_on_mask(op_p->enable_mask)) {
 			pr_info("%s\n", op_p->action_msg);
 			console_loglevel = orig_log_level;
-			op_p->handler(key);
+
+			if (in_nmi() && !op_p->nmi_safe) {
+				kfifo_in(&sysrq_nmi_fifo, &key, 1);
+				irq_work_queue(&sysrq_nmi_work);
+			} else {
+				op_p->handler(key);
+			}
 		} else {
 			pr_info("This sysrq operation is disabled.\n");
 			console_loglevel = orig_log_level;
diff --git a/include/linux/sysrq.h b/include/linux/sysrq.h
index 3a582ec..630b5b9 100644
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
index 9e59347..2b51173 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -943,6 +943,7 @@ static const struct sysrq_key_op sysrq_dbg_op = {
 	.handler	= sysrq_handle_dbg,
 	.help_msg	= "debug(g)",
 	.action_msg	= "DEBUG",
+	.nmi_safe	= true,
 };
 #endif
 
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
