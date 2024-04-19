Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B9F8AACD6
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 19 Apr 2024 12:30:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rxlW8-0005tp-VK
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 19 Apr 2024 10:30:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rxlW7-0005tj-Od
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 Apr 2024 10:30:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zXfB1XmyJGycp6o9EvN2dcs3pfRs+qgNDmJ2Wpliu7Y=; b=Zt8eS7AxKIqR2+iWj5ggwsmCBt
 0EyIgPcXDlz9wfbtWeZU89+1t8vTpEsj/vOqsp5UY/b/JHHHMAFLkF6hGIOaTXqSeke3DW36DND6W
 FtpqfeGTUUPV/l3yovL1m2F54KYCFm+XB9yNrsLRNljxXKjes2WEwNA6cef2nwXNCK4g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zXfB1XmyJGycp6o9EvN2dcs3pfRs+qgNDmJ2Wpliu7Y=; b=m
 33pIWtcUWEQtORa7EK2UVDCMDLZh6l6PO8ji+sGSjRpWE0FULOugUsP9gOaBTOutfepzv6AjV8qe1
 MOv0tjVNkG9/TYd6uxMOIQtx5MgsuUQzEYlXgtDRSr6q6VZcBxVETgk3DJWIs1QG3xsUZ2co2ZIP1
 eXIWLmX0WtYDPNAE=;
Received: from mail-wm1-f42.google.com ([209.85.128.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rxlW7-0004vM-66 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 Apr 2024 10:30:51 +0000
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-419c8c314d3so120325e9.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 19 Apr 2024 03:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713522639; x=1714127439; darn=lists.sourceforge.net;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zXfB1XmyJGycp6o9EvN2dcs3pfRs+qgNDmJ2Wpliu7Y=;
 b=ZFDec15nc0f30+5rL+jXuiPn1FzIJnf1ghIoItV1Kfy392tKZTVRO11HddglHIJ0NT
 bc6mRTUBOscCkG0fXhPYHQXq1YwrB0r4AsPKugZpVdWuMgmEr5E5hOiWAKJNS2VVn472
 UQ9++LohVuabGqAkHM38W9Zphfu/2MwQzRAgYserT5Q7SH8FQR33EmXKIdLfpVwD10Qs
 lQ3kMMz5jphZPG0XPk1qBJgEEmzudb+9HjkViaAOL/wIJzoUZBJkCkFK0bZjvJB2VRVr
 z1MQ81WRU2RrQPt1pqU35k0OSCW01Q8BrOwbBIV2WuU+pqLkZizyvH2thjR3evB8Px7q
 fXlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713522639; x=1714127439;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zXfB1XmyJGycp6o9EvN2dcs3pfRs+qgNDmJ2Wpliu7Y=;
 b=FIWTPOgNeXJ7i+xcEA1g/2YWMoaOwkoUel8ZyQ6nlRB5luCEbH4Rl7mb4XMUT7NBiC
 BACP8/ppEEgcmfvEjM2cDY59T4En6Tdpso6LulaAWUJgUU6hzS6kIPEpsElY83MJ1QNu
 Ei97Md8PnJlobH/7KThmEQQg5HUTX6SWEgy825qU27Zsb0fNOhC6j5GDAlTz1WNN3u8u
 B+gvaJEVPa6W5LexdE2ZMYpPMo7FZilwjAENu1wWAzsbrZJjzWpsd6LuSlKIMVJk/8t0
 9XsHchygs0kQNt+Luy1fOcq9tRSGctE4f5/QL49OopBI+IxJ+dkCiUmcvJOi7EeQnQMl
 NVYA==
X-Gm-Message-State: AOJu0YwnqaAMjLJQEwa4hTO+iY59+0ZpIOVgSr7EpCJ5B+0KNAYhcY/S
 Hpqvexw90ROtxcBzBZb2DDCBFKK4bBmECA8ZOO3yMebwqMLtlmXyXRMyxweftZM=
X-Google-Smtp-Source: AGHT+IGiH7Y+JOa4zFWT4uBG5e0nxTZ7q2bT95W8eY0sXWj0RTRbbUTMVj2Y/lTD0+EbzWnZRuMC8Q==
X-Received: by 2002:a05:600c:3ba3:b0:418:d4a5:b10c with SMTP id
 n35-20020a05600c3ba300b00418d4a5b10cmr1203298wms.28.1713522639574; 
 Fri, 19 Apr 2024 03:30:39 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 jg1-20020a05600ca00100b004183e983d97sm5885615wmb.39.2024.04.19.03.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 03:30:39 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
Date: Fri, 19 Apr 2024 11:30:01 +0100
MIME-Version: 1.0
Message-Id: <20240419-kgdboc_fix_schedule_work-v1-1-ff19881677e5@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKhHImYC/x2MSQqAMBDAviJztlB1BPUrIqXLqINipcUFxL9bP
 AaSPBApMEXosgcCnRzZbwmKPAM7620iwS4xlLJEiUUrlskZb9XIt4p2JnespC4fFjFKaxBNo6s
 aIeV7oCT963543w83lr0YagAAAA==
To: Jason Wessel <jason.wessel@windriver.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3694;
 i=daniel.thompson@linaro.org; h=from:subject:message-id;
 bh=C+qOn5JTN9zJb5FySGwxd2G4kTU2FmFYAYBmugqPSPE=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBmIke9ZVMNfK8Mz+OrFbqaCdj672YT4w8UQ6ueq
 XBwtvN/r82JAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCZiJHvQAKCRB84yVdOfeI
 ofNLD/0Umjj+W7GAbBqQ40IwzKkdPszIlUlf+waYzWOInyWrpl4sPA64fuVxOM2OiIaMG76D5wZ
 TaHUmY75/p8yYCvxnDmCImLbbfksCTqMWW6U4OIg/Smf2j04Qr11sM8bjhpZsS7yDBZK6wCdFec
 ixKLPDfcJLWujuojN8mgtzUD5HDdNTytJFS7HsMTNC9sZHHUN0quVcTU3P6AaqYApXoBzQN2H6B
 HtDoEBSNjeeq/LrZCcrLHNTgWTQ9xlnZVOHFdlzCmSSMKaonGBK2Q57W3yOgcdGUqkL3fTmM97+
 EebnbAIuqfIHzbeHkFJNDThEsUCqyg4GXpHi/De94YHJoab9H8DazLfa5p1BqmVM7obUOK+4z4v
 nLTeji+w4KrvcAqxGu5y4IHL3rwd7c14dD0USQqNS32p1mnzrkJN95l7SV2MwyeBjiAFJ6j8dd7
 NEOqHbly54qnGxAKN2NNAjo6b7upiB3zBnvKB8smcKodgoNxiqDzXWmRlXWrSymGVUidj/WQBpq
 343NQhA3JUChjQXwvXUONWV/Vka8QXMflolG+vVdOGfXbjfWyXlkWVMtNuOBFZR/1ChTcqAWYls
 1BuHcD+sywGdEzXvb2qP7Fbc4S47aYDSAy+T2fX4aDz5z+9qpjG+EvMJniaR7tceykHS3GzOOMi
 v/BaL26UzkgkwSQ==
X-Developer-Key: i=daniel.thompson@linaro.org; a=openpgp;
 fpr=E38BE19861669213F6E2661AA8A4E3BC5B7B28BE
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Currently, when kdb is compiled with keyboard support, then
 we will use schedule_work() to provoke reset of the keyboard status.
 Unfortunately
 schedule_work() gets called from the kgdboc post-debug-ex [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.42 listed in wl.mailspike.net]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [209.85.128.42 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1rxlW7-0004vM-66
Subject: [Kgdb-bugreport] [PATCH] serial: kgdboc: Fix NMI-safety problems
 from keyboard reset code
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Liuye <liu.yeC@h3c.com>, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Currently, when kdb is compiled with keyboard support, then we will use
schedule_work() to provoke reset of the keyboard status.  Unfortunately
schedule_work() gets called from the kgdboc post-debug-exception
handler.  That risks deadlock since schedule_work() is not NMI-safe and,
even on platforms where the NMI is not directly used for debugging, the
debug trap can have NMI-like behaviour depending on where breakpoints
are placed.

Fix this by using the irq work system, which is NMI-safe, to defer the
call to schedule_work() to a point when it is safe to call.

Reported-by: Liuye <liu.yeC@h3c.com>
Closes: https://lore.kernel.org/all/20240228025602.3087748-1-liu.yeC@h3c.com/
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/tty/serial/kgdboc.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
index 7ce7bb1640054..adcea70fd7507 100644
--- a/drivers/tty/serial/kgdboc.c
+++ b/drivers/tty/serial/kgdboc.c
@@ -19,6 +19,7 @@
 #include <linux/console.h>
 #include <linux/vt_kern.h>
 #include <linux/input.h>
+#include <linux/irq_work.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/serial_core.h>
@@ -48,6 +49,25 @@ static struct kgdb_io		kgdboc_earlycon_io_ops;
 static int                      (*earlycon_orig_exit)(struct console *con);
 #endif /* IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE) */
 
+/*
+ * When we leave the debug trap handler we need to reset the keyboard status
+ * (since the original keyboard state gets partially clobbered by kdb use of
+ * the keyboard).
+ *
+ * The path to deliver the reset is somewhat circuitous.
+ *
+ * To deliver the reset we register an input handler, reset the keyboard and
+ * then deregister the input handler. However, to get this done right, we do
+ * have to carefully manage the calling context because we can only register
+ * input handlers from task context.
+ *
+ * In particular we need to trigger the action from the debug trap handler with
+ * all its NMI and/or NMI-like oddities. To solve this the kgdboc trap exit code
+ * (the "post_exception" callback) uses irq_work_queue(), which is NMI-safe, to
+ * schedule a callback from a hardirq context. From there we have to defer the
+ * work again, this time using schedule_Work(), to get a callback using the
+ * system workqueue, which runs in task context.
+ */
 #ifdef CONFIG_KDB_KEYBOARD
 static int kgdboc_reset_connect(struct input_handler *handler,
 				struct input_dev *dev,
@@ -99,10 +119,17 @@ static void kgdboc_restore_input_helper(struct work_struct *dummy)
 
 static DECLARE_WORK(kgdboc_restore_input_work, kgdboc_restore_input_helper);
 
+static void kgdboc_queue_restore_input_helper(struct irq_work *unused)
+{
+	schedule_work(&kgdboc_restore_input_work);
+}
+
+static DEFINE_IRQ_WORK(kgdboc_restore_input_irq_work, kgdboc_queue_restore_input_helper);
+
 static void kgdboc_restore_input(void)
 {
 	if (likely(system_state == SYSTEM_RUNNING))
-		schedule_work(&kgdboc_restore_input_work);
+		irq_work_queue(&kgdboc_restore_input_irq_work);
 }
 
 static int kgdboc_register_kbd(char **cptr)
@@ -133,6 +160,7 @@ static void kgdboc_unregister_kbd(void)
 			i--;
 		}
 	}
+	irq_work_sync(&kgdboc_restore_input_irq_work);
 	flush_work(&kgdboc_restore_input_work);
 }
 #else /* ! CONFIG_KDB_KEYBOARD */

---
base-commit: 0bbac3facb5d6cc0171c45c9873a2dc96bea9680
change-id: 20240419-kgdboc_fix_schedule_work-f0cb44b8a354

Best regards,
-- 
Daniel Thompson <daniel.thompson@linaro.org>



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
