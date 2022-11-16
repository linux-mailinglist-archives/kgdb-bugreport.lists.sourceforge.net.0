Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED2A62C40F
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 16 Nov 2022 17:22:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ovLBA-0002vW-PP
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 16 Nov 2022 16:22:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1ovLB8-0002vI-M4
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 16 Nov 2022 16:22:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8rR7OgmI/JUsM6cOvDEez6+6LhtAAivMeCFIKDYeiDs=; b=O/cK1fBi6kpdAM6xYbdNZoRqBV
 LefjciTN09ud4M+N8W/8MbYaFPGLSMS6mYBDcmxpPOEMyRF+MOdmARTLvIfuCJ/WC8sakpbdJQCCu
 rPuSpSks6fWItbXh9kxR0nhxYid30sbINwCv7SPNPtvdGbzwtcM2J1BF+XZQPTTh+Bfk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8rR7OgmI/JUsM6cOvDEez6+6LhtAAivMeCFIKDYeiDs=; b=KWc4AMpTfX8jWHlNPu79HUPPzo
 z1+Vd4yIHYodcuHLUxBa/ZZrfRNTjoF3LoTW73IEu5rWGG6vB0Tq2qw8SA3JzhPcc0xppVYvtBr9Q
 EXMxmQM+FSu7NrJY7JGcyY2i3fdmRJsLEMpF22IrmJoMf7Fhn4GkFPjYwxR0bN1CXTp4=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ovLB7-00Aak2-VM for kgdb-bugreport@lists.sourceforge.net;
 Wed, 16 Nov 2022 16:22:22 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1668615735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8rR7OgmI/JUsM6cOvDEez6+6LhtAAivMeCFIKDYeiDs=;
 b=yek+I+AWhez5rkEA5jpNLeS+dTK2vOYMuw49/4KeOx+vZ3j7fSICGh+A7GDKzg5z7TNe2w
 GNw3aJ8GgsUetQiTtAe6edQKm2iFjgqj4sP/xbEFwx5FjRjF+o3qdfUN8VptbvgQ1FTgSU
 XNuT7pmvKcUE6jWrDCsA8If0jfaxz/Nfe59VftfvTuxUeW3lurw11BtZ43HdyVaJd/ROh6
 AXV7vSqILME+Fby/jKq7IUA2zE+x+sKNyx1ZxF8IafSf1P7CUoGoNq4M6G9DeWlhcmumgB
 9rzjBdRedJFUuh6GLZNJHCwNg1g0XRq+YBkVa1FS/uzQFrOkhHTRPBf3H3u0jQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1668615735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8rR7OgmI/JUsM6cOvDEez6+6LhtAAivMeCFIKDYeiDs=;
 b=BUIX13s3OtJiinZiPhHeHtVgfLl3mq3vyjm9l09/OnWGIn8MwDBkNG+hBGTwiLBOEgYOs4
 z5ZfPI5vGKcwmmCA==
To: Petr Mladek <pmladek@suse.com>
Date: Wed, 16 Nov 2022 17:27:48 +0106
Message-Id: <20221116162152.193147-37-john.ogness@linutronix.de>
In-Reply-To: <20221116162152.193147-1-john.ogness@linutronix.de>
References: <20221116162152.193147-1-john.ogness@linutronix.de>
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
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1ovLB7-00Aak2-VM
Subject: [Kgdb-bugreport] [PATCH printk v5 36/40] tty: serial: kgdboc: use
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
Reviewed-by: Petr Mladek <pmladek@suse.com>
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
