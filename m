Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E6039628542
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 14 Nov 2022 17:29:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1oucLO-0008SW-Lo
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 14 Nov 2022 16:29:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1oucLN-0008SQ-SP
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 14 Nov 2022 16:29:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4PxzIkDOo+u2ZWn4WKSm9Hq+Fp48aeu4iQFbr0MeDXE=; b=N2vRUc5nbSYX8xNay93ro+uP9t
 mkhQIvXkGB0ieJTjkPsQ7X8FKlISuL0r7KmdJ1JzY9bMGmAbKFXITfshxZyseuWot/x+qil85R1eN
 /7svgOe8pPfM5luGTbLT0qfOo9Y0UuEcSuhzSUAzmBF3BiyaYkVPsc31S35MWmtejSJg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4PxzIkDOo+u2ZWn4WKSm9Hq+Fp48aeu4iQFbr0MeDXE=; b=Uwi+O/uJl/SiLovvPmRihk2m/r
 Zu0+jc2/pUNOwsxuG7Pa1NNPSHiRnmtCdhU08hXGFVwcSMCAHV3PVg8I4USJPcz1zzZfboG08lN9m
 WXuQHuUZXYszsowvBK2OXlmC1q7lQkowLUuL+MXnRNlsuWxyLd2oDEBnDEBSPDrsGNko=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oucLM-0083vW-FH for kgdb-bugreport@lists.sourceforge.net;
 Mon, 14 Nov 2022 16:29:57 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1668443389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4PxzIkDOo+u2ZWn4WKSm9Hq+Fp48aeu4iQFbr0MeDXE=;
 b=1BKrXov9UpGW8i3q7hfrAts/TS9f1RYajAbeVEXEGrtL7vaFgC21p2/gycHpZdggcRdkMR
 ymAXLo3nI1XznOcfkM8o5VPA4u6dK12AQ9M+D9N/Y7xJ/VWzIzjgdzIM7jZdzTrLeTEgVf
 ldvYptvRObxoWgQM1mjVO0U5z0p5nGCAs7EtMbBk3dTvPNu5ImyjgmMlyxInldZZtJmK2A
 1C5vFloKr8VFUqWXDe8yM2OiOhAi0RIy9lNx/vMF7VcWmlEYi+lu43zGfF6mavA+0ue7WX
 HCOKbjnE3m0/2oipWF8vmACY9N8pHiiQtSahib4N206+Wa9R/AOzX9tdp8cgXw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1668443389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4PxzIkDOo+u2ZWn4WKSm9Hq+Fp48aeu4iQFbr0MeDXE=;
 b=YJxFMEQT+jRTL58bXGade43+HEy6xareEPmdNqBiX7GialR4nAAc3bII7mmuoQPHmtUymm
 dWTycSv7+nBOStCQ==
To: Petr Mladek <pmladek@suse.com>
Date: Mon, 14 Nov 2022 17:35:28 +0106
Message-Id: <20221114162932.141883-36-john.ogness@linutronix.de>
In-Reply-To: <20221114162932.141883-1-john.ogness@linutronix.de>
References: <20221114162932.141883-1-john.ogness@linutronix.de>
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  configure_kgdboc() uses the console_lock for console list
 iteration. Use the console_list_lock instead because list synchronization
 responsibility will be removed from the console_lock in a later chan [...]
 Content analysis details:   (-1.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [193.142.43.55 listed in list.dnswl.org]
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not
 exist)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1oucLM-0083vW-FH
Subject: [Kgdb-bugreport] [PATCH printk v4 35/39] tty: serial: kgdboc: use
 console_list_lock for list traversal
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

configure_kgdboc() uses the console_lock for console list iteration. Use
the console_list_lock instead because list synchronization responsibility
will be removed from the console_lock in a later change.

The SRCU iterator could have been used here, but a later change will
relocate the locking of the console_list_lock to also provide
synchronization against register_console().

Note, the console_lock is still needed to serialize the device()
callback with other console operations.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 drivers/tty/serial/kgdboc.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
index c6df9ef34099..82b4b4d67823 100644
--- a/drivers/tty/serial/kgdboc.c
+++ b/drivers/tty/serial/kgdboc.c
@@ -193,7 +193,16 @@ static int configure_kgdboc(void)
 	if (!p)
 		goto noconfig;
 
+	/* For safe traversal of the console list. */
+	console_list_lock();
+
+	/*
+	 * Take console_lock to serialize device() callback with
+	 * other console operations. For example, fg_console is
+	 * modified under console_lock when switching vt.
+	 */
 	console_lock();
+
 	for_each_console(cons) {
 		int idx;
 		if (cons->device && cons->device(cons, &idx) == p &&
@@ -202,8 +211,11 @@ static int configure_kgdboc(void)
 			break;
 		}
 	}
+
 	console_unlock();
 
+	console_list_unlock();
+
 	kgdb_tty_driver = p;
 	kgdb_tty_line = tty_line;
 
-- 
2.30.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
