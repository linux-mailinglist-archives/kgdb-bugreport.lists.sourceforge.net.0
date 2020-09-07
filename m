Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D30442605F2
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Sep 2020 22:48:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kFO4G-0004HH-LT
	for lists+kgdb-bugreport@lfdr.de; Mon, 07 Sep 2020 20:48:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dave@stgolabs.net>) id 1kFO4F-0004H7-4Z
 for kgdb-bugreport@lists.sourceforge.net; Mon, 07 Sep 2020 20:48:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E44+w+yzk1Ubc17VEwXd1BxRaS+mvz0ETz+3pUqYHZk=; b=S/wzzgjdw9Pbphw9XVgSsccR2j
 Zg0N4++bwW5qHPCcXRLWOtszOx6JjfhHKVTACWTqDELacZ1NGyl9xObIreaiGDd54mjvagPaSf1i4
 VH/KnGtBDGPq1nJC34BGpNQisaXds3XZtIF0+zgKRezM45K9syt6i8yKME8YguL4qM0I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E44+w+yzk1Ubc17VEwXd1BxRaS+mvz0ETz+3pUqYHZk=; b=HjnJR1fDe6aEgJbU+r+KJ/e/R5
 4XqQSjbFXiEpSHD2m4oEEyWCng7c+GeEy1VtSRyhnH0FGARgzNfoAHDPzCTiRi4KTmKNtTAtzOKHf
 JNY1IZm3k/XoE8cWPFiQzydR5Ki8YCs7wwtMUhUoD/Sjze1NRpjphObMG6EOp9GoPpj8=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kFO4D-00GA7o-68
 for kgdb-bugreport@lists.sourceforge.net; Mon, 07 Sep 2020 20:48:47 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AAACFAC95;
 Mon,  7 Sep 2020 20:48:39 +0000 (UTC)
From: Davidlohr Bueso <dave@stgolabs.net>
To: daniel.thompson@linaro.org
Date: Mon,  7 Sep 2020 13:32:06 -0700
Message-Id: <20200907203206.21293-1-dave@stgolabs.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200907134614.guc4tzj3knnihbe4@holly.lan>
References: <20200907134614.guc4tzj3knnihbe4@holly.lan>
MIME-Version: 1.0
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 1.0 SPF_SOFTFAIL           SPF: sender does not match SPF record (softfail)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kFO4D-00GA7o-68
Subject: [Kgdb-bugreport] [PATCH v2] kdb: Use newer api for tasklist scanning
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
Cc: Davidlohr Bueso <dave@stgolabs.net>, Davidlohr Bueso <dbueso@suse.de>,
 kgdb-bugreport@lists.sourceforge.net, oleg@redhat.com,
 jason.wessel@windriver.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

This kills using the do_each_thread/while_each_thread combo to
iterate all threads and uses for_each_process_thread() instead,
maintaining semantics. while_each_thread() is ultimately racy
and deprecated;  although in this particular case there is no
concurrency so it doesn't matter. Still lets trivially get rid
of two more users.

Acked-by: Oleg Nesterov <oleg@redhat.com>
Signed-off-by: Davidlohr Bueso <dbueso@suse.de>
---
 kernel/debug/gdbstub.c         | 4 ++--
 kernel/debug/kdb/kdb_bt.c      | 4 ++--
 kernel/debug/kdb/kdb_main.c    | 8 ++++----
 kernel/debug/kdb/kdb_private.h | 4 ----
 4 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/kernel/debug/gdbstub.c b/kernel/debug/gdbstub.c
index cc3c43dfec44..b52ebff09ac8 100644
--- a/kernel/debug/gdbstub.c
+++ b/kernel/debug/gdbstub.c
@@ -725,7 +725,7 @@ static void gdb_cmd_query(struct kgdb_state *ks)
 			}
 		}
 
-		do_each_thread(g, p) {
+		for_each_process_thread(g, p) {
 			if (i >= ks->thr_query && !finished) {
 				int_to_threadref(thref, p->pid);
 				ptr = pack_threadid(ptr, thref);
@@ -735,7 +735,7 @@ static void gdb_cmd_query(struct kgdb_state *ks)
 					finished = 1;
 			}
 			i++;
-		} while_each_thread(g, p);
+		}
 
 		*(--ptr) = '\0';
 		break;
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
