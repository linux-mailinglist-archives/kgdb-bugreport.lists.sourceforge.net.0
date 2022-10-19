Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3860E604A0B
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 19 Oct 2022 16:56:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1olAUf-0002WA-0a
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 19 Oct 2022 14:56:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1olAUd-0002Vt-90
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 19 Oct 2022 14:56:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FdvxHOKwRIeI8BiM8k+rYwU/Yx30rZAhLXmKb87AiP8=; b=le53evVgKHhBcb2Xr4JwgmQj0C
 tmOKmpT8MOg5jxS5HFxbyNJk++87Nd90fzKr0D+58vQot4bGJAsxJbbjwIjDqv0d/buTLMZIMoLwd
 YYmp/+MKRNrZE3aiLzr9VbXMdt1b11b47QUZ+3oteeeweEtHBjNCUDiqepEsCtJlyIlc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FdvxHOKwRIeI8BiM8k+rYwU/Yx30rZAhLXmKb87AiP8=; b=Qi7QveUN2P81lIR18CKvxCJ+So
 3wZJMvD8Hxr8QmWucEgYGAAa+QZKYlf1XPfBxWGIAQu73RpxpHYgeFZUK2/lIV00Yi9k2ED7pgYFZ
 MjvVP01LE12P40wLOtuo/+ATMV7u4uvbgm6fQjWhFDa8BlG4VvYYd5dOhGTbdwL7NlnE=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1olAUc-00072e-Jd for kgdb-bugreport@lists.sourceforge.net;
 Wed, 19 Oct 2022 14:56:27 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1666191380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FdvxHOKwRIeI8BiM8k+rYwU/Yx30rZAhLXmKb87AiP8=;
 b=YJM/Q8Y/iU41nYJhp3ruJ3GZbQPygcVKdQtdGfYKzTF62VPMx1mnPM9tcgyukJ54yaBxZA
 GVrkuBdRj36R50zyHRbByxcwzeIkJ2CitT346w2Db5zH5yWwwEieG+szD/pwmPecMyCI1h
 0OEDEw9VNJtjb26YQe62EHk5Rwz/lbk5LQrNjCrzvDvUiIssEVgWHSJaoJO/87vO/A/kOf
 XaEI1oeCR6s/TkWDLLjt70+k/1a69wPsRy2nuUIWcbB/Vtekle1QbRVEcd04sjNyqVuA0D
 1WVA1iDuqI9sMaCvV7EaPS+iAWUQOLFn2okif3uEEF9aGgVMzxDui9lC/dsqAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1666191380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FdvxHOKwRIeI8BiM8k+rYwU/Yx30rZAhLXmKb87AiP8=;
 b=8EnO9qClCf1jaZEbNBimixqghlBQ62awKnPSz1PmBmcugCl3Z+v0WMz2rs+IIgPUeCv/Ol
 Snw30DIMiYbGmfDw==
To: Petr Mladek <pmladek@suse.com>
Date: Wed, 19 Oct 2022 17:01:56 +0206
Message-Id: <20221019145600.1282823-35-john.ogness@linutronix.de>
In-Reply-To: <20221019145600.1282823-1-john.ogness@linutronix.de>
References: <20221019145600.1282823-1-john.ogness@linutronix.de>
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
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1olAUc-00072e-Jd
Subject: [Kgdb-bugreport] [PATCH printk v2 34/38] serial: kgdboc: use
 console_list_lock instead of console_lock
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
should be used instead because list synchronization repsponsibility will
be removed from the console_lock in a later change.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 drivers/tty/serial/kgdboc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
index 48000666789a..0d85596aebe2 100644
--- a/drivers/tty/serial/kgdboc.c
+++ b/drivers/tty/serial/kgdboc.c
@@ -547,13 +547,13 @@ static int __init kgdboc_earlycon_init(char *opt)
 	 */
 
 	/*
-	 * Hold the console_lock to guarantee that no consoles are
+	 * Hold the console_list_lock to guarantee that no consoles are
 	 * unregistered until the kgdboc_earlycon setup is complete.
 	 * Trapping the exit() callback relies on exit() not being
 	 * called until the trap is setup. This also allows safe
 	 * traversal of the console list.
 	 */
-	console_lock();
+	console_list_lock();
 	for_each_console(con) {
 		if (con->write && con->read &&
 		    (console_is_enabled(con) || (con->flags & CON_BOOT)) &&
@@ -595,7 +595,7 @@ static int __init kgdboc_earlycon_init(char *opt)
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
