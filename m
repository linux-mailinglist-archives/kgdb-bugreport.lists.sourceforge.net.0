Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A82DC62C412
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 16 Nov 2022 17:22:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ovLBF-0004Vv-D0
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 16 Nov 2022 16:22:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1ovLB9-0004V8-TM
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 16 Nov 2022 16:22:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R9VqGyF+glKoWbwrATKZGXQP3ZfoC2SELt3pYx7i6e4=; b=jIIgYEcIPAudHni+9mi9XUOi03
 61OtYSi5rDba8MCAMJT5cVFj1e95eGCPhwNZY2VUGZeepdB6dFC+kTFyDfybOWyH8ARL2/XWLdofD
 aSbZqADnwQDFRG0oiVjCtTCfcU045VUwF/6TD01DdHm3Agm+bjjBsWa+YBlBDb2LIJdw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R9VqGyF+glKoWbwrATKZGXQP3ZfoC2SELt3pYx7i6e4=; b=kaiVRnMsqURSE4G/3WZ0u8y5to
 VMue9I9tZwuaGCDXoTzToPSCqUPVyehDWGfQYEYC2D6QlUfaalJmcLPw0ZQ1384KWqeTdfcwpsi59
 loquPRU5xGG7TAtqe+D9VHkHJX23f6kyr50WkDBQAYBh3FvuDjSQ4N6Oe/eHyIKpmCjY=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ovLB9-0002bd-6f for kgdb-bugreport@lists.sourceforge.net;
 Wed, 16 Nov 2022 16:22:23 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1668615736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R9VqGyF+glKoWbwrATKZGXQP3ZfoC2SELt3pYx7i6e4=;
 b=JFsQt9YmKmGYiNMCmtvxB3r69uHQoFqE8e46/QPCeV4UzhXpIrH/WBkT8OVqrE9LmK1igd
 8MYMnuoCiKcekVXCEqztixtf06Z+X0tmr4ZCp4z2KnxJX4XizYz6iFOt4XbmEnOrfWpMEd
 9pJfm2udp0lnzaqCp9qDyM7fk/zZO8dGcumh8J4QcUMBqF2OsCea9tAj0AmtK+QRm10uw2
 STmOa5knG3Xl4Ae3JELKSNNr1ur3iSmPTmxeT36HTAadHweraHKRNB9IUvEnThYR5yot/r
 BFK8xrc0lOODKN2Lb2Rqnd0X+EUw0Z5u+ngrj+fd0rY+uQAN8YbkjA/WOCmrAw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1668615736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R9VqGyF+glKoWbwrATKZGXQP3ZfoC2SELt3pYx7i6e4=;
 b=4QlR9bdmeVF94Qc5Vu64CzXPINchKf2DFGK9G/aISYm0uexwOLYizOLQ6gSDk2jDy/Sr04
 FB7QWs6ZgcD1g+Cw==
To: Petr Mladek <pmladek@suse.com>
Date: Wed, 16 Nov 2022 17:27:50 +0106
Message-Id: <20221116162152.193147-39-john.ogness@linutronix.de>
In-Reply-To: <20221116162152.193147-1-john.ogness@linutronix.de>
References: <20221116162152.193147-1-john.ogness@linutronix.de>
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: kgdboc_earlycon_init() uses the console_lock to ensure that
 no consoles are unregistered until the kgdboc_earlycon is setup. The
 console_list_lock
 should be used instead because list synchronization r [...] 
 Content analysis details:   (-1.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linutronix.de]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [193.142.43.55 listed in list.dnswl.org]
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not
 exist)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1ovLB9-0002bd-6f
Subject: [Kgdb-bugreport] [PATCH printk v5 38/40] tty: serial: kgdboc: use
 console_list_lock to trap exit
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

kgdboc_earlycon_init() uses the console_lock to ensure that no consoles
are unregistered until the kgdboc_earlycon is setup. The console_list_lock
should be used instead because list synchronization responsibility will
be removed from the console_lock in a later change.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Petr Mladek <pmladek@suse.com>
---
 drivers/tty/serial/kgdboc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
index 8c2b7ccdfebf..a3ed9b34e2ab 100644
--- a/drivers/tty/serial/kgdboc.c
+++ b/drivers/tty/serial/kgdboc.c
@@ -558,13 +558,13 @@ static int __init kgdboc_earlycon_init(char *opt)
 	 */
 
 	/*
-	 * Hold the console_lock to guarantee that no consoles are
+	 * Hold the console_list_lock to guarantee that no consoles are
 	 * unregistered until the kgdboc_earlycon setup is complete.
 	 * Trapping the exit() callback relies on exit() not being
 	 * called until the trap is setup. This also allows safe
 	 * traversal of the console list and race-free reading of @flags.
 	 */
-	console_lock();
+	console_list_lock();
 	for_each_console(con) {
 		if (con->write && con->read &&
 		    (con->flags & (CON_BOOT | CON_ENABLED)) &&
@@ -606,7 +606,7 @@ static int __init kgdboc_earlycon_init(char *opt)
 	}
 
 unlock:
-	console_unlock();
+	console_list_unlock();
 
 	/* Non-zero means malformed option so we always return zero */
 	return 0;
-- 
2.30.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
