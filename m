Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7988F1A4C31
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 11 Apr 2020 00:45:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jN2PG-0007wP-8G
	for lists+kgdb-bugreport@lfdr.de; Fri, 10 Apr 2020 22:45:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jN2PE-0007w0-JN
 for kgdb-bugreport@lists.sourceforge.net; Fri, 10 Apr 2020 22:45:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0Xvr0zLScn2nLCI1oJV5OmhbqIZY3/XDOPCMztpMIRU=; b=YKooL9W6nTw5RZpj+ZjIXlEldg
 CjyC7OxpUB6BvYJ6wA13ooca51Rk6N1YvPzJ+SOz8Xerl8GZCyAwzsndeoZ4Lr+vwazo7xDy8aRnC
 gYzo1KDqzW31tLe/HN56i3GYo69wc50mdCZofLSievVOZjnjTZu+7WptnTxRkzSmXpb4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0Xvr0zLScn2nLCI1oJV5OmhbqIZY3/XDOPCMztpMIRU=; b=IrLlT8x/6+uQSVUo1XatrVxQ6q
 FHC1P4e/B4JzvscIKf7AylGbSiqbMS2rVu6rHvz8104idm4PILjHODFa9O85ypbOlLL4Vw3ZWo35C
 bbuZdUpvWqtW6ugrSuwmcnc+HzzXip9Y/DXPSH8BUV1oAR5LfuBfqgzNmBcmCrPnQLe8=;
Received: from mail-vs1-f66.google.com ([209.85.217.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jN2P9-00BBba-52
 for kgdb-bugreport@lists.sourceforge.net; Fri, 10 Apr 2020 22:45:48 +0000
Received: by mail-vs1-f66.google.com with SMTP id d7so1965988vsm.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 10 Apr 2020 15:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0Xvr0zLScn2nLCI1oJV5OmhbqIZY3/XDOPCMztpMIRU=;
 b=k4p/J0RkQWbVJUKkTEJkmAlkTUHSGfQUMbPY5oEJl0LlPckFTu8/+Cq9PSIYVOTAMF
 Cl7i8VarjWIpiZwgsCIXffNBCRoDzx5zRIs2DL/a1TP/GQCnX0rVVMXb+UubxNRsVGE/
 H02eTDq2K8FVOWnJiLXE/ZsILItbjVpsEFQBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Xvr0zLScn2nLCI1oJV5OmhbqIZY3/XDOPCMztpMIRU=;
 b=ThTYh2dji6V74TjhRfvon+n+zhDlHAYJab2h2wRqcrSnNxYo9gmN82QuLb4q1H4Ocb
 Cr8lx+3/xb2rI5sjq2ZNpWXzrXidXHcUXu6H//0sbrno59s/hUUJl3q79UI6swiKJWa9
 XJlieJNZ2j0F6w+CU/+5XyXiRl6c/Ixcr4EKIPJDyzgRLKLxQx6iVf3XNqqIdwCHD4Ce
 9S2ysvZrQN36P4hkZq9a/Cr8nkg8qVVOyQPYQ6JCTPHI0PA1X0xJ21DO1KqCTWomApbt
 40D1jCuR4fn9r19ouhA9uCJ8DKgk1p4qyywNt4EZ+TGXk0RKdER38ApEFUKpbF/khtIx
 NElw==
X-Gm-Message-State: AGi0PubHvskmnhU1YjDzMOvImW6ml/0P3wNdAzwvZmAB6B1YSYxFCzzw
 Yj5QoPqRs/guP26UhqGPSGAAZ1qwSe9OcA==
X-Google-Smtp-Source: APiQypKJ94vBioTXZPIp0dI7ctcYkCPzkMjxyO4M1PLccd96ucK1TAvxhGD7obO0jnob1QYfSWfzmw==
X-Received: by 2002:a17:902:8e8b:: with SMTP id
 bg11mr6257430plb.139.1586557107068; 
 Fri, 10 Apr 2020 15:18:27 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id x2sm2646600pfq.92.2020.04.10.15.18.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2020 15:18:26 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 gregkh@linuxfoundation.org
Date: Fri, 10 Apr 2020 15:17:25 -0700
Message-Id: <20200410151632.6.If2deff9679a62c1ce1b8f2558a8635dc837adf8c@changeid>
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
 trust [209.85.217.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jN2P9-00BBba-52
Subject: [Kgdb-bugreport] [PATCH 6/7] serial: qcom_geni_serial: Support
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
 kgdb-bugreport@lists.sourceforge.net, linux-arm-msm@vger.kernel.org,
 hpa@zytor.com, agross@kernel.org, bjorn.andersson@linaro.org, mingo@redhat.com,
 bp@alien8.de, linux-serial@vger.kernel.org, jslaby@suse.com,
 tglx@linutronix.de, linux-kernel@vger.kernel.org
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

 drivers/tty/serial/qcom_geni_serial.c | 32 +++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 0bd1684cabb3..e3bb90404ab5 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1084,6 +1084,36 @@ static void qcom_geni_serial_earlycon_write(struct console *con,
 	__qcom_geni_serial_console_write(&dev->port, s, n);
 }
 
+#ifdef CONFIG_CONSOLE_POLL
+static int qcom_geni_serial_earlycon_read(struct console *con,
+					  char *s, unsigned int n)
+{
+	struct earlycon_device *dev = con->data;
+	struct uart_port *uport = &dev->port;
+	int num_read = 0;
+	int ch;
+
+	while (num_read < n) {
+		ch = qcom_geni_serial_get_char(uport);
+		if (ch == NO_POLL_CHAR)
+			break;
+		s[num_read++] = ch;
+	}
+
+	return num_read;
+}
+
+static void __init qcom_geni_serial_enable_early_read(struct geni_se *se,
+						      struct console *con)
+{
+	geni_se_setup_s_cmd(se, UART_START_READ, 0);
+	con->read = qcom_geni_serial_earlycon_read;
+}
+#else
+static inline void qcom_geni_serial_enable_early_read(struct geni_se *se,
+						      struct console *con) { ; }
+#endif
+
 static int __init qcom_geni_serial_earlycon_setup(struct earlycon_device *dev,
 								const char *opt)
 {
@@ -1130,6 +1160,8 @@ static int __init qcom_geni_serial_earlycon_setup(struct earlycon_device *dev,
 
 	dev->con->write = qcom_geni_serial_earlycon_write;
 	dev->con->setup = NULL;
+	qcom_geni_serial_enable_early_read(&se, dev->con);
+
 	return 0;
 }
 OF_EARLYCON_DECLARE(qcom_geni, "qcom,geni-debug-uart",
-- 
2.26.0.110.g2183baf09c-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
