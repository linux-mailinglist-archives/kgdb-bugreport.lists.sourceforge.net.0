Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D031C9BBB
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  7 May 2020 22:09:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jWmph-0007zt-Ng
	for lists+kgdb-bugreport@lfdr.de; Thu, 07 May 2020 20:09:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jWmpf-0007zd-Ee
 for kgdb-bugreport@lists.sourceforge.net; Thu, 07 May 2020 20:09:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bnBeK10KzsaeyDFO2398m9/Skswi+j6FYU/gKr10cks=; b=kcJwsiy9qnwPKn3ifChUBdgOmt
 hoPGitK6pB1moMiRkZscXzfkH3ZXCjBhAzshQ27/oOZHvuQgOwuKR7/EwDyN3SPNhM2TcBnHFM+E+
 YQroQyCl8aeHxXtw9gtBXtt4C8LvRqs3k4pGnGNaIAWIWcifcncAvD1SV1eqG6dTBfVA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bnBeK10KzsaeyDFO2398m9/Skswi+j6FYU/gKr10cks=; b=iQg03b+kRgTv/WNoR48YzPLFPl
 VrMPkpU5Ct1EV9FjFu6tAUYmCbZFJHgzmoQ2GgxSbdK3KadZrp4JUIA1ubAw2mHDvs0kxI9AdRO3S
 9uEkTOEB9lt54DXie8unnDEYymA6DdcyJbUIj4ZyQsPX3X3xiu6R3VfdEjLHMAXmTEdI=;
Received: from mail-pj1-f67.google.com ([209.85.216.67])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jWmpe-00EdSl-6i
 for kgdb-bugreport@lists.sourceforge.net; Thu, 07 May 2020 20:09:23 +0000
Received: by mail-pj1-f67.google.com with SMTP id e6so3123839pjt.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 07 May 2020 13:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bnBeK10KzsaeyDFO2398m9/Skswi+j6FYU/gKr10cks=;
 b=GzcY94LdE0hSxHNb2Ie4O6ZGy7FUnmfrizHDOWnagUu/3DoRcnlASU4EtxJamQJf5n
 YInSK43rqVxNgmqEJyLE1V8uoQuK711LrzZzl6Jy+DwiB3USC73zDvfsnly8sf5RE3MO
 gJ0PUw1ZkSRig2z0wZbVSdLbZCRY0xEmG2+0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bnBeK10KzsaeyDFO2398m9/Skswi+j6FYU/gKr10cks=;
 b=Gn3IJEKnIQ9pODE3QToLM45Wx/JfmRjUh2kp9j2A8mYAnF141DsDcX02tq1cXpixbl
 WwZ55Nfw3soN7hSo0ScXz0sG0YSbY6MDfibbP44g34oV3Nau/iVtAtnpRH9aBiEwaYek
 VWst31g62C1D1z9mErtQMUi9UEuTqC5kwsSCoVpbucJjEbx9X6a12L1jlRTxsoDB/SFo
 oVe3UNFy8u9m9pZbYOhAz5yLWywtib0y1PYsUyNgipmCR4g6EC/SseMnzfwOl19Znv2x
 Ae+MHU5qK6CqYSp3xAUMXbvkt9E/C5JTeJ2mZZoeMDjJwJBvcFW9Z7+4n3ynFytjJ1Z4
 /0KA==
X-Gm-Message-State: AGi0PuZ5Rh9ucEgVGJeXECzulQ6sENgLXFP/389p2x9TnfnnhewCFopn
 5NYqHDuVBElafi4BHQ4/Cfrg9g==
X-Google-Smtp-Source: APiQypKbwI7JzsjlGczS2mRvFdtUhbrL91Jdr9XjVjfScPm9ggnNRqUiKjXSnHdXQBa+ufgliHhpcg==
X-Received: by 2002:a17:902:dc84:: with SMTP id
 n4mr14949596pld.281.1588882156436; 
 Thu, 07 May 2020 13:09:16 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id d203sm5547601pfd.79.2020.05.07.13.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 13:09:15 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 gregkh@linuxfoundation.org
Date: Thu,  7 May 2020 13:08:50 -0700
Message-Id: <20200507130644.v4.12.I8ee0811f0e0816dd8bfe7f2f5540b3dba074fae8@changeid>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
In-Reply-To: <20200507200850.60646-1-dianders@chromium.org>
References: <20200507200850.60646-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.67 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWmpe-00EdSl-6i
Subject: [Kgdb-bugreport] [PATCH v4 12/12] serial: amba-pl011: Support
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
Cc: catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
 kgdb-bugreport@lists.sourceforge.net, jslaby@suse.com, agross@kernel.org,
 bjorn.andersson@linaro.org, mingo@redhat.com, bp@alien8.de,
 linux-serial@vger.kernel.org, hpa@zytor.com,
 Russell King <linux@armlinux.org.uk>, tglx@linutronix.de,
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

Changes in v4: None
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
2.26.2.645.ge9eca65c58-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
