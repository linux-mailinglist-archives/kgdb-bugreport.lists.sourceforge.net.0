Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D39D120BA4C
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 26 Jun 2020 22:26:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jouvD-0000CR-Ld
	for lists+kgdb-bugreport@lfdr.de; Fri, 26 Jun 2020 20:26:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jouvD-0000CE-3b
 for kgdb-bugreport@lists.sourceforge.net; Fri, 26 Jun 2020 20:26:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nh/XMISnZwDUDVXykpPDZDWs7ITXF0m9DBs4KaFX09A=; b=YF09PKW9S8vawEjE2sQeyakUWJ
 HPS1XEyS+UIbJc7R+aaZZHmSjaikwi8nYYC2SGGWySec0TIJ6Pf2Ke+zsFehr+LlM7Ls7JSOjk8Th
 Pjux0h+whVHEB2NAX8IY8NMDKqvmShKLPPq9pnS4QpFuIUc8Z7zwaIwoHr4/3KLr3BYk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nh/XMISnZwDUDVXykpPDZDWs7ITXF0m9DBs4KaFX09A=; b=egzUm6RCaFiMojsbK27j3TDqim
 G1vCWdtaf95M8tNaiTNg55dFcFXU8rLnvHaXM9/BWfN1i8iIqGruxvOqxDJyA9BJeVnVzn6Xq5hMN
 AQzo04luoJ5pRkzNRRajDTckDtdtHA741silh4p5isgl5sXI7FfJswjfk5yZ1JFWJ+HM=;
Received: from mail-pf1-f195.google.com ([209.85.210.195])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jouvB-00Ghys-L5
 for kgdb-bugreport@lists.sourceforge.net; Fri, 26 Jun 2020 20:26:03 +0000
Received: by mail-pf1-f195.google.com with SMTP id 207so4908793pfu.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 26 Jun 2020 13:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nh/XMISnZwDUDVXykpPDZDWs7ITXF0m9DBs4KaFX09A=;
 b=blr2vXq07pMiMpEXRhLhu+veBjLT//1bnvT8npipodFtn0Z6uPj8HmO/6UoX8oPvPH
 HLQx7bso85UrhJNWDdF7tNnrvWZc9C3K0HqBEAJIk8adocqPBvrISinmFN7EPlvNpS0V
 JmaKEx8AhyrH04GP63juV+XIap5e3PVCSeiyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nh/XMISnZwDUDVXykpPDZDWs7ITXF0m9DBs4KaFX09A=;
 b=PyK34kGIya6n6C5iSmjuzsWltBqjOTUQZ4dtfxyHVPxNMLy8Lob4B8tB/p4itOsN9r
 IvdE4DNWecTABMCm6QG1EQfHgFqwLNq1ac8eWQTWYYwTjLLl5yKJJSQycIVwruX2SLvx
 9Dq05HpJTnDQX3s9jM9gI3j4vsBvpbZ1nlKlwbUgHP2fJUUsexpfNwn/7pYvk6iMh1pd
 NeU0Vazpz6G3MxEVaqgUwS9inynwdgVs5WgRwK4Oyu8wEOanYg3nq2Ojc89T3BOKjeg6
 3Vxw0i4wk0szAHfxzFct0suiYdu4aPhSRNhjThStf9da1qw32M1Jv3OkQnPksVdxBMzb
 jTpQ==
X-Gm-Message-State: AOAM531vv48ssV48RVIBD9KLQnOmnFXCnDZ5B0StuAmY2Ghl3o8FCFQt
 AY+0TAWaVGmc3tAwe1y/30ehzBfTDog=
X-Google-Smtp-Source: ABdhPJwlCaDddLvCMDFr3TmO1d0wxD7LNzMMAVuhsc9eBDQSRZK95Sq9iHrZHpgzWFh9b4iQtpIyFQ==
X-Received: by 2002:a17:902:7603:: with SMTP id
 k3mr3902976pll.178.1593201657303; 
 Fri, 26 Jun 2020 13:00:57 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id p8sm23461610pgs.29.2020.06.26.13.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 13:00:56 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: gregkh@linuxfoundation.org
Date: Fri, 26 Jun 2020 13:00:32 -0700
Message-Id: <20200626125844.1.I8546ecb6c5beb054f70c5302d1a7293484212cd1@changeid>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
In-Reply-To: <20200626200033.1528052-1-dianders@chromium.org>
References: <20200626200033.1528052-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.195 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jouvB-00Ghys-L5
Subject: [Kgdb-bugreport] [PATCH 1/2] serial: qcom_geni_serial: Make kgdb
 work even if UART isn't console
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
Cc: daniel.thompson@linaro.org, linux-serial@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, Jiri Slaby <jslaby@suse.com>,
 evgreen@chromium.org, swboyd@chromium.org, akashast@codeaurora.org,
 Andy Gross <agross@kernel.org>, vivek.gautam@codeaurora.org,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

The geni serial driver had the rather sketchy hack in it where it
would adjust the number of bytes per RX FIFO word from 4 down to 1 if
it detected that CONFIG_CONSOLE_POLL was enabled (for kgdb) and this
was a console port (defined by the kernel directing output to this
port via the "console=" command line argument).

The problem with that sketchy hack is that it's possible to run kgdb
over a serial port even if it isn't used for console.

Let's avoid the hack by simply handling the 4-bytes-per-FIFO word case
for kdb.  We'll have to have a (very small) cache but that should be
fine.

A nice side effect of this patch is that an agetty (or similar)
running on this port is less likely to drop characters.  We'll
have roughly 4 times the RX FIFO depth than we used to now.

NOTE: the character cache here isn't shared between the polling API
and the non-polling API.  That means that, technically, the polling
API could eat a few extra bytes.  This doesn't seem to pose a huge
problem in reality because we'll only get several characters per FIFO
word if those characters are all received at nearly the same time and
we don't really expect non-kgdb characters to be sent to the same port
as kgdb at the exact same time we're exiting kgdb.

ALSO NOTE: we still have the sketchy hack for setting the number of
bytes per TX FIFO word in place, but that one is less bad.  kgdb
doesn't have any problem with this because it always just sends 1 byte
at a time and waits for it to finish.  The TX FIFO hack is only really
needed for console output.  In any case, a future patch will remove
that hack, too.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/tty/serial/qcom_geni_serial.c | 80 ++++++++++++++++++---------
 1 file changed, 55 insertions(+), 25 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 0300867eab7a..4610e391e886 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -103,11 +103,13 @@
 #define DEFAULT_IO_MACRO_IO2_IO3_MASK		GENMASK(15, 4)
 #define IO_MACRO_IO2_IO3_SWAP		0x4640
 
-#ifdef CONFIG_CONSOLE_POLL
-#define CONSOLE_RX_BYTES_PW 1
-#else
-#define CONSOLE_RX_BYTES_PW 4
-#endif
+struct qcom_geni_private_data {
+	/* NOTE: earlycon port will have NULL here */
+	struct uart_driver *drv;
+
+	u32 poll_cached_bytes;
+	unsigned int poll_cached_bytes_cnt;
+};
 
 struct qcom_geni_serial_port {
 	struct uart_port uport;
@@ -129,6 +131,8 @@ struct qcom_geni_serial_port {
 	int wakeup_irq;
 	bool rx_tx_swap;
 	bool cts_rts_swap;
+
+	struct qcom_geni_private_data private_data;
 };
 
 static const struct uart_ops qcom_geni_console_pops;
@@ -264,8 +268,9 @@ static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
 	unsigned int baud;
 	unsigned int fifo_bits;
 	unsigned long timeout_us = 20000;
+	struct qcom_geni_private_data *private_data = uport->private_data;
 
-	if (uport->private_data) {
+	if (private_data->drv) {
 		port = to_dev_port(uport, uport);
 		baud = port->baud;
 		if (!baud)
@@ -331,23 +336,42 @@ static void qcom_geni_serial_abort_rx(struct uart_port *uport)
 }
 
 #ifdef CONFIG_CONSOLE_POLL
+
 static int qcom_geni_serial_get_char(struct uart_port *uport)
 {
-	u32 rx_fifo;
+	struct qcom_geni_private_data *private_data = uport->private_data;
 	u32 status;
+	u32 word_cnt;
+	int ret;
+
+	if (!private_data->poll_cached_bytes_cnt) {
+		status = readl(uport->membase + SE_GENI_M_IRQ_STATUS);
+		writel(status, uport->membase + SE_GENI_M_IRQ_CLEAR);
 
-	status = readl(uport->membase + SE_GENI_M_IRQ_STATUS);
-	writel(status, uport->membase + SE_GENI_M_IRQ_CLEAR);
+		status = readl(uport->membase + SE_GENI_S_IRQ_STATUS);
+		writel(status, uport->membase + SE_GENI_S_IRQ_CLEAR);
 
-	status = readl(uport->membase + SE_GENI_S_IRQ_STATUS);
-	writel(status, uport->membase + SE_GENI_S_IRQ_CLEAR);
+		status = readl(uport->membase + SE_GENI_RX_FIFO_STATUS);
+		word_cnt = status & RX_FIFO_WC_MSK;
+		if (!word_cnt)
+			return NO_POLL_CHAR;
 
-	status = readl(uport->membase + SE_GENI_RX_FIFO_STATUS);
-	if (!(status & RX_FIFO_WC_MSK))
-		return NO_POLL_CHAR;
+		if (word_cnt == 1 && (status & RX_LAST))
+			private_data->poll_cached_bytes_cnt =
+				(status & RX_LAST_BYTE_VALID_MSK) >>
+				RX_LAST_BYTE_VALID_SHFT;
+		else
+			private_data->poll_cached_bytes_cnt = 4;
 
-	rx_fifo = readl(uport->membase + SE_GENI_RX_FIFOn);
-	return rx_fifo & 0xff;
+		private_data->poll_cached_bytes =
+			readl(uport->membase + SE_GENI_RX_FIFOn);
+	}
+
+	private_data->poll_cached_bytes_cnt--;
+	ret = private_data->poll_cached_bytes & 0xff;
+	private_data->poll_cached_bytes >>= 8;
+
+	return ret;
 }
 
 static void qcom_geni_serial_poll_put_char(struct uart_port *uport,
@@ -837,13 +861,11 @@ static int qcom_geni_serial_port_setup(struct uart_port *uport)
 	u32 proto;
 	u32 pin_swap;
 
-	if (uart_console(uport)) {
+	if (uart_console(uport))
 		port->tx_bytes_pw = 1;
-		port->rx_bytes_pw = CONSOLE_RX_BYTES_PW;
-	} else {
+	else
 		port->tx_bytes_pw = 4;
-		port->rx_bytes_pw = 4;
-	}
+	port->rx_bytes_pw = 4;
 
 	proto = geni_se_read_proto(&port->se);
 	if (proto != GENI_SE_UART) {
@@ -1139,6 +1161,8 @@ static int qcom_geni_serial_earlycon_exit(struct console *con)
 	return 0;
 }
 
+static struct qcom_geni_private_data earlycon_private_data;
+
 static int __init qcom_geni_serial_earlycon_setup(struct earlycon_device *dev,
 								const char *opt)
 {
@@ -1154,6 +1178,8 @@ static int __init qcom_geni_serial_earlycon_setup(struct earlycon_device *dev,
 	if (!uport->membase)
 		return -EINVAL;
 
+	uport->private_data = &earlycon_private_data;
+
 	memset(&se, 0, sizeof(se));
 	se.base = uport->membase;
 	if (geni_se_read_proto(&se) != GENI_SE_UART)
@@ -1172,6 +1198,7 @@ static int __init qcom_geni_serial_earlycon_setup(struct earlycon_device *dev,
 	qcom_geni_serial_poll_tx_done(uport);
 	qcom_geni_serial_abort_rx(uport);
 	geni_se_config_packing(&se, BITS_PER_BYTE, 1, false, true, false);
+	geni_se_config_packing(&se, BITS_PER_BYTE, 4, false, false, true);
 	geni_se_init(&se, DEF_FIFO_DEPTH_WORDS / 2, DEF_FIFO_DEPTH_WORDS - 2);
 	geni_se_select_mode(&se, GENI_SE_FIFO);
 
@@ -1396,7 +1423,8 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	uport->private_data = drv;
+	port->private_data.drv = drv;
+	uport->private_data = &port->private_data;
 	platform_set_drvdata(pdev, port);
 	port->handle_rx = console ? handle_rx_console : handle_rx_uart;
 
@@ -1442,7 +1470,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 static int qcom_geni_serial_remove(struct platform_device *pdev)
 {
 	struct qcom_geni_serial_port *port = platform_get_drvdata(pdev);
-	struct uart_driver *drv = port->uport.private_data;
+	struct uart_driver *drv = port->private_data.drv;
 
 	if (port->se.has_opp_table)
 		dev_pm_opp_of_remove_table(&pdev->dev);
@@ -1458,16 +1486,18 @@ static int __maybe_unused qcom_geni_serial_sys_suspend(struct device *dev)
 {
 	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
 	struct uart_port *uport = &port->uport;
+	struct qcom_geni_private_data *private_data = uport->private_data;
 
-	return uart_suspend_port(uport->private_data, uport);
+	return uart_suspend_port(private_data->drv, uport);
 }
 
 static int __maybe_unused qcom_geni_serial_sys_resume(struct device *dev)
 {
 	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
 	struct uart_port *uport = &port->uport;
+	struct qcom_geni_private_data *private_data = uport->private_data;
 
-	return uart_resume_port(uport->private_data, uport);
+	return uart_resume_port(private_data->drv, uport);
 }
 
 static const struct dev_pm_ops qcom_geni_serial_pm_ops = {
-- 
2.27.0.212.ge8ba1cc988-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
