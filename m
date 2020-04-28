Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 942371BCE53
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 28 Apr 2020 23:14:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jTXYy-00039a-Cu
	for lists+kgdb-bugreport@lfdr.de; Tue, 28 Apr 2020 21:14:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jTXYu-000398-5L
 for kgdb-bugreport@lists.sourceforge.net; Tue, 28 Apr 2020 21:14:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4oGO5v8y9nak8k9DrQPglFtrPLstpeIPrguWZ4LmKLk=; b=EQ5jL3PrsbOgMQAl6r0b8DR0lE
 SxTN9TadVa7A4ULB1VIYAn6wAXu0+FdykFYSS6RAt2mwI88y8Pl9IorquKObhrJHMk7FNKWYRzGZI
 tPm//pb20vk8BEqg8MnH9IitiK6EOhVNyYTFWVm6lJQcNKyjWOFuf0FVqK4Beb+QXkww=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4oGO5v8y9nak8k9DrQPglFtrPLstpeIPrguWZ4LmKLk=; b=m8/6SNmsdz9pJCC5ZfHhXjChQk
 +av6jkXrF8w/J1hl2pksa/zCwfeGhqg3t5bawe3xzK0vfweCfi/G63Mk1vAv72QL/E0cDvthhEGeV
 chVV7CEkvvQJx0fzAmvIYvA1LfwrQYK5y/xhcFPlOB35ZJ7SMyNBRX9CjaOzrbzFhr6Y=;
Received: from mail-pj1-f65.google.com ([209.85.216.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jTXYs-00FUqG-4n
 for kgdb-bugreport@lists.sourceforge.net; Tue, 28 Apr 2020 21:14:40 +0000
Received: by mail-pj1-f65.google.com with SMTP id a7so55363pju.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 28 Apr 2020 14:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4oGO5v8y9nak8k9DrQPglFtrPLstpeIPrguWZ4LmKLk=;
 b=lC/o9/g0QvPZPmlrzukJy8za454JFvMQ6cfQQiPCvEmJqP5U7RtcGoNEEmRqQ2yyve
 +ZhWGOuIAj/7XknaXTCzgBgpD/pS6Zwjx/MibXjHKLZBX/Sl5fdjL9PZrqow6aRDfNPH
 OUPD0gdA3c10zoXT8G662DiHJbzogg3+7fv+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4oGO5v8y9nak8k9DrQPglFtrPLstpeIPrguWZ4LmKLk=;
 b=T1BVf1vn4l2AOrHoWyvAG2OkGRkk6z7GqASdnOcpJDFq1mc0vsbAJmW0cCkkh7qQ6p
 gna3yVd2/sp9yvQmOLGddG4WtxupsvdHNPeTwBhtahcd7vaSnTI0z971+Jni4A93vxTz
 vm6O5Vr14KxK9GrkkLnIVdRdoHrtx2eyE5sZVJyLx79Wt8NMjwkWY6sPN3z0TJAU4GnD
 40EskbfxS/v1Y4+Ku8kou0WpRJLlmF9BXbAJXBjAPesfE63p40fkXP46gBugdpL993kM
 Kd79HEo4mUmwxkYPI9kYLu7iew3gK8jLvf+2b2ZtC66dF8d/+fCFlrsdRBhYq0tqBGLx
 QIBA==
X-Gm-Message-State: AGi0PubB0NX2O+8D5Luz54UU8bF/bKNX28i8L8BqktUFLeQjdoZoxTxm
 B/SJkfFg8Y7F3kIwP0vTqXtHmg==
X-Google-Smtp-Source: APiQypKmcFNHvVmZs0bdmlo52tOJ+MEJoSuTxzLb+JRrva27+RdyqI9eP6g8PWVNuKP/HyPbfr2aUA==
X-Received: by 2002:a17:902:784c:: with SMTP id
 e12mr30329731pln.191.1588108472393; 
 Tue, 28 Apr 2020 14:14:32 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id 18sm2988202pjf.30.2020.04.28.14.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 14:14:32 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 gregkh@linuxfoundation.org
Date: Tue, 28 Apr 2020 14:13:50 -0700
Message-Id: <20200428141218.v3.10.I8f668556c244776523320a95b09373a86eda11b7@changeid>
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
 trust [209.85.216.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jTXYs-00FUqG-4n
Subject: [Kgdb-bugreport] [PATCH v3 10/11] serial: 8250_early: Support
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
Cc: corbet@lwn.net, kgdb-bugreport@lists.sourceforge.net, hpa@zytor.com,
 bjorn.andersson@linaro.org, agross@kernel.org, bp@alien8.de,
 linux-serial@vger.kernel.org, catalin.marinas@arm.com, jslaby@suse.com,
 tglx@linutronix.de, will@kernel.org, mingo@redhat.com,
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
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---

Changes in v3:
- Renamed earlycon_kgdboc to kgdboc_earlycon.

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
2.26.2.303.gf8c07b1a785-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
