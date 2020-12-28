Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB6E2E93B2
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  4 Jan 2021 11:51:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kwNSW-0001z6-1s
	for lists+kgdb-bugreport@lfdr.de; Mon, 04 Jan 2021 10:51:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bodefang@126.com>) id 1ktiMK-0000sP-CI
 for kgdb-bugreport@lists.sourceforge.net; Mon, 28 Dec 2020 02:34:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=os0e7yDxDmr48itpSyk+PBXhkus/bZ75U22h9N7lIiM=; b=LV0U3S/RAfmynZh4MlaqBipFJw
 gGAr4ARd8/0C3w5poQHKuKfefklhTV/yzCC4nV6EVJeZsBVBiPkR/3lhXKRuo3ARC+xetUtMLSdby
 KRZtiYcizGcT3EYCgRubxChchPwqfLYSgPjKgHgaK3XMKxzaomrZ7mjw0wfhYXD07hSw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=os0e7yDxDmr48itpSyk+PBXhkus/bZ75U22h9N7lIiM=; b=fNPIHpRi+Y0iCUifNZilOHAiMe
 6JsO7vaGwwJvJIAl7BRDIJ3PcRSEM1s0ssxJxIVW/NBX1Gll7b0dcDiWwcj3lc6ePxrD9ml4nSOSk
 Jp12afs2h4VSlKjn+LHAFyh/WCWP4cMZBZ1Su3AOoE+pqbTqwYxhlEgFHsRkXIVdGqxw=;
Received: from m15114.mail.126.com ([220.181.15.114])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:DHE-RSA-AES256-SHA:256) (Exim 4.92.2) id 1ktiM5-004qEY-VA
 for kgdb-bugreport@lists.sourceforge.net; Mon, 28 Dec 2020 02:34:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=os0e7yDxDmr48itpSy
 k+PBXhkus/bZ75U22h9N7lIiM=; b=KriXCrmJ4jBzxqyHdjU456tv2wUl/LaY2r
 YyO0COWO43yiSt6OUby1LXKjXbsYmJQNn7AVyTA8o7qRXBrIDYbHsaMysF/iP4AT
 YW3pl9XH/g7hSMszou1/nnrp5oJQwZyl6l1+KiRldJuU/PDs0T9iHlHwaJj92AXT
 GM+YYy1us=
Received: from localhost.localdomain (unknown [36.112.86.14])
 by smtp7 (Coremail) with SMTP id DsmowACXmWnpO+lfZoqEMg--.33140S2;
 Mon, 28 Dec 2020 09:59:05 +0800 (CST)
From: Defang Bo <bodefang@126.com>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 dianders@chromium.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org
Date: Mon, 28 Dec 2020 09:58:58 +0800
Message-Id: <1609120738-202321-1-git-send-email-bodefang@126.com>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: DsmowACXmWnpO+lfZoqEMg--.33140S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFW3Kr1UAF4xuF13Zry3CFg_yoW3urg_Ca
 y5XF1xX3yj9w1qg3W2y393ur9Fyanru3Z3XFn293yfCry5Cr1q9FWqvFZ5WF18XFsFyFsr
 ZrZIqrW09F1IqjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjF4iUUUUUU==
X-Originating-IP: [36.112.86.14]
X-CM-SenderInfo: pergvwxdqjqiyswou0bp/1tbikgkJ11pECFyxVAAAsq
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
X-Headers-End: 1ktiM5-004qEY-VA
X-Mailman-Approved-At: Mon, 04 Jan 2021 10:51:30 +0000
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

Similar to commit<1bd54d851f50>("kgdboc: Passing ekgdboc to command line causes panic"),
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
