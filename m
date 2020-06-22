Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 50306203957
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 22 Jun 2020 16:27:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jnNQQ-0005JJ-54
	for lists+kgdb-bugreport@lfdr.de; Mon, 22 Jun 2020 14:27:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jnNQO-0005J7-Tt
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Jun 2020 14:27:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SpQVzSBjDEPebQy5qXPK/BkcdPQ45hc1OKMcPgP/hpg=; b=eA1yfgjJpFVbhSAgDoFocPo5ZD
 f8RbDZ6WMr1bdxpuYvFNGqc2+YB+Osloam07oMjHng3/3RCVLSG7XyMHq7lAWVUotN4vad8WO+egU
 53AagioAnnYObKiuEYDr+dyUbGQ+P/lbtbEpAOfMwGoic462BJvWpPBnQ85Vnjp1yMP8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SpQVzSBjDEPebQy5qXPK/BkcdPQ45hc1OKMcPgP/hpg=; b=NKM2wau5zH5URHVT5wz+/uAAXb
 Q1Dgvd9RzNqLKq8EtAsgCzzEvYHxHeNoCEbEEYjr4ZGIIslhFX+0bFpT4/zTjTceQh1+gH7zSd01c
 7rc3aunuAKduxATEDdY1Qydsr1Sotw65Vt3hlZ56R7bb2dRrgM8HguLbTgALa1+dxTyo=;
Received: from mail-pf1-f194.google.com ([209.85.210.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jnNQK-00C0SX-Cx
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Jun 2020 14:27:52 +0000
Received: by mail-pf1-f194.google.com with SMTP id x207so8496202pfc.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Jun 2020 07:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SpQVzSBjDEPebQy5qXPK/BkcdPQ45hc1OKMcPgP/hpg=;
 b=hI2iPwM6eHl78f/Rf8OaivVcHz3gxNYp7IujpJ0Fw4woi28ptBxRkJmesqWs9PJ8eq
 yFgt6ooC0ATzyjeS3E3XgbmXm+QpmI3HL0rWsAUsTdQfAkLwHauCN9foUfI51PEMGHZ8
 yODUaCBZN8pKYgqZBYI9xuc0XcLmgHZwlVFZ3KYI3auT9hZPwg6xMXFq9NPQ8FSG50FJ
 oR8FlHOsAAzKbPhx4LYo0bJFdsUWcoUsugtAVKLcLzmcam3p7brbYKkOdLUOjAkWmQ16
 9WZbzObPYrGJctJ6gY4fm+CGqzRaZTkVF7lUIi5989wtOBl4m4X8YvITzEhSBDAYRgCI
 lq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SpQVzSBjDEPebQy5qXPK/BkcdPQ45hc1OKMcPgP/hpg=;
 b=n2J7uo+kaYWYO+IWfVsbIz9Bv00qbKXrnEb5r7EJ2puShRwloCsKu8qgRaJX/YjiCX
 PXCUwlQjc5k5R2PhO2JuwjWP+GXAxz6dGO7FvsG6ba3FYSYzRp9HloKsyP7PSHfWxii7
 rYOCP4K1mvwMTKoCXbanvc5HeAH+j6vHdieSlH6yRLclceTu86IPsmWgIOFSL/QN7n/u
 0kEtr4kwBUwvlxYWsBT606NsCCN4zJaDr2NYwKZFDbf3FsiT1GFG6ttsBP3S1L8m/f8b
 OBbEup/xreFd0EdMA3De89U9KQMT5jHHmT2A5rAvF/L4/O0FRdQcxjON7IlaHb2wqtqT
 65tw==
X-Gm-Message-State: AOAM5312UyBOujVBiRxiM/UQGZASqkbTfpd/KnxV5TMB16knjsen2TVw
 FzGz8qM9JKDdsQKbnPQp/CeAgq7EaOM=
X-Google-Smtp-Source: ABdhPJwEwxcR4qCfAcHSUX33rqxUd8JB5pxuQIXs8e8eUwjmKcCs+hmNcxPhJxjHoOv9HJRsrjAwZw==
X-Received: by 2002:a63:eb54:: with SMTP id b20mr13113025pgk.380.1592836055116; 
 Mon, 22 Jun 2020 07:27:35 -0700 (PDT)
Received: from localhost.localdomain ([117.252.67.186])
 by smtp.gmail.com with ESMTPSA id d6sm14547939pjh.5.2020.06.22.07.27.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jun 2020 07:27:34 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: kgdb-bugreport@lists.sourceforge.net,
	linux-serial@vger.kernel.org
Date: Mon, 22 Jun 2020 19:56:20 +0530
Message-Id: <1592835984-28613-4-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592835984-28613-1-git-send-email-sumit.garg@linaro.org>
References: <1592835984-28613-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: 1.4 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 1.5 RCVD_IN_SORBS_WEB      RBL: SORBS: sender is an abusable web server
 [117.252.67.186 listed in dnsbl.sorbs.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.194 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.194 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jnNQK-00C0SX-Cx
Subject: [Kgdb-bugreport] [PATCH 3/7] kgdb: Add request_nmi() to the io ops
 table for kgdboc
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
Cc: daniel.thompson@linaro.org, gregkh@linuxfoundation.org,
 jason.wessel@windriver.com, linux@armlinux.org.uk, jslaby@suse.com,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

From: Daniel Thompson <daniel.thompson@linaro.org>

Add request_nmi() callback to install a non-maskable interrupt handler
corresponding to IRQ retrieved from polling interface. If NMI handler
installation fails due to missing support from underlying irqchip driver
then fallback to install it as normal interrupt handler.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
Co-developed-by: Sumit Garg <sumit.garg@linaro.org>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 drivers/tty/serial/kgdboc.c | 35 +++++++++++++++++++++++++++++++++++
 include/linux/kgdb.h        |  7 +++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
index 84ffede..263afae 100644
--- a/drivers/tty/serial/kgdboc.c
+++ b/drivers/tty/serial/kgdboc.c
@@ -19,6 +19,9 @@
 #include <linux/console.h>
 #include <linux/vt_kern.h>
 #include <linux/input.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqdesc.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/serial_core.h>
@@ -390,12 +393,44 @@ static void kgdboc_post_exp_handler(void)
 	kgdboc_restore_input();
 }
 
+static int kgdb_tty_irq;
+
+static int kgdboc_request_nmi(irq_handler_t fn, void *dev_id)
+{
+	int irq, res;
+
+	/* Better to avoid double allocation in the tty driver! */
+	if (kgdb_tty_irq)
+		return 0;
+
+	if (!kgdb_tty_driver->ops->poll_get_irq)
+		return -ENODEV;
+
+	irq =
+	    kgdb_tty_driver->ops->poll_get_irq(kgdb_tty_driver, kgdb_tty_line);
+	if (irq <= 0)
+		return irq ? irq : -ENODEV;
+
+	irq_set_status_flags(irq, IRQ_NOAUTOEN);
+	res = request_nmi(irq, fn, IRQF_PERCPU, "kgdboc", dev_id);
+	if (res) {
+		res = request_irq(irq, fn, IRQF_SHARED, "kgdboc", dev_id);
+		WARN_ON(res);
+	}
+
+	enable_irq(irq);
+
+	kgdb_tty_irq = irq;
+	return 0;
+}
+
 static struct kgdb_io kgdboc_io_ops = {
 	.name			= "kgdboc",
 	.read_char		= kgdboc_get_char,
 	.write_char		= kgdboc_put_char,
 	.pre_exception		= kgdboc_pre_exp_handler,
 	.post_exception		= kgdboc_post_exp_handler,
+	.request_nmi		= kgdboc_request_nmi,
 };
 
 #if IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE)
diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
index 529116b..b32b044 100644
--- a/include/linux/kgdb.h
+++ b/include/linux/kgdb.h
@@ -16,6 +16,7 @@
 #include <linux/linkage.h>
 #include <linux/init.h>
 #include <linux/atomic.h>
+#include <linux/interrupt.h>
 #ifdef CONFIG_HAVE_ARCH_KGDB
 #include <asm/kgdb.h>
 #endif
@@ -276,6 +277,10 @@ struct kgdb_arch {
  * the I/O driver.
  * @post_exception: Pointer to a function that will do any cleanup work
  * for the I/O driver.
+ * @request_nmi: Pointer to a function that can install an non-maskable
+ * interrupt handler that will be called when a character is pending and that
+ * can be cleared by calling @read_char until it returns NO_POLL_CHAR. If NMI
+ * installation fails then fallback to install normal interrupt handler.
  * @cons: valid if the I/O device is a console; else NULL.
  */
 struct kgdb_io {
@@ -287,6 +292,8 @@ struct kgdb_io {
 	void			(*deinit) (void);
 	void			(*pre_exception) (void);
 	void			(*post_exception) (void);
+	int			(*request_nmi)(irq_handler_t nmi_handler,
+					       void *dev_id);
 	struct console		*cons;
 };
 
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
