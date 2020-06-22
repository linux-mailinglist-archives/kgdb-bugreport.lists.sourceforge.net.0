Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A39DC20394C
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 22 Jun 2020 16:27:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jnNQL-0005fs-Ei
	for lists+kgdb-bugreport@lfdr.de; Mon, 22 Jun 2020 14:27:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jnNQJ-0005fk-EU
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Jun 2020 14:27:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sjUQXgLs8QLSZt9fRiSIf9rP+l/zfeDDFs4yVtYk7Z0=; b=eFRzIKOO+/Ism+6Fjw9uSpqOtC
 bhmbSSHv0SYI4xhR+K+v3G3pl5daixkjvAS7T05w3yK5GPr1aYkTh45LgeySy0zxP171TXexz4GSK
 1cmpXyqv0bhUshNhWMmOSdsNPvBVBMqK101pW69QfoAZTAeAT9Sc6g16TsXpOMQDukek=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sjUQXgLs8QLSZt9fRiSIf9rP+l/zfeDDFs4yVtYk7Z0=; b=XJK3sQ+SYcmy6C/J5MkxN+VDKI
 zo/j8+RQqt9Gi1QfuUEHaTHoqwQ2JYLwxTrmS9hF+dNmPUppUlrs/Wssmaf1ZqfryhkGSnPMziVgh
 x1mD4rm1gMt6+82Vvbf3IPeqavq7N339D4Z1LUpXrLm93gbn925qWZEjuRjuufwGx0Vc=;
Received: from mail-pj1-f67.google.com ([209.85.216.67])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jnNQI-00F0Ve-1M
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Jun 2020 14:27:47 +0000
Received: by mail-pj1-f67.google.com with SMTP id h22so8710497pjf.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Jun 2020 07:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=sjUQXgLs8QLSZt9fRiSIf9rP+l/zfeDDFs4yVtYk7Z0=;
 b=QOeLXcXXYJY7Mbx/0GKxWfojZNvqp1+/iUKrhHvJJPT9TVW7hdHXE2t9l97MfMSFpN
 a08ODnr/u8hVAu7RVgm3nwaohgTk6yIAfdCRoM5WfyRsqxQHCEGEzi9wTA/yKOQSDDTn
 EspPlVmFhi6LGov/zu0zVQxHn0TORwdNIp4Tz25YBXpANqqkhTFuF4GxAxBipD+4hDqG
 jmvq8KHWY56pQ4Uhc3UmRVKr91Ozy+VR2DUlvgYbGewgO3jRkY/Dp81cKfOw8z4F75Dm
 Z8nwP0kHFAnNAqtxxXXSBop65W6O3MFJ//0g5Mpc6ZSBKBujqa7snPffto/Uxw5BV9qX
 S9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=sjUQXgLs8QLSZt9fRiSIf9rP+l/zfeDDFs4yVtYk7Z0=;
 b=PugpdkSZaPE5UOqVJ68bTcnTaVenlNygKGjU7+XWzFtYC4yCTxzPs6Wo+AzVWFxrjB
 kwWZxOQTGlSmtnYuufLLg8SHdIaG9Jaa4SLaUf+ifBbsbOhio/e0981Ik3HHZD3anQAB
 EHAalrtQLx2I8zub6I9+g85wEteFsmZyUQZMELToq/8imK+QnHC9UaFKdeXS9LH7SgYv
 BF9Oed/UVnXMRBu3c9WbHAt5laXWoZLwauJ6i7XwG+M3a0WxgpH/ANRc12gAtfV7krHw
 ttm5l7+cpd0qSJ/2puAIt0PrWZxq0Z+3MGGGlPsWUpW74t7r2RSZ62jZi4bBOeJhsBXV
 Ma8g==
X-Gm-Message-State: AOAM53102bg/7K70UGO4BFNp0FNFez3TnmjDoKLBm/GYCXxVNT9ZRFiL
 9urESo/LdM6DyAJ1J69WBvrzMJ3ZCaY=
X-Google-Smtp-Source: ABdhPJzpaCxkbO/21akB31Cg1TWuLDrphNwsB5izjnAOPjR2mgcdxwifka4NWh+oyQbNDK0xDtgcng==
X-Received: by 2002:a17:90a:d485:: with SMTP id
 s5mr17596432pju.61.1592836060022; 
 Mon, 22 Jun 2020 07:27:40 -0700 (PDT)
Received: from localhost.localdomain ([117.252.67.186])
 by smtp.gmail.com with ESMTPSA id d6sm14547939pjh.5.2020.06.22.07.27.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jun 2020 07:27:39 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: kgdb-bugreport@lists.sourceforge.net,
	linux-serial@vger.kernel.org
Date: Mon, 22 Jun 2020 19:56:21 +0530
Message-Id: <1592835984-28613-5-git-send-email-sumit.garg@linaro.org>
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
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.5 RCVD_IN_SORBS_WEB      RBL: SORBS: sender is an abusable web server
 [117.252.67.186 listed in dnsbl.sorbs.net]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.67 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.67 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jnNQI-00F0Ve-1M
Subject: [Kgdb-bugreport] [PATCH 4/7] serial: kgdb_nmi: Add support for
 interrupt based fallback
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

Add a generic NMI fallback to support kgdb NMI console feature which can
be overridden by arch specific implementation.

This common fallback mechanism utilizes kgdb IO based interrupt in order
to support entry into kgdb if a user types in kgdb_nmi_magic sequence. So
during NMI console init, NMI handler is installed corresponding to kgdb
IO based NMI which is invoked when a character is pending and that can be
cleared by calling @read_char until it returns NO_POLL_CHAR.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
Co-developed-by: Sumit Garg <sumit.garg@linaro.org>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 drivers/tty/serial/kgdb_nmi.c | 47 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 40 insertions(+), 7 deletions(-)

diff --git a/drivers/tty/serial/kgdb_nmi.c b/drivers/tty/serial/kgdb_nmi.c
index b32c6b1..2580f39 100644
--- a/drivers/tty/serial/kgdb_nmi.c
+++ b/drivers/tty/serial/kgdb_nmi.c
@@ -42,9 +42,46 @@ MODULE_PARM_DESC(magic, "magic sequence to enter NMI debugger (default $3#33)");
 static atomic_t kgdb_nmi_num_readers = ATOMIC_INIT(0);
 static struct console *orig_dbg_cons;
 
+static int kgdb_nmi_poll_one_knock(void);
+
+static irqreturn_t kgdb_handle_nmi(int irq, void *dev_id)
+{
+	int ret;
+
+	if (kgdb_nmi_knock < 0) {
+		kgdb_breakpoint();
+		return IRQ_HANDLED;
+	}
+
+	ret = kgdb_nmi_poll_one_knock();
+	if (ret == NO_POLL_CHAR)
+		return IRQ_NONE;
+
+	while (ret != 1) {
+		ret = kgdb_nmi_poll_one_knock();
+		if (ret == NO_POLL_CHAR)
+			return IRQ_HANDLED;
+	}
+
+	kgdb_breakpoint();
+	return IRQ_HANDLED;
+}
+
 static int kgdb_nmi_console_setup(struct console *co, char *options)
 {
-	arch_kgdb_ops.enable_nmi(1);
+	int res;
+
+	if (arch_kgdb_ops.enable_nmi) {
+		arch_kgdb_ops.enable_nmi(1);
+	} else if (dbg_io_ops->request_nmi) {
+		res = dbg_io_ops->request_nmi(kgdb_handle_nmi, co);
+		if (res) {
+			pr_err("ttyNMI0: Cannot request nmi/irq\n");
+			return res;
+		}
+	} else {
+		return -ENODEV;
+	}
 
 	/* The NMI console uses the dbg_io_ops to issue console messages. To
 	 * avoid duplicate messages during kdb sessions we must inform kdb's
@@ -328,9 +365,6 @@ int kgdb_register_nmi_console(void)
 {
 	int ret;
 
-	if (!arch_kgdb_ops.enable_nmi)
-		return 0;
-
 	kgdb_nmi_tty_driver = alloc_tty_driver(1);
 	if (!kgdb_nmi_tty_driver) {
 		pr_err("%s: cannot allocate tty\n", __func__);
@@ -380,9 +414,8 @@ int kgdb_unregister_nmi_console(void)
 {
 	int ret;
 
-	if (!arch_kgdb_ops.enable_nmi)
-		return 0;
-	arch_kgdb_ops.enable_nmi(0);
+	if (arch_kgdb_ops.enable_nmi)
+		arch_kgdb_ops.enable_nmi(0);
 
 	ret = unregister_console(&kgdb_nmi_console);
 	if (ret)
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
