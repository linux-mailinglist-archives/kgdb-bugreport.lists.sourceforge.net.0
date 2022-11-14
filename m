Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB90628545
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 14 Nov 2022 17:30:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1oucLQ-0004Kl-7s
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 14 Nov 2022 16:30:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1oucLN-0004KT-S8
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 14 Nov 2022 16:29:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2wDn6g+8UuBdFK6wWrlxzslZkfyRUaJ6YAvy13J2JzM=; b=R91i82BFz6wK/h9tyofPPe4N4S
 ziVOtQ1PkvyhI0G5VrYVzsVd/9b0E1k6CUY3YPwA3RvkRk7Q6B9l7o8yLIZIgLNvxGUC25LfpI/VQ
 mAxdINj/Mi9uMuKzaZrsDl2f3dz7Fl0KPODom0gSb1HiGkXNElbBhUU+7AuWC+quXozE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2wDn6g+8UuBdFK6wWrlxzslZkfyRUaJ6YAvy13J2JzM=; b=dBN+W8+y3y7EJtcEbcXfRbxH8g
 hNPglbjs91k9ZBJ4vulCcRWZqXQwb5rGxmdUmpw4VDmn2IFtry93h3jBeG+oMKiV73fWq+fkN0v9Y
 ZZ+kSH0xMKwCJA1/KimG7/Rwl37IZAWl8dSgp/CC2YX/152+NQaJjk55foj8+b5I1dL4=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oucLL-0000hU-Ls for kgdb-bugreport@lists.sourceforge.net;
 Mon, 14 Nov 2022 16:29:57 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1668443389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2wDn6g+8UuBdFK6wWrlxzslZkfyRUaJ6YAvy13J2JzM=;
 b=BImf087f9JnZ88MWf7ANkPfWPNC7L78l8GKfPWaZ1afRJ+A+JBuMrpM8D1Ka321WprAnA3
 EGloFZFKdW72lAGMkaKfGh8DjWcnX/CaE/PiSwUMI6Ev+J+j0YujoKIAviukaNA6BNfXG6
 vZQKB3mcJni3b4fbuzwdnXl0zvRf10T9m37lJxrHpv2cksUNBagpZ2TxbYiXBkkwN8uGFR
 QmO4TI8BuMPRs08ILB69SI8eB5ifJwO3XFa/Na0Ps0ULOqzEpXNv/aY2+GJpk5tnowTx8g
 lQWj2mP+9P3cjsdwI04CGBTnOSDytJN+t4szjXImS/5DCyylCW1RsCBuFWAI7g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1668443389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2wDn6g+8UuBdFK6wWrlxzslZkfyRUaJ6YAvy13J2JzM=;
 b=1WUe4EQRUuyC882lbN52LVmxM2UtRXMjNbX4zkjqflQk4DO03Am6ce06RfjNxTxnINegur
 l44TkJN3V9duhpDA==
To: Petr Mladek <pmladek@suse.com>
Date: Mon, 14 Nov 2022 17:35:27 +0106
Message-Id: <20221114162932.141883-35-john.ogness@linutronix.de>
In-Reply-To: <20221114162932.141883-1-john.ogness@linutronix.de>
References: <20221114162932.141883-1-john.ogness@linutronix.de>
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
 --- drivers/tty/serial/kgdboc.c | 10 ++++++++-- 1 file changed, 8 insertions(+),
 2 deletions(-) 
 Content analysis details:   (-1.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not
 exist)
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [193.142.43.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1oucLL-0000hU-Ls
Subject: [Kgdb-bugreport] [PATCH printk v4 34/39] tty: serial: kgdboc: use
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
