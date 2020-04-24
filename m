Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB591B714B
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 24 Apr 2020 11:56:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jRv4i-0003tB-Ph
	for lists+kgdb-bugreport@lfdr.de; Fri, 24 Apr 2020 09:56:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jRv4g-0003t3-Uw
 for kgdb-bugreport@lists.sourceforge.net; Fri, 24 Apr 2020 09:56:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mD/kfPP0LJg4RaHAfHE48TNR0vDMyG0NIvrIYBVARm4=; b=EFZsH5cHvoMux5FVrPLHsPqEAS
 h9zfjxPeu9zIK8W7utOH1zGleuNz2AXwcfrJBRztH1ea1UAdAQEjTB7uRbSSspVPus2gH7pjkd7S/
 cuqiP0lUou0ZI97Fotn2eg8BMstS9DXQS1zdmujKnnD0cQMT9pHIxPsfMOh77kbRT7nY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mD/kfPP0LJg4RaHAfHE48TNR0vDMyG0NIvrIYBVARm4=; b=EB/C3N+ySx1yVDHLQ6916Fux6k
 X8yJfl6SEQqPo0SS0kii4tPC1EFktFEPqyv3/p0NrEBZvJNS/jNn3GcZNk7OzoweCSQI0b5WeVgsn
 UmC1b5U7N1ARwFXvb5HdLOgvEwkDmALJ8uWySmrxFf/vu7HYM4sXUTwBesc4LOc3j2/c=;
Received: from mail-pj1-f65.google.com ([209.85.216.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jRv4b-00CQBH-MT
 for kgdb-bugreport@lists.sourceforge.net; Fri, 24 Apr 2020 09:56:46 +0000
Received: by mail-pj1-f65.google.com with SMTP id t40so3725270pjb.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 24 Apr 2020 02:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=mD/kfPP0LJg4RaHAfHE48TNR0vDMyG0NIvrIYBVARm4=;
 b=U+zdC02vPpa+dW82b5konrmLSoLeQfS1bxJbZyxDYPtJKTL3/ZyaLfUT22Gh6Hb+yQ
 vdpuVUFR5Mj1U4PSuIHGD9vUt25BRP+1dzf9tl3AD96LnDwcN6PcX2bO0PjuUsRDonzE
 9d6O9Ud5RgNBiAloHqRMT9G9djQlKWVxNbQzxSkyu0cFFZIapMhibJhxYCmCumNEy2l0
 RU4FIW+Ag6a1rTMYezFeBuu0zZiNE2Iakx8gDg2vyuxt8qajobywkK6QL1duo3J9Ai35
 IqnNw40CcBuZ0757a4pwrHuhSXUQeHr+vz39ybQUYZ4+1/vvaVA5kjFpoC/7I/hYcvSs
 Enig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=mD/kfPP0LJg4RaHAfHE48TNR0vDMyG0NIvrIYBVARm4=;
 b=ts3R55Rv4H4/3nXhUCPEhjB2G5M+h2QEbaAdMJsUoEVI3h0T/O1IEYJdnOl9XDC4GF
 hQUkcBa0xeuP0TqHW5/rz/zRWegdcrofyMUaQlaSRG42cwPuBjbG+HUpv8cg8xICp7cT
 dP8HjExU/Mv8oeT+oNI645AHzTUK2/YjzK9CbrnKyM+uLrWW5bqwdNoQROgVEWiRaGtc
 /cmRP4Ab12Q3pc1+D3JqgFIEsSkBtWduNTf1wc0HWi9GKw8B7GrLsXsAXQiZLYPBEIaP
 m5xdf6qKBk1C4qZ6L3+l2CTyQrpPuD/TmgARztFxXA9xjAtKKijW5n5sCTV1zBLKlx/Q
 3OHQ==
X-Gm-Message-State: AGi0Pub0P1qVsFFvghR9oSm9nTTTnVf5o767twrvg59900Zhwjkps8Yi
 tkmgu/XyHV3HVfZHHqFRKe6HtCxHVdY=
X-Google-Smtp-Source: APiQypJghaVt/q6zmxXTjSbtQU6fVWfz/4mYcA8lUSSczTk75+y04uRfK5Ppid1rBINUIfxzC7tJRg==
X-Received: by 2002:a17:902:7593:: with SMTP id
 j19mr8125373pll.62.1587716098746; 
 Fri, 24 Apr 2020 01:14:58 -0700 (PDT)
Received: from localhost.localdomain ([117.252.71.186])
 by smtp.gmail.com with ESMTPSA id q201sm5080005pfq.40.2020.04.24.01.14.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Apr 2020 01:14:57 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: dianders@chromium.org,
	linux-serial@vger.kernel.org
Date: Fri, 24 Apr 2020 13:43:51 +0530
Message-Id: <1587716031-28199-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.65 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jRv4b-00CQBH-MT
Subject: [Kgdb-bugreport] [PATCH] serial: amba-pl011: Support earlycon_kgdboc
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
Cc: daniel.thompson@linaro.org, kgdb-bugreport@lists.sourceforge.net,
 jason.wessel@windriver.com, linux@armlinux.org.uk,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, jslaby@suse.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Implement the read() function in the early console driver. With
recently added earlycon_kgdboc feature, this allows you to use kgdb
to debug fairly early into the system boot.

We only bother implementing this if polling is enabled since kgdb can't
be enabled without that.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---

Depends on kgdb patch series: https://lkml.org/lkml/2020/4/21/1179

 drivers/tty/serial/amba-pl011.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index 2296bb0..c010f63 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -2435,6 +2435,37 @@ static void pl011_early_write(struct console *con, const char *s, unsigned n)
 	uart_console_write(&dev->port, s, n, pl011_putc);
 }
 
+#ifdef CONFIG_CONSOLE_POLL
+static int pl011_getc(struct uart_port *port)
+{
+	if (readl(port->membase + UART01x_FR) & UART01x_FR_RXFE)
+		return NO_POLL_CHAR;
+
+	if (port->iotype == UPIO_MEM32)
+		return readl(port->membase + UART01x_DR);
+	else
+		return readb(port->membase + UART01x_DR);
+}
+
+static int pl011_early_read(struct console *con, char *s, unsigned int n)
+{
+	struct earlycon_device *dev = con->data;
+	int ch, num_read = 0;
+
+	while (num_read < n) {
+		ch = pl011_getc(&dev->port);
+		if (ch == NO_POLL_CHAR)
+			break;
+
+		s[num_read++] = ch;
+	}
+
+	return num_read;
+}
+#else
+#define pl011_early_read NULL
+#endif
+
 /*
  * On non-ACPI systems, earlycon is enabled by specifying
  * "earlycon=pl011,<address>" on the kernel command line.
@@ -2454,6 +2485,7 @@ static int __init pl011_early_console_setup(struct earlycon_device *device,
 		return -ENODEV;
 
 	device->con->write = pl011_early_write;
+	device->con->read = pl011_early_read;
 
 	return 0;
 }
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
