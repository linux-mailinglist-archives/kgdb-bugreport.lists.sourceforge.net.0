Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B40203964
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 22 Jun 2020 16:28:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jnNQk-0005hM-Jx
	for lists+kgdb-bugreport@lfdr.de; Mon, 22 Jun 2020 14:28:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jnNQj-0005hA-8Q
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Jun 2020 14:28:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JRSHvl6U+IZL0NsvNZuwTx0bEAhR9MBQN7axB8epcUs=; b=M/UIZYzMCBHItEiss8XBfYulBZ
 hGGRXDaIEQW4VwQg0emYTI43WnIKaBQvXKB8335DVeGAxYcxPYdQl5wO4l0z5lQ5CNoKTdNhIrxAg
 vXqrH4nUekAK2hHrewFB1bbtmQ2S+Pd3HgUL8qpZPSVxViQYiPwTMxIl0PhZnY29pFtM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JRSHvl6U+IZL0NsvNZuwTx0bEAhR9MBQN7axB8epcUs=; b=fGw45z630YuBkjbmaVIGsoTew4
 10B6vZGoxL8TjMnkrsURQtu/aguRAiP3gLR6Kw6grOQCOtj9xjg8IW2xNO/0NdeAj8qiUrjQ3F4sn
 HtkpYGxS8eXLvNe3EQX80O2XodeZTBF4URXomU5gLwpb9w0VBMk2veCrmJIGTXVPTKEo=;
Received: from mail-pf1-f195.google.com ([209.85.210.195])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jnNQe-00E0Vj-Kn
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Jun 2020 14:28:13 +0000
Received: by mail-pf1-f195.google.com with SMTP id b201so8509268pfb.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Jun 2020 07:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JRSHvl6U+IZL0NsvNZuwTx0bEAhR9MBQN7axB8epcUs=;
 b=S8TezEvuiSh9r4tBiJ8Y0oZfklqL3bPKvd/7r3OyPqXHHov7Otay0asDWDli0VDaTF
 KFKyvZN2KacrOaS0MVEXkb9jRAT3dQ4+Cf6+zAfEvJedm3lyOYDDTqLOfN/36anHjr9r
 KsqPKjJzOfSAwUn3oO5oleQ5ofNvOhbgSz8gIHtWYPg+o2u7HtyH8K3QJE5pq3xfJxCf
 709Ko3xFJDv3Pq4cJf9abD0OkIiy+mcEygCEca/dxQTzzLvArfOFqQzOToCln2rtZ7F3
 ckoSN05a+EOUNIWgO9ziPfaAC+soDU1jlx1wKcwKemwABOOuuzqjb6b6ae8iByzjA2HG
 bZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JRSHvl6U+IZL0NsvNZuwTx0bEAhR9MBQN7axB8epcUs=;
 b=SVc4HI4ef6KIibzQrZRYUxenbkDBPbM/TDh6+ocs84ZrQV5GKxRX+gdJKqglouardk
 bdbpEOkCDxJyvkrOd6yqbh9RcnWhN3YMT49iS5gOBmU5HIX3I+861CNsekzWE4e4Q+a8
 rOhQOB5IMfEtW8kPBNNU7Opt5Fvc3GJVi2rofxjVAIGp+kcBoLzeprkxAeV6gSR8B69p
 ABiFGYnxE1pvpVfx7sOjt2KkAg9ry5i6ieGlOq09g4k/l6qW0GtdEF37Me4+dFAOFj7w
 U5R0RGtYqXJOTgbk1wfXSpkGoL2hqmM/moQRGdHbKAcYkz8lRBn3zM+Xfcsa0JAJAtYd
 S7Ig==
X-Gm-Message-State: AOAM532sWjo+NbDedFyRmXPOmB+w5wH8gAN+IGxTgja7hLS22w3k8HUS
 ttgkEoqg/f3O2GErF4HaUOyLRgzeTOI=
X-Google-Smtp-Source: ABdhPJyMPNkXvDSph4eqALLF9WLDlS7kA1v1tH/G8OVD2Popzc1/lGc77i3S8lr2qBs9cq2g8vL/bQ==
X-Received: by 2002:a63:d652:: with SMTP id d18mr13372987pgj.164.1592836075366; 
 Mon, 22 Jun 2020 07:27:55 -0700 (PDT)
Received: from localhost.localdomain ([117.252.67.186])
 by smtp.gmail.com with ESMTPSA id d6sm14547939pjh.5.2020.06.22.07.27.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jun 2020 07:27:54 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: kgdb-bugreport@lists.sourceforge.net,
	linux-serial@vger.kernel.org
Date: Mon, 22 Jun 2020 19:56:24 +0530
Message-Id: <1592835984-28613-8-git-send-email-sumit.garg@linaro.org>
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
 trust [209.85.210.195 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.195 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jnNQe-00E0Vj-Kn
Subject: [Kgdb-bugreport] [PATCH 7/7] serial: kgdb_nmi: Replace hrtimer with
 irq_work ping
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

Currently kgdb_nmi relies on a 100Hz timer to "defer" work from an NMI
handler. This is essentially doing the job that irq_work is designed to
do but in an odd and inefficient manner. Remove the timer code and
replace it with more appropriate irq_work related APIs.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 drivers/tty/serial/kgdb_nmi.c | 35 ++++++++++-------------------------
 1 file changed, 10 insertions(+), 25 deletions(-)

diff --git a/drivers/tty/serial/kgdb_nmi.c b/drivers/tty/serial/kgdb_nmi.c
index 2580f39..ad84eef 100644
--- a/drivers/tty/serial/kgdb_nmi.c
+++ b/drivers/tty/serial/kgdb_nmi.c
@@ -21,7 +21,7 @@
 #include <linux/tty_flip.h>
 #include <linux/serial_core.h>
 #include <linux/interrupt.h>
-#include <linux/hrtimer.h>
+#include <linux/irq_work.h>
 #include <linux/tick.h>
 #include <linux/kfifo.h>
 #include <linux/kgdb.h>
@@ -127,7 +127,7 @@ static struct console kgdb_nmi_console = {
 
 struct kgdb_nmi_tty_priv {
 	struct tty_port port;
-	struct timer_list timer;
+	struct irq_work work;
 	STRUCT_KFIFO(char, KGDB_NMI_FIFO_SIZE) fifo;
 };
 
@@ -141,13 +141,12 @@ static void kgdb_tty_recv(int ch)
 	if (!kgdb_nmi_port || ch < 0)
 		return;
 	/*
-	 * Can't use port->tty->driver_data as tty might be not there. Timer
-	 * will check for tty and will get the ref, but here we don't have to
-	 * do that, and actually, we can't: we're in NMI context, no locks are
-	 * possible.
+	 * Can't use port->tty->driver_data as tty might be not there. Also, we
+	 * can't even do that as we're in NMI context, no locks are possible.
 	 */
 	priv = container_of(kgdb_nmi_port, struct kgdb_nmi_tty_priv, port);
 	kfifo_in(&priv->fifo, &c, 1);
+	irq_work_queue(&priv->work);
 }
 
 static int kgdb_nmi_poll_one_knock(void)
@@ -222,18 +221,12 @@ bool kgdb_nmi_poll_knock(void)
 	return true;
 }
 
-/*
- * The tasklet is cheap, it does not cause wakeups when reschedules itself,
- * instead it waits for the next tick.
- */
-static void kgdb_nmi_tty_receiver(struct timer_list *t)
+static void kgdb_nmi_tty_receiver(struct irq_work *work)
 {
-	struct kgdb_nmi_tty_priv *priv = from_timer(priv, t, timer);
+	struct kgdb_nmi_tty_priv *priv =
+	    container_of(work, struct kgdb_nmi_tty_priv, work);
 	char ch;
 
-	priv->timer.expires = jiffies + (HZ/100);
-	add_timer(&priv->timer);
-
 	if (likely(!atomic_read(&kgdb_nmi_num_readers) ||
 		   !kfifo_len(&priv->fifo)))
 		return;
@@ -245,22 +238,13 @@ static void kgdb_nmi_tty_receiver(struct timer_list *t)
 
 static int kgdb_nmi_tty_activate(struct tty_port *port, struct tty_struct *tty)
 {
-	struct kgdb_nmi_tty_priv *priv =
-	    container_of(port, struct kgdb_nmi_tty_priv, port);
-
 	kgdb_nmi_port = port;
-	priv->timer.expires = jiffies + (HZ/100);
-	add_timer(&priv->timer);
 
 	return 0;
 }
 
 static void kgdb_nmi_tty_shutdown(struct tty_port *port)
 {
-	struct kgdb_nmi_tty_priv *priv =
-	    container_of(port, struct kgdb_nmi_tty_priv, port);
-
-	del_timer(&priv->timer);
 	kgdb_nmi_port = NULL;
 }
 
@@ -279,7 +263,8 @@ static int kgdb_nmi_tty_install(struct tty_driver *drv, struct tty_struct *tty)
 		return -ENOMEM;
 
 	INIT_KFIFO(priv->fifo);
-	timer_setup(&priv->timer, kgdb_nmi_tty_receiver, 0);
+	init_irq_work(&priv->work, kgdb_nmi_tty_receiver);
+	atomic_set(&priv->work.flags, IRQ_WORK_LAZY);
 	tty_port_init(&priv->port);
 	priv->port.ops = &kgdb_nmi_tty_port_ops;
 	tty->driver_data = priv;
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
