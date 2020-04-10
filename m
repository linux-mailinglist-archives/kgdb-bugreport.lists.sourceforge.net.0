Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E576C1A4C36
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 11 Apr 2020 00:48:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jN2SF-0002SR-N6
	for lists+kgdb-bugreport@lfdr.de; Fri, 10 Apr 2020 22:48:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jN2SE-0002SK-9J
 for kgdb-bugreport@lists.sourceforge.net; Fri, 10 Apr 2020 22:48:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7A6FUrEihYonXIpPhnCErlWl+4ZFT4mvYVljlFWGAP4=; b=H77Wzspthg+AVP74ysifqeSrg9
 TBILILSz24hp6KT2qObdwpCTV/G378aLhEJXnrlolQtSWRHmQQ3YjQRLwSnZpp89tKDtfyOTPNTbN
 aVvRHlRyj9VQ1mPPOfSIaMPdy8IuqrZausgbVmozIYAmv2fx8loo3vv/wFg68/RhLA9c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7A6FUrEihYonXIpPhnCErlWl+4ZFT4mvYVljlFWGAP4=; b=lACbQoKJfhPvENJnM8kvcLXpJ1
 U2n74TZh8TE2g5SSJw4FHlRTjWUn7kpCHSQXMduaLzXO52i0BgfqR5V7MbBdtPpwFILbfFJkj30YZ
 xg897mwIJOisQe6zQqFswodBIA+hQlX/4zhF6PuFaLkNECCV4221rHydspUwgB6orZ4Y=;
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jN2S6-00Ek4n-Vt
 for kgdb-bugreport@lists.sourceforge.net; Fri, 10 Apr 2020 22:48:54 +0000
Received: by mail-oi1-f196.google.com with SMTP id b7so38704oic.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 10 Apr 2020 15:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7A6FUrEihYonXIpPhnCErlWl+4ZFT4mvYVljlFWGAP4=;
 b=A8zixFy38mun90CDAXlagVbAIIVwh9/25A/e43Q9RCFDEn+rOp9ZVO0j0mSlXrQ8vT
 YYiCKZpKJT2bIMJS9e7wnmEAtxwvF+vg9K8vHguKd7KWs8bmd0/ZXCQbNchlmGQ6f5id
 QXT8w0UcQ7ThQOglUn/LWks0X9xwLGASWJRQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7A6FUrEihYonXIpPhnCErlWl+4ZFT4mvYVljlFWGAP4=;
 b=Y1pJZ9SiJF/Plahu+9r5Hl7EFJhrLFqaI3UNrtMnuLe/8EW+Ac0eOfSOdoQKgdl27E
 lfSglzXX7R/igOGa2fO+UTP0hexcWfBauE4nA7XyaEAvtkayW+8eZcxGUkiILAQSQA6B
 8wShvvfbR9lO7gQSymFHwMzqvs1XlTr0zqt7iZTE+Y3kpZkvakS8JjwFd+aVhMxPh+uJ
 xbw88MLpm4esXXYf+WrIarPerlnqLqlFiyOHnC6dKr7jWDCY0NhC9Ku+5G0g/nkwLtDB
 6DomqNvtntmBq/NV8YBOk7GTv0BeN+Uns5B2eGdnakLS2BMz3+qRAi+1o9x8zxRWFOJt
 NKpg==
X-Gm-Message-State: AGi0PuaySQA3JYQ7TwdEBpQ6esqrtuSE5kYE3eX/J02YkslVIXrgj0Z1
 Su75vh1cfyM0eoiEb440UXAtLESbrvikRQ==
X-Google-Smtp-Source: APiQypJBkfxcG7ETfLq/uX0qKEMzrTaauzB9axhptLbpfS46Oj3ffr4yc5nX4ePFLIoum7gB6Llgbg==
X-Received: by 2002:a17:90b:4902:: with SMTP id
 kr2mr5571773pjb.152.1586557108150; 
 Fri, 10 Apr 2020 15:18:28 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id x2sm2646600pfq.92.2020.04.10.15.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2020 15:18:27 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 gregkh@linuxfoundation.org
Date: Fri, 10 Apr 2020 15:17:26 -0700
Message-Id: <20200410151632.7.I8f668556c244776523320a95b09373a86eda11b7@changeid>
X-Mailer: git-send-email 2.26.0.110.g2183baf09c-goog
In-Reply-To: <20200410221726.36442-1-dianders@chromium.org>
References: <20200410221726.36442-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.196 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jN2S6-00Ek4n-Vt
Subject: [Kgdb-bugreport] [PATCH 7/7] serial: 8250_early: Support
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
 kgdb-bugreport@lists.sourceforge.net, hpa@zytor.com, agross@kernel.org,
 bjorn.andersson@linaro.org, mingo@redhat.com, bp@alien8.de,
 linux-serial@vger.kernel.org, jslaby@suse.com, tglx@linutronix.de,
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
2.26.0.110.g2183baf09c-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
