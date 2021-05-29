Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C176D396EAB
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  1 Jun 2021 10:17:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lnzaP-0003xv-Nt
	for lists+kgdb-bugreport@lfdr.de; Tue, 01 Jun 2021 08:17:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <thunder.leizhen@huawei.com>) id 1lmwkv-0000NI-3o
 for kgdb-bugreport@lists.sourceforge.net; Sat, 29 May 2021 11:03:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kUVwF+Disv2rEE2VNvj8nETFhSWsHEskgqal5y3exQw=; b=Z+IYAK/eCUuWJHSvYplUthGHkd
 xdGd/C+9DseTczq+b2RTJgFch3OQjklskgfPpf5XBpCBpatHbnXjTlmEYr4HXo1RePMAIgN0dno3D
 VNepFTcf98/tuqM/l1s3LEJX3PgZbUb4cBtW9UmqMyLWxonwCSC0URdAgKnSEAsoNDfw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kUVwF+Disv2rEE2VNvj8nETFhSWsHEskgqal5y3exQw=; b=MBERVM4loAgeavxWzQckBDIrOW
 usvkA3ci2tawvRwTBXOnDZLxeeBUGCHjgP2FoT4e4bYsmgIHOOamsTcu7aOAChUBXtap21dsiz5TO
 wLxkdjOSa4Z8GgP5ZYSblyUw+IAKalrVTdiFCI9QJoAjqLNM1TTZABmkWx74gKWjJtLs=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lmwkk-001xnn-RB
 for kgdb-bugreport@lists.sourceforge.net; Sat, 29 May 2021 11:03:50 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Fsdrc52VhzYrY7;
 Sat, 29 May 2021 19:00:48 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 29 May 2021 19:03:26 +0800
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 29 May 2021 19:03:25 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Jason Wessel <jason.wessel@windriver.com>, Daniel Thompson
 <daniel.thompson@linaro.org>, Douglas Anderson <dianders@chromium.org>,
 Balbir Singh <bsingharora@gmail.com>, Barry Song
 <song.bao.hua@hisilicon.com>, Christoph Hellwig <hch@lst.de>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra
 <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, Davidlohr Bueso
 <dave@stgolabs.net>, Eric Biederman <ebiederm@xmission.com>, "Naveen N . Rao"
 <naveen.n.rao@linux.ibm.com>, Anil S Keshavamurthy
 <anil.s.keshavamurthy@intel.com>, "David S . Miller" <davem@davemloft.net>,
 Masami Hiramatsu <mhiramat@kernel.org>, Jessica Yu <jeyu@kernel.org>,
 "Steffen Klassert" <steffen.klassert@secunet.com>, Daniel Jordan
 <daniel.m.jordan@oracle.com>, Oleg Nesterov <oleg@redhat.com>, John Stultz
 <john.stultz@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Luis Chamberlain
 <mcgrof@kernel.org>, Tejun Heo <tj@kernel.org>, Lai Jiangshan
 <jiangshanlai@gmail.com>, kgdb-bugreport
 <kgdb-bugreport@lists.sourceforge.net>, kexec <kexec@lists.infradead.org>,
 linux-crypto <linux-crypto@vger.kernel.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Date: Sat, 29 May 2021 19:03:02 +0800
Message-ID: <20210529110305.9446-2-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20210529110305.9446-1-thunder.leizhen@huawei.com>
References: <20210529110305.9446-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.177.72]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1lmwkk-001xnn-RB
X-Mailman-Approved-At: Tue, 01 Jun 2021 08:17:15 +0000
Subject: [Kgdb-bugreport] [PATCH v2 1/4] kprobes: Fix spelling mistakes
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
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Fix some spelling mistakes in comments:
decrese ==> decrease
immmediately ==> immediately

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 include/linux/freelist.h | 2 +-
 kernel/kprobes.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/freelist.h b/include/linux/freelist.h
index fc1842b96469..1811c1f3f8cb 100644
--- a/include/linux/freelist.h
+++ b/include/linux/freelist.h
@@ -39,7 +39,7 @@ static inline void __freelist_add(struct freelist_node *node, struct freelist_he
 	 * and a refcount increment of a node in try_get, then back up to
 	 * something non-zero, then the refcount increment is done by the other
 	 * thread) -- so if the CAS to add the node to the actual list fails,
-	 * decrese the refcount and leave the add operation to the next thread
+	 * decrease the refcount and leave the add operation to the next thread
 	 * who puts the refcount back to zero (which could be us, hence the
 	 * loop).
 	 */
diff --git a/kernel/kprobes.c b/kernel/kprobes.c
index 8c0a6fdef771..d4156082d5a5 100644
--- a/kernel/kprobes.c
+++ b/kernel/kprobes.c
@@ -641,7 +641,7 @@ void wait_for_kprobe_optimizer(void)
 	while (!list_empty(&optimizing_list) || !list_empty(&unoptimizing_list)) {
 		mutex_unlock(&kprobe_mutex);
 
-		/* this will also make optimizing_work execute immmediately */
+		/* this will also make optimizing_work execute immediately */
 		flush_delayed_work(&optimizing_work);
 		/* @optimizing_work might not have been queued yet, relax */
 		cpu_relax();
-- 
2.25.1




_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
