Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F113628547
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 14 Nov 2022 17:30:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1oucLT-0008TV-Mx
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 14 Nov 2022 16:30:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1oucLR-0008TN-R3
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 14 Nov 2022 16:30:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ekc6YsdvItEWqTtBsALAxHEjpl5Na6n2oyZUMYkLTB4=; b=L35jmoCPN0HcRyTxYu9Xx6omKn
 Qrm8oEPggi1TMoCLBwHjcWv2P6pso2Kgm+KL3ociMxvEZTOq0Y1/j0RhR2aMmcxux0w582RfEcaOe
 ZGQlI2y7DZChu9l5Nj2Jcn7gsFZss93b/4eEJVuHFMpRgC9VWJWRaFQCfnds1MDjj3Ag=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ekc6YsdvItEWqTtBsALAxHEjpl5Na6n2oyZUMYkLTB4=; b=L8jn3R9m4vMW53WN9pAxsMkx+T
 CgYQqERImP7rNV1PL22ydkgArjNOTyFVxiwsQAXExG/4ObznM9QeaovfYfgsyUENekUdB7QX4PgdY
 aJEyPzReDUex2dYK0VFLxZkDGvlFMe70SL5FWFn1eqvxU3ALf+aINsltA/PVgv7zgFF0=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oucLM-0000hW-U9 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 14 Nov 2022 16:30:01 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1668443390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ekc6YsdvItEWqTtBsALAxHEjpl5Na6n2oyZUMYkLTB4=;
 b=yLTA3smRSwZAzo0WodrUiCw7R5e475OFiwy+MWrPjH2XP7ogPwQVMS/zXU+LhKNp3eKpXA
 KGtD1o1+JZmtwdaVIy0gg29vMf6kvK9rm2vrsZyonpaDUUTb5Sp/mH9T0OWeMIm1fw0CNZ
 yVxqCP1JkAW2TE0usGB3mIL6COdrOyYk7TGKh3uCK6ZEoKV1rsr8JN2AswuXWtLRch8B/g
 h9RBqzV3HRHCpEuRiQzw7NorZv1XRz1MTdoruSZvLqfVBLUkSQNCGeokFeJYuRRdnl1ChN
 gpVIJdkzBvjKIPQNYUsMfwB2OouUp3eQQlkvIZcwWD6vHw7JrG+3vaFv+Ovqvg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1668443390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ekc6YsdvItEWqTtBsALAxHEjpl5Na6n2oyZUMYkLTB4=;
 b=cu2GY0TtUc+v5tINvlKDlxbO+i9OxziAYNewzqmSMu9L8Im8ozqk0RzFdYXxlRic6fMIZq
 zx1LlYZGgEzZ0FCA==
To: Petr Mladek <pmladek@suse.com>
Date: Mon, 14 Nov 2022 17:35:29 +0106
Message-Id: <20221114162932.141883-37-john.ogness@linutronix.de>
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
 Content preview: Calling tty_find_polling_driver() can lead to
 uart_set_options()
 being called (via the poll_init() callback of tty_operations) to configure
 the uart. But uart_set_options() can also be called by regis [...] 
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
X-Headers-End: 1oucLM-0000hW-U9
Subject: [Kgdb-bugreport] [PATCH printk v4 36/39] tty: serial: kgdboc:
 synchronize tty_find_polling_driver() and register_console()
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

Calling tty_find_polling_driver() can lead to uart_set_options() being
called (via the poll_init() callback of tty_operations) to configure the
uart. But uart_set_options() can also be called by register_console()
(via the setup() callback of console).

Take the console_list_lock to synchronize against register_console() and
also use it for console list traversal. This also ensures the console list
cannot change until the polling console has been chosen.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Petr Mladek <pmladek@suse.com>
---
 drivers/tty/serial/kgdboc.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
index 82b4b4d67823..8c2b7ccdfebf 100644
--- a/drivers/tty/serial/kgdboc.c
+++ b/drivers/tty/serial/kgdboc.c
@@ -189,12 +189,20 @@ static int configure_kgdboc(void)
 	if (kgdboc_register_kbd(&cptr))
 		goto do_register;
 
+	/*
+	 * tty_find_polling_driver() can call uart_set_options()
+	 * (via poll_init) to configure the uart. Take the console_list_lock
+	 * in order to synchronize against register_console(), which can also
+	 * configure the uart via uart_set_options(). This also allows safe
+	 * traversal of the console list.
+	 */
+	console_list_lock();
+
 	p = tty_find_polling_driver(cptr, &tty_line);
-	if (!p)
+	if (!p) {
+		console_list_unlock();
 		goto noconfig;
-
-	/* For safe traversal of the console list. */
-	console_list_lock();
+	}
 
 	/*
 	 * Take console_lock to serialize device() callback with
-- 
2.30.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
