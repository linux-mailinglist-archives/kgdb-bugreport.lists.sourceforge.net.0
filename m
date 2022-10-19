Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEBE604A02
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 19 Oct 2022 16:56:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1olAUU-00085T-HC
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 19 Oct 2022 14:56:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1olAUS-00085N-FK
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 19 Oct 2022 14:56:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NEhmZhH2pnDE6WuTxQwMCcvi/RbMP+L4l7DVKXhScfQ=; b=bWb5oetgIG4RIc4EeCddgHsPL/
 GBxZVpFRTERovfMsAYIAWSzyCzGQKs4jdU0emJhBjoKNQxrxyKeq4mlagAeHDZFTx0E+RTg3jMPpO
 +ekbMSbIxTpRb8gQDBpC3xZns/jEX91/wANdhvW9XKAdjBkzzpqsISdbBEr67WOh6pE4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NEhmZhH2pnDE6WuTxQwMCcvi/RbMP+L4l7DVKXhScfQ=; b=JmU1zmNGhBezoGC0pk4dr2dngf
 lRjFRoIYx96mLEL/Wy7zQi7M7MfEXg+66ltXGMmuw+93h4fqPSSeeTYoeAjKFe86aRaau6gYjVM6G
 Bdr5furNpM1tZh19Kgm3QYgKFB9b3iEBHt6CSF+P1M8+K2n4TuO90x0c/RhmRlJ5KiEQ=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1olAUR-00071N-HN for kgdb-bugreport@lists.sourceforge.net;
 Wed, 19 Oct 2022 14:56:16 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1666191363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NEhmZhH2pnDE6WuTxQwMCcvi/RbMP+L4l7DVKXhScfQ=;
 b=WkJA4pqmnV5juPN/ttgFR+jALEcs6JiTFkAuj55fv1Kc9Cx9UAm1N2rezLQc4WaDTdI/Ez
 m/HFdf7pZqHhdxeVSxmJ/wOoDKSjiMkAqJ8syecbdqYLzx9aZNdxjA9PJjkX7XcCeN9bSn
 bNe0JNx3plnLRTHu6/TZEDVzHEPTgZuc1wDuCH0zd719J7sckLPTqVJ2fAeNX8P7melcni
 0q6XH6+z5F33XWbnvc5mJtt5eRYubPRu1pN8zAtwSWT7NlR9AjihtUMfpyxtPV4FPukpwg
 awmFOtjaGtFa430Q5t3JRNOLPoKJdpHRQeR0xyjB/xzpitnezB7/EUhmrWpzGg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1666191363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NEhmZhH2pnDE6WuTxQwMCcvi/RbMP+L4l7DVKXhScfQ=;
 b=aDl1Im9QlC7jXBpafB/JPa5shMExjhVLO58+NwKbR8EV60/QUyHkbiIXWH+jwcsUkqMUn9
 dwjFqk2pmsScIoAQ==
To: Petr Mladek <pmladek@suse.com>
Date: Wed, 19 Oct 2022 17:01:23 +0206
Message-Id: <20221019145600.1282823-2-john.ogness@linutronix.de>
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
 Content preview: From: Thomas Gleixner <tglx@linutronix.de> Unprotected list
 walks are not necessarily safe. Signed-off-by: Thomas Gleixner
 <tglx@linutronix.de>
 Signed-off-by: John Ogness <john.ogness@linutronix.de> Reviewed-by: Petr
 Mladek <pmladek@suse.com> --- drivers/tty/serial/kgdboc.c | 2 ++ 1 file cha
 [...] Content analysis details:   (-1.9 points, 6.0 required)
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
X-Headers-End: 1olAUR-00071N-HN
Subject: [Kgdb-bugreport] [PATCH printk v2 01/38] serial: kgdboc: Lock
 console list in probe function
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

From: Thomas Gleixner <tglx@linutronix.de>

Unprotected list walks are not necessarily safe.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: John Ogness <john.ogness@linutronix.de>
Reviewed-by: Petr Mladek <pmladek@suse.com>
---
 drivers/tty/serial/kgdboc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
index 7aa37be3216a..e76f0186c335 100644
--- a/drivers/tty/serial/kgdboc.c
+++ b/drivers/tty/serial/kgdboc.c
@@ -193,6 +193,7 @@ static int configure_kgdboc(void)
 	if (!p)
 		goto noconfig;
 
+	console_lock();
 	for_each_console(cons) {
 		int idx;
 		if (cons->device && cons->device(cons, &idx) == p &&
@@ -201,6 +202,7 @@ static int configure_kgdboc(void)
 			break;
 		}
 	}
+	console_unlock();
 
 	kgdb_tty_driver = p;
 	kgdb_tty_line = tty_line;
-- 
2.30.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
