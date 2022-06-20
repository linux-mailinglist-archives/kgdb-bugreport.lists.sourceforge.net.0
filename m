Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8A1551F1C
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 20 Jun 2022 16:42:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1o3IbP-0000Qg-6G
	for lists+kgdb-bugreport@lfdr.de; Mon, 20 Jun 2022 14:42:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <wangxiang@cdjrlc.com>) id 1o3Ex7-0001WZ-2f
 for kgdb-bugreport@lists.sourceforge.net; Mon, 20 Jun 2022 10:48:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=21wvCleeMSODrArStaOTmyd0XEkmJC6WXOLAtBFUTH4=; b=eFwj3fp/ztg2+u822+koHV+zFO
 9/bu9dSQICuAf2aTCQPIcd0iixg/BLT+Jr3KL+lqQbJOrAZ18Zy4zpNM5nve+kC4TfHuobm7fWJqL
 siTTxsBnLa1Ra+pQ8XDbgnMJy0AQvNLR/C/8DUcDc+w5++Pk0E2AsfrWLHwyhv365d9g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=21wvCleeMSODrArStaOTmyd0XEkmJC6WXOLAtBFUTH4=; b=B
 R20PN2bxodmlukSRoBErBgzGuh1a7/yjjXY0nA74AKFj++7HnUQSIDC0dFlEPC8aCQH6SdvX4ho77
 PsyFuTlD5WDbsXTmsEpE9vvjQTNdC3sXUw/zFW3kJPWLx+gBSQ1UAli/gN2c8qgn8aL5UMyaJRFwT
 3QQkKixnBRzED8/4=;
Received: from smtpbg123.qq.com ([175.27.65.52] helo=smtpbg.qq.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o3Ex1-008C2B-6D
 for kgdb-bugreport@lists.sourceforge.net; Mon, 20 Jun 2022 10:48:17 +0000
X-QQ-mid: bizesmtp75t1655722026tpfowczi
Received: from localhost.localdomain ( [106.117.82.33])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 20 Jun 2022 18:46:56 +0800 (CST)
X-QQ-SSF: 01000000004000D0I000B00A0000000
X-QQ-FEAT: AsJu5+SoYW4r99ODow98FzXA05NwqwMOP0PDB6J+D6MRSmW7JE7EPnWFeeFyr
 WBMGF/XR9kGz/QAfFWvSnljZE0ukbHUzd3DQYAfbDif8AJ8meakRTgmfH1Xc2jyXua8A7sP
 Wad3n3PSwrIvp87ycqBsdInNghQv/HBooxfOvzXvS0VFj8crsEFnZMX6KOEnZYGJ6Slz8S+
 u3iInKuO1HH9MCeu4RL/iH76Caj3jU6MFYUg4paqInSyEEcaB3nNVzurKnDttF6aVCU074I
 pIaXvzyGsMtNBvK0M7lsn/paPyPgrMgKeHvOKQN2ThqiyC6+UPJ2RcmAjv/UfaPzRNeXTXw
 90zLVVQ37CKXuEugCU=
X-QQ-GoodBg: 0
From: Xiang wangx <wangxiang@cdjrlc.com>
To: jason.wessel@windriver.com
Date: Mon, 20 Jun 2022 18:46:53 +0800
Message-Id: <20220620104653.5451-1-wangxiang@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam8
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Delete the redundant word 'the'. Signed-off-by: Xiang wangx
 <wangxiang@cdjrlc.com> --- drivers/tty/serial/kgdboc.c | 2 +- 1 file changed, 
 1 insertion(+),
 1 deletion(-) diff --git a/drivers/tty/serial/kgdboc.c
 b/drivers/tty/serial/kgdboc.c
 index 79b7db8580e0..7aa37be3216a 100644 --- a/drivers/tty/serial/kgdboc.c
 +++ b/drivers/tty/serial/kgdboc.c @@ -342,7 +342,7 @@ s [...] 
 Content analysis details:   (1.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE1           RBL: IP Listed in UCEPROTECT Level 1
 [175.27.65.52 listed in dnsbl-1.uceprotect.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [175.27.65.52 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1o3Ex1-008C2B-6D
X-Mailman-Approved-At: Mon, 20 Jun 2022 14:42:06 +0000
Subject: [Kgdb-bugreport] [PATCH] serial: kgdboc: Fix typo in comment
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
Cc: daniel.thompson@linaro.org, Xiang wangx <wangxiang@cdjrlc.com>,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
 jirislaby@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Delete the redundant word 'the'.

Signed-off-by: Xiang wangx <wangxiang@cdjrlc.com>
---
 drivers/tty/serial/kgdboc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
index 79b7db8580e0..7aa37be3216a 100644
--- a/drivers/tty/serial/kgdboc.c
+++ b/drivers/tty/serial/kgdboc.c
@@ -342,7 +342,7 @@ static int param_set_kgdboc_var(const char *kmessage,
 	/*
 	 * Configure with the new params as long as init already ran.
 	 * Note that we can get called before init if someone loads us
-	 * with "modprobe kgdboc kgdboc=..." or if they happen to use the
+	 * with "modprobe kgdboc kgdboc=..." or if they happen to use
 	 * the odd syntax of "kgdboc.kgdboc=..." on the kernel command.
 	 */
 	if (configured >= 0)
-- 
2.36.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
