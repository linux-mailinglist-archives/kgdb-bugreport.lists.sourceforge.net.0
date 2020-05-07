Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B3C1C9BC0
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  7 May 2020 22:09:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jWmpn-0003rr-CY
	for lists+kgdb-bugreport@lfdr.de; Thu, 07 May 2020 20:09:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jWmpj-0003rd-Ms
 for kgdb-bugreport@lists.sourceforge.net; Thu, 07 May 2020 20:09:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JDitJmCYI6w8zpra4JuK0k+hw0gGmgK6hNM/TsrDerA=; b=ZlKfBMhUIU9OPQohu6H48HYwP3
 fIKoC2Fp/sxY3iuMZB8ZF7MqVoPd2xzXjQPPCwKT6OgccsJM3zHeY3BxTYjPbzw/u2KzKndnG/rGu
 XxDgVEn+2UhlwpzhOHcj55Nw3LAGo4T7VK1zxxCrwrRca1O/eRLg7uJWbcxFsOugEHeQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JDitJmCYI6w8zpra4JuK0k+hw0gGmgK6hNM/TsrDerA=; b=NbHA3ePM5XHM49aPIthp3J9Vo9
 ANiZeL20o7AsMHLxqzp4X6lLGBBea7KgXNa/1MZTXNdUkp8MmueDwFGiaqj6reWSHgY+pb9ezB38K
 3+38o5SezQ++OBIDbYXlRH+UlLiylypmna2iJ+xZElW3ViWvhKjHGsvZ2ZoLCUYXQLXM=;
Received: from mail-pj1-f66.google.com ([209.85.216.66])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jWmpi-00EdT7-FV
 for kgdb-bugreport@lists.sourceforge.net; Thu, 07 May 2020 20:09:27 +0000
Received: by mail-pj1-f66.google.com with SMTP id ms17so3133647pjb.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 07 May 2020 13:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JDitJmCYI6w8zpra4JuK0k+hw0gGmgK6hNM/TsrDerA=;
 b=k06JzvMvr6IYLZzGXi5MfjXYuByqlDZ5Ov7mPhaAbBAYC2WDtJlBDj/9PSIX63fckv
 yvcOSjPw7/Q1Vr8lprU6X2yuu+hUFrZgmNJmmkEF8/JQfVgtWlgprpvoRq5+dHn2sEWv
 beDgToAgENRUasSAvNZUqtFk/E56syR3ia0zw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JDitJmCYI6w8zpra4JuK0k+hw0gGmgK6hNM/TsrDerA=;
 b=ARKyy5uBzPBTUQKdoetY0222mfFPEv7N/DR6VAfUNjv8GpSx19+ERcIF1IWzLKmx8P
 WSeBxSng/KqgXZvG8tSifUffCEzkz6WU/GfEuWymirwd/kiGZ8xxAPPat59MkoOXAahA
 PEC+C8rSC+VQkgTtqywHqj3DGpWvhoMstncg9T5d5u9bYvywywwYqTkp2YK5gOonmHBN
 TewoRK6Cr4HgG5ddMuzY61Ky/asoKMK4cYBj3KBkFQF8XA1y/CAMxDTCBwVbCO/0Miko
 +rAC4fkbR7TnUyChNs9WyNLEqEkMciCZ2UpfVZ6Lrgugf77WeeNMm50QZKTafRCY5SDI
 N/8g==
X-Gm-Message-State: AGi0PuZ+kUzh26APww02BO8N9CdcMFywwrZziOOHxUsXjXgHOp6ke/kS
 wToblLTKksyDyHcjMqqQq/7V5Q==
X-Google-Smtp-Source: APiQypJ7eLBdCYVxkzItvTQhjgPKMPikSZLf+2fArLtn+DXLDcEsLN3jFlCfrxAqCJRgj8wo2lxu1w==
X-Received: by 2002:a17:902:7593:: with SMTP id
 j19mr15341546pll.62.1588882153625; 
 Thu, 07 May 2020 13:09:13 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id d203sm5547601pfd.79.2020.05.07.13.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 13:09:13 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 gregkh@linuxfoundation.org
Date: Thu,  7 May 2020 13:08:48 -0700
Message-Id: <20200507130644.v4.10.If2deff9679a62c1ce1b8f2558a8635dc837adf8c@changeid>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
In-Reply-To: <20200507200850.60646-1-dianders@chromium.org>
References: <20200507200850.60646-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.66 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.66 listed in wl.mailspike.net]
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
X-Headers-End: 1jWmpi-00EdT7-FV
Subject: [Kgdb-bugreport] [PATCH v4 10/12] serial: qcom_geni_serial: Support
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
 kgdb-bugreport@lists.sourceforge.net, linux-arm-msm@vger.kernel.org,
 jslaby@suse.com, agross@kernel.org, bjorn.andersson@linaro.org,
 mingo@redhat.com, bp@alien8.de, linux-serial@vger.kernel.org, hpa@zytor.com,
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
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---

Changes in v4: None
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
2.26.2.645.ge9eca65c58-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
