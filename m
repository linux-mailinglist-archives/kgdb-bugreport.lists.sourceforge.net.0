Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2814962C405
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 16 Nov 2022 17:22:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ovLAy-0006a9-Tj
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 16 Nov 2022 16:22:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1ovLAx-0006Zw-9g
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 16 Nov 2022 16:22:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/Z8Y08lU4gBzUjFFzV1bgJ9D4slaSXi2GlBsKiKXaB8=; b=mcxz3WhTvXM0C8pcJP+AegX/Pc
 LrkD+16VNHqxc241ByDsLdVx69tustMy1OG2jAIhKLE0SUvoSfSDcmgocgbPmg9vGIRaM4xzdBPFE
 tpMDYXpmWe2Y07eoChKg1yVXaWP2yDrMzlqIfJqRU3nE0YYs76pyw3Nn5l7KkpVCRD9c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/Z8Y08lU4gBzUjFFzV1bgJ9D4slaSXi2GlBsKiKXaB8=; b=mQxOTnuiM+EFo4riu4aKKwY7nW
 QChnE7ao/R/gs4dOC9/ixeWs6SfafTnNmeHeY1r8S5F7tMiUorT49OGbyjQ85eRhqEksCurivgvLc
 A7Ik0onpvayNVdTEXlX87gYT68d8YDBjge9yeRetvUl5bMYhRLcdYzwqH/2wynwFu4+E=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ovLAw-00Aaio-LN for kgdb-bugreport@lists.sourceforge.net;
 Wed, 16 Nov 2022 16:22:11 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1668615724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Z8Y08lU4gBzUjFFzV1bgJ9D4slaSXi2GlBsKiKXaB8=;
 b=AlFnjhG6yoalddGZUFtJcAolOgncQCDPgISMOQ36V6hlKtWG/cSc/rczN/innYrbR/Jywt
 6BvsgBT8OM0LI0Zl93AGE5DcOK1Hk6PuqLE9MA6ZMxEFV140/y9Mh5kvEiN3u+2H3AgdKK
 +yLeMp6/Iwq+h0Rj2BKXdtZip7O7SGTdH/pr5EM1c/UOFDnm/rWDQpxmN58Gn4s3l0jWhT
 iGumgzq8mY+cbvxvXW6Wg5Fr6sjE/yVmwbnkPerYdOX99Q0eOvyJBOl6ryyIUf2n5ylE35
 XNUzA/3US4iPGW+at2fOIIkGxF9+2P6fccpt+a2QBG7OmpQDcRtLnBgi2WuoXA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1668615724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Z8Y08lU4gBzUjFFzV1bgJ9D4slaSXi2GlBsKiKXaB8=;
 b=UPIFaN5gtyWRJGSpTKiuex30w225CCf2nyuT23Yek69V+hFQwIVsUK9SGiI9NihuAmA3qc
 np5rsSzRcXc59rDg==
To: Petr Mladek <pmladek@suse.com>
Date: Wed, 16 Nov 2022 17:27:26 +0106
Message-Id: <20221116162152.193147-15-john.ogness@linutronix.de>
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
 Content preview: Guarantee safe iteration of the console list by using SRCU.
 Signed-off-by: John Ogness <john.ogness@linutronix.de> Reviewed-by: Petr
 Mladek <pmladek@suse.com> Reviewed-by: Aaron Tomlin <atomlin@atomlin.com>
 --- kernel/debug/kdb/kdb_io.c | 18 ++++++++++++++++-- [...] 
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
X-Headers-End: 1ovLAw-00Aaio-LN
Subject: [Kgdb-bugreport] [PATCH printk v5 14/40] kdb: use srcu console list
 iterator
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
 kgdb-bugreport@lists.sourceforge.net, Aaron Tomlin <atomlin@redhat.com>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Thomas Gleixner <tglx@linutronix.de>, Aaron Tomlin <atomlin@atomlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Guarantee safe iteration of the console list by using SRCU.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Reviewed-by: Aaron Tomlin <atomlin@atomlin.com>
---
 kernel/debug/kdb/kdb_io.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 67d3c48a1522..5c7e9ba7cd6b 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -545,6 +545,7 @@ static void kdb_msg_write(const char *msg, int msg_len)
 {
 	struct console *c;
 	const char *cp;
+	int cookie;
 	int len;
 
 	if (msg_len == 0)
@@ -558,8 +559,20 @@ static void kdb_msg_write(const char *msg, int msg_len)
 		cp++;
 	}
 
-	for_each_console(c) {
-		if (!(c->flags & CON_ENABLED))
+	/*
+	 * The console_srcu_read_lock() only provides safe console list
+	 * traversal. The use of the ->write() callback relies on all other
+	 * CPUs being stopped at the moment and console drivers being able to
+	 * handle reentrance when @oops_in_progress is set.
+	 *
+	 * There is no guarantee that every console driver can handle
+	 * reentrance in this way; the developer deploying the debugger
+	 * is responsible for ensuring that the console drivers they
+	 * have selected handle reentrance appropriately.
+	 */
+	cookie = console_srcu_read_lock();
+	for_each_console_srcu(c) {
+		if (!(console_srcu_read_flags(c) & CON_ENABLED))
 			continue;
 		if (c == dbg_io_ops->cons)
 			continue;
@@ -577,6 +590,7 @@ static void kdb_msg_write(const char *msg, int msg_len)
 		--oops_in_progress;
 		touch_nmi_watchdog();
 	}
+	console_srcu_read_unlock(cookie);
 }
 
 int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
-- 
2.30.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
