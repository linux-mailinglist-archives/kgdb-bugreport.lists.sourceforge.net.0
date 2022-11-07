Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1C661F52E
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Nov 2022 15:17:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1os2vz-0002ZM-MX
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 07 Nov 2022 14:17:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1os2vw-0002YY-FS
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Nov 2022 14:17:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ABDFtrgjV5x8uGkolXUUesJdZpQfr7BwwBr7iTObU1k=; b=KXwa1rT/zWuQRhAhArfiZLflOs
 1TQD1eHKayTA4XCAEqcJqdLqwWd1Fuo0Dd6RN1/cbyAG14klk6DH+aJdbLO/1kg+Z0KuSDetKPGbU
 KGhKljn4ba36z+nv2K/c/GVEXKkAK5QFSgK1sjDyWcUeSRvKdI2BQEiWfJSlUlq4/g84=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ABDFtrgjV5x8uGkolXUUesJdZpQfr7BwwBr7iTObU1k=; b=S0rps67hfzF3z2al9WtUm/Im2k
 043uHy1OjTJ35/OfsPWuPpYjgYEv3Gn60BTk14NL32O9SeDqDO3Y6Nxkojt4J9oFnbRd+UTOVRhhq
 +gQCo4UGM4VJ2Sn2ooXZs0fIAJTKMUfEIbheI3FWOTIyVRrTyiknS+Wwz2vIvG0tUi4w=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1os2vv-00036i-Oo for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Nov 2022 14:17:04 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1667830617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ABDFtrgjV5x8uGkolXUUesJdZpQfr7BwwBr7iTObU1k=;
 b=quYSkn0H6WS4/l0RYtMy3BDn/rK/rRzby8k7+wPwnxKordiq2TgHz8VGVPX95WuRGgwskm
 EtBX73KPFW0k9NtYTpUCTtC+tWMJhMww3Zvq9V2lgXuA2ShF3fqmI4g0ScS/P1sTLwetNh
 ExpToebi/v9WRQUmTKE5E/WcN/uuirbBRldIeX/WLOaS06fohXQ/OGszmxg1g6WSergB31
 MbaozUQ59Y9Fv+G+GH08ICMAjHlm76Pco9BS188p4z7JPQKzTEx426fF2f8aER4+H6sylG
 CSiyN8MEZvyACLULxolUeG76LhEFYwnZoc0EQUAsjHeEZdS3ykqCDiKbXDiAqw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1667830617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ABDFtrgjV5x8uGkolXUUesJdZpQfr7BwwBr7iTObU1k=;
 b=0EsqVlG5GcPGEcsVNMZ4uy7CR5J6JcEVjcsCxd7fPEIZJDWclxknPbTwQCDjbw6tArZeef
 7aUFWCYb4TEtlXBA==
To: Petr Mladek <pmladek@suse.com>
Date: Mon,  7 Nov 2022 15:22:35 +0106
Message-Id: <20221107141638.3790965-38-john.ogness@linutronix.de>
In-Reply-To: <20221107141638.3790965-1-john.ogness@linutronix.de>
References: <20221107141638.3790965-1-john.ogness@linutronix.de>
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Calling tty_find_polling_driver() can lead to
 uart_set_options()
 being called (via the poll_init() callback of tty_operations) to configure
 the uart. But uart_set_options() can also be called by regis [...] 
 Content analysis details:   (-1.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [193.142.43.55 listed in list.dnswl.org]
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not
 exist)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1os2vv-00036i-Oo
Subject: [Kgdb-bugreport] [PATCH printk v3 37/40] tty: serial: kgdboc:
 synchronize tty_find_polling_driver() and register_console()
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

Calling tty_find_polling_driver() can lead to uart_set_options() being
called (via the poll_init() callback of tty_operations) to configure the
uart. But uart_set_options() can also be called by register_console()
(via the setup() callback of console).

Take the console_list_lock to synchronize against register_console() and
also use it for console list traversal. This also ensures the console list
cannot change until the polling console has been chosen.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 drivers/tty/serial/kgdboc.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
index 82b4b4d67823..8c2b7ccdfebf 100644
--- a/drivers/tty/serial/kgdboc.c
+++ b/drivers/tty/serial/kgdboc.c
@@ -189,12 +189,20 @@ static int configure_kgdboc(void)
 	if (kgdboc_register_kbd(&cptr))
 		goto do_register;
 
+	/*
+	 * tty_find_polling_driver() can call uart_set_options()
+	 * (via poll_init) to configure the uart. Take the console_list_lock
+	 * in order to synchronize against register_console(), which can also
+	 * configure the uart via uart_set_options(). This also allows safe
+	 * traversal of the console list.
+	 */
+	console_list_lock();
+
 	p = tty_find_polling_driver(cptr, &tty_line);
-	if (!p)
+	if (!p) {
+		console_list_unlock();
 		goto noconfig;
-
-	/* For safe traversal of the console list. */
-	console_list_lock();
+	}
 
 	/*
 	 * Take console_lock to serialize device() callback with
-- 
2.30.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
