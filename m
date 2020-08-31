Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E2F25C26A
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  3 Sep 2020 16:24:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kDqAL-0005Ec-SA
	for lists+kgdb-bugreport@lfdr.de; Thu, 03 Sep 2020 14:24:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dave@stgolabs.net>) id 1kCq1v-0003bZ-Tf
 for kgdb-bugreport@lists.sourceforge.net; Mon, 31 Aug 2020 20:03:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7lH1hbgMpToYcQR9PcjGIN1b09Stxu9g1DJ+UbRlGQI=; b=k5KkZmbqTpmF/Hn+8ZgvWY0KDb
 YsCKDj4+pcZHvEcFS07xiuE/mAhhE3nwRyPfcCKg4XLJ/cKnCMqP4DNE5Hw6eLmneFhYOAPKJNaDa
 a3Qmxv8DZdiLR4KIvuY3rYIIYibdKLEtnfhyq4PeHQnQRhuUfAzjZsE8EbdGPgXNY2Io=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7lH1hbgMpToYcQR9PcjGIN1b09Stxu9g1DJ+UbRlGQI=; b=U
 A3HRrqwvypp4Tfdp3dzFrHC1StcG61ayrJFmVVySlzghzeZnbT6mMCUIj0dmj1OFzvoYvwj2jtsYS
 5A/TDq/ZFEiZGR3mF5JAne1UCeYQwrlmR7qYrXFTiFE5r+RiRKgyMwtrcfC5rfmX5OiErO6IqBMq4
 jBUvVHkj4VmRqso0=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kCq1t-006tr1-OR
 for kgdb-bugreport@lists.sourceforge.net; Mon, 31 Aug 2020 20:03:51 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8E676B7F1;
 Mon, 31 Aug 2020 19:50:06 +0000 (UTC)
From: Davidlohr Bueso <dave@stgolabs.net>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 dianders@chromium.org
Date: Mon, 31 Aug 2020 12:34:35 -0700
Message-Id: <20200831193435.22141-1-dave@stgolabs.net>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 1.0 SPF_SOFTFAIL           SPF: sender does not match SPF record (softfail)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kCq1t-006tr1-OR
X-Mailman-Approved-At: Thu, 03 Sep 2020 14:24:40 +0000
Subject: [Kgdb-bugreport] [PATCH -next] kdb: Use newer api for tasklist
 scanning
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
Cc: Davidlohr Bueso <dbueso@suse.de>, kgdb-bugreport@lists.sourceforge.net,
 dave@stgolabs.net, oleg@redhat.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

This kills the custom kdb_do_each_thread/kdb_while_each_thread
calls used in kdb to iterate through all tasks. It is obsolete
and racy to use tsk->thread_group, although in this particular
case there is no concurrency so it doesn't matter. Still, lets
trivially replace it for the newer one, maintaining semantics,
of course.

Signed-off-by: Davidlohr Bueso <dbueso@suse.de>
---
 kernel/debug/kdb/kdb_bt.c      | 4 ++--
 kernel/debug/kdb/kdb_main.c    | 8 ++++----
 kernel/debug/kdb/kdb_private.h | 4 ----
 3 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/kernel/debug/kdb/kdb_bt.c b/kernel/debug/kdb/kdb_bt.c
index 18e03aba2cfc..1f9f0e47aeda 100644
--- a/kernel/debug/kdb/kdb_bt.c
+++ b/kernel/debug/kdb/kdb_bt.c
@@ -149,14 +149,14 @@ kdb_bt(int argc, const char **argv)
 				return 0;
 		}
 		/* Now the inactive tasks */
-		kdb_do_each_thread(g, p) {
+		for_each_process_thread(g, p) {
 			if (KDB_FLAG(CMD_INTERRUPT))
 				return 0;
 			if (task_curr(p))
 				continue;
 			if (kdb_bt1(p, mask, btaprompt))
 				return 0;
-		} kdb_while_each_thread(g, p);
+		}
 	} else if (strcmp(argv[0], "btp") == 0) {
 		struct task_struct *p;
 		unsigned long pid;
diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 5c7949061671..930ac1b25ec7 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -2299,10 +2299,10 @@ void kdb_ps_suppressed(void)
 		if (kdb_task_state(p, mask_I))
 			++idle;
 	}
-	kdb_do_each_thread(g, p) {
+	for_each_process_thread(g, p) {
 		if (kdb_task_state(p, mask_M))
 			++daemon;
-	} kdb_while_each_thread(g, p);
+	}
 	if (idle || daemon) {
 		if (idle)
 			kdb_printf("%d idle process%s (state I)%s\n",
@@ -2370,12 +2370,12 @@ static int kdb_ps(int argc, const char **argv)
 	}
 	kdb_printf("\n");
 	/* Now the real tasks */
-	kdb_do_each_thread(g, p) {
+	for_each_process_thread(g, p) {
 		if (KDB_FLAG(CMD_INTERRUPT))
 			return 0;
 		if (kdb_task_state(p, mask))
 			kdb_ps1(p);
-	} kdb_while_each_thread(g, p);
+	}
 
 	return 0;
 }
diff --git a/kernel/debug/kdb/kdb_private.h b/kernel/debug/kdb/kdb_private.h
index 2e296e4a234c..a4281fb99299 100644
--- a/kernel/debug/kdb/kdb_private.h
+++ b/kernel/debug/kdb/kdb_private.h
@@ -230,10 +230,6 @@ extern struct task_struct *kdb_curr_task(int);
 
 #define kdb_task_has_cpu(p) (task_curr(p))
 
-/* Simplify coexistence with NPTL */
-#define	kdb_do_each_thread(g, p) do_each_thread(g, p)
-#define	kdb_while_each_thread(g, p) while_each_thread(g, p)
-
 #define GFP_KDB (in_interrupt() ? GFP_ATOMIC : GFP_KERNEL)
 
 extern void *debug_kmalloc(size_t size, gfp_t flags);
-- 
2.26.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
