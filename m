Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F672665E6B
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 11 Jan 2023 15:52:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pFcSY-0001gS-IY
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 11 Jan 2023 14:52:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1pFcSX-0001gM-25
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 11 Jan 2023 14:52:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C3ShpcOwOQrvdccdvZNmwpq5oNx/F35tbPLB2fWoef8=; b=b9+88Zymj2yqUFlj/vHqi3M3JN
 LDyO6hMhZZ91MtGaPxruCMj0rKgxZ3ejKwDtNOMiWL+++7iMLn4FwJF73zWEpu+/7Zu/HS1Aux9kp
 hAOPDQAookVqQrxdbxD8cV/pNAm49jTyD3g4bIlD+bxwn/ypm/P/fb//EBedOb3zE+RY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=C3ShpcOwOQrvdccdvZNmwpq5oNx/F35tbPLB2fWoef8=; b=m
 oVTUAfj3izEYoQ7Ulibxi6lzRwDu6OM0TLOhTTMuIY29CqC8DzECeM+gxJ1Av1uF195PD5iJDuCm/
 8chfuUV/57ur9rdDl9ksSc3ojFVdnpaOty2/O70PewBqXpyli/J7IOIRSD/YFFlcPvLeXxUOp+P3e
 eCOonLmGXWJN/jis=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pFcSS-00DxuX-UX for kgdb-bugreport@lists.sourceforge.net;
 Wed, 11 Jan 2023 14:52:07 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1673448715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=C3ShpcOwOQrvdccdvZNmwpq5oNx/F35tbPLB2fWoef8=;
 b=IxLWTMd44vVjt+DirBUWgQYJI/UOfvIW8vYd8ssjsPkHlrjpioQhApzLpwEmh6T3hICiOK
 Vt2UE6NAVZRw8JydZxC6ukdxTmTvhFNNfeYB6iaDvBaVTy5AvSeNOvR86IL7KWStfVNQIR
 L2Y6VwUxDpieUmqyo2V6KO6QtsF3syndBf7DzhElOpiQCMAgpF/lAhX6LtxuNHWmS/kROt
 Rr5cOPYJDcRnA9mzbOMx7+vgmgG4htzS8p4gDm9NTTnMcR25EP/SQgr3TViTvmemDLzlUM
 qRgM803Rro8yMRdOMR++SSbuhZV3WYHoTt44/mIo4BBvs2aRUGGenk0A87jyCw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1673448715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=C3ShpcOwOQrvdccdvZNmwpq5oNx/F35tbPLB2fWoef8=;
 b=uoOqLfetODlsE968Zaka7g/1SL5Ga0HewEV2DZsZZXbcna0JECOq1/c8A+3uvgPhsO5i6W
 v6OdmN8tCIo0HEDw==
To: Petr Mladek <pmladek@suse.com>
Date: Wed, 11 Jan 2023 15:57:10 +0106
Message-Id: <20230111145110.1327831-1-john.ogness@linutronix.de>
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Several mutexes are taken while setting up console serial
 ports. In particular,
 the tty_port->mutex and @console_mutex are taken: serial_pnp_probe
 serial8250_register_8250_port uart_add_one_port (locks tty_port->mutex)
 uart_configure_port register_console (locks @console_mutex) 
 Content analysis details:   (-1.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linutronix.de]
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not
 exist)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [193.142.43.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pFcSS-00DxuX-UX
Subject: [Kgdb-bugreport] [PATCH] tty: serial: kgdboc: fix mutex locking
 order for configure_kgdboc()
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

Several mutexes are taken while setting up console serial ports. In
particular, the tty_port->mutex and @console_mutex are taken:

  serial_pnp_probe
    serial8250_register_8250_port
      uart_add_one_port (locks tty_port->mutex)
        uart_configure_port
          register_console (locks @console_mutex)

In order to synchronize kgdb's tty_find_polling_driver() with
register_console(), commit 6193bc90849a ("tty: serial: kgdboc:
synchronize tty_find_polling_driver() and register_console()") takes
the @console_mutex. However, this leads to the following call chain
(with locking):

  platform_probe
    kgdboc_probe
      configure_kgdboc (locks @console_mutex)
        tty_find_polling_driver
          uart_poll_init (locks tty_port->mutex)
            uart_set_options

This is clearly deadlock potential due to the reverse lock ordering.

Since uart_set_options() requires holding @console_mutex in order to
serialize early initialization of the serial-console lock, take the
@console_mutex in uart_poll_init() instead of configure_kgdboc().

Since configure_kgdboc() was using @console_mutex for safe traversal
of the console list, change it to use the SRCU iterator instead.

Add comments to uart_set_options() kerneldoc mentioning that it
requires holding @console_mutex (aka the console_list_lock).

Fixes: 6193bc90849a ("tty: serial: kgdboc: synchronize tty_find_polling_driver() and register_console()")
Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 drivers/tty/serial/kgdboc.c      | 16 ++++------------
 drivers/tty/serial/serial_core.c |  5 +++++
 2 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
index a3ed9b34e2ab..f7df46cc1890 100644
--- a/drivers/tty/serial/kgdboc.c
+++ b/drivers/tty/serial/kgdboc.c
@@ -171,6 +171,7 @@ static int configure_kgdboc(void)
 	int err = -ENODEV;
 	char *cptr = config;
 	struct console *cons;
+	int cookie;
 
 	if (!strlen(config) || isspace(config[0])) {
 		err = 0;
@@ -189,15 +190,6 @@ static int configure_kgdboc(void)
 	if (kgdboc_register_kbd(&cptr))
 		goto do_register;
 
-	/*
-	 * tty_find_polling_driver() can call uart_set_options()
-	 * (via poll_init) to configure the uart. Take the console_list_lock
-	 * in order to synchronize against register_console(), which can also
-	 * configure the uart via uart_set_options(). This also allows safe
-	 * traversal of the console list.
-	 */
-	console_list_lock();
-
 	p = tty_find_polling_driver(cptr, &tty_line);
 	if (!p) {
 		console_list_unlock();
@@ -211,7 +203,8 @@ static int configure_kgdboc(void)
 	 */
 	console_lock();
 
-	for_each_console(cons) {
+	cookie = console_srcu_read_lock();
+	for_each_console_srcu(cons) {
 		int idx;
 		if (cons->device && cons->device(cons, &idx) == p &&
 		    idx == tty_line) {
@@ -219,11 +212,10 @@ static int configure_kgdboc(void)
 			break;
 		}
 	}
+	console_srcu_read_unlock(cookie);
 
 	console_unlock();
 
-	console_list_unlock();
-
 	kgdb_tty_driver = p;
 	kgdb_tty_line = tty_line;
 
diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index b9fbbee598b8..ec874f3a567c 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -2212,6 +2212,9 @@ EXPORT_SYMBOL_GPL(uart_parse_options);
  * @parity: parity character - 'n' (none), 'o' (odd), 'e' (even)
  * @bits: number of data bits
  * @flow: flow control character - 'r' (rts)
+ *
+ * Locking: Caller must hold console_list_lock in order to serialize
+ * early initialization of the serial-console lock.
  */
 int
 uart_set_options(struct uart_port *port, struct console *co,
@@ -2619,7 +2622,9 @@ static int uart_poll_init(struct tty_driver *driver, int line, char *options)
 
 	if (!ret && options) {
 		uart_parse_options(options, &baud, &parity, &bits, &flow);
+		console_list_lock();
 		ret = uart_set_options(port, NULL, baud, parity, bits, flow);
+		console_list_unlock();
 	}
 out:
 	mutex_unlock(&tport->mutex);

base-commit: b7bfaa761d760e72a969d116517eaa12e404c262
-- 
2.30.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
