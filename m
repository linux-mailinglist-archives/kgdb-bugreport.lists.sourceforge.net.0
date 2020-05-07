Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F126B1CDAD0
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 11 May 2020 15:10:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jY8Co-0005Fk-QO
	for lists+kgdb-bugreport@lfdr.de; Mon, 11 May 2020 13:10:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yanaijie@huawei.com>) id 1jWeNY-0007Tb-8P
 for kgdb-bugreport@lists.sourceforge.net; Thu, 07 May 2020 11:07:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oX1LMAT7lFChkd8oEI+lxQuhOHHvTqhL9CAAZw1uC4w=; b=KwnxdYHvZ+U/mHt8JKEQGn6uHJ
 pHBp/k1R5zxLq37iMLQEGTE8x0uOTu2YXVdH/Spvn/QP8cjcRiOUV2rhf4BOQRP9O9F52McOcni5C
 o/l/tCjVT70wQVjzSfXGBb+6fOcaL5hV3I86XCz0+VhwWzucyG8UXdn527jaG0Eoy8mc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=oX1LMAT7lFChkd8oEI+lxQuhOHHvTqhL9CAAZw1uC4w=; b=E
 bs5clzNptxAZyQf2Tvz8oFWljGrk/cy7jmW6sEdRn0wp83hn01vwgaYxEhGw7WJkIzGuAJtmV8Dzs
 eCqUqpqKnwqYQwXQS9JlMtUFYaPKqLhHVzvFsy1Idlo4Kfy3R6+LFhVEul9ARHCwfKtD3g4gUnXVg
 HhlF/VXf08QUzTTs=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jWeNW-0003z7-3M
 for kgdb-bugreport@lists.sourceforge.net; Thu, 07 May 2020 11:07:48 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id E066BDDB11D6676765FA;
 Thu,  7 May 2020 19:07:38 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Thu, 7 May 2020
 19:07:28 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <jason.wessel@windriver.com>, <daniel.thompson@linaro.org>,
 <dianders@chromium.org>, <kgdb-bugreport@lists.sourceforge.net>,
 <linux-kernel@vger.kernel.org>
Date: Thu, 7 May 2020 19:06:49 +0800
Message-ID: <20200507110649.37426-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWeNW-0003z7-3M
X-Mailman-Approved-At: Mon, 11 May 2020 13:10:48 +0000
Subject: [Kgdb-bugreport] [PATCH] kgdb: Return true in kgdb_nmi_poll_knock()
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
Cc: Jason Yan <yanaijie@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Fix the following coccicheck warning:

include/linux/kgdb.h:301:54-55: WARNING: return of 0/1 in function
'kgdb_nmi_poll_knock' with return type bool

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 include/linux/kgdb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
index b072aeb1fd78..042828aeb73d 100644
--- a/include/linux/kgdb.h
+++ b/include/linux/kgdb.h
@@ -298,7 +298,7 @@ extern bool kgdb_nmi_poll_knock(void);
 #else
 static inline int kgdb_register_nmi_console(void) { return 0; }
 static inline int kgdb_unregister_nmi_console(void) { return 0; }
-static inline bool kgdb_nmi_poll_knock(void) { return 1; }
+static inline bool kgdb_nmi_poll_knock(void) { return true; }
 #endif
 
 extern int kgdb_register_io_module(struct kgdb_io *local_kgdb_io_ops);
-- 
2.21.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
