Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0DC6AE509
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  7 Mar 2023 16:40:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pZZQB-0003Ri-4Q
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 07 Mar 2023 15:40:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1pZZQ8-0003Rc-U5
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 07 Mar 2023 15:40:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oAaIzsWI+DXQ807RCKvS+zEYcv/H3X+nOpua3UqPND8=; b=OFKQ8tWbN2bWPpsw9RTzOqUTiG
 E9Ir+D2NQKiUCSX1RpLbonkiLzG6iuk7loSVaUJw/jzSI0g6stfOYFztCZCXniKRkIb1GhjUWRnnB
 40kUXOMslTBmkaSTDv/BCapA55lA57NI2m/sQGjDkOFg9smXF1ycH+anB+GFc4UzKmiY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oAaIzsWI+DXQ807RCKvS+zEYcv/H3X+nOpua3UqPND8=; b=MeMj8fhgdS9BIod6aN/jJhRG5I
 TMYrr769hnSFsBxBuo7HQP1C6MTLxSkqxpk0vyoONLapTGFYvFSi/unkAE6K8Wnqe2URra8mLPL/7
 8tNTJa6HoC0WqI6T2nbcJlDU2r+MF0ER9N60Ysn5z7kootV3SRnBBQEWGB9XV0h2qpgo=;
Received: from mail-qt1-f177.google.com ([209.85.160.177])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pZZQ7-002Jzn-KB for kgdb-bugreport@lists.sourceforge.net;
 Tue, 07 Mar 2023 15:40:07 +0000
Received: by mail-qt1-f177.google.com with SMTP id s12so14673825qtq.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 07 Mar 2023 07:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678203602;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oAaIzsWI+DXQ807RCKvS+zEYcv/H3X+nOpua3UqPND8=;
 b=mVrAGCWMoUTE4b+4SmezfNy2ymk14IVMVMmGIoxoLhzojbfCPV0DsyViyyBIXuZV1m
 IE8YDz0l11yH0YVpDdMEBPjlFpzkzKuzqKrDH1WMvh/LPbGt7NDdrjPvX+Xb7WGIA9/y
 dmW58A6HnjbJPgSllAZzjBAyUkFkeCw2RKS78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678203602;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oAaIzsWI+DXQ807RCKvS+zEYcv/H3X+nOpua3UqPND8=;
 b=mfwKjZUuNZLcULWvefgu82hjJFk486E6JNp8Kr1cpwhvmY4VnfR057C4U5nDBneJK1
 G2Gxbb2NLYSl6tW2D6fKb3vwfDoAJOKQilCCRk6dWnehe1m2e6f0B+uP86CIcXt9R3gI
 g+iCTgRn5HmcM4kwM9IqN2PoJ0RFsudyTm821lViuamtGyIecU+zE/oUQTSnv9LaIaoH
 /qib50pbhSbDaYmOvFgYTVgXtTQfUparmG6I7g9+o1OyIStkhoLr6FwpRJZFHGtN5TmY
 ayv7ldBu4h3wjzHGKIKfpkD/9fcFQg2RaIycqLmDJW41zQZWzS9q04IKobfmwHJ/Iswc
 zfDg==
X-Gm-Message-State: AO0yUKWcCehEaw28mnLN376t2qSfO611scQz6BD48S/OGXCClLX8Vbzr
 tmm+ghxko61H2/jKwKhU8ZbHXv8DX9cNb+2BPTQ=
X-Google-Smtp-Source: AK7set9YT+h+URl5z9jkarOCmjqbanYlcXm3N10vAqJLY2v22NAZ3Ao9oO5SaoI6/ADUBN1+wljhtQ==
X-Received: by 2002:a17:903:1c9:b0:19e:6fd5:f4fa with SMTP id
 e9-20020a17090301c900b0019e6fd5f4famr15192866plh.69.1678203171195; 
 Tue, 07 Mar 2023 07:32:51 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:2023:7dda:98bb:96dd])
 by smtp.gmail.com with ESMTPSA id
 jy16-20020a17090342d000b0019719f752c5sm8586843plb.59.2023.03.07.07.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 07:32:50 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue,  7 Mar 2023 07:32:13 -0800
Message-Id: <20230307073155.3.Ie678853bb101091afe78cc8c22344bf3ff3aed74@changeid>
X-Mailer: git-send-email 2.40.0.rc0.216.gc4246ad0f0-goog
In-Reply-To: <20230307073155.1.Iaab0159b8d268060a0e131ebb27125af4750ef99@changeid>
References: <20230307073155.1.Iaab0159b8d268060a0e131ebb27125af4750ef99@changeid>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On sc7180 Chromebooks, I did the following: * Didn't enable
 earlycon in the kernel command line. * Didn't enable serial console in the
 kernel command line. * Didn't enable an agetty or any other clien [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.177 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.177 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pZZQ7-002Jzn-KB
Subject: [Kgdb-bugreport] [PATCH 3/3] tty: serial: qcom-geni-serial: Add a
 poll_init() function
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

On sc7180 Chromebooks, I did the following:
* Didn't enable earlycon in the kernel command line.
* Didn't enable serial console in the kernel command line.
* Didn't enable an agetty or any other client of "/dev/ttyMSM0".
* Added "kgdboc=ttyMSM0" to the kernel command line.

After I did that, I tried to enter kdb with this command over an ssh
session:
  echo g > /proc/sysrq-trigger

When I did that the system just hung.

Although I thought I'd tested this scenario before, I couldn't go back
and find a time when it was working. Previous testing must have relied
on either the UART acting as the kernel console or an agetty running.

It turns out to be pretty easy to fix: we can just use
qcom_geni_serial_port_setup() as the .poll_init() function. This,
together with the patch ("serial: uart_poll_init() should power on the
UART"), allows the debugger to work even if there are no other users
of the serial port.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/tty/serial/qcom_geni_serial.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 74a0e074c2de..00752ff783c6 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1534,6 +1534,7 @@ static const struct uart_ops qcom_geni_console_pops = {
 #ifdef CONFIG_CONSOLE_POLL
 	.poll_get_char	= qcom_geni_serial_get_char,
 	.poll_put_char	= qcom_geni_serial_poll_put_char,
+	.poll_init = qcom_geni_serial_port_setup,
 #endif
 	.pm = qcom_geni_serial_pm,
 };
-- 
2.40.0.rc0.216.gc4246ad0f0-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
