Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC382F6F85
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 15 Jan 2021 01:33:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l0D3o-0002CZ-RM
	for lists+kgdb-bugreport@lfdr.de; Fri, 15 Jan 2021 00:33:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dave@stgolabs.net>) id 1l0D3n-0002CS-Cp
 for kgdb-bugreport@lists.sourceforge.net; Fri, 15 Jan 2021 00:33:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0sL6vMUX5T8yV3WE57C2FZnx/fqs6zyPG8qWqSpnIzU=; b=P7QzASM5QXt6tHgOIfKPGlesCm
 dfoZmBUtkOahvGlqD+gv3M2a43goX/4htn8HJzJ9BaqFR/t/b6qjnM5yr5u+OGrm6NkGJdFuQlHmZ
 o1UW1ttJxgNtjT91ATm/zpOxCoTl4vLcpvYXc0wEzZeDoRmNyzmWfbH49vYjPOPMJFM8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0sL6vMUX5T8yV3WE57C2FZnx/fqs6zyPG8qWqSpnIzU=; b=M
 fGF8J2b9H1YtK3fx1YuTgdAPCTBsh5eNOiREMF+tK6LwGZq9i/T+z9nlmyEwJ7PEJPcCaaOTDY9sd
 uuRN4LcMD7BYh+uHzWOqLFx8rp4tvIYdHuIvg6UnBur+l8mbgMnXn2BETnunyKlVju6FYphdqXCzK
 bGfCxBHWIOYmfeWE=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l0D3c-00CVUY-Mi
 for kgdb-bugreport@lists.sourceforge.net; Fri, 15 Jan 2021 00:33:51 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D0993AC24;
 Fri, 15 Jan 2021 00:13:51 +0000 (UTC)
From: Davidlohr Bueso <dave@stgolabs.net>
To: jason.wessel@windriver.com
Date: Thu, 14 Jan 2021 16:13:44 -0800
Message-Id: <20210115001344.117108-1-dave@stgolabs.net>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.de]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 1.0 SPF_SOFTFAIL           SPF: sender does not match SPF record (softfail)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1l0D3c-00CVUY-Mi
Subject: [Kgdb-bugreport] [PATCH] kgdb: Schedule breakpoints via workqueue
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
Cc: kgdb-bugreport@lists.sourceforge.net, daniel.thompson@linaro.org,
 dave@stgolabs.net, linux-kernel@vger.kernel.org,
 Davidlohr Bueso <dbueso@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

The original functionality was added back in:

    1cee5e35f15 (kgdb: Add the ability to schedule a breakpoint via a tasklet)

However tasklets have long been deprecated as being too heavy on
the system by running in irq context - and this is not a performance
critical path. If a higher priority process wants to run, it must
wait for the tasklet to finish before doing so. Instead, generate
the breakpoint exception in process context.

Signed-off-by: Davidlohr Bueso <dbueso@suse.de>
---
Compile-tested only.

 kernel/debug/debug_core.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index af6e8b4fb359..e1ff974c6b6f 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -119,7 +119,7 @@ static DEFINE_RAW_SPINLOCK(dbg_slave_lock);
  */
 static atomic_t			masters_in_kgdb;
 static atomic_t			slaves_in_kgdb;
-static atomic_t			kgdb_break_tasklet_var;
+static atomic_t			kgdb_break_work_var;
 atomic_t			kgdb_setting_breakpoint;
 
 struct task_struct		*kgdb_usethread;
@@ -1085,27 +1085,27 @@ static void kgdb_unregister_callbacks(void)
 }
 
 /*
- * There are times a tasklet needs to be used vs a compiled in
+ * There are times a workqueue needs to be used vs a compiled in
  * break point so as to cause an exception outside a kgdb I/O module,
  * such as is the case with kgdboe, where calling a breakpoint in the
  * I/O driver itself would be fatal.
  */
-static void kgdb_tasklet_bpt(unsigned long ing)
+static void kgdb_work_bpt(struct work_struct *unused)
 {
 	kgdb_breakpoint();
-	atomic_set(&kgdb_break_tasklet_var, 0);
+	atomic_set(&kgdb_break_work_var, 0);
 }
 
-static DECLARE_TASKLET_OLD(kgdb_tasklet_breakpoint, kgdb_tasklet_bpt);
+static DECLARE_WORK(kgdb_async_breakpoint, kgdb_work_bpt);
 
 void kgdb_schedule_breakpoint(void)
 {
-	if (atomic_read(&kgdb_break_tasklet_var) ||
+	if (atomic_read(&kgdb_break_work_var) ||
 		atomic_read(&kgdb_active) != -1 ||
 		atomic_read(&kgdb_setting_breakpoint))
 		return;
-	atomic_inc(&kgdb_break_tasklet_var);
-	tasklet_schedule(&kgdb_tasklet_breakpoint);
+	atomic_inc(&kgdb_break_work_var);
+	schedule_work(&kgdb_async_breakpoint);
 }
 EXPORT_SYMBOL_GPL(kgdb_schedule_breakpoint);
 
-- 
2.26.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
