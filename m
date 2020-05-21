Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EF61DC77F
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 21 May 2020 09:22:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jbfWj-00083X-MT
	for lists+kgdb-bugreport@lfdr.de; Thu, 21 May 2020 07:22:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <liwei391@huawei.com>) id 1jbfWh-00083Q-Q9
 for kgdb-bugreport@lists.sourceforge.net; Thu, 21 May 2020 07:21:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LooMJgnBrpGlXiqCOzLVJF+ZZe863XDYgdf5cXAv+ds=; b=VeH3h3IHd1PkIQD7WYqUArjxVA
 s0nkydhhKIEZ8l+UmGG2a3nlQFFPU9OhB1IyjkBavwvyvq4GjezVM0f8x+6kBDrp9rEDAPnCvVmYn
 1gD+zvpjdWJRwW5aVo1HX8M+TMBoqDcufmzeF/Tmgia4WwiFk8OGwKDg/kinJyi8t3Vw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=LooMJgnBrpGlXiqCOzLVJF+ZZe863XDYgdf5cXAv+ds=; b=Y
 hZ7tuDTvgZNKa1jOgQdYlo2+FdEU9ytvMghje1wj8VPZWDhoAe9zpSe9/OzsmUANqJ0u3knpFRQKk
 bEQRNr0z+Fekd2f+Xm4TmRTW2AQ4P3xo2fQt1rCq05dImKb4WWHd/YMNqNiXRHqIsLWilNqBGsEQT
 e2rRqwF4yUH8YASc=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jbfWe-003Xpe-0S
 for kgdb-bugreport@lists.sourceforge.net; Thu, 21 May 2020 07:21:59 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 2BA30391107AC5928B81;
 Thu, 21 May 2020 15:21:49 +0800 (CST)
Received: from euler.huawei.com (10.175.124.27) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Thu, 21 May 2020 15:21:48 +0800
From: Wei Li <liwei391@huawei.com>
To: Daniel Thompson <daniel.thompson@linaro.org>, Doug Anderson
 <dianders@chromium.org>, Jason Wessel <jason.wessel@windriver.com>,
 "Masahiro Yamada" <yamada.masahiro@socionext.com>
Date: Thu, 21 May 2020 15:21:25 +0800
Message-ID: <20200521072125.21103-1-liwei391@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jbfWe-003Xpe-0S
Subject: [Kgdb-bugreport] [PATCH v3] kdb: Remove the misfeature 'KDBFLAGS'
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Currently, 'KDBFLAGS' is an internal variable of kdb, it is combined
by 'KDBDEBUG' and state flags. It will be shown only when 'KDBDEBUG'
is set, and the user can define an environment variable named 'KDBFLAGS'
too. These are puzzling indeed.

After communication with Daniel, it seems that 'KDBFLAGS' is a misfeature.
So let's replace 'KDBFLAGS' with 'KDBDEBUG' to just show the value we
wrote into. After this modification, we can use `md4c1 kdb_flags` instead,
to observe the state flags.

Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Wei Li <liwei391@huawei.com>
---
v2 -> v3:
 - Change to replace the internal env 'KDBFLAGS' with 'KDBDEBUG'.
v1 -> v2:
 - Fix lack of braces.

 kernel/debug/kdb/kdb_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 4fc43fb17127..392029287083 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -418,8 +418,7 @@ int kdb_set(int argc, const char **argv)
 				    argv[2]);
 			return 0;
 		}
-		kdb_flags = (kdb_flags &
-			     ~(KDB_DEBUG_FLAG_MASK << KDB_DEBUG_FLAG_SHIFT))
+		kdb_flags = (kdb_flags & ~KDB_DEBUG(MASK))
 			| (debugflags << KDB_DEBUG_FLAG_SHIFT);
 
 		return 0;
@@ -2081,7 +2080,8 @@ static int kdb_env(int argc, const char **argv)
 	}
 
 	if (KDB_DEBUG(MASK))
-		kdb_printf("KDBFLAGS=0x%x\n", kdb_flags);
+		kdb_printf("KDBDEBUG=0x%x\n",
+			(kdb_flags & KDB_DEBUG(MASK)) >> KDB_DEBUG_FLAG_SHIFT);
 
 	return 0;
 }
-- 
2.17.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
