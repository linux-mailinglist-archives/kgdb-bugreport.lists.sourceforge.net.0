Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2578B20B9FC
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 26 Jun 2020 22:08:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1joudw-0007qO-Uc
	for lists+kgdb-bugreport@lfdr.de; Fri, 26 Jun 2020 20:08:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1joudv-0007qH-Qg
 for kgdb-bugreport@lists.sourceforge.net; Fri, 26 Jun 2020 20:08:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qkv/VxHWefC5lUyKA8n1Hz1OCbBvMseIHHitJ71savo=; b=dU8WavLNnovTHDioUlxXID1X2c
 oPX1S6OGQwnskh+KFu9rdb6BRAFjvuqKOztYbyDBS9iR4btan1myhU3OgJv4QK6ygTS24QOwr4Gf+
 FX0SyBIQYAboX0INspGGkDPSC+xFLpk4bRmcbK7lTz9lbfcnrcOKx8Ces/23fE1LFGTo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qkv/VxHWefC5lUyKA8n1Hz1OCbBvMseIHHitJ71savo=; b=eOJjWuOMjczeL0tc9QuRX1kJg8
 8KeF8/EoWwHCoxH4ed/NG8/xfZL8q/w41Cp57zZkrGxG/D3Ccc+Lyct07zWzIn+Eh1Sq+F3y3/a/S
 OhnQyYMt49yJCz6YJmB0M/Hbbu0toX8mYFb/iUy9KTWCsXybAr0bC96OSvpl99z8NSWA=;
Received: from mail-vs1-f65.google.com ([209.85.217.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1joudu-0024ek-Cj
 for kgdb-bugreport@lists.sourceforge.net; Fri, 26 Jun 2020 20:08:11 +0000
Received: by mail-vs1-f65.google.com with SMTP id o15so6104969vsp.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 26 Jun 2020 13:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qkv/VxHWefC5lUyKA8n1Hz1OCbBvMseIHHitJ71savo=;
 b=kw5llNn/AfTSTCkoBZbQldAVoB9RomIr31RSMH32YULEsUd/dNEtUnbSFK+nyM1761
 BEV9eQxusgef5wIJOXwbx+sxLRWVII1VKSaPsKAIJF9ASgE4Ih4oh0BNdZQXvXehiMXV
 3T+C6f2jWfspnhrfPQDbS0hzt5xWsuBwGlahQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qkv/VxHWefC5lUyKA8n1Hz1OCbBvMseIHHitJ71savo=;
 b=Or7BbM16W/0HN6gVjNv62LN+Qp7NGgeLozaDDVZDOwPr4y7s7/ufnxk7L/FQt9f823
 c34AiSbrEVg1l8q3HfCfllrMuqcv66++f+67JhETBm0EBujDq5BGt3fmsXsqcvNKXuHR
 r4DP8eq6mdA2Z7TcAlkZ0i5RHXClY6mKks6oMBBTLbR920FrbMyQGK620Z78zLOYpr0P
 stVi3PfEpy8tsR3P2xkQVziHhwnp3cEmC34yzHU5LYUdAbBlVA0wfL3Ztwph8krNA94A
 CUYSdlOGIvI4adgT/Z22ueg3J2z6gzPd3To+M3RXmWigVts3y0+cu+6wdQ8Qnd08FTrc
 1nUw==
X-Gm-Message-State: AOAM53057PYnp7EeK0m7zY/PhGPP8N57j8/9ORpJnYlrqsYjjakxEp/q
 y7NxAW4XjSjU2eBexXfmE8+9A2U7SnE=
X-Google-Smtp-Source: ABdhPJzuo5CGUj0KWrNvbLBx8x80yd0S+PRmolL/V/IiPvTaFV87C8WlpLw6Fq1U4qD3FnOzB8470A==
X-Received: by 2002:a17:902:7109:: with SMTP id
 a9mr4105159pll.58.1593201659045; 
 Fri, 26 Jun 2020 13:00:59 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id p8sm23461610pgs.29.2020.06.26.13.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 13:00:58 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: gregkh@linuxfoundation.org
Date: Fri, 26 Jun 2020 13:00:33 -0700
Message-Id: <20200626125844.2.Iabd56347670b9e4e916422773aba5b27943d19ee@changeid>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
In-Reply-To: <20200626200033.1528052-1-dianders@chromium.org>
References: <20200626200033.1528052-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.65 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.65 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1joudu-0024ek-Cj
Subject: [Kgdb-bugreport] [PATCH 2/2] serial: qcom_geni_serial: Always use 4
 bytes per TX FIFO word
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

The geni serial driver had a rule that we'd only use 1 byte per FIFO
word for the TX FIFO if we were being used for the serial console.
This is ugly and a bit of a pain.  It's not too hard to fix, so fix
it.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/tty/serial/qcom_geni_serial.c | 57 +++++++++++++++++----------
 1 file changed, 37 insertions(+), 20 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 4610e391e886..583d903321b5 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -103,12 +103,18 @@
 #define DEFAULT_IO_MACRO_IO2_IO3_MASK		GENMASK(15, 4)
 #define IO_MACRO_IO2_IO3_SWAP		0x4640
 
+/* We always configure 4 bytes per FIFO word */
+#define BYTES_PER_FIFO_WORD		4
+
 struct qcom_geni_private_data {
 	/* NOTE: earlycon port will have NULL here */
 	struct uart_driver *drv;
 
 	u32 poll_cached_bytes;
 	unsigned int poll_cached_bytes_cnt;
+
+	u32 write_cached_bytes;
+	unsigned int write_cached_bytes_cnt;
 };
 
 struct qcom_geni_serial_port {
@@ -121,8 +127,6 @@ struct qcom_geni_serial_port {
 	bool setup;
 	int (*handle_rx)(struct uart_port *uport, u32 bytes, bool drop);
 	unsigned int baud;
-	unsigned int tx_bytes_pw;
-	unsigned int rx_bytes_pw;
 	void *rx_fifo;
 	u32 loopback;
 	bool brk;
@@ -390,13 +394,25 @@ static void qcom_geni_serial_poll_put_char(struct uart_port *uport,
 #ifdef CONFIG_SERIAL_QCOM_GENI_CONSOLE
 static void qcom_geni_serial_wr_char(struct uart_port *uport, int ch)
 {
-	writel(ch, uport->membase + SE_GENI_TX_FIFOn);
+	struct qcom_geni_private_data *private_data = uport->private_data;
+
+	private_data->write_cached_bytes =
+		(private_data->write_cached_bytes >> 8) | (ch << 24);
+	private_data->write_cached_bytes_cnt++;
+
+	if (private_data->write_cached_bytes_cnt == BYTES_PER_FIFO_WORD) {
+		writel(private_data->write_cached_bytes,
+		       uport->membase + SE_GENI_TX_FIFOn);
+		private_data->write_cached_bytes_cnt = 0;
+	}
 }
 
 static void
 __qcom_geni_serial_console_write(struct uart_port *uport, const char *s,
 				 unsigned int count)
 {
+	struct qcom_geni_private_data *private_data = uport->private_data;
+
 	int i;
 	u32 bytes_to_send = count;
 
@@ -431,6 +447,15 @@ __qcom_geni_serial_console_write(struct uart_port *uport, const char *s,
 							SE_GENI_M_IRQ_CLEAR);
 		i += chars_to_write;
 	}
+
+	if (private_data->write_cached_bytes_cnt) {
+		private_data->write_cached_bytes >>= BITS_PER_BYTE *
+			(BYTES_PER_FIFO_WORD - private_data->write_cached_bytes_cnt);
+		writel(private_data->write_cached_bytes,
+		       uport->membase + SE_GENI_TX_FIFOn);
+		private_data->write_cached_bytes_cnt = 0;
+	}
+
 	qcom_geni_serial_poll_tx_done(uport);
 }
 
@@ -503,7 +528,7 @@ static int handle_rx_console(struct uart_port *uport, u32 bytes, bool drop)
 	tport = &uport->state->port;
 	for (i = 0; i < bytes; ) {
 		int c;
-		int chunk = min_t(int, bytes - i, port->rx_bytes_pw);
+		int chunk = min_t(int, bytes - i, BYTES_PER_FIFO_WORD);
 
 		ioread32_rep(uport->membase + SE_GENI_RX_FIFOn, buf, 1);
 		i += chunk;
@@ -683,11 +708,11 @@ static void qcom_geni_serial_handle_rx(struct uart_port *uport, bool drop)
 
 	if (!word_cnt)
 		return;
-	total_bytes = port->rx_bytes_pw * (word_cnt - 1);
+	total_bytes = BYTES_PER_FIFO_WORD * (word_cnt - 1);
 	if (last_word_partial && last_word_byte_cnt)
 		total_bytes += last_word_byte_cnt;
 	else
-		total_bytes += port->rx_bytes_pw;
+		total_bytes += BYTES_PER_FIFO_WORD;
 	port->handle_rx(uport, total_bytes, drop);
 }
 
@@ -720,7 +745,7 @@ static void qcom_geni_serial_handle_tx(struct uart_port *uport, bool done,
 	}
 
 	avail = port->tx_fifo_depth - (status & TX_FIFO_WC);
-	avail *= port->tx_bytes_pw;
+	avail *= BYTES_PER_FIFO_WORD;
 
 	tail = xmit->tail;
 	chunk = min(avail, pending);
@@ -744,7 +769,7 @@ static void qcom_geni_serial_handle_tx(struct uart_port *uport, bool done,
 		int c;
 
 		memset(buf, 0, ARRAY_SIZE(buf));
-		tx_bytes = min_t(size_t, remaining, port->tx_bytes_pw);
+		tx_bytes = min_t(size_t, remaining, BYTES_PER_FIFO_WORD);
 
 		for (c = 0; c < tx_bytes ; c++) {
 			buf[c] = xmit->buf[tail++];
@@ -861,12 +886,6 @@ static int qcom_geni_serial_port_setup(struct uart_port *uport)
 	u32 proto;
 	u32 pin_swap;
 
-	if (uart_console(uport))
-		port->tx_bytes_pw = 1;
-	else
-		port->tx_bytes_pw = 4;
-	port->rx_bytes_pw = 4;
-
 	proto = geni_se_read_proto(&port->se);
 	if (proto != GENI_SE_UART) {
 		dev_err(uport->dev, "Invalid FW loaded, proto: %d\n", proto);
@@ -898,10 +917,8 @@ static int qcom_geni_serial_port_setup(struct uart_port *uport)
 	 */
 	if (uart_console(uport))
 		qcom_geni_serial_poll_tx_done(uport);
-	geni_se_config_packing(&port->se, BITS_PER_BYTE, port->tx_bytes_pw,
-						false, true, false);
-	geni_se_config_packing(&port->se, BITS_PER_BYTE, port->rx_bytes_pw,
-						false, false, true);
+	geni_se_config_packing(&port->se, BITS_PER_BYTE, BYTES_PER_FIFO_WORD,
+			       false, true, true);
 	geni_se_init(&port->se, UART_RX_WM, port->rx_fifo_depth - 2);
 	geni_se_select_mode(&port->se, GENI_SE_FIFO);
 	port->setup = true;
@@ -1197,8 +1214,8 @@ static int __init qcom_geni_serial_earlycon_setup(struct earlycon_device *dev,
 	 */
 	qcom_geni_serial_poll_tx_done(uport);
 	qcom_geni_serial_abort_rx(uport);
-	geni_se_config_packing(&se, BITS_PER_BYTE, 1, false, true, false);
-	geni_se_config_packing(&se, BITS_PER_BYTE, 4, false, false, true);
+	geni_se_config_packing(&se, BITS_PER_BYTE, BYTES_PER_FIFO_WORD,
+			       false, true, true);
 	geni_se_init(&se, DEF_FIFO_DEPTH_WORDS / 2, DEF_FIFO_DEPTH_WORDS - 2);
 	geni_se_select_mode(&se, GENI_SE_FIFO);
 
-- 
2.27.0.212.ge8ba1cc988-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
