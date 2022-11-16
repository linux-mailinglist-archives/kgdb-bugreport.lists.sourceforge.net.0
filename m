Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5DA62C410
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 16 Nov 2022 17:22:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ovLBE-0004VV-2d
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 16 Nov 2022 16:22:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1ovLB7-0004Uv-GC
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 16 Nov 2022 16:22:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XOHwuBaQ1W+3awwG2RAkUq8lXTwRKxgLO4vJVGnxlV8=; b=Gt6VuvnK/7ukvVOV1Hieoe2U3P
 QKpNVqqmj7sSEaateOLg5gosuwFDZNsCWhG5HDscyyS4cYEzOUKzVO3934LqOVDGX4sMOIxg4wD7g
 pUZr3x10tkODQs7SCe+7B0eDERcXTZASSqUJGOH04O8P0BAFapxElqNGSrHZOQGAf1ug=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XOHwuBaQ1W+3awwG2RAkUq8lXTwRKxgLO4vJVGnxlV8=; b=EVUzUVrDUZN+1BXKDvRsaPBisJ
 tyCq0j9HQcj9adHZBIpKqC4jvc8nJN58pjRElaEzmxDw3QU/lD0twMKYQl9DTIWXDvh2nOKpvphNR
 TG38yJOSaIpgLsKeCQ4N6iNhOnpGrrC3QM629xxbqFTeo/PRg5rrTHDBwFbXN0q1ABt8=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ovLB6-0002bO-R0 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 16 Nov 2022 16:22:21 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1668615734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XOHwuBaQ1W+3awwG2RAkUq8lXTwRKxgLO4vJVGnxlV8=;
 b=zwABEZ9mxonAyBNUeWB10LZTBQNhVUWXnM4uJOtaQ2YyZadMZ5Bi3atLrrsSkVEU/BnViB
 xAZVnMRA2dR8k2nO0aVndbNd46Y1KfXjZxNnIMCd0MWCLq21gTPYXnDQlH47HazQ4NDvNt
 wmcJ6p2S4E6O3pkDLBoS7eyHnNAg3KsSCoQvLEKQjz/CSbQe3nu6Pon8WzaivpF79mr26K
 BAILjyp28M6MufGbgldEQGXoQwcNvfSuPpzdX/UBg8mB6SWPRgUX+uX2ZRJIGeOWZIQXpE
 2Z/4P+skN/oruOza9baWAElWHHWGDsIWdsfXNjTGDHR5DZfUdF7y4XpQqQEB6w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1668615734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XOHwuBaQ1W+3awwG2RAkUq8lXTwRKxgLO4vJVGnxlV8=;
 b=s9R0LFz1ZdiHDzIlIEwfz6Uf9mV1b7pU/Ru3/LSGYsFj+6aDJGhMs03+ARyz6ujFNcaXLF
 WcI0pM16uwfwndDg==
To: Petr Mladek <pmladek@suse.com>
Date: Wed, 16 Nov 2022 17:27:47 +0106
Message-Id: <20221116162152.193147-36-john.ogness@linutronix.de>
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
 Content preview: Use srcu console list iteration for safe console list
 traversal.
 Note that this is a preparatory change for when console_lock no longer
 provides
 synchronization for the console list. Signed-off-by: John Ogness
 <john.ogness@linutronix.de>
 Reviewed-by: Petr Mladek <pmladek@suse.com> --- drivers/tty/serial/kgdboc.c
 | 10 ++++++++-- 1 file changed, 8 insertions(+), 2 deletions(-) 
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
X-Headers-End: 1ovLB6-0002bO-R0
Subject: [Kgdb-bugreport] [PATCH printk v5 35/40] tty: serial: kgdboc: use
 srcu console list iterator
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

Use srcu console list iteration for safe console list traversal.
Note that this is a preparatory change for when console_lock no
longer provides synchronization for the console list.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
Reviewed-by: Petr Mladek <pmladek@suse.com>
---
 drivers/tty/serial/kgdboc.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
index 5be381003e58..c6df9ef34099 100644
--- a/drivers/tty/serial/kgdboc.c
+++ b/drivers/tty/serial/kgdboc.c
@@ -451,6 +451,7 @@ static void kgdboc_earlycon_pre_exp_handler(void)
 {
 	struct console *con;
 	static bool already_warned;
+	int cookie;
 
 	if (already_warned)
 		return;
@@ -463,9 +464,14 @@ static void kgdboc_earlycon_pre_exp_handler(void)
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
