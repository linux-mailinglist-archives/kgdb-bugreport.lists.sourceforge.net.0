Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 188BF227FAF
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 21 Jul 2020 14:11:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jxr72-0001Lp-SQ
	for lists+kgdb-bugreport@lfdr.de; Tue, 21 Jul 2020 12:11:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jxr71-0001Le-5L
 for kgdb-bugreport@lists.sourceforge.net; Tue, 21 Jul 2020 12:11:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jQ4rDDgYanuVEiD5VSyVtoHbMEWpqen32aI8GMWnA+0=; b=NsZRpFGEiiUEH30je7xs4qOQFE
 6b0HWPrrgRRi5ImKk7d6fIxpRqD/mhMKoZHerdrhzOR0aB9Tw+S43yske4UMYlPepLM63VXLQjoQu
 RvEIDIJ5ffpWrxqidN4ax0pe/rBZwb1Fv94gwY7zPKEmUKieJb92gkPZFA76v8bJtuPU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jQ4rDDgYanuVEiD5VSyVtoHbMEWpqen32aI8GMWnA+0=; b=S6Z0V8evbcF6Wkr26EiaIInGjJ
 aSbeqgwj3hgL1urF0aOydIqDxPnxdWD7oTKcVlDidSYG58TkmJda1kfu0Rg7ZgoL4JCLb6UOm734t
 tReOPfwBvI1y3zN2wA0w8WbdSpHNzqwjofX94sz8kLOR59TLh+bk/rq7v9RVpRAEr7e0=;
Received: from mail-pj1-f68.google.com ([209.85.216.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jxr6v-00C1w5-9p
 for kgdb-bugreport@lists.sourceforge.net; Tue, 21 Jul 2020 12:11:08 +0000
Received: by mail-pj1-f68.google.com with SMTP id a9so1485445pjd.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 21 Jul 2020 05:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=jQ4rDDgYanuVEiD5VSyVtoHbMEWpqen32aI8GMWnA+0=;
 b=BuARnLySFYXHobk+DJzYYbZapFac75rnp2cAzZUyk+Gi1xEuU1EKVS1Y1ft+eSIwcL
 vUQ65Nj4hj0gbP6KuHvpVQ1/mKEqee4c+RYlKvvGEkqecq5lPOYvBC/pKxqWrs/xvNuX
 ConaNJol+yJAMDTJi84K9crZw28bIZdQhev3sLhB3gqdVEqEs55lxbxIv8OArsnDnGfV
 CCpC7mpvvk9RD+YSf+d/FvJn9J02mMZZ+jD96+Ckm7JLj1B7A4Q+80Q9XsJ0Ztb2vljT
 r9PD1tKl8MrmBZAm8XG6xSQLyTNYFft4pqHRY1+16emo3h9Q8zs9U0cfGItOz/xXjY0v
 cfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=jQ4rDDgYanuVEiD5VSyVtoHbMEWpqen32aI8GMWnA+0=;
 b=Cz3SCmQV0Zhqbkiw5yMqB9OfWR9RrGuTZ2Mbn+LQ3w1X+FSHnXFXX1s4oWwAX6dlVY
 +hJXDgry4vYYltFvYaA6shG7v8hq38xEavCY8nbfNJResOH1TYyfad4O6uEQFMtNiFHR
 JPI9zufHbajbjUPUQjYxGl5ASmOy6GI6+5FzGIJUJMxVekmz9nQWLaOj3GDZql8UwFwE
 ULkDOozYE+2/v1CfM4mre9JW/yySxChXwSLw6a7cXEcoC4sxg4uoPuUjyDJzVVNkGky5
 ZSTIzeB4mMdPov0amqNSf7b5dw4/a7nsdovw+m1cjId6PBsDx1VC4ZZo6agQmX/OrAn6
 JhHQ==
X-Gm-Message-State: AOAM532vfW0NOo318Jo4BWoiltOMtfbB+xcOjjUfNKBoL9lJnaMDwjzb
 SZw0OT+fBj317Hncov1sKUw8ZQ==
X-Google-Smtp-Source: ABdhPJwuz8QK1fPNOpZalpAeTbf4LEUS9VjUfrRfr1RCUAvdtOBgLm3oRTOaw/15VbGU7Sm1GM7DZg==
X-Received: by 2002:a17:902:a9c8:: with SMTP id
 b8mr22299780plr.2.1595333459711; 
 Tue, 21 Jul 2020 05:10:59 -0700 (PDT)
Received: from localhost.localdomain ([117.210.211.74])
 by smtp.gmail.com with ESMTPSA id w9sm20601992pfq.178.2020.07.21.05.10.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Jul 2020 05:10:58 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: gregkh@linuxfoundation.org, daniel.thompson@linaro.org,
 dianders@chromium.org, linux-serial@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net
Date: Tue, 21 Jul 2020 17:40:10 +0530
Message-Id: <1595333413-30052-3-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595333413-30052-1-git-send-email-sumit.garg@linaro.org>
References: <1595333413-30052-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.68 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jxr6v-00C1w5-9p
Subject: [Kgdb-bugreport] [RFC 2/5] serial: core: Add framework to allow NMI
 aware serial drivers
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
Cc: jslaby@suse.com, linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
 jason.wessel@windriver.com, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Add NMI framework APIs in serial core which can be leveraged by serial
drivers to have NMI driven serial transfers. These APIs are kept under
CONFIG_CONSOLE_POLL as currently kgdb initializing uart in polling mode
is the only known user to enable NMI driven serial port.

The general idea is to intercept RX characters in NMI context, if those
are specific to magic sysrq then allow corresponding handler to run in
NMI context. Otherwise defer all other RX and TX operations to IRQ work
queue in order to run those in normal interrupt context.

Also, since magic sysrq entry APIs will need to be invoked from NMI
context, so make those APIs NMI safe via deferring NMI unsafe work to
IRQ work queue.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 drivers/tty/serial/serial_core.c | 120 ++++++++++++++++++++++++++++++++++++++-
 include/linux/serial_core.h      |  67 ++++++++++++++++++++++
 2 files changed, 185 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index 57840cf..6342e90 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -3181,8 +3181,14 @@ static bool uart_try_toggle_sysrq(struct uart_port *port, unsigned int ch)
 		return true;
 	}
 
+#ifdef CONFIG_CONSOLE_POLL
+	if (in_nmi())
+		irq_work_queue(&port->nmi_state.sysrq_toggle_work);
+	else
+		schedule_work(&sysrq_enable_work);
+#else
 	schedule_work(&sysrq_enable_work);
-
+#endif
 	port->sysrq = 0;
 	return true;
 }
@@ -3273,12 +3279,122 @@ int uart_handle_break(struct uart_port *port)
 		port->sysrq = 0;
 	}
 
-	if (port->flags & UPF_SAK)
+	if (port->flags & UPF_SAK) {
+#ifdef CONFIG_CONSOLE_POLL
+		if (in_nmi())
+			irq_work_queue(&port->nmi_state.sysrq_sak_work);
+		else
+			do_SAK(state->port.tty);
+#else
 		do_SAK(state->port.tty);
+#endif
+	}
 	return 0;
 }
 EXPORT_SYMBOL_GPL(uart_handle_break);
 
+#ifdef CONFIG_CONSOLE_POLL
+int uart_nmi_handle_char(struct uart_port *port, unsigned int status,
+			 unsigned int overrun, unsigned int ch,
+			 unsigned int flag)
+{
+	struct uart_nmi_rx_data rx_data;
+
+	if (!in_nmi())
+		return 0;
+
+	rx_data.status = status;
+	rx_data.overrun = overrun;
+	rx_data.ch = ch;
+	rx_data.flag = flag;
+
+	if (!kfifo_in(&port->nmi_state.rx_fifo, &rx_data, 1))
+		++port->icount.buf_overrun;
+
+	return 1;
+}
+EXPORT_SYMBOL_GPL(uart_nmi_handle_char);
+
+static void uart_nmi_rx_work(struct irq_work *rx_work)
+{
+	struct uart_nmi_state *nmi_state =
+	    container_of(rx_work, struct uart_nmi_state, rx_work);
+	struct uart_port *port =
+	    container_of(nmi_state, struct uart_port, nmi_state);
+	struct uart_nmi_rx_data rx_data;
+
+	/*
+	 * In polling mode, serial device is initialized much prior to
+	 * TTY port becoming active. This scenario is especially useful
+	 * from debugging perspective such that magic sysrq or debugger
+	 * entry would still be possible even when TTY port isn't
+	 * active (consider a boot hang case or if a user hasn't opened
+	 * the serial port). So we discard any other RX data apart from
+	 * magic sysrq commands in case TTY port isn't active.
+	 */
+	if (!port->state || !tty_port_active(&port->state->port)) {
+		kfifo_reset(&nmi_state->rx_fifo);
+		return;
+	}
+
+	spin_lock(&port->lock);
+	while (kfifo_out(&nmi_state->rx_fifo, &rx_data, 1))
+		uart_insert_char(port, rx_data.status, rx_data.overrun,
+				 rx_data.ch, rx_data.flag);
+	spin_unlock(&port->lock);
+
+	tty_flip_buffer_push(&port->state->port);
+}
+
+static void uart_nmi_tx_work(struct irq_work *tx_work)
+{
+	struct uart_nmi_state *nmi_state =
+	    container_of(tx_work, struct uart_nmi_state, tx_work);
+	struct uart_port *port =
+	    container_of(nmi_state, struct uart_port, nmi_state);
+
+	spin_lock(&port->lock);
+	if (nmi_state->tx_irq_callback)
+		nmi_state->tx_irq_callback(port);
+	spin_unlock(&port->lock);
+}
+
+static void uart_nmi_sak_work(struct irq_work *work)
+{
+	struct uart_nmi_state *nmi_state =
+	    container_of(work, struct uart_nmi_state, sysrq_sak_work);
+	struct uart_port *port =
+	    container_of(nmi_state, struct uart_port, nmi_state);
+
+	do_SAK(port->state->port.tty);
+}
+
+#ifdef CONFIG_MAGIC_SYSRQ_SERIAL
+static void uart_nmi_toggle_work(struct irq_work *work)
+{
+	schedule_work(&sysrq_enable_work);
+}
+#endif
+
+int uart_nmi_state_init(struct uart_port *port)
+{
+	int ret;
+
+	ret = kfifo_alloc(&port->nmi_state.rx_fifo, 256, GFP_KERNEL);
+	if (ret)
+		return ret;
+
+	init_irq_work(&port->nmi_state.rx_work, uart_nmi_rx_work);
+	init_irq_work(&port->nmi_state.tx_work, uart_nmi_tx_work);
+	init_irq_work(&port->nmi_state.sysrq_sak_work, uart_nmi_sak_work);
+#ifdef CONFIG_MAGIC_SYSRQ_SERIAL
+	init_irq_work(&port->nmi_state.sysrq_toggle_work, uart_nmi_toggle_work);
+#endif
+	return ret;
+}
+EXPORT_SYMBOL_GPL(uart_nmi_state_init);
+#endif
+
 EXPORT_SYMBOL(uart_write_wakeup);
 EXPORT_SYMBOL(uart_register_driver);
 EXPORT_SYMBOL(uart_unregister_driver);
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index 9fd550e..84487a9 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -18,6 +18,8 @@
 #include <linux/tty.h>
 #include <linux/mutex.h>
 #include <linux/sysrq.h>
+#include <linux/irq_work.h>
+#include <linux/kfifo.h>
 #include <uapi/linux/serial_core.h>
 
 #ifdef CONFIG_SERIAL_CORE_CONSOLE
@@ -103,6 +105,28 @@ struct uart_icount {
 typedef unsigned int __bitwise upf_t;
 typedef unsigned int __bitwise upstat_t;
 
+#ifdef CONFIG_CONSOLE_POLL
+struct uart_nmi_rx_data {
+	unsigned int		status;
+	unsigned int		overrun;
+	unsigned int		ch;
+	unsigned int		flag;
+};
+
+struct uart_nmi_state {
+	bool			active;
+
+	struct irq_work		tx_work;
+	void			(*tx_irq_callback)(struct uart_port *port);
+
+	struct irq_work		rx_work;
+	DECLARE_KFIFO_PTR(rx_fifo, struct uart_nmi_rx_data);
+
+	struct irq_work		sysrq_sak_work;
+	struct irq_work		sysrq_toggle_work;
+};
+#endif
+
 struct uart_port {
 	spinlock_t		lock;			/* port lock */
 	unsigned long		iobase;			/* in/out[bwl] */
@@ -255,6 +279,9 @@ struct uart_port {
 	struct gpio_desc	*rs485_term_gpio;	/* enable RS485 bus termination */
 	struct serial_iso7816   iso7816;
 	void			*private_data;		/* generic platform data pointer */
+#ifdef CONFIG_CONSOLE_POLL
+	struct uart_nmi_state	nmi_state;
+#endif
 };
 
 static inline int serial_port_in(struct uart_port *up, int offset)
@@ -475,4 +502,44 @@ extern int uart_handle_break(struct uart_port *port);
 					 !((cflag) & CLOCAL))
 
 int uart_get_rs485_mode(struct uart_port *port);
+
+/*
+ * The following are helper functions for the NMI aware serial drivers.
+ * Currently NMI support is only enabled under polling mode.
+ */
+
+#ifdef CONFIG_CONSOLE_POLL
+int uart_nmi_state_init(struct uart_port *port);
+int uart_nmi_handle_char(struct uart_port *port, unsigned int status,
+			 unsigned int overrun, unsigned int ch,
+			 unsigned int flag);
+
+static inline bool uart_nmi_active(struct uart_port *port)
+{
+	return port->nmi_state.active;
+}
+
+static inline void uart_set_nmi_active(struct uart_port *port, bool val)
+{
+	port->nmi_state.active = val;
+}
+#else
+static inline int uart_nmi_handle_char(struct uart_port *port,
+				       unsigned int status,
+				       unsigned int overrun,
+				       unsigned int ch, unsigned int flag)
+{
+	return 0;
+}
+
+static inline bool uart_nmi_active(struct uart_port *port)
+{
+	return false;
+}
+
+static inline void uart_set_nmi_active(struct uart_port *port, bool val)
+{
+}
+#endif
+
 #endif /* LINUX_SERIAL_CORE_H */
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
