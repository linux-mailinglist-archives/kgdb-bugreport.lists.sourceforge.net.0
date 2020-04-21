Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 828751B31DE
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 21 Apr 2020 23:23:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jR0MT-00075G-Ak
	for lists+kgdb-bugreport@lfdr.de; Tue, 21 Apr 2020 21:23:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jR0MG-00074X-EX
 for kgdb-bugreport@lists.sourceforge.net; Tue, 21 Apr 2020 21:23:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=to0u/Jn7Js4VPZOuXqA43IyX5Na3y9BiQIqtXkvA+lM=; b=NSbF5KSRArxk4L4kzWjwV/WsiW
 9OcJppll1rSI6RFE13V85NkustqEb+5v+bXRy9mMHYZqNEusBvNxAiN+iD1+W0m7jsjn5e11aZ6nr
 ddN5tZSO2EunR5U48qL5lhGcQibFn/O5pcfBMWbtC3+ul6KN/AWId7FaLkUPiRaxqz2k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=to0u/Jn7Js4VPZOuXqA43IyX5Na3y9BiQIqtXkvA+lM=; b=NBFkZVYhNb6NLtNEwy88yA6a1M
 UhNEdWEtt0NIqRmnF7IJOabXhnV1/RddZRw2F0LUaFkRCNwJbZb/UxN1KXqafPP59w9iaJOZt/MHC
 mUOHLbv1LVvOBJ3tAQNl5N5ndidHO+1gBq6VuDp2zj9nu6u+TDB81U7u16OFY7Ad+vlA=;
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jR0ME-005haR-5P
 for kgdb-bugreport@lists.sourceforge.net; Tue, 21 Apr 2020 21:23:08 +0000
Received: by mail-il1-f196.google.com with SMTP id i16so9962857ils.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 21 Apr 2020 14:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=to0u/Jn7Js4VPZOuXqA43IyX5Na3y9BiQIqtXkvA+lM=;
 b=Fi7GhO/HIQuePgWWr4CAwtD3Nm2BO9549F2xy6Ify+xWUhksu4HNmc2cI7/51GU+Ch
 L/n5ai+tI4jzrDDdPfty2/gS+I7isrdFl83WaL/FlfxsVbFv0gdgZJthH5iQcYAQHTC5
 QDlYrK8x4Xkir0fVq0MFu0g741PDRv9AznrbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=to0u/Jn7Js4VPZOuXqA43IyX5Na3y9BiQIqtXkvA+lM=;
 b=qLeKC5AicW6xTDGxZMc+g3P++Y5VFPV8yTNLhVGE2xuUExuttalb0NtkwBLhJ15SqT
 sSi47MTs7YLI4utxHKAIbwcQPc4L1/Od1qfaKtdg1YDnSrYpFPEDMRUhJShiWBLyQZpp
 lJfDJiNxEAPXL+SczvTfqaOOZIuERrVRMDrBLHIHjCxFalLxP9vnp9etMkJ6GrckT/b0
 NkwXO3RibuzmtYeBCFyU7+VaFw2ZApGLgmQzWi50RkyNNLyIBMSMtFZEAu3zGEIiC9RS
 TdDRuuWmSlqjc8fqsH2v+wSB9Z31HBjT4dXhOEksiqlrsUDeebeqMbUTs8o2WWx6hru4
 iy2w==
X-Gm-Message-State: AGi0PuYJrgEKJm5T+ZsEGcK7MalEWpcLdZxHh7ayeS+xTW8sbdCe7Abq
 hZUt0CT8CzEUUsmQPjS5cudg1wELd7SpMQ==
X-Google-Smtp-Source: APiQypJ7dM3c1Vl/KOkONz1GC46IExu+/RPzPNDHW1csvMJmR81uQd7VsO5+P57/5ygsNzFb3hkAUw==
X-Received: by 2002:a63:de4b:: with SMTP id y11mr8602658pgi.23.1587503730684; 
 Tue, 21 Apr 2020 14:15:30 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id c1sm3287880pfo.152.2020.04.21.14.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 14:15:30 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 gregkh@linuxfoundation.org
Date: Tue, 21 Apr 2020 14:14:47 -0700
Message-Id: <20200421141234.v2.9.I8f668556c244776523320a95b09373a86eda11b7@changeid>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
In-Reply-To: <20200421211447.193860-1-dianders@chromium.org>
References: <20200421211447.193860-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.196 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.196 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jR0ME-005haR-5P
Subject: [Kgdb-bugreport] [PATCH v2 9/9] serial: 8250_early: Support
 earlycon_kgdboc
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
 linux-serial@vger.kernel.org, hpa@zytor.com, tglx@linutronix.de,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Implement the read() function in the early console driver.  With
recent kgdb patches this allows you to use kgdb to debug fairly early
into the system boot.

We only bother implementing this if polling is enabled since kgdb
can't be enabled without that.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2: None

 drivers/tty/serial/8250/8250_early.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_early.c b/drivers/tty/serial/8250/8250_early.c
index 5cd8c36c8fcc..70d7826788f5 100644
--- a/drivers/tty/serial/8250/8250_early.c
+++ b/drivers/tty/serial/8250/8250_early.c
@@ -109,6 +109,28 @@ static void early_serial8250_write(struct console *console,
 	uart_console_write(port, s, count, serial_putc);
 }
 
+#ifdef CONFIG_CONSOLE_POLL
+static int early_serial8250_read(struct console *console,
+				 char *s, unsigned int count)
+{
+	struct earlycon_device *device = console->data;
+	struct uart_port *port = &device->port;
+	unsigned int status;
+	int num_read = 0;
+
+	while (num_read < count) {
+		status = serial8250_early_in(port, UART_LSR);
+		if (!(status & UART_LSR_DR))
+			break;
+		s[num_read++] = serial8250_early_in(port, UART_RX);
+	}
+
+	return num_read;
+}
+#else
+#define early_serial8250_read NULL
+#endif
+
 static void __init init_port(struct earlycon_device *device)
 {
 	struct uart_port *port = &device->port;
@@ -149,6 +171,7 @@ int __init early_serial8250_setup(struct earlycon_device *device,
 		init_port(device);
 
 	device->con->write = early_serial8250_write;
+	device->con->read = early_serial8250_read;
 	return 0;
 }
 EARLYCON_DECLARE(uart8250, early_serial8250_setup);
-- 
2.26.1.301.g55bc3eb7cb9-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
