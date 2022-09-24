Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A851E5E8676
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 24 Sep 2022 02:05:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1obsfI-00062y-99
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 24 Sep 2022 00:05:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1obsfG-00062s-KN
 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 24 Sep 2022 00:05:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wmQTrIsrazpPIyD8N/ImSAVVwbH1mqHErna9k27Vvaw=; b=fC4WsrhhCLWR1qOO7cBL0UOrKA
 E5TKm42w8HKp2z8oSAol6HFP2BgcN/qTe5IM9/48+LwCvsbQsWhkvGyVkaUwGeedNweBeF+KsKUZk
 oLbinIeSF5db4ZM3ynZEwiT1TKz9qrJ94fer3hlew215AwkB6tGId2V5oiMwGkAcfjAY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wmQTrIsrazpPIyD8N/ImSAVVwbH1mqHErna9k27Vvaw=; b=ZFtvqJgcTNU9pJRPcibiqAxnLM
 pNN11ITTUnU8OVOI+E3wB5DLUC9lEmofwZZI1W669THQIAL3yeUwBSPgY2sV3TSXI/b4RsOTmB2Fk
 x9BSZ9gyRaQoip3ARmwCfRhgklobloMpI/CMGa5xPEcjTeVwbLXUO/r95uTelXmz+pKs=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1obsfS-0006Fs-AV for kgdb-bugreport@lists.sourceforge.net;
 Sat, 24 Sep 2022 00:05:15 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1663977901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wmQTrIsrazpPIyD8N/ImSAVVwbH1mqHErna9k27Vvaw=;
 b=e0HL7iVSFrWDEyWd93pKTysu+f2PtjV3UFX2E17ouIqnFgtgYHj2JwYv2DJpGHFeLeQ3ld
 MCM414BiK2Y3yDjf149S6h7A2iKBukElbmL8Fx+8e0sPzdpxSUabOQYTK4KjD2bSusFYnP
 //N/XuNoVWXLv6GGGBV6UOQkBD+XfX0rptum628w3mUuvC8YGt0WaymrGmYMZDiBqax5Me
 Rggwzu8njK/aSMcmvP10yWtRrHV4bUJBQdZnWnzqiXp9tAjhEgNDoHxBmN+uFi/uXa+Mos
 JdYY7EdmpHm6MrGtdgVzyLDiJyHObnss252/czGO/8zUHjIBcIgYIQW0F8EU1g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1663977901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wmQTrIsrazpPIyD8N/ImSAVVwbH1mqHErna9k27Vvaw=;
 b=b9MI9BO/qiKg/DT4XFHp9Pb+3i4omPO4qdqEr0ElztkwrozUgg0NcEq8KTBgK/v0k0uPW1
 l2r6ueyffq6bMOAw==
To: Petr Mladek <pmladek@suse.com>
Date: Sat, 24 Sep 2022 02:10:46 +0206
Message-Id: <20220924000454.3319186-11-john.ogness@linutronix.de>
In-Reply-To: <20220924000454.3319186-1-john.ogness@linutronix.de>
References: <20220924000454.3319186-1-john.ogness@linutronix.de>
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Thomas Gleixner <tglx@linutronix.de> Provide a special
 list iterator macro for KGDB to allow unprotected list walks and add a few
 comments to explain the hope based approach. Preperatory change for changing
 the console list to hlist and adding lockdep asserts to regular list walks.
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1obsfS-0006Fs-AV
Subject: [Kgdb-bugreport] [PATCH printk 10/18] kgbd: Pretend that console
 list walk is safe
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Aaron Tomlin <atomlin@redhat.com>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

From: Thomas Gleixner <tglx@linutronix.de>

Provide a special list iterator macro for KGDB to allow unprotected list
walks and add a few comments to explain the hope based approach.

Preperatory change for changing the console list to hlist and adding
lockdep asserts to regular list walks.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: John Ogness <john.ogness@linutronix.de>
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/tty/serial/kgdboc.c |  5 ++++-
 include/linux/console.h     | 10 ++++++++++
 kernel/debug/kdb/kdb_io.c   |  7 ++++++-
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
index af2aa76bae15..57a5fd27dffe 100644
--- a/drivers/tty/serial/kgdboc.c
+++ b/drivers/tty/serial/kgdboc.c
@@ -462,10 +462,13 @@ static void kgdboc_earlycon_pre_exp_handler(void)
 	 * we have no other choice so we keep using it.  Since not all
 	 * serial drivers might be OK with this, print a warning once per
 	 * boot if we detect this case.
+	 *
+	 * Pretend that walking the console list is safe...
 	 */
-	for_each_console(con)
+	for_each_console_kgdb(con) {
 		if (con == kgdboc_earlycon_io_ops.cons)
 			return;
+	}
 
 	already_warned = true;
 	pr_warn("kgdboc_earlycon is still using bootconsole\n");
diff --git a/include/linux/console.h b/include/linux/console.h
index 24344f9b0bc1..86a6125512b9 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -187,6 +187,16 @@ extern void console_list_unlock(void) __releases(console_mutex);
 #define for_each_console(con)						\
 	for (con = console_drivers; con != NULL; con = con->next)
 
+/**
+ * for_each_console_kgdb() - Iterator over registered consoles for KGDB
+ * @con:	struct console pointer used as loop cursor
+ *
+ * Has no serialization requirements and KGDB pretends that this is safe.
+ * Don't use outside of the KGDB fairy tale land!
+ */
+#define for_each_console_kgdb(con)					\
+	for (con = console_drivers; con != NULL; con = con->next)
+
 extern int console_set_on_cmdline;
 extern struct console *early_console;
 
diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 67d3c48a1522..fb3775e61a3b 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -558,7 +558,12 @@ static void kdb_msg_write(const char *msg, int msg_len)
 		cp++;
 	}
 
-	for_each_console(c) {
+	/*
+	 * This is a completely unprotected list walk designed by the
+	 * wishful thinking department. See the oops_in_progress comment
+	 * below - especially the encourage section...
+	 */
+	for_each_console_kgdb(c) {
 		if (!(c->flags & CON_ENABLED))
 			continue;
 		if (c == dbg_io_ops->cons)
-- 
2.30.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
