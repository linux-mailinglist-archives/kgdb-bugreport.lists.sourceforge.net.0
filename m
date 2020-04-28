Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4051D1BCE4D
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 28 Apr 2020 23:14:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jTXYu-0002gQ-23
	for lists+kgdb-bugreport@lfdr.de; Tue, 28 Apr 2020 21:14:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jTXYr-0002g8-WF
 for kgdb-bugreport@lists.sourceforge.net; Tue, 28 Apr 2020 21:14:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/OLrWf8x1qLHrBr/Q6vF9daUHKkS3VqdNLwPQBuWJDU=; b=fQSc2oSE1Vq9I9/8/5CRSBBZ56
 Lc0GdhgZvF+z+NseUorxtKsw8t82QoX7K3id8AyHA0fv4Fzx8IZwiD+v+8FW47dNcyhrRlUtXanWq
 To6or3xBfGqmpHPcTPJz2QHQzhfIwVbtNhWuyMGeRSBgTdNxlP/QqrBrJg8gIi0X4pfc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/OLrWf8x1qLHrBr/Q6vF9daUHKkS3VqdNLwPQBuWJDU=; b=iQ+PgcsGPxtaeOMEFA7NAPfOLC
 rSD4vuDCBdOlU5fGWEbytt5osYuhrKd/Wx9LHZjFMvt4sURL8lCQvSwffD8GyufGpIoEmnqfJOVUA
 dd5pdNi+MHLSDEKt5fYy5+0VdfZXmZHR3Hgs9pQzdGmD50JJcwwKZhdwZMBYtSDiWDfo=;
Received: from mail-pj1-f68.google.com ([209.85.216.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jTXYq-002zIq-SF
 for kgdb-bugreport@lists.sourceforge.net; Tue, 28 Apr 2020 21:14:37 +0000
Received: by mail-pj1-f68.google.com with SMTP id hi11so54650pjb.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 28 Apr 2020 14:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/OLrWf8x1qLHrBr/Q6vF9daUHKkS3VqdNLwPQBuWJDU=;
 b=ceR7s4QLjCxcwBopolOS/b+gt1XS1V44hpA4RaLu3U7xz4gbiad0ZwvuUfq2zoDgWW
 LUxBaQE0WU7cVAqQaq42UbdsZLHipbJutBdwwdZhBMU9LwbKFUAMsXICh1j8qxyF2HLT
 XNOSxdPCyaFKmbg5uLtxCtuq/CZhkE8K72skM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/OLrWf8x1qLHrBr/Q6vF9daUHKkS3VqdNLwPQBuWJDU=;
 b=OOjQuXH16Oqcd5890wGddQlMTKXWEJaofi0tryY5A8yPNof8ZeEMXSGXcUGKNUgM7w
 fgn4cFLUXdVk9iDk0k4Ht44R+JtBt+/lGg6pGsllO+o9pT3aA75Uuh8TH7Wl85+f7oYU
 fDs0JQBsoMXOGDT9FKFh5RXLWKbVQEwpGKK2//kvZ1zKtawIh/quxFLkxT1LiVOW6vai
 hhG5EiGI9+07XzEg38nxh18Yg1b0T/i0zt2+TuRIpQCmZF8s2i1AbyGP2yIsp4pB8tG/
 dr8brjilZKtI/ieHke0JcsHdhd8zbRgik6f6MAZgZA9hDEjsbVvmTyo4ZDa1W3BVxKQK
 R5Jw==
X-Gm-Message-State: AGi0PuYFEdo/7Nb8WA1VOfdQbLt7KORTsP8DXvdLUBrrx4cNWbD5+5xR
 af2mHLlu79zgytOOmCLyoe/Fdg==
X-Google-Smtp-Source: APiQypImFZwATzuEOLMe75yAljMn4Bd02aw2txf/8JfWQMe0c5vUhr/j2Svo3I7xFuBIbvpRPemi7A==
X-Received: by 2002:a17:902:904a:: with SMTP id
 w10mr16025829plz.17.1588108471172; 
 Tue, 28 Apr 2020 14:14:31 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id 18sm2988202pjf.30.2020.04.28.14.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 14:14:30 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 gregkh@linuxfoundation.org
Date: Tue, 28 Apr 2020 14:13:49 -0700
Message-Id: <20200428141218.v3.9.If2deff9679a62c1ce1b8f2558a8635dc837adf8c@changeid>
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
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.68 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jTXYq-002zIq-SF
Subject: [Kgdb-bugreport] [PATCH v3 09/11] serial: qcom_geni_serial: Support
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
Cc: corbet@lwn.net, kgdb-bugreport@lists.sourceforge.net,
 linux-arm-msm@vger.kernel.org, hpa@zytor.com, bjorn.andersson@linaro.org,
 agross@kernel.org, bp@alien8.de, linux-serial@vger.kernel.org,
 catalin.marinas@arm.com, jslaby@suse.com, tglx@linutronix.de, will@kernel.org,
 mingo@redhat.com, linux-kernel@vger.kernel.org
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
---

Changes in v3:
- Renamed earlycon_kgdboc to kgdboc_earlycon.
- { ; } ==> { }

Changes in v2: None

 drivers/tty/serial/qcom_geni_serial.c | 32 +++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 6119090ce045..6bace1c6bb09 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1090,6 +1090,36 @@ static void qcom_geni_serial_earlycon_write(struct console *con,
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
+						      struct console *con) { }
+#endif
+
 static int __init qcom_geni_serial_earlycon_setup(struct earlycon_device *dev,
 								const char *opt)
 {
@@ -1136,6 +1166,8 @@ static int __init qcom_geni_serial_earlycon_setup(struct earlycon_device *dev,
 
 	dev->con->write = qcom_geni_serial_earlycon_write;
 	dev->con->setup = NULL;
+	qcom_geni_serial_enable_early_read(&se, dev->con);
+
 	return 0;
 }
 OF_EARLYCON_DECLARE(qcom_geni, "qcom,geni-debug-uart",
-- 
2.26.2.303.gf8c07b1a785-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
