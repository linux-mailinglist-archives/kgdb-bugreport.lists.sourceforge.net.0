Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9C02E93B0
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  4 Jan 2021 11:51:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kwNSV-0001yl-Ub
	for lists+kgdb-bugreport@lfdr.de; Mon, 04 Jan 2021 10:51:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bodefang@126.com>) id 1ktWLs-0004sI-A7
 for kgdb-bugreport@lists.sourceforge.net; Sun, 27 Dec 2020 13:44:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rqb+wRh62Gki33C+j9ZCew9NAJiKb5+CJW7yy9XRjhY=; b=gUwqq0ixPkWs+b+1ufyiwrmXnX
 uGU5Oemsi9f6r0LJKlPkxbGjX3RPU2c8KEzTzhqoVPJXBMQXnJeNTKs9h6qCMIaOtNvfPu09mB/Xo
 pKRRbwmoVmuQBXtENk9sU3TUPeKOhXDeR+tLEDan2E6kI4yzb1KZMcxiFW52Zr6gTs/c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Rqb+wRh62Gki33C+j9ZCew9NAJiKb5+CJW7yy9XRjhY=; b=ScChCv84+RmM2FDLFn+wQ6rdsM
 MsNZ/lAETbdTgBSI9WLqf67ZrkriXlCqr+6eJvrzbFZkZV4o6f1Oav5vY5E/vDsA4YJecXvuVlEIi
 nAbMtQt0VIAOTqnfNy8zoMEBAwNPOKOCr06bReI304lD8TGbEGFYdRGbY3pP85YwyQ2k=;
Received: from m15113.mail.126.com ([220.181.15.113])
 by sfi-mx-1.v28.lw.sourceforge.com with smtp (Exim 4.92.2)
 id 1ktWLm-002ukt-Gr
 for kgdb-bugreport@lists.sourceforge.net; Sun, 27 Dec 2020 13:44:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=Rqb+wRh62Gki33C+j9
 ZCew9NAJiKb5+CJW7yy9XRjhY=; b=fjaKvN1YQc0lSBIKMAQ/1q6t89qxp5LsR4
 mCH/M3evdqKNacRYoOHe3ceWvmPVRy85BfLepzAoP8BnqwY4H81pACn0H8fJo9tj
 q2E0BqTtm6QhXU0hq59HVvkUFbivpt3nfTVYvRmFzmUb/Xto7YbjPYMgW6RccjZB
 iQitk4mUU=
Received: from localhost.localdomain (unknown [36.112.86.14])
 by smtp3 (Coremail) with SMTP id DcmowADX3wNwj+hf+_j6NA--.4703S2;
 Sun, 27 Dec 2020 21:43:13 +0800 (CST)
From: Defang Bo <bodefang@126.com>
To: jason.wessel@windriver.com,
	daniel.thompson@linaro.org,
	arnd@arndb.de
Date: Sun, 27 Dec 2020 21:43:05 +0800
Message-Id: <1609076585-4010725-1-git-send-email-bodefang@126.com>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: DcmowADX3wNwj+hf+_j6NA--.4703S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GF13KFyrZFy3tF4rXFWDurg_yoW3Gwc_Ga
 45Xr1xJrWY9w1qg3W2v3yfZry7Aa17W3WfJFn2kw4fCry5ur1qkFWqvFZ5GF18Jr4vyFsr
 XrsIqrW09F12yjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRoqcUUUUUU==
X-Originating-IP: [36.112.86.14]
X-CM-SenderInfo: pergvwxdqjqiyswou0bp/1tbikhEI11pECFooHQAAsl
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (bodefang[at]126.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1ktWLm-002ukt-Gr
X-Mailman-Approved-At: Mon, 04 Jan 2021 10:51:29 +0000
Subject: [Kgdb-bugreport] [PATCH] kgdbts: Passing ekgdbts to command line
 causes panic
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
Cc: gregkh@linuxfoundation.org, Defang Bo <bodefang@126.com>,
 linux-kernel@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Similar to commit<1bd54d85>,kgdbts_option_setup does not check input argument
before passing it to strlen. The argument would be a NULL pointer.

Signed-off-by: Defang Bo <bodefang@126.com>
---
 drivers/misc/kgdbts.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/misc/kgdbts.c b/drivers/misc/kgdbts.c
index 945701b..99d9795 100644
--- a/drivers/misc/kgdbts.c
+++ b/drivers/misc/kgdbts.c
@@ -1057,6 +1057,11 @@ static void kgdbts_run_tests(void)
 
 static int kgdbts_option_setup(char *opt)
 {
+	if (!opt) {
+		pr_err("kgdbts: config string not provided\n");
+		return -EINVAL;
+	}
+
 	if (strlen(opt) >= MAX_CONFIG_LEN) {
 		printk(KERN_ERR "kgdbts: config string too long\n");
 		return -ENOSPC;
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
