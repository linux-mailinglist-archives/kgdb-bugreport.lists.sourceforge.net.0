Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3950E2E93B1
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  4 Jan 2021 11:51:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kwNSV-0001yv-W9
	for lists+kgdb-bugreport@lfdr.de; Mon, 04 Jan 2021 10:51:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bodefang@126.com>) id 1ktiFM-0004jW-5D
 for kgdb-bugreport@lists.sourceforge.net; Mon, 28 Dec 2020 02:26:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7Talz/lFvusOYa6P4ctOD4KbtRRHAT+PHWA9WD6jOe0=; b=F6GuafAvJQSCeexD1k1yZc341W
 UD/n6HJCJ62H9gQeFWfZ24SiCjVHWuwxYeOa7oW3vf6Nce0eM+iV5FCmIJJel2sam2x8nvbZXjt1j
 elc/UqYHy5JzujF9jTSDXtgdnwm4frF0qUQIHNJ084HpVZd3r6ODfCbPSNm08yGnfzrA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7Talz/lFvusOYa6P4ctOD4KbtRRHAT+PHWA9WD6jOe0=; b=UI5DWqKOYb89NNxzFK2RG9jX1H
 8tsuImNDnULAZaHNDbAI6l7huUr8k8VWsrwTtXLOBq86S0hi61Pxyk0Kb4cwA3jmBGmGx+avddhWw
 RdshzmHBvo0v5T4DCUk7AriqEjUsXOP43lGrPZPmlzFKCFWicjQh6AMMuPfNLV9ACBtw=;
Received: from mail-m963.mail.126.com ([123.126.96.3])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:DHE-RSA-AES256-SHA:256) (Exim 4.92.2) id 1ktiFF-001ccA-74
 for kgdb-bugreport@lists.sourceforge.net; Mon, 28 Dec 2020 02:26:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=7Talz/lFvusOYa6P4c
 tOD4KbtRRHAT+PHWA9WD6jOe0=; b=hFoOEthnViifPN/PZLFjX3MmqjQL2I87YM
 ZPDySn9fLcuY9ek8QT3FQJqGd7NHkdDHanw+9YsSw9krG58Sdz+vYapKmYpbxq0A
 k/xsOZOZGP8yS6Bm45P7FB4Wr/mC/cc1iMOyiNw4NyQ5FgV805fIb8Fcsdm+5yfu
 fCN8Yf3NY=
Received: from localhost.localdomain (unknown [36.112.86.14])
 by smtp8 (Coremail) with SMTP id NORpCgBHVqbJOulfiL6OBA--.38746S2;
 Mon, 28 Dec 2020 09:54:18 +0800 (CST)
From: Defang Bo <bodefang@126.com>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 dianders@chromium.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org
Date: Mon, 28 Dec 2020 09:54:10 +0800
Message-Id: <1609120450-199726-1-git-send-email-bodefang@126.com>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: NORpCgBHVqbJOulfiL6OBA--.38746S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFW3Kr1UAF4xuF13Zry3CFg_yoW3urX_Ca
 y5XF1xX3yj9w1qg3W2y393Zr9Fya17u3Z3XFn293yfCry5Cr4q9FWqvFs5WF18XFsFyFsr
 ZrZIvrW09F1IqjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRoqcUUUUUU==
X-Originating-IP: [36.112.86.14]
X-CM-SenderInfo: pergvwxdqjqiyswou0bp/1tbi4woJ11pD81jTKwAAs9
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (bodefang[at]126.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [123.126.96.3 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [123.126.96.3 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ktiFF-001ccA-74
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
Cc: Defang Bo <bodefang@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Similar to commit<1bd54d851f50>(("kgdboc: Passing ekgdboc to command line causes panic"),
kgdbts_option_setup does not check input argument before passing it to strlen.
The argument would be a NULL pointer.

Signed-off-by: Defang Bo <bodefang@126.com>
---
 drivers/misc/kgdbts.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/misc/kgdbts.c b/drivers/misc/kgdbts.c
index 945701b..b077547 100644
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
