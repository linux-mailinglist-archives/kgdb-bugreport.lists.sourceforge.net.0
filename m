Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AA63DEF1E
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  3 Aug 2021 15:31:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1mAuVY-0001iV-35
	for lists+kgdb-bugreport@lfdr.de; Tue, 03 Aug 2021 13:31:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <john.ogness@linutronix.de>) id 1mAuVS-0001iH-2w
 for kgdb-bugreport@lists.sourceforge.net; Tue, 03 Aug 2021 13:30:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xAgt43961jyij8yurqAZzMzspZ62E9WGA/zMDz6s0Qw=; b=Yk+kvkXWixPlDoHJc5S/e/s9FX
 5dFr7l/5seKINhbbdi/PPVBvZFEWq+fNT+jIyze0I0F7sog/X/r69YFR86PNtpndlronhWjSOVHzZ
 X7TkATS4ajqNpVUm7z6hr8qGy0VEwM/gjq6M2ITGIzVNH8pR0DQyJmCVOoZU7ZCcKa44=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xAgt43961jyij8yurqAZzMzspZ62E9WGA/zMDz6s0Qw=; b=Inp7tD6NXG6mZ/TDs0iojDKZ55
 952ImjcEMkN0fpAr/JUFNw0YbzabLQGngRrN99NC7H93AE7Y56lOrIus55PIUN20q0XiQ2rdl+neF
 EzMeQ9bF8faBeDex5f0A9NSE11My87xmLIoNE5fa8NjilZbgiKl411mfBkGqx+9pxDS0=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mAuVJ-00B97f-NH
 for kgdb-bugreport@lists.sourceforge.net; Tue, 03 Aug 2021 13:30:54 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1627996387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xAgt43961jyij8yurqAZzMzspZ62E9WGA/zMDz6s0Qw=;
 b=YpPWs3o/B08aeOu2jZY5CcU8eMJIzia50ZUSkZ/lljJApVZApvJvxFCjM9HD1tup/y6yD3
 1mqq2hQTMEyZpivHFcbjLndetNDr01ZLTx51xYG8+DWxX4H6j+vENOSYsx73oK+qs8Xqm1
 /y84n45T2NHu0gArNlLAt8xIw2rRITjlNumNhCKAzNtNtvn5f4v6uKgbYQ+7pzQ7ez1nkL
 IvBy4DpkFnJO9CKGfLwUQYCUyyTyDIkvuZpZ4NUknW3dus4t5g3/bJfPrCzrktDssURZNg
 Hh0Q2F+rnnFDJRwDtV3im5RWA1QFD/HjZqrFcdf71xi3Ao4siI4dKwEnloFksA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1627996387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xAgt43961jyij8yurqAZzMzspZ62E9WGA/zMDz6s0Qw=;
 b=MCZ7OS/cK1rdoa45XNCSrdVh34SJf6UBPkwX7KPK88AHKgr7SUDhadj+wmCwcKhrWAa/DG
 4JjP66cVvCzqf8DA==
To: Petr Mladek <pmladek@suse.com>
Date: Tue,  3 Aug 2021 15:19:00 +0206
Message-Id: <20210803131301.5588-10-john.ogness@linutronix.de>
In-Reply-To: <20210803131301.5588-1-john.ogness@linutronix.de>
References: <20210803131301.5588-1-john.ogness@linutronix.de>
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not exist)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1mAuVJ-00B97f-NH
Subject: [Kgdb-bugreport] [PATCH printk v1 09/10] kdb: if available,
 only use atomic consoles for output mirroring
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
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jason Wessel <jason.wessel@windriver.com>, Cengiz Can <cengiz@kernel.wtf>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Currently kdb uses the @oops_in_progress hack to mirror kdb output
to all active consoles from NMI context. Ignoring locks is unsafe.

Now that an NMI-safe atomic interface is available for consoles,
use only that interface to mirror kdb output if such a console is
available.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 kernel/debug/kdb/kdb_io.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 6735ac36b718..871b89d6294b 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -544,6 +544,7 @@ static int kdb_search_string(char *searched, char *searchfor)
 
 static void kdb_msg_write(const char *msg, int msg_len)
 {
+	bool atomic_console_available;
 	struct console *c;
 	const char *cp;
 	int len;
@@ -559,11 +560,26 @@ static void kdb_msg_write(const char *msg, int msg_len)
 		cp++;
 	}
 
+	atomic_console_available = have_atomic_console();
+
 	for_each_console(c) {
 		if (!(c->flags & CON_ENABLED))
 			continue;
 		if (c == dbg_io_ops->cons)
 			continue;
+
+		/*
+		 * If any atomic consoles are available, only atomic
+		 * consoles are used.
+		 */
+		if (atomic_console_available) {
+			if (c->write_atomic) {
+				c->write_atomic(c, msg, msg_len);
+				touch_nmi_watchdog();
+			}
+			continue;
+		}
+
 		/*
 		 * Set oops_in_progress to encourage the console drivers to
 		 * disregard their internal spin locks: in the current calling
-- 
2.20.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
