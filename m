Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5206C61F52B
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Nov 2022 15:17:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1os2vz-0003AE-1s
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 07 Nov 2022 14:17:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1os2vw-00039o-Ax
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Nov 2022 14:17:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SVseywoielHQsdgFj4SQ2wUZa0m9RxiqWqQHkSQjPis=; b=O6BrMcRBLO+sbf9VvUDaAuwLXy
 ANoPRwN3iay3ri0eQ25UgiQrimUCf9zGBWVyPs7KT+fufflm4Ex8Sup2AXC/bjxYZaU6X1ciN4CJr
 9MWEK4Ft6EG/v+3mokN150irtr25FRF8U0d0TLD8RT2KvAZJ9rJVTL2bFSettTmKbArw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SVseywoielHQsdgFj4SQ2wUZa0m9RxiqWqQHkSQjPis=; b=a4+uv/CnMuEpF82ux17F9ZKz7/
 E7Kjkh/HiOtTD3U6/SgWka0+t+B23SWHj+5hsdyvTevRP+jaLY7p1GoyVRGdGWXZdPZS8LAkbZF9t
 /TEeehz7USlQFOYxMom8/3xkrwSa49YPGJVVm2F54u/dVjLkd5W1BHoC/nafiQjMqUgM=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1os2vv-00036d-81 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Nov 2022 14:17:03 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1667830617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SVseywoielHQsdgFj4SQ2wUZa0m9RxiqWqQHkSQjPis=;
 b=gqAyq8wc/xmtR7iqeOG6HKRPQNaHenvleIBzDQ/LW3mKRO51oeZo94GS/qRNuT8ieSU0xm
 67Ezdbpop5bIKLaW4vynak6kv+RutOCMz7GJmsmWvJ7ztSxvOPnfZsII/sczgr4+zwlbH0
 bvBpYYScUM3+IVnwUhj0PRvYRquDb0k9dX6d4FiyUu64Q/sTrT/pd/vzPWoMAYhgg2rfNa
 2MwuVE4oyZ5XOUiJrMrXKb8HCarltDgby4NEQN13ZduKMvpyiMLdZaTIIaHReLQ4CPsOXo
 WmDQpN1gWbLYKOD9QXS7ZKEJtYAVyIu5cwJ/0yLtFFfv2+ZH5482Fb2f8IS7XA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1667830617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SVseywoielHQsdgFj4SQ2wUZa0m9RxiqWqQHkSQjPis=;
 b=Z547tJz8CL/7ne/rUO0T2mCvQYl5X73Ya4ph+/4nhh6mLeSrOtoKGcN6H+lDnm6AvUFYKH
 ymi7EfX8Rj0GaIBw==
To: Petr Mladek <pmladek@suse.com>
Date: Mon,  7 Nov 2022 15:22:34 +0106
Message-Id: <20221107141638.3790965-37-john.ogness@linutronix.de>
In-Reply-To: <20221107141638.3790965-1-john.ogness@linutronix.de>
References: <20221107141638.3790965-1-john.ogness@linutronix.de>
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
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
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1os2vv-00036d-81
Subject: [Kgdb-bugreport] [PATCH printk v3 36/40] tty: serial: kgdboc: use
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
 drivers/tty/serial/kgdboc.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
index 5be381003e58..82b4b4d67823 100644
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
 
@@ -451,6 +463,7 @@ static void kgdboc_earlycon_pre_exp_handler(void)
 {
 	struct console *con;
 	static bool already_warned;
+	int cookie;
 
 	if (already_warned)
 		return;
@@ -463,9 +476,14 @@ static void kgdboc_earlycon_pre_exp_handler(void)
 	 * serial drivers might be OK with this, print a warning once per
 	 * boot if we detect this case.
 	 */
-	for_each_console(con)
+	cookie = console_srcu_read_lock();
+	for_each_console_srcu(con) {
 		if (con == kgdboc_earlycon_io_ops.cons)
-			return;
+			break;
+	}
+	console_srcu_read_unlock(cookie);
+	if (con)
+		return;
 
 	already_warned = true;
 	pr_warn("kgdboc_earlycon is still using bootconsole\n");
-- 
2.30.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
