Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 565A862C406
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 16 Nov 2022 17:22:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ovLB0-0004U5-2Q
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 16 Nov 2022 16:22:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1ovLAy-0004Tq-ST
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 16 Nov 2022 16:22:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OX8P8PjcP3et+B8RxGuAu/qJSUE13puFYmEXVzvc8MY=; b=XXvfESkaidTMQHwBX9V0FHjhYP
 m+dgy3qzLzkApX7SNfsxB3YBSMMwEiNTJq7z5747KDmi1Rs4Fd1KiJvs5pf0KwB/8Rq6yXxzDVs69
 2cKZVWd2JkKF+G1XnTw0Ff0QwpVMpDyN9eYqMBDWlAZi47Nqxc+5B5F5h8oOfKxmQlng=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OX8P8PjcP3et+B8RxGuAu/qJSUE13puFYmEXVzvc8MY=; b=cStvXaNa86qJlTFgcrYNtQ9sSZ
 TuTRqsd/9zw2rog+f3ShbGwGXNcOXsnnPuyoT9TEhgF/eXp+JMpZwYIYQSFyIA+PLQnnjEJ8PboPu
 wwarVXN2dE+uOebJVeULah4/Wnp8li6oAqX8ybDx8rP0sDSnEBFQxAQL5StwclnXhNfY=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ovLAw-0002ZN-Fm for kgdb-bugreport@lists.sourceforge.net;
 Wed, 16 Nov 2022 16:22:12 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1668615721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OX8P8PjcP3et+B8RxGuAu/qJSUE13puFYmEXVzvc8MY=;
 b=CEddAbi3RzraEuQWrV50K39HBCaBs5n1hbnWKQvKdxtvYvNn7qth0mD3hPQU/k5IM6/6jI
 tsakH1BSYxyMEWSQ+SYJ0ZbSLVzyVLLN6/OuY208TtKzgXC6M7StlhGoOqITVvqEeeSE2M
 X8Is4GU+dlc+eKJOSLahx8apQ/7CBFU4io8nbjAZNv2xNFB/IGOy7i8ahbNIx2TlwkTdyz
 ibPl1VaO0F9fOd8M9cClH3/bgDQIBr7zIZlGTmpNxRMFTCwefsc+Ksw5eBzns2iBBhnSdp
 K1UNeEN6Iqb9zCaC3+k2B4ePn7UMXh2KRldr715r7YqNpg/80ijcaDxMTepW6w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1668615721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OX8P8PjcP3et+B8RxGuAu/qJSUE13puFYmEXVzvc8MY=;
 b=wWUGVs3m5zf238cl2T7E7PtRK7QDcJHWNVj1NK/JvMgbbu2/yMeyvExDpCJ6+ELC+PGYAH
 BBDa/hEaxQ3F/JAw==
To: Petr Mladek <pmladek@suse.com>
Date: Wed, 16 Nov 2022 17:27:20 +0106
Message-Id: <20221116162152.193147-9-john.ogness@linutronix.de>
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
 Content preview: kgdboc_earlycon_init() uses the console_lock to ensure that
 no consoles are unregistered until the kgdboc_earlycon is setup. This is
 necessary because the trapping of the exit() callback assumes that [...] 
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
X-Headers-End: 1ovLAw-0002ZN-Fm
Subject: [Kgdb-bugreport] [PATCH printk v5 08/40] tty: serial: kgdboc:
 document console_lock usage
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
are unregistered until the kgdboc_earlycon is setup. This is necessary
because the trapping of the exit() callback assumes that the exit()
callback is not called before the trap is setup.

Explicitly document this non-typical console_lock usage.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Petr Mladek <pmladek@suse.com>
---
 drivers/tty/serial/kgdboc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
index e76f0186c335..5be381003e58 100644
--- a/drivers/tty/serial/kgdboc.c
+++ b/drivers/tty/serial/kgdboc.c
@@ -530,6 +530,14 @@ static int __init kgdboc_earlycon_init(char *opt)
 	 * Look for a matching console, or if the name was left blank just
 	 * pick the first one we find.
 	 */
+
+	/*
+	 * Hold the console_lock to guarantee that no consoles are
+	 * unregistered until the kgdboc_earlycon setup is complete.
+	 * Trapping the exit() callback relies on exit() not being
+	 * called until the trap is setup. This also allows safe
+	 * traversal of the console list and race-free reading of @flags.
+	 */
 	console_lock();
 	for_each_console(con) {
 		if (con->write && con->read &&
-- 
2.30.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
