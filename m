Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0EE8B0C64
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 24 Apr 2024 16:22:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rzdVm-0005d5-Pf
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 24 Apr 2024 14:22:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rzdVl-0005cy-6Q
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 24 Apr 2024 14:22:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rbu3CtHQPDzqG7bcEJAxBge0HJMTre8Cbx1YM3r4SiU=; b=W51MTYd2U4jePW7Oig41f4lQXg
 yFpz5dPdDASxN2tcYKvoXcwdA3TQIW9DcGlSWeJIv4XeucRphcwNpdvvQJIq1NDA+UooGic25FAdI
 JqOVWPC5U7KsJQW0SYWxkBfjmUhce+HsipvqeTCTCdDzfefa3fiRw2Zq00QFTF9k+3CM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rbu3CtHQPDzqG7bcEJAxBge0HJMTre8Cbx1YM3r4SiU=; b=N
 KLMORKC5GPsGRagbJ+bPp4Su+CpimJWOX7JfRoKMDYKU866smtdlVw7KNOeMELRnctNArOA0ALaCJ
 uq4SMyRW6mcBaOEBxmBZOa4eQ6ivM9UPSiPQvkEwRhKGaCtrp2HbAylN0WZOcy7DcSbtzCEu+zA/Z
 1cMckxb6gxWqsNPk=;
Received: from mail-wm1-f50.google.com ([209.85.128.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rzdVj-0003EA-Qa for kgdb-bugreport@lists.sourceforge.net;
 Wed, 24 Apr 2024 14:22:13 +0000
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-41ac4cd7a1cso14161505e9.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 24 Apr 2024 07:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713968521; x=1714573321; darn=lists.sourceforge.net;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rbu3CtHQPDzqG7bcEJAxBge0HJMTre8Cbx1YM3r4SiU=;
 b=vM67QvYg6aKraQAZaDmX9nDHY4lxYqkflHPp4+LuwFaEknwDN+JPyJEMs984F9Izm6
 CXyndUf3Vxpcks13aHlxgEdZs0Vgx58S7x9T+pYeb6danwg8Rlrti0ZscDwZqIi9fq0N
 lKGv2YOYWlpT0i6VQOSkEWxOkEwy//RB8ImkWYmWQQQnhjBtZAo0i/Th4t1Z9NduiTIZ
 7qqZ4bwG6aIPfu4ESPyeqB4dzRUIBnegDNjPp5ojqPCSNs3YLSzhe1D7CiU5kRpz3aLs
 3xsfLYf7O9lYSatT/552wgaWqlLtckO3Y/XJyWADJP6yUYs1U96TSkVYX2GyGNMvMO1L
 iO8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713968521; x=1714573321;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rbu3CtHQPDzqG7bcEJAxBge0HJMTre8Cbx1YM3r4SiU=;
 b=CVeb6HG2OOV2bEhu5aJJ02ucMhC0Ykfpc+wObepkpRWC2rPABptnLLdye8XGI/EsQ1
 2lZmZRUjP+tsK0Cd7qTD1TYNntDVokkB6pzdQRXyeTcd392G7DB6yhYygPPj7SIYXnug
 91PvJhTSyZ2FAW0SiN7xxRNLqg4TXr8l1deUO9x8tXfpzbVuaDw9pxfSnxsFqKiL67aD
 swQebQB8CuSGk6UhVTXZkkOKhGaoW4PCbGG4Nn7lu0+7FaaLEKfVfH9IZu0VqTx3JvZW
 j7lZJZDuBcHUm4dGtyih/96gly5WRLUQdCzrV1JU7/8ccH2YzX5yXBarFepysNJ8QAwK
 sUdw==
X-Gm-Message-State: AOJu0YzNKwuZCkx5a4/6EkxiflKMy69VgwGgJTaPYwYbBOFjCc4+DLgf
 0QZvFjr5FSRY7SSa09OBENpwKPwENPoiriETuDEpzCzel8MIqVWxVWM4BRW4ZXE=
X-Google-Smtp-Source: AGHT+IGqxAXxOtPD63SKaGX/vtzm4PnE/j4LFLNS+70NxHdpPcb3rgN8pMmwPYmCLEzyUXpYw1Y9NQ==
X-Received: by 2002:a05:600c:154f:b0:418:e08c:817 with SMTP id
 f15-20020a05600c154f00b00418e08c0817mr1761473wmg.32.1713968520750; 
 Wed, 24 Apr 2024 07:22:00 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a05600c1f8c00b004183edc31adsm27649971wmb.44.2024.04.24.07.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 07:22:00 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
Date: Wed, 24 Apr 2024 15:21:41 +0100
MIME-Version: 1.0
Message-Id: <20240424-kgdboc_fix_schedule_work-v2-1-50f5a490aec5@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHQVKWYC/42NUQ6CMBBEr0L22xqKRcAv72EIacsWNpDWbBU1h
 LtbOYGfbzLzZoWITBjhkq3AuFCk4BMUhwzsqP2AgvrEUOSFypVsxDT0JtjO0buLdsT+OWP3Cjw
 Jl1ujlKn1qVSQ5nfGVNrVtzbxSPER+LM/LfKX/iFdpJDCOdnUtTxXFZbXmbzmcAw8QLtt2xfsN
 8yIwQAAAA==
To: Jason Wessel <jason.wessel@windriver.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4055;
 i=daniel.thompson@linaro.org; h=from:subject:message-id;
 bh=zQ4ggdIVSkhmIl2fRvA4hlHqqYytUieTW/CMICOA+M0=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBmKRV5Wm2kC9hXmk1syJZaOzjZr40TcSJ3+kCD8
 Le6DrhAgK+JAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCZikVeQAKCRB84yVdOfeI
 oe8JEACq4DWqHSaha3tdg43NRvx3r3lp+1RIoZJTpXkJvDcRqZBur0QZaN5enNHuOZ7h23bi0z0
 3G/06X0RqQLXPnROu0bhZGwOHxEwZsdyZwkOI8K786wrJtxZ8OeKlKPKjh/jXd8/TuEFlJvKxBA
 kqalG7vC2g8E4NaI9o/SJZ/G8u3HQUgmBBt2J9yqOPI65yQHst89j4MTQkWIl067p8GKYKvYI7x
 hu4Dh4dYnKZYezWiV+4r/Scb4E344be3xvwhpL7Mlx3//qTSm6SEqsTfF/R3Rryp8Y3aWNDlyEx
 mWVdmPZvMnXRMMU4X8mPafGACNPGMCUH5nUrWScO492cvqy3DiqP3XtiqbuKcp90d1U8Ycgbubf
 m+5JWlSDixrC1nQn6AJhWR/pL9F5PieinPIrA/ZxMQlMRUZVmmo4eMs4TS4u7zY/570eMmjj8FH
 tx1yQrX6yu8/OyVwWm/jBkulK0p4ErHxbNqad8++8QglVZ/Z7LjWzVlpEYF/cj0Sd+TwGFxsu22
 N+DUnLN2BhwwVpnHG+4t0fxpM3RHTZjNQZ3S2U3C2m7f0Yucm5ojCRWU3NYvDq+ZO9DQtkUuds/
 I4WaG+g6zGRwtcVfbf06Ih1m+++WZHVfrLOTe495+m4RhFVBOCqRqh72aLihN42svzQ9fFEWBE6
 ZGCViho+/fVYTQg==
X-Developer-Key: i=daniel.thompson@linaro.org; a=openpgp;
 fpr=E38BE19861669213F6E2661AA8A4E3BC5B7B28BE
X-Spam-Score: -5.2 (-----)
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
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.128.50 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.50 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1rzdVj-0003EA-Qa
Subject: [Kgdb-bugreport] [PATCH v2] serial: kgdboc: Fix NMI-safety problems
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
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
@Greg: I'm assuming this could/should go via your tree but feel free
       to share an ack if you want me to hoover it up instead.

Changes in v2:
- Fix typo in the big comment (thanks Doug)
- Link to v1: https://lore.kernel.org/r/20240419-kgdboc_fix_schedule_work-v1-1-ff19881677e5@linaro.org
---
 drivers/tty/serial/kgdboc.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
index 7ce7bb1640054..58ea1e1391cee 100644
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
+ * work again, this time using schedule_work(), to get a callback using the
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
