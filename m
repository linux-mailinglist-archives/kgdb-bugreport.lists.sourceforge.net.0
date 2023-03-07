Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F056AE502
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  7 Mar 2023 16:39:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pZZPR-0002G4-83
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 07 Mar 2023 15:39:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1pZZPN-0002Fx-BZ
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 07 Mar 2023 15:39:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c3oD+VWh6vfXWKl1YinwYukVpyEX7O+ZCt88fiLI0g4=; b=XLrQdi17G5Cn/jRGPcMipHjsgE
 JwY6hd/wLUn8hmlDZnDNoCHviF3TcFePbTLMf2zGIVpXkQv7hVVEcj+jm6BhSyX6QEADwmmptEqHP
 SpgyUbaC9v2klSrRb/wzjvyXrRznIibh3oDEC3EFZHJmOVFEAMUvNPivHbrAOrogLaRY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=c3oD+VWh6vfXWKl1YinwYukVpyEX7O+ZCt88fiLI0g4=; b=E
 B5T/d6IlwwbO0wo7jId5ELPCHfssmKkl3HlBdUvaT3FuKukaUpILytBkH/2qXsZr+PnMofEvugRmK
 QsciXKRTYAt8VafAxJ6vxSXqK4maDL4WKWcb6fgW1kb+ahO64lA+kGFANEbpHh3ruiO3mtxqcnY9J
 anpSiD4ypdusb8cs=;
Received: from mail-oa1-f53.google.com ([209.85.160.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pZZPI-0005ns-R1 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 07 Mar 2023 15:39:21 +0000
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-1767a208b30so13543587fac.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 07 Mar 2023 07:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678203552;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c3oD+VWh6vfXWKl1YinwYukVpyEX7O+ZCt88fiLI0g4=;
 b=ESsav5IHBlDE+9kov0gJJfhSIohUmjiixxjKkiO+RKnJgFUA9RUHsRshJrPxL559ag
 fi5htrKIz+Rhy5w4VeQphrUky0DOcn66n06Np57p0/TfAn/4a/YpTxFekKO88ejOzjcy
 AiRepiRLQypTup5uclZHloWx7PwMcrOgQ9KM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678203552;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c3oD+VWh6vfXWKl1YinwYukVpyEX7O+ZCt88fiLI0g4=;
 b=3adJ9h6quWi6jJBtGkvGpxBorWNzJN3Ww6Rf5flSbzadpkFhB7foGgK2yODIRoAivz
 E8SaaZ44oOkg0+JzY27VBDCJwLgJFw3ilvTwiVaQvo2fHL2fyNuJgrcwZCVLv/yX2S+m
 yVa5uA1/jIllBSqCalgZb0+FWwavy5F3Jt/VkBr62dfR9lFlqUuU8PRrHH9umuIWgHqJ
 4/d1dVUocpL854Er1XGHqr9qQtCQKtHCXKD1xPcdolgPKSPF6sREzuuMhNDVVojZi7gl
 rb+HiU2Iui+j/tLQEl8V9sUyvnu7eN0TEcTuUqeutUzkGez9JZd+UYxUUXT8r1kvylt8
 rweQ==
X-Gm-Message-State: AO0yUKU/afppLKAiuFiHyya1AvGQPk6BAKh8xl8BM1sBObnC79YTP4xP
 4TGp5kJpJPcLhcp+sq9y8wSRmUo67xTTNLcKVgI=
X-Google-Smtp-Source: AK7set+HF+uHK6o7uusM0NKP4C1wBRuoJGtW9phRDx4xNRHTf+wnthartYKd0Z8578jfS7OlD/PVxQ==
X-Received: by 2002:a17:902:e748:b0:19e:82d5:634c with SMTP id
 p8-20020a170902e74800b0019e82d5634cmr16558648plf.53.1678203167946; 
 Tue, 07 Mar 2023 07:32:47 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:2023:7dda:98bb:96dd])
 by smtp.gmail.com with ESMTPSA id
 jy16-20020a17090342d000b0019719f752c5sm8586843plb.59.2023.03.07.07.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 07:32:47 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue,  7 Mar 2023 07:32:11 -0800
Message-Id: <20230307073155.1.Iaab0159b8d268060a0e131ebb27125af4750ef99@changeid>
X-Mailer: git-send-email 2.40.0.rc0.216.gc4246ad0f0-goog
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Commit d8aca2f96813 ("tty: serial: qcom-geni-serial: stop
 operations in progress at shutdown") was basically a straight revert of the
 commit it claims to fix without any explanation of why the problem [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.53 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.53 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pZZPI-0005ns-R1
Subject: [Kgdb-bugreport] [PATCH 1/3] tty: serial: qcom-geni-serial: Fix
 kdb/kgdb after port shutdown (again)
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-serial@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Commit d8aca2f96813 ("tty: serial: qcom-geni-serial: stop operations
in progress at shutdown") was basically a straight revert of the
commit it claims to fix without any explanation of why the problems
talked about in the original patch were no longer relevant. Indeed,
commit d8aca2f96813 ("tty: serial: qcom-geni-serial: stop operations
in progress at shutdown") re-introduces the same problem that commit
e83766334f96 ("tty: serial: qcom_geni_serial: No need to stop tx/rx on
UART shutdown") fixed.

The problems are very easy to see by simply doing this on a
sc7180-based Chromebook:

1. Boot in developer mode with serial console enabled and kdb setup on
   the serial console.
2. via ssh: stop console-ttyMSM0; echo g > /proc/sysrq-trigger

When you do the above you'll see the "kdb" prompt printed on the
serial console but be unable to interact with it.

Let's fix the problem again by noting that the console port is never
configured in DMA mode and thus we don't need to stop things for the
console.

Fixes: d8aca2f96813 ("tty: serial: qcom-geni-serial: stop operations in progress at shutdown")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/tty/serial/qcom_geni_serial.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index d69592e5e2ec..74a0e074c2de 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1070,8 +1070,10 @@ static int setup_fifos(struct qcom_geni_serial_port *port)
 static void qcom_geni_serial_shutdown(struct uart_port *uport)
 {
 	disable_irq(uport->irq);
-	qcom_geni_serial_stop_tx(uport);
-	qcom_geni_serial_stop_rx(uport);
+	if (!uart_console(uport)) {
+		qcom_geni_serial_stop_tx(uport);
+		qcom_geni_serial_stop_rx(uport);
+	}
 }
 
 static int qcom_geni_serial_port_setup(struct uart_port *uport)
-- 
2.40.0.rc0.216.gc4246ad0f0-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
