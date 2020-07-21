Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 272E6227FB4
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 21 Jul 2020 14:11:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jxr7B-0001Mh-UW
	for lists+kgdb-bugreport@lfdr.de; Tue, 21 Jul 2020 12:11:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jxr78-0001MT-PB
 for kgdb-bugreport@lists.sourceforge.net; Tue, 21 Jul 2020 12:11:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2zOkNlooR1zcsl5ai3d/r17122nHEKv/dFvwHU/KZrA=; b=ckgxMYFWdcU1dGxZhsxrEpvpVP
 ZTy2GLeLhdiXv7uz25XItxpblNhp2Jcb/LGNFT7wLOueb13kymuL0J36dLHGnArvPKOrlynmNynqA
 cgLTtGdbfo0WtfyicG3Hw0+tEjzqLoyhSKCJeXiTb9NSpw1tLXDSDh0wSRE/b3qSOkD4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2zOkNlooR1zcsl5ai3d/r17122nHEKv/dFvwHU/KZrA=; b=GOhzIkKcpGeS92Gg0tALJA2+K/
 60xM/599QR2S9BJurAbW+R3dIt9yQODMpbWB0gpca1BPTCZs0mKfBHinFQIkJGjOC6U5NvlzNGiMt
 zoDb8PdTfbYjFU1LMj8BrarksU/qLJ6DTMZukkjURhykmQC4La9RuZfHp/B8tuZz3nr8=;
Received: from mail-pg1-f193.google.com ([209.85.215.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jxr76-002yQF-Q9
 for kgdb-bugreport@lists.sourceforge.net; Tue, 21 Jul 2020 12:11:18 +0000
Received: by mail-pg1-f193.google.com with SMTP id g67so11854997pgc.8
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 21 Jul 2020 05:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2zOkNlooR1zcsl5ai3d/r17122nHEKv/dFvwHU/KZrA=;
 b=qCxiWVCIYBZyxLsMeE0w7kCkNJoBZ7QRMGqB8iz9+cZylR3Kxiuii46cbejMIY5/Np
 ZPzpH/PyZvdzSoaoO7jzVg7fQcXnSQx4/lfSr/0aek5vJ/moI57rKq5+4cqL+06Q6siA
 ziJkw20K+BOosurBJ8w5GtJj6skjC3rNixycBb+zVpuP1yXWrvoEsRM3SArliy201rSc
 Kmlz87fkvx+pqm6TXR7sILSVPWtN5AMhcvfyLkpHxVnnib/39NDu7LBfAoHjxHNspceS
 kmhG+kH5t7cmNe14hfKOHg7LeuJT4Q0m0CwyhqWLQqnc3T6DfETzD4UG11CpF2kCND1/
 Dc5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2zOkNlooR1zcsl5ai3d/r17122nHEKv/dFvwHU/KZrA=;
 b=Y/8t6lDPO0CVW4XBEBMPrHO9t3DqcvxWMMk4mZEbQeHM8+4owSGmBbQ1VPLaf0enG0
 9m72q2AfUl/S/YHqTnN7uo2jcSkE3KhT2euiA/FazA7e8cQBOGfZtM82qkrfKlbo5Pay
 B2RQoR+yFSilR+shL/HOJmJFyQZmtXrFEWiWjX93Lawspru3p7Kh26Ij2p0VYl0WWFMz
 QwE5qDIiv9geYOOKYeFpu4pouA7mC8ua9lNgmXZ1T8/+hMO90K6NL42aKhOk2NgeIR4A
 yKS9C9bLqSvppjSNOuyjfpdFjUHVgKlvMlN3q2YYLO7LP45dcRKo0BkuzQ10IUaTRaZb
 zIOw==
X-Gm-Message-State: AOAM532/CcspOQwHO2E6agwsxS+2Tl2/m47XWlieXdOjtin6Fy6YJ146
 VrCkMufnVBJmFrW7Oehj724Y0Q==
X-Google-Smtp-Source: ABdhPJwKUmsn6lRMXYTYzTogmHp0PD64aIq6+1XW2ha8ClQcPj9F4Yp1/qWxe7LuhU7j6OSsyTNzkg==
X-Received: by 2002:a05:6a00:2292:: with SMTP id
 f18mr24239679pfe.192.1595333471193; 
 Tue, 21 Jul 2020 05:11:11 -0700 (PDT)
Received: from localhost.localdomain ([117.210.211.74])
 by smtp.gmail.com with ESMTPSA id w9sm20601992pfq.178.2020.07.21.05.11.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Jul 2020 05:11:10 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: gregkh@linuxfoundation.org, daniel.thompson@linaro.org,
 dianders@chromium.org, linux-serial@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net
Date: Tue, 21 Jul 2020 17:40:12 +0530
Message-Id: <1595333413-30052-5-git-send-email-sumit.garg@linaro.org>
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
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.193 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jxr76-002yQF-Q9
Subject: [Kgdb-bugreport] [RFC 4/5] serial: amba-pl011: Enable NMI aware
 uart port
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

Allow serial device interrupt to be requested as an NMI during
initialization in polling mode. If the irqchip doesn't support serial
device interrupt as an NMI then fallback to it being as a normal IRQ.

Currently this NMI aware uart port only supports NMI driven programmed
IO operation whereas DMA operation isn't supported.

And while operating in NMI mode, RX always remains active irrespective
of whether corresponding TTY port is active or not. So we directly bail
out of startup, shutdown and rx_stop APIs if NMI mode is active.

Also, get rid of modification to interrupts enable mask in pl011_hwinit()
as now we have a proper way to enable interrupts for NMI entry using
pl011_enable_interrupts().

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 drivers/tty/serial/amba-pl011.c | 124 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 113 insertions(+), 11 deletions(-)

diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index 0983c5e..5df1c07 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -41,6 +41,8 @@
 #include <linux/sizes.h>
 #include <linux/io.h>
 #include <linux/acpi.h>
+#include <linux/irq.h>
+#include <linux/irqdesc.h>
 
 #include "amba-pl011.h"
 
@@ -347,6 +349,10 @@ static int pl011_fifo_to_tty(struct uart_amba_port *uap)
 		if (uart_handle_sysrq_char(&uap->port, ch & 255))
 			continue;
 
+		if (uart_nmi_handle_char(&uap->port, ch, UART011_DR_OE, ch,
+					 flag))
+			continue;
+
 		uart_insert_char(&uap->port, ch, UART011_DR_OE, ch, flag);
 	}
 
@@ -1316,6 +1322,9 @@ static void pl011_stop_rx(struct uart_port *port)
 	struct uart_amba_port *uap =
 	    container_of(port, struct uart_amba_port, port);
 
+	if (uart_nmi_active(port))
+		return;
+
 	uap->im &= ~(UART011_RXIM|UART011_RTIM|UART011_FEIM|
 		     UART011_PEIM|UART011_BEIM|UART011_OEIM);
 	pl011_write(uap->im, uap, REG_IMSC);
@@ -1604,13 +1613,6 @@ static int pl011_hwinit(struct uart_port *port)
 		    UART011_FEIS | UART011_RTIS | UART011_RXIS,
 		    uap, REG_ICR);
 
-	/*
-	 * Save interrupts enable mask, and enable RX interrupts in case if
-	 * the interrupt is used for NMI entry.
-	 */
-	uap->im = pl011_read(uap, REG_IMSC);
-	pl011_write(UART011_RTIM | UART011_RXIM, uap, REG_IMSC);
-
 	if (dev_get_platdata(uap->port.dev)) {
 		struct amba_pl011_data *plat;
 
@@ -1711,6 +1713,96 @@ static void pl011_put_poll_char(struct uart_port *port,
 	pl011_write(ch, uap, REG_DR);
 }
 
+static irqreturn_t pl011_nmi_int(int irq, void *dev_id)
+{
+	struct uart_amba_port *uap = dev_id;
+	unsigned int status, pass_counter = AMBA_ISR_PASS_LIMIT;
+	int handled = 0;
+
+	status = pl011_read(uap, REG_MIS);
+	if (status) {
+		do {
+			check_apply_cts_event_workaround(uap);
+
+			pl011_write(status, uap, REG_ICR);
+
+			if (status & (UART011_RTIS|UART011_RXIS)) {
+				pl011_fifo_to_tty(uap);
+				irq_work_queue(&uap->port.nmi_state.rx_work);
+			}
+
+			if (status & UART011_TXIS)
+				irq_work_queue(&uap->port.nmi_state.tx_work);
+
+			if (pass_counter-- == 0)
+				break;
+
+			status = pl011_read(uap, REG_MIS);
+		} while (status != 0);
+		handled = 1;
+	}
+
+	return IRQ_RETVAL(handled);
+}
+
+static int pl011_allocate_nmi(struct uart_amba_port *uap)
+{
+	int ret;
+
+	irq_set_status_flags(uap->port.irq, IRQ_NOAUTOEN);
+	ret = request_nmi(uap->port.irq, pl011_nmi_int, IRQF_PERCPU,
+			  "uart-pl011", uap);
+	if (ret) {
+		irq_clear_status_flags(uap->port.irq, IRQ_NOAUTOEN);
+		return ret;
+	}
+
+	enable_irq(uap->port.irq);
+
+	return ret;
+}
+
+static void pl011_tx_irq_callback(struct uart_port *port)
+{
+	struct uart_amba_port *uap =
+	    container_of(port, struct uart_amba_port, port);
+
+	spin_lock(&port->lock);
+	pl011_tx_chars(uap, true);
+	spin_unlock(&port->lock);
+}
+
+static int pl011_poll_init(struct uart_port *port)
+{
+	struct uart_amba_port *uap =
+	    container_of(port, struct uart_amba_port, port);
+	int retval;
+
+	retval = pl011_hwinit(port);
+	if (retval)
+		goto clk_dis;
+
+	/* In case NMI isn't supported, fallback to normal interrupt mode */
+	retval = pl011_allocate_nmi(uap);
+	if (retval)
+		return 0;
+
+	retval = uart_nmi_state_init(port);
+	if (retval)
+		goto clk_dis;
+
+	port->nmi_state.tx_irq_callback = pl011_tx_irq_callback;
+	uart_set_nmi_active(port, true);
+
+	pl011_enable_interrupts(uap);
+
+	return 0;
+
+ clk_dis:
+	clk_disable_unprepare(uap->clk);
+	return retval;
+}
+
 #endif /* CONFIG_CONSOLE_POLL */
 
 static bool pl011_split_lcrh(const struct uart_amba_port *uap)
@@ -1736,8 +1828,6 @@ static void pl011_write_lcr_h(struct uart_amba_port *uap, unsigned int lcr_h)
 
 static int pl011_allocate_irq(struct uart_amba_port *uap)
 {
-	pl011_write(uap->im, uap, REG_IMSC);
-
 	return request_irq(uap->port.irq, pl011_int, IRQF_SHARED, "uart-pl011", uap);
 }
 
@@ -1748,6 +1838,9 @@ static int pl011_startup(struct uart_port *port)
 	unsigned int cr;
 	int retval;
 
+	if (uart_nmi_active(port))
+		return 0;
+
 	retval = pl011_hwinit(port);
 	if (retval)
 		goto clk_dis;
@@ -1790,6 +1883,9 @@ static int sbsa_uart_startup(struct uart_port *port)
 		container_of(port, struct uart_amba_port, port);
 	int retval;
 
+	if (uart_nmi_active(port))
+		return 0;
+
 	retval = pl011_hwinit(port);
 	if (retval)
 		return retval;
@@ -1859,6 +1955,9 @@ static void pl011_shutdown(struct uart_port *port)
 	struct uart_amba_port *uap =
 		container_of(port, struct uart_amba_port, port);
 
+	if (uart_nmi_active(port))
+		return;
+
 	pl011_disable_interrupts(uap);
 
 	pl011_dma_shutdown(uap);
@@ -1891,6 +1990,9 @@ static void sbsa_uart_shutdown(struct uart_port *port)
 	struct uart_amba_port *uap =
 		container_of(port, struct uart_amba_port, port);
 
+	if (uart_nmi_active(port))
+		return;
+
 	pl011_disable_interrupts(uap);
 
 	free_irq(uap->port.irq, uap);
@@ -2142,7 +2244,7 @@ static const struct uart_ops amba_pl011_pops = {
 	.config_port	= pl011_config_port,
 	.verify_port	= pl011_verify_port,
 #ifdef CONFIG_CONSOLE_POLL
-	.poll_init     = pl011_hwinit,
+	.poll_init     = pl011_poll_init,
 	.poll_get_char = pl011_get_poll_char,
 	.poll_put_char = pl011_put_poll_char,
 #endif
@@ -2173,7 +2275,7 @@ static const struct uart_ops sbsa_uart_pops = {
 	.config_port	= pl011_config_port,
 	.verify_port	= pl011_verify_port,
 #ifdef CONFIG_CONSOLE_POLL
-	.poll_init     = pl011_hwinit,
+	.poll_init     = pl011_poll_init,
 	.poll_get_char = pl011_get_poll_char,
 	.poll_put_char = pl011_put_poll_char,
 #endif
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
