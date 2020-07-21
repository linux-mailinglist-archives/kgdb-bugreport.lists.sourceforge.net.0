Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2B3227FB1
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 21 Jul 2020 14:11:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jxr75-0008Ir-He
	for lists+kgdb-bugreport@lfdr.de; Tue, 21 Jul 2020 12:11:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jxr74-0008Hp-L1
 for kgdb-bugreport@lists.sourceforge.net; Tue, 21 Jul 2020 12:11:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OGQRgVBuDs2YGom8JxN4Q6Y+XwAeTFKd4PRQsmAWmzk=; b=ktHc4nbQdoND6PrOXaV/uL+4ea
 NyxcTvIyJCSXoSXrJDtpwoSLmWh/TbI/5S81GCWJyJ0taUZuVzzDFGwAgobn1DtiRmLJSn9AkuEo8
 gu+d9JU8zM8z47Nk8IUIzkigDQ87JJcYkV6MbhgwYbG/aGU57Hx3IOBorng4asSPfrWw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OGQRgVBuDs2YGom8JxN4Q6Y+XwAeTFKd4PRQsmAWmzk=; b=DVdfmd012+NWUYY/TX0M6PXyPP
 m69kQe8M88JZdFlX3+hpKTNygkdQt2cjWG0+Z84lah1cPK0NzaiFGJ6U+XaJys5B5pKTFQRf1gvSn
 0lTIs21LO73/3Gw31kLKgCBAAgQecXtcZt3Qf4mrsVVsn70hTKizj91s9jbRtD0X0EUc=;
Received: from mail-pf1-f195.google.com ([209.85.210.195])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jxr70-00F2GE-UH
 for kgdb-bugreport@lists.sourceforge.net; Tue, 21 Jul 2020 12:11:14 +0000
Received: by mail-pf1-f195.google.com with SMTP id 1so10644414pfn.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 21 Jul 2020 05:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=OGQRgVBuDs2YGom8JxN4Q6Y+XwAeTFKd4PRQsmAWmzk=;
 b=C+YljNqfo+m3jtYr5ucEEoBYZHGPJbJaYid6dRHAr3tg1SE4+PBla45YLdd3dzeAHV
 90eRRECKtqlWsTY5czSJlAD1vbdg7ui2zXs9SHToZ6XnExMoNPkSDk+ML6y5WMAiy/ZD
 mDdVglWsqvth6SRd/6q3aFFQsxwYNgryrerakMMD+NV6wrDxUFLEeKNiqogb/3o2KXkd
 u6VZ1ra+OywG31748fw9BXQkhU0S+LSiBUwohiti/NQQReJsbeDTqHTcaP2NTmtdYEnC
 DTBsy6kLBZAlelpCT8CxjgLWv9tbmZYh7QoBm1TGYKc7xtGEbI5j8iw64L4vOMCRB4rF
 oCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=OGQRgVBuDs2YGom8JxN4Q6Y+XwAeTFKd4PRQsmAWmzk=;
 b=pZfXLT457Ix5pDD0oGiMsQYDKlbEhnPqpzGx/dGFyrttqrFzFegr2XdzuxoXiztvh/
 eHTERGcHr0Z5I3n1PZ/8AREodgDlQGnNrd6qfMARy99+y73esCIYjfc8/DO6N9d/pJXW
 vX5elLU3zDbhLuEUgZjLVhoRaXtSyimxOXmknEziTgq5+ozohQkcHKy2RkRqhrLSf3zl
 ozyQYBI1VE9GSeSOiB8+R7zVAaw6Am27uH8/d7WtzGItal8UGuPKAQ85rV2UxFEYgm5v
 xdNQAMxKtSmoA31dtjqukBmVNP05okvCApaz8hMno4HkuD3BCk4n3t+31nDOklc5R6BK
 EL2Q==
X-Gm-Message-State: AOAM5316eKwo6Rk6O43JjujUgOxLHOFlwWF00gz2xgXKJMCqejbZ2aio
 D7eiz7AotL+TsEeu0tnemyNmgQ==
X-Google-Smtp-Source: ABdhPJwbPLE5qE6oDrg12B+GPfjB19fSVE5EYiyAwJo6+g7xrMU3f6F7QpxgLLkrhSFzZ1GWjG8yLw==
X-Received: by 2002:a63:f254:: with SMTP id d20mr15590929pgk.119.1595333465291; 
 Tue, 21 Jul 2020 05:11:05 -0700 (PDT)
Received: from localhost.localdomain ([117.210.211.74])
 by smtp.gmail.com with ESMTPSA id w9sm20601992pfq.178.2020.07.21.05.11.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Jul 2020 05:11:04 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: gregkh@linuxfoundation.org, daniel.thompson@linaro.org,
 dianders@chromium.org, linux-serial@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net
Date: Tue, 21 Jul 2020 17:40:11 +0530
Message-Id: <1595333413-30052-4-git-send-email-sumit.garg@linaro.org>
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
 trust [209.85.210.195 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.195 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jxr70-00F2GE-UH
Subject: [Kgdb-bugreport] [RFC 3/5] serial: amba-pl011: Re-order APIs
 definition
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

A future patch will need to call pl011_hwinit() and
pl011_enable_interrupts() before they are currently defined. Move
them closer to the front of the file. There is no change in the
implementation of either function.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 drivers/tty/serial/amba-pl011.c | 148 ++++++++++++++++++++--------------------
 1 file changed, 74 insertions(+), 74 deletions(-)

diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index 8efd7c2..0983c5e 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -1581,6 +1581,80 @@ static void pl011_break_ctl(struct uart_port *port, int break_state)
 	spin_unlock_irqrestore(&uap->port.lock, flags);
 }
 
+static int pl011_hwinit(struct uart_port *port)
+{
+	struct uart_amba_port *uap =
+	    container_of(port, struct uart_amba_port, port);
+	int retval;
+
+	/* Optionaly enable pins to be muxed in and configured */
+	pinctrl_pm_select_default_state(port->dev);
+
+	/*
+	 * Try to enable the clock producer.
+	 */
+	retval = clk_prepare_enable(uap->clk);
+	if (retval)
+		return retval;
+
+	uap->port.uartclk = clk_get_rate(uap->clk);
+
+	/* Clear pending error and receive interrupts */
+	pl011_write(UART011_OEIS | UART011_BEIS | UART011_PEIS |
+		    UART011_FEIS | UART011_RTIS | UART011_RXIS,
+		    uap, REG_ICR);
+
+	/*
+	 * Save interrupts enable mask, and enable RX interrupts in case if
+	 * the interrupt is used for NMI entry.
+	 */
+	uap->im = pl011_read(uap, REG_IMSC);
+	pl011_write(UART011_RTIM | UART011_RXIM, uap, REG_IMSC);
+
+	if (dev_get_platdata(uap->port.dev)) {
+		struct amba_pl011_data *plat;
+
+		plat = dev_get_platdata(uap->port.dev);
+		if (plat->init)
+			plat->init();
+	}
+	return 0;
+}
+
+/*
+ * Enable interrupts, only timeouts when using DMA
+ * if initial RX DMA job failed, start in interrupt mode
+ * as well.
+ */
+static void pl011_enable_interrupts(struct uart_amba_port *uap)
+{
+	unsigned int i;
+
+	spin_lock_irq(&uap->port.lock);
+
+	/* Clear out any spuriously appearing RX interrupts */
+	pl011_write(UART011_RTIS | UART011_RXIS, uap, REG_ICR);
+
+	/*
+	 * RXIS is asserted only when the RX FIFO transitions from below
+	 * to above the trigger threshold.  If the RX FIFO is already
+	 * full to the threshold this can't happen and RXIS will now be
+	 * stuck off.  Drain the RX FIFO explicitly to fix this:
+	 */
+	for (i = 0; i < uap->fifosize * 2; ++i) {
+		if (pl011_read(uap, REG_FR) & UART01x_FR_RXFE)
+			break;
+
+		pl011_read(uap, REG_DR);
+	}
+
+	uap->im = UART011_RTIM;
+	if (!pl011_dma_rx_running(uap))
+		uap->im |= UART011_RXIM;
+	pl011_write(uap->im, uap, REG_IMSC);
+	spin_unlock_irq(&uap->port.lock);
+}
+
 #ifdef CONFIG_CONSOLE_POLL
 
 static void pl011_quiesce_irqs(struct uart_port *port)
@@ -1639,46 +1713,6 @@ static void pl011_put_poll_char(struct uart_port *port,
 
 #endif /* CONFIG_CONSOLE_POLL */
 
-static int pl011_hwinit(struct uart_port *port)
-{
-	struct uart_amba_port *uap =
-	    container_of(port, struct uart_amba_port, port);
-	int retval;
-
-	/* Optionaly enable pins to be muxed in and configured */
-	pinctrl_pm_select_default_state(port->dev);
-
-	/*
-	 * Try to enable the clock producer.
-	 */
-	retval = clk_prepare_enable(uap->clk);
-	if (retval)
-		return retval;
-
-	uap->port.uartclk = clk_get_rate(uap->clk);
-
-	/* Clear pending error and receive interrupts */
-	pl011_write(UART011_OEIS | UART011_BEIS | UART011_PEIS |
-		    UART011_FEIS | UART011_RTIS | UART011_RXIS,
-		    uap, REG_ICR);
-
-	/*
-	 * Save interrupts enable mask, and enable RX interrupts in case if
-	 * the interrupt is used for NMI entry.
-	 */
-	uap->im = pl011_read(uap, REG_IMSC);
-	pl011_write(UART011_RTIM | UART011_RXIM, uap, REG_IMSC);
-
-	if (dev_get_platdata(uap->port.dev)) {
-		struct amba_pl011_data *plat;
-
-		plat = dev_get_platdata(uap->port.dev);
-		if (plat->init)
-			plat->init();
-	}
-	return 0;
-}
-
 static bool pl011_split_lcrh(const struct uart_amba_port *uap)
 {
 	return pl011_reg_to_offset(uap, REG_LCRH_RX) !=
@@ -1707,40 +1741,6 @@ static int pl011_allocate_irq(struct uart_amba_port *uap)
 	return request_irq(uap->port.irq, pl011_int, IRQF_SHARED, "uart-pl011", uap);
 }
 
-/*
- * Enable interrupts, only timeouts when using DMA
- * if initial RX DMA job failed, start in interrupt mode
- * as well.
- */
-static void pl011_enable_interrupts(struct uart_amba_port *uap)
-{
-	unsigned int i;
-
-	spin_lock_irq(&uap->port.lock);
-
-	/* Clear out any spuriously appearing RX interrupts */
-	pl011_write(UART011_RTIS | UART011_RXIS, uap, REG_ICR);
-
-	/*
-	 * RXIS is asserted only when the RX FIFO transitions from below
-	 * to above the trigger threshold.  If the RX FIFO is already
-	 * full to the threshold this can't happen and RXIS will now be
-	 * stuck off.  Drain the RX FIFO explicitly to fix this:
-	 */
-	for (i = 0; i < uap->fifosize * 2; ++i) {
-		if (pl011_read(uap, REG_FR) & UART01x_FR_RXFE)
-			break;
-
-		pl011_read(uap, REG_DR);
-	}
-
-	uap->im = UART011_RTIM;
-	if (!pl011_dma_rx_running(uap))
-		uap->im |= UART011_RXIM;
-	pl011_write(uap->im, uap, REG_IMSC);
-	spin_unlock_irq(&uap->port.lock);
-}
-
 static int pl011_startup(struct uart_port *port)
 {
 	struct uart_amba_port *uap =
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
