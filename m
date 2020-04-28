Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCB51BCE54
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 28 Apr 2020 23:14:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jTXYy-00039l-F1
	for lists+kgdb-bugreport@lfdr.de; Tue, 28 Apr 2020 21:14:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jTXYu-00039F-Dg
 for kgdb-bugreport@lists.sourceforge.net; Tue, 28 Apr 2020 21:14:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=olbDJB3S+bdQ1rHPM1o42dCtHB3e0ATdib9atqJ3CH0=; b=Vjai9voH3Zv/bYMBNbWdZzd6Vo
 ibyYAgyc0f8NmRsWKOOlpsfgy217+o4TGlaHUQEffPP74Mu0wfQxqxmrR6bTf9+yhEi22guJ7tW1d
 xPmHkAqK5GpDfa2O2/FHriLxvTxaI3bw6TERUYJN4Wihv4CrhyLwnLES8p2QyNsp60Jo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=olbDJB3S+bdQ1rHPM1o42dCtHB3e0ATdib9atqJ3CH0=; b=QpCj94V8pWbfZ4/NHBlCyg2uTg
 woxqU1AegO9cpnC0Nn813vX1xV32gqT1zIBw1n1BcGzDVtH9E60ll+fnICMLDH2WYPbz9wIsFc+Gt
 U5B1Uy1nrxn1upegpsCeC36xnRg+iW2lnKsC4iB4soHFEQ6Lwn/EW3csdz9UwJgMXKTA=;
Received: from mail-pj1-f68.google.com ([209.85.216.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jTXYt-001XX7-Ba
 for kgdb-bugreport@lists.sourceforge.net; Tue, 28 Apr 2020 21:14:40 +0000
Received: by mail-pj1-f68.google.com with SMTP id a7so55385pju.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 28 Apr 2020 14:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=olbDJB3S+bdQ1rHPM1o42dCtHB3e0ATdib9atqJ3CH0=;
 b=PIn5iHI/IwS+TMjQUsr/2rRfGrEiC7wLceEHu2VgewBRrHcU+2V+W+ZAiKrY1GySUm
 voM5jTx9zygH5APLxR5laFyA0OZJt/joPffylYulA5va6p0bqd8+/oQtuvMlQvPT7Iw4
 iOWldVK3Gzxz4MGAg0AYGRLa5WBTB28vN/Ofo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=olbDJB3S+bdQ1rHPM1o42dCtHB3e0ATdib9atqJ3CH0=;
 b=S3LsqUb55XbvQHPYNRQHDIQVu6I3xksAFg7dyuq9Da5xdpl2ejRswgHHEmMwcoaCsx
 mU7+WIGl5Ufgs5lXm6Blq3863hElz32MzXccMGvIBoH8gD3bTLgt7c8DJ1+6bj82TOqx
 WU8TdjpW/pFTOIVPxhCOsOGDoUdvkLX88/lgQcyQropeE4IhneIBxQBoHECcs6GS3qY8
 RHOWtJXyCRXCBYE7Q26pzsE91mDvVQSaO1r7qihe3G0YP2x2+wWYFA98ovGoN1mkh6gS
 GduZm8RFMLhZA5CJ8NPaLCixZCMBkLDkQjpBqa0IyOngXyJk3POLg0TuukFvU6Yjdj+D
 sn7A==
X-Gm-Message-State: AGi0PuZ46dxq/iXwO+JDKaF4yO8SCrGDsyeHPkPn0bhOv2cLN5Z9YXh3
 2UK1pIQbFcN/16g9kDK78aeIFg==
X-Google-Smtp-Source: APiQypLL7OQbMlCdHb2Gh/LCqBb1CYuqtnA3YYlHL+MOghPSzRephJ9LAeuBLX+kdzhTdo5B2mZSjQ==
X-Received: by 2002:a17:902:6ac9:: with SMTP id
 i9mr31679849plt.35.1588108473631; 
 Tue, 28 Apr 2020 14:14:33 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id 18sm2988202pjf.30.2020.04.28.14.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 14:14:33 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 gregkh@linuxfoundation.org
Date: Tue, 28 Apr 2020 14:13:51 -0700
Message-Id: <20200428141218.v3.11.I8ee0811f0e0816dd8bfe7f2f5540b3dba074fae8@changeid>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
In-Reply-To: <20200428211351.85055-1-dianders@chromium.org>
References: <20200428211351.85055-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.68 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.68 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jTXYt-001XX7-Ba
Subject: [Kgdb-bugreport] [PATCH v3 11/11] serial: amba-pl011: Support
 kgdboc_earlycon
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
Cc: corbet@lwn.net, Russell King <linux@armlinux.org.uk>,
 kgdb-bugreport@lists.sourceforge.net, hpa@zytor.com,
 bjorn.andersson@linaro.org, agross@kernel.org, bp@alien8.de,
 linux-serial@vger.kernel.org, catalin.marinas@arm.com, jslaby@suse.com,
 tglx@linutronix.de, will@kernel.org, mingo@redhat.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

From: Sumit Garg <sumit.garg@linaro.org>

Implement the read() function in the early console driver. With
recently added kgdboc_earlycon feature, this allows you to use kgdb
to debug fairly early into the system boot.

We only bother implementing this if polling is enabled since kgdb can't
be enabled without that.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- ("serial: amba-pl011: Support kgdboc_earlycon") pulled into my v3.
- Renamed earlycon_kgdboc to kgdboc_earlycon.

Changes in v2: None

 drivers/tty/serial/amba-pl011.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index 2296bb0f9578..c010f639298d 100644
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
2.26.2.303.gf8c07b1a785-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
