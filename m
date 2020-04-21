Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0F71B31A3
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 21 Apr 2020 23:15:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jR0F0-0007bu-0K
	for lists+kgdb-bugreport@lfdr.de; Tue, 21 Apr 2020 21:15:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jR0Ey-0007bb-TG
 for kgdb-bugreport@lists.sourceforge.net; Tue, 21 Apr 2020 21:15:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BjXLxKYx2J4SfneKVn6eyAIDqxc8kteAmWSGrEv3s1Q=; b=BPXeOvK7gC96pkLJg/clkEn5EF
 7Pcb+u/GuvHfadG8c+oASBizFaAqR1Q1MvBJiQ6VvvKJbNI0N1u6t928TDWk9MEDcHrz0L9ptMuCY
 FiRvJQOSYU0uvarVw/9EdyUx5cwgHlt5zxQ8xP9pV4JROidCIP21C7SBg/tadM2cNFb4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BjXLxKYx2J4SfneKVn6eyAIDqxc8kteAmWSGrEv3s1Q=; b=IAHY+AANQnoptYPxjGHPR6KdOU
 FProym1TqnNUbTrc8nTg7iie2SQBhPH0ZqMx6RbtmpWxcqQeI75XczLLduJpuT3xWn+eNwXurVFH3
 dF/sMWHBhw95S6Sv/pZkNESwzdqHqsvy6WAIBXB50BsICLnJWa2jKXosETevaIJfQkOc=;
Received: from mail-pf1-f193.google.com ([209.85.210.193])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jR0Ex-009LvK-08
 for kgdb-bugreport@lists.sourceforge.net; Tue, 21 Apr 2020 21:15:36 +0000
Received: by mail-pf1-f193.google.com with SMTP id b8so7195055pfp.8
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 21 Apr 2020 14:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BjXLxKYx2J4SfneKVn6eyAIDqxc8kteAmWSGrEv3s1Q=;
 b=CcJCluHY3oWgCqfj8YhfZKPo0NR/BUu6kAlYc9e5Oewk1f5pCuZN7xV0s8bJRPKSaa
 jN+bzjxqRaMU7hrDRd5nNyB2ufRcJdE8b+aIVwOlnZcSoBmTm7+6Ka+Hyjdbn8I/xBdB
 1FpGO292NE9dv3pw6YfLq20gXxSIurqzigZRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BjXLxKYx2J4SfneKVn6eyAIDqxc8kteAmWSGrEv3s1Q=;
 b=TpFon/iRJkl4wRYny8Rlk4P2xBGPE7hOuPy2AJv7hRiq4y2zxCsaB/Tz+xVUL25sMZ
 nwHBnrCSf0BP9GIKwarMqSCeLmYiaA4lEL1lxqxOgvlTGsZHS/trGaTDH2HoA+0F/jOA
 aHHRsVBY/bQwdcrVcXzqqUNCiquW/ty+JnZZ6zJXPsiKAFX1kOcuGYBbQgCYFGRYUxIq
 C1nDgOp+OZduVNX4durJWhjhZVXRx/EBZDI7R1poaGQ7A5084bpqlL0N/iMEvFXKJz36
 mofiphRG9YL63MyXSGoJxCZN/I4uYfmA/4jmb6qkBghAkaQ7rAV2I4/cL0AT0/QkcxzI
 j6Ww==
X-Gm-Message-State: AGi0Pua0fE6hu8B5/1NjUfF2kbgq2+KASQsqosyHlGszRa0MQm3Im7M4
 MrZhduqEha/fhlLf5Ly1+Eg3JA==
X-Google-Smtp-Source: APiQypKbzNZ3tNv1+91oSCmg1IIaM8GOSYYn0L8dUZkcD300x8Du/f0RDrz/WsZ9Oyq+POo+vU2dNg==
X-Received: by 2002:a63:f14b:: with SMTP id o11mr24165243pgk.429.1587503729162; 
 Tue, 21 Apr 2020 14:15:29 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id c1sm3287880pfo.152.2020.04.21.14.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 14:15:28 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 gregkh@linuxfoundation.org
Date: Tue, 21 Apr 2020 14:14:46 -0700
Message-Id: <20200421141234.v2.8.If2deff9679a62c1ce1b8f2558a8635dc837adf8c@changeid>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
In-Reply-To: <20200421211447.193860-1-dianders@chromium.org>
References: <20200421211447.193860-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.193 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.193 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jR0Ex-009LvK-08
Subject: [Kgdb-bugreport] [PATCH v2 8/9] serial: qcom_geni_serial: Support
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
---

Changes in v2: None

 drivers/tty/serial/qcom_geni_serial.c | 32 +++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 6119090ce045..4563d152b39e 100644
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
+						      struct console *con) { ; }
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
2.26.1.301.g55bc3eb7cb9-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
