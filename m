Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C456BDA20
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 16 Mar 2023 21:27:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pcuBj-0007lM-58
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 16 Mar 2023 20:27:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1pcuBf-0007l7-MR
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 16 Mar 2023 20:27:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R7uYBq/r2MM26gN/T+YojigH2qsAcwEwpy934F/qkEQ=; b=cxTHs+i96VGGc4BZe15zCImsB0
 q54HF6sD0ZIfYG93EvKx59zvfRaY/8UzyjwMJfsV5Kr9BJS7yxR8gsp++VKgFUxGy5oi8+cOIvMnn
 jhgd9jf7eLxU6WBAi0v5MgZ9ssq6TvyNFPdIKXrplvNnsiaaJFmuKw45WOItlJsyJo+c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R7uYBq/r2MM26gN/T+YojigH2qsAcwEwpy934F/qkEQ=; b=k0vUgDwuN92rilog27jwq5dbSO
 FoRxwdMalpTCCLt4SGIpWfN67qqZjziqSrQcP7e21GzzUWqv3zVRH1brCqfqKNEOJ6TfdiUXFEjeO
 tAM6L6QTtCfDbne8NfGdFUPBhNxu/kva9nfiS1oy0QFR07UDMQ48dngcvI3q730LHVLc=;
Received: from mail-qt1-f172.google.com ([209.85.160.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pcuBb-00BBJH-Kq for kgdb-bugreport@lists.sourceforge.net;
 Thu, 16 Mar 2023 20:27:00 +0000
Received: by mail-qt1-f172.google.com with SMTP id l13so3220196qtv.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 16 Mar 2023 13:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678998410;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R7uYBq/r2MM26gN/T+YojigH2qsAcwEwpy934F/qkEQ=;
 b=m5kV52wSO889V4Pmx4+BF1d7NxRii9FZiOapyGbUMnn1GJmoW7TyfdIaB7K3f2ICsU
 CTSuNvK8/jRiX2Q5mIKzLe5J649LWsnHy0QAR1gHx7ItZGFok1jCKwEWowUAEEx+UWcn
 J6EPdi453FmXr8wFrxC00lhjwN/iFFmnhRhO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678998410;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R7uYBq/r2MM26gN/T+YojigH2qsAcwEwpy934F/qkEQ=;
 b=lpYGAX//sDwExUsM4XQ9hcG5nBILJHQ0ZeNSYEKc6Mhs7kTyQO+lKefZogLjjLyn3a
 JTAgBz8xwMxPRVplUSBZMCwLE0uPvu0sQhaEkEOUCaThv4y1kRh6X4AOZ+B1EgT5ihir
 32vqxtIB2Gae4Xn9MY5qdwjTWjkDiAbJ6Eu1QKJBH0ngzZK/APIgEFm2CANiHdbduQCS
 Jdb+8ev+t4sZs1aDcScEIpL4gVVMVvaDDQlF3Zna1SikIEiGH7jGrq1JKS/KNtCvH4Xx
 lJvwDtN2mQFoIkjCNP3S087jptDSRk+BI4aL54uaW0UMtFPl4vJ/5Tc9Ysh1pbS7251b
 vAHw==
X-Gm-Message-State: AO0yUKW8+vypz0/MY2glC9Nb9yYRocZgIwSC6PouSzonAgfvgv4fNcVo
 hmB/SdRfH8yiDaVu7gIsp+nhcaO9Zyto5GLAj+4=
X-Google-Smtp-Source: AK7set8U+8u0pAReOkw3SQcSNQaY6unkcGqSXoWSlafTmIws3G0+lrdPTp5NRIJ1P1F3tRAnfoo8wQ==
X-Received: by 2002:a17:90b:3850:b0:234:118d:b1b1 with SMTP id
 nl16-20020a17090b385000b00234118db1b1mr4760801pjb.48.1678998082769; 
 Thu, 16 Mar 2023 13:21:22 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:4db6:6f23:6ad2:998d])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a17090a5a0400b0023acdac248dsm24114pjd.15.2023.03.16.13.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 13:21:22 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 16 Mar 2023 13:20:57 -0700
Message-Id: <20230316132027.RESEND.2.Ie678853bb101091afe78cc8c22344bf3ff3aed74@changeid>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230316202057.4070382-1-dianders@chromium.org>
References: <20230316202057.4070382-1-dianders@chromium.org>
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
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.172 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.160.172 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pcuBb-00BBJH-Kq
Subject: [Kgdb-bugreport] [RESEND PATCH 2/2] tty: serial: qcom-geni-serial:
 Add a poll_init() function
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
index d69592e5e2ec..7fdb3e12846d 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1532,6 +1532,7 @@ static const struct uart_ops qcom_geni_console_pops = {
 #ifdef CONFIG_CONSOLE_POLL
 	.poll_get_char	= qcom_geni_serial_get_char,
 	.poll_put_char	= qcom_geni_serial_poll_put_char,
+	.poll_init = qcom_geni_serial_port_setup,
 #endif
 	.pm = qcom_geni_serial_pm,
 };
-- 
2.40.0.rc1.284.g88254d51c5-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
