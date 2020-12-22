Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B39A2E0CCF
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 22 Dec 2020 16:36:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1krjiG-0000Hl-C8
	for lists+kgdb-bugreport@lfdr.de; Tue, 22 Dec 2020 15:36:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <zhengyongjun3@huawei.com>) id 1krhnL-0003Mz-Bo
 for kgdb-bugreport@lists.sourceforge.net; Tue, 22 Dec 2020 13:33:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/DIkVduXCA//Z/v1tYO+0WYwD5TgIei34M8jATXH1nU=; b=hlufXb+08LepPULun18d6Karz+
 AoJ/dfr2ydjLi1GhmbH8djYbqM/HBZYv+3yFJgzKUuha0eV19dqVRvuh3BbxErobBZNKrRnpIXtV/
 Nk9E28Sn44jmRzvH0lnmxZqCwxIFiH++tm34lIo6ZgHYK3pI9IzNAZH8+ZOqnBlmzdpo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/DIkVduXCA//Z/v1tYO+0WYwD5TgIei34M8jATXH1nU=; b=e
 Eyu3gNn7soQoPLH9VGQzswR6bnhsHaxA3t7KDUvtrrxGDnBlVWr08KlshL/YoaoLbzx77t8Wt/jnu
 4M8Yd13frd+evDufE+gRUpQhcbvUBwn7hVg6z0Hjw8FwhQ/QvA+jQ7ctrvJQjszDOkycNQT476gLN
 odBaFRQ+RTAcMSgI=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1krhnA-00664p-9f
 for kgdb-bugreport@lists.sourceforge.net; Tue, 22 Dec 2020 13:33:43 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D0chN09SrzM6q8;
 Tue, 22 Dec 2020 21:32:20 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Tue, 22 Dec 2020 21:33:08 +0800
From: Zheng Yongjun <zhengyongjun3@huawei.com>
To: <jason.wessel@windriver.com>, <daniel.thompson@linaro.org>,
 <kgdb-bugreport@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>
Date: Tue, 22 Dec 2020 21:33:44 +0800
Message-ID: <20201222133344.19753-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1krhnA-00664p-9f
X-Mailman-Approved-At: Tue, 22 Dec 2020 15:36:33 +0000
Subject: [Kgdb-bugreport] [PATCH -next] misc: use DIV_ROUND_UP macro to do
 calculation
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
Cc: Zheng Yongjun <zhengyongjun3@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Don't open-code DIV_ROUND_UP() kernel macro.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/misc/kgdbts.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/kgdbts.c b/drivers/misc/kgdbts.c
index 945701bce553..cd086921a792 100644
--- a/drivers/misc/kgdbts.c
+++ b/drivers/misc/kgdbts.c
@@ -139,9 +139,8 @@ static int restart_from_top_after_write;
 static int sstep_state;
 
 /* Storage for the registers, in GDB format. */
-static unsigned long kgdbts_gdb_regs[(NUMREGBYTES +
-					sizeof(unsigned long) - 1) /
-					sizeof(unsigned long)];
+static unsigned long kgdbts_gdb_regs[DIV_ROUND_UP(NUMREGBYTES,
+				     sizeof(unsigned long)i)];
 static struct pt_regs kgdbts_regs;
 
 /* -1 = init not run yet, 0 = unconfigured, 1 = configured. */
-- 
2.22.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
