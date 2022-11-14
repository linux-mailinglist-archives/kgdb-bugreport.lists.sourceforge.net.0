Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5129262853B
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 14 Nov 2022 17:29:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1oucLH-0007IG-2D
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 14 Nov 2022 16:29:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1oucLG-0007I4-16
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 14 Nov 2022 16:29:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OX8P8PjcP3et+B8RxGuAu/qJSUE13puFYmEXVzvc8MY=; b=AVHhaIHeth47p/j/Q1ij0B3PaY
 Glt/BoT3kXeUCa/uoYnABziZ5IrdYcO0Xm9+ZTtqGC/h744HQkutJC+Y4NX3ZMef7PrpcpVuRvoiT
 PFn05QKVrLhUeI1UAkGH/YNlD/wXj105P2Jbt4aK5R4/B5cbqvNLAa7afqrEFMIXYVNI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OX8P8PjcP3et+B8RxGuAu/qJSUE13puFYmEXVzvc8MY=; b=ENb5BAqpUt456Ux0TGxsyE3HDQ
 Of9PRAv1D3sNTkNXZFnmHaHqSmfM+jJ3RaBJ1d5A/wVscLn5xZzQsA0eaR9f3giUAvXKlw/V2M8S1
 0o+yLxKw0vNYrrIRa0y0bjb4tNAsS21gaSbdf/31gCdMF04C1osX6R8QnZjVed92xYg4=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oucLB-0083vC-St for kgdb-bugreport@lists.sourceforge.net;
 Mon, 14 Nov 2022 16:29:49 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1668443377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OX8P8PjcP3et+B8RxGuAu/qJSUE13puFYmEXVzvc8MY=;
 b=07f/Iv1wL9DpAMhdAgc7Xt3WxoplT/3Nu02eKR1b8+j1+Y7qfzi1+FNR+cnpkz+yvo16Ze
 MBTxlfIFPnOpIaZmaWz8PKDgW1EEFLce5Z7cjkdy6Vz0eKot3ypTtDpD7aXfrOfrZ5b4jX
 QntAcdes7YddyPfeX5F8PQ8xBH1C/Xmv0UymHEQmXC9tX8u9cMQ0818P0ky0qz/V24Ia2u
 6PtsU3Op8WIIueIM9CeNFqHhD5rmh6U9hltEKu6vOewN2wBbCliUb2DS6q5csf2Eu5FEkm
 eEGxJwFLBff19l0CYvNQu8UBltdyze2FqKOkIC9D+rP9sBHRrdRV24X32/Thow==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1668443377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OX8P8PjcP3et+B8RxGuAu/qJSUE13puFYmEXVzvc8MY=;
 b=tELjjwZ800XS5coQk0qRU9bwQBSC526T8kNf1rYyslpyZ3bvfpKU2a+6OVmFy+qzAW3ZUV
 +iS9PnHyufG1tIDg==
To: Petr Mladek <pmladek@suse.com>
Date: Mon, 14 Nov 2022 17:35:00 +0106
Message-Id: <20221114162932.141883-8-john.ogness@linutronix.de>
In-Reply-To: <20221114162932.141883-1-john.ogness@linutronix.de>
References: <20221114162932.141883-1-john.ogness@linutronix.de>
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
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not
 exist)
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [193.142.43.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1oucLB-0083vC-St
Subject: [Kgdb-bugreport] [PATCH printk v4 07/39] tty: serial: kgdboc:
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
