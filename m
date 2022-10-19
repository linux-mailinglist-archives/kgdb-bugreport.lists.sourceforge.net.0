Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B1E604A0A
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 19 Oct 2022 16:56:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1olAUe-00086R-8p
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 19 Oct 2022 14:56:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1olAUZ-00085z-JH
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 19 Oct 2022 14:56:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l6JL8Q05OijoTEvKKyIiYa7K6VvZeDLREPexuqG68w4=; b=fevWoJc9ajPVN7D/gvTVg1wBrx
 ns+KeQrtcBCI4QW1g/NFFhujF+3usysUKy9KC7Tp6UwoHg8OtNXJoAMhyS8DTkXVA2T4X4kxfjV2Q
 D4V2PGS1o7Dy32dgP9mgi5MOfD+/imLxEpE4UuoXMSh1XEsZkVtqqwlZpTVZdA7IpXWA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=l6JL8Q05OijoTEvKKyIiYa7K6VvZeDLREPexuqG68w4=; b=NG+exk4DErXGHnV57lvAyX0L4O
 i8HhfQVJpz2ZwHkYO+ww6J2y/CMHQQrgLYIr/eswbjiFCxSb9+DxHQO8Q1IIEpI3DrGBM5mOn2tIy
 nbYApZaGRsYkyIqcT4kL68y9ydOoKpsp6f/N8BFDxnGPls6dEdvfKRLV3bjUVh0N1+UY=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1olAUY-00072J-Un for kgdb-bugreport@lists.sourceforge.net;
 Wed, 19 Oct 2022 14:56:23 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1666191376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l6JL8Q05OijoTEvKKyIiYa7K6VvZeDLREPexuqG68w4=;
 b=2lE2ZSVvaLYxX/mxts/imwzBNHAp8IFSDC/ai7lkxP1zyF6vpMFV8KAaG0pwB+zKzWkutn
 BNZQsjhTA+fE9mUGf/9zLZQuPNRIBu0owJpd7GDzfuULoEKri5Ic8olH4bE1eI5Rf1CKGy
 vTs3ThAfna4xN6EPjQmcBVcPNNwb7z99UsM+MaDiSMsHRWQQdQDukhcxIu7T4tOZ2TYmxg
 Bfdt5cy+/S+IRAvC/LS6NYxQYe0e79/FQQRYb/Mcd8jS8qxWB1iuXQe85SqXEhXYqiH8j4
 +8mgUokSmCQOtAKhWeO3fUlqU5Flbi2cC2akX0Xw1B69Gv1ldKxWWm+8ITOUfQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1666191376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l6JL8Q05OijoTEvKKyIiYa7K6VvZeDLREPexuqG68w4=;
 b=CQZkI2DXDnPwDZmhG2PVbvPciqqo6PQ6K7EPwjaFXRMKTNR/ZrE840g4rZSpD8aFVitZok
 a6Wx9DhxTm9LofBg==
To: Petr Mladek <pmladek@suse.com>
Date: Wed, 19 Oct 2022 17:01:48 +0206
Message-Id: <20221019145600.1282823-27-john.ogness@linutronix.de>
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
 Content preview: Guarantee safe iteration of the console list by using SRCU.
 Signed-off-by: John Ogness <john.ogness@linutronix.de> ---
 kernel/debug/kdb/kdb_io.c
 | 5 ++++- 1 file changed, 4 insertions(+), 1 deletion(-) 
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
X-Headers-End: 1olAUY-00072J-Un
Subject: [Kgdb-bugreport] [PATCH printk v2 26/38] kdb: use srcu console list
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
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Guarantee safe iteration of the console list by using SRCU.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 kernel/debug/kdb/kdb_io.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 550fe8b456ec..5c0bd93c3574 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -545,6 +545,7 @@ static void kdb_msg_write(const char *msg, int msg_len)
 {
 	struct console *c;
 	const char *cp;
+	int cookie;
 	int len;
 
 	if (msg_len == 0)
@@ -558,7 +559,8 @@ static void kdb_msg_write(const char *msg, int msg_len)
 		cp++;
 	}
 
-	for_each_console(c) {
+	cookie = console_srcu_read_lock();
+	for_each_console_srcu(c) {
 		if (!console_is_enabled(c))
 			continue;
 		if (c == dbg_io_ops->cons)
@@ -577,6 +579,7 @@ static void kdb_msg_write(const char *msg, int msg_len)
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
