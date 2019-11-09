Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 68092F6139
	for <lists+kgdb-bugreport@lfdr.de>; Sat,  9 Nov 2019 20:46:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iTWgj-0004hH-9E
	for lists+kgdb-bugreport@lfdr.de; Sat, 09 Nov 2019 19:46:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1iTWgi-0004hA-9E
 for kgdb-bugreport@lists.sourceforge.net; Sat, 09 Nov 2019 19:46:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FDlNx6EGMrp3vN/hMVd1kyT0CxIKEbIPYjtFrXlWFSw=; b=bhq2CoDA1QdTdUKij4ZcGmRFmj
 A4lY4r81OxOjOQpsQSW165cxUrKdB1hOPAxiPrGtx3ozzUnscta31dpLp2vn3w5cewDcxvSbfQNv/
 dMJR7TZI0grsyNiuIvtb4fTY4s42u97g0G/TWHOTlxfHQ7FfyAkISmHuLpfLwjecMf9Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FDlNx6EGMrp3vN/hMVd1kyT0CxIKEbIPYjtFrXlWFSw=; b=RnTF4cesP6tzrAv98efQEzhEtg
 49k+yCXqugKECRzpTl3KAgUGW+Vl8J+pjxLQ+sdG1Hjas1F+JyPjVmCpYw3/+mNVXIwAbPqBl9ft2
 0F6Xs+Ot8WDISL3b7xsV1940cO+7QFsNUh+2C6kjd2Y6c0iSakJU97mPo1g6kRNtIuN8=;
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iTWgg-009qdl-Fg
 for kgdb-bugreport@lists.sourceforge.net; Sat, 09 Nov 2019 19:46:24 +0000
Received: by mail-io1-f66.google.com with SMTP id i13so8647627ioj.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sat, 09 Nov 2019 11:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FDlNx6EGMrp3vN/hMVd1kyT0CxIKEbIPYjtFrXlWFSw=;
 b=ZzFmB7sQK3gNmFEeDI9qpvLvJ1+N05YxWvEuumFV/BcGrWe9iFzRin5aqvjGTKaR9P
 jqm9KQ+kCcE6UAOTUuZCEzJ1Y28Zql+YlERBbd4b1VaF/hxXwZxAYXfL49v/4yFpClf7
 JONMJc6wtb1wy2WdlfJr4HYyIBX2UU49UcKYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FDlNx6EGMrp3vN/hMVd1kyT0CxIKEbIPYjtFrXlWFSw=;
 b=q9snY96lbQpJVrrIF1OgO4HUJSgSe/P+IglZPTrQv0KjZcyDiavzpb46qMO5/iacIQ
 AoeoTUqW8xdR+HB6Lgda3spHEzHtNqk11P+9Ab5lUt5CCWBCgSnXvA9Fp5ti3leMDeFm
 A2i/zPuevT7ytE9RU6FNpYA41cAeeDC7BFVNXVcgg+TnPOYEEMcJZTZO0/xENLFEXmJK
 ETSaxuA4zfhDWDmB4Q/NMkZMOtPgi5mfgyCiP6BiJYYsfIvmetuQS8gAWfRzPENpOwdS
 1jDu13L+0rXuMMJp/KhrFa2asQdZOTrNfwT/xuH82UyI0w+KPAXUc5dv31dppATl59nh
 jOVA==
X-Gm-Message-State: APjAAAWtr9CL41NnewNN88wZ2C+qfEMgip5ugrkIw6jbJs/nof2m97Q3
 Yv2CcwO162D30NtZNQ9CTJhJqJhXSHo=
X-Google-Smtp-Source: APXvYqylPzIZ+Djw1JoI0Ai9UaxOOYX4sETzbck6F8sybWeqW/bp7Rd3HddEPdVW3U7hfLf/l1vWvw==
X-Received: by 2002:a63:7c10:: with SMTP id x16mr19430535pgc.176.1573327072998; 
 Sat, 09 Nov 2019 11:17:52 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id i11sm9193577pgd.7.2019.11.09.11.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2019 11:17:52 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Paul Burton <paul.burton@mips.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>
Date: Sat,  9 Nov 2019 11:16:43 -0800
Message-Id: <20191109111624.4.Ibc3d982bbeb9e46872d43973ba808cd4c79537c7@changeid>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
In-Reply-To: <20191109191644.191766-1-dianders@chromium.org>
References: <20191109191644.191766-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.66 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.66 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iTWgg-009qdl-Fg
Subject: [Kgdb-bugreport] [PATCH 4/5] kdb: Gid rid of implicit setting of
 the current task / regs
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
Cc: qiaochong@loongson.cn, Christophe Leroy <christophe.leroy@c-s.fr>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 kgdb-bugreport@lists.sourceforge.net, Prarit Bhargava <prarit@redhat.com>,
 Chuhong Yuan <hslester96@gmail.com>, ralf@linux-mips.org,
 linux-kernel@vger.kernel.org, Nicholas Mc Guire <hofrat@osadl.org>,
 Will Deacon <will@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Some (but not all?) of the kdb backtrace paths would cause the
kdb_current_task and kdb_current_regs to remain changed.  As discussed
in a review of a previous patch [1], this doesn't seem intuitive, so
let's fix that.

...but, it turns out that there's actually no longer any reason to set
the current task / current regs while backtracing anymore anyway.  As
of commit 2277b492582d ("kdb: Fix stack crawling on 'running' CPUs
that aren't the master") if we're backtracing on a task running on a
CPU we ask that CPU to do the backtrace itself.  Linux can do that
without anything fancy.  If we're doing backtrace on a sleeping task
we can also do that fine without updating globals.  So this patch
mostly just turns into deleting a bunch of code.

[1] https://lore.kernel.org/r/20191010150735.dhrj3pbjgmjrdpwr@holly.lan

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 kernel/debug/kdb/kdb_bt.c      | 8 +-------
 kernel/debug/kdb/kdb_main.c    | 2 +-
 kernel/debug/kdb/kdb_private.h | 1 -
 3 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/kernel/debug/kdb/kdb_bt.c b/kernel/debug/kdb/kdb_bt.c
index 4af48ac53625..3de0cc780c16 100644
--- a/kernel/debug/kdb/kdb_bt.c
+++ b/kernel/debug/kdb/kdb_bt.c
@@ -119,7 +119,6 @@ kdb_bt_cpu(unsigned long cpu)
 		return;
 	}
 
-	kdb_set_current_task(kdb_tsk);
 	kdb_bt1(kdb_tsk, ~0UL, false);
 }
 
@@ -166,10 +165,8 @@ kdb_bt(int argc, const char **argv)
 		if (diag)
 			return diag;
 		p = find_task_by_pid_ns(pid, &init_pid_ns);
-		if (p) {
-			kdb_set_current_task(p);
+		if (p)
 			return kdb_bt1(p, ~0UL, false);
-		}
 		kdb_printf("No process with pid == %ld found\n", pid);
 		return 0;
 	} else if (strcmp(argv[0], "btt") == 0) {
@@ -178,11 +175,9 @@ kdb_bt(int argc, const char **argv)
 		diag = kdbgetularg((char *)argv[1], &addr);
 		if (diag)
 			return diag;
-		kdb_set_current_task((struct task_struct *)addr);
 		return kdb_bt1((struct task_struct *)addr, ~0UL, false);
 	} else if (strcmp(argv[0], "btc") == 0) {
 		unsigned long cpu = ~0;
-		struct task_struct *save_current_task = kdb_current_task;
 		if (argc > 1)
 			return KDB_ARGCOUNT;
 		if (argc == 1) {
@@ -204,7 +199,6 @@ kdb_bt(int argc, const char **argv)
 				kdb_bt_cpu(cpu);
 				touch_nmi_watchdog();
 			}
-			kdb_set_current_task(save_current_task);
 		}
 		return 0;
 	} else {
diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 4d44b3746836..ba12e9f4661e 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -1138,7 +1138,7 @@ static void kdb_dumpregs(struct pt_regs *regs)
 	console_loglevel = old_lvl;
 }
 
-void kdb_set_current_task(struct task_struct *p)
+static void kdb_set_current_task(struct task_struct *p)
 {
 	kdb_current_task = p;
 
diff --git a/kernel/debug/kdb/kdb_private.h b/kernel/debug/kdb/kdb_private.h
index e829b22f3946..2e296e4a234c 100644
--- a/kernel/debug/kdb/kdb_private.h
+++ b/kernel/debug/kdb/kdb_private.h
@@ -240,7 +240,6 @@ extern void *debug_kmalloc(size_t size, gfp_t flags);
 extern void debug_kfree(void *);
 extern void debug_kusage(void);
 
-extern void kdb_set_current_task(struct task_struct *);
 extern struct task_struct *kdb_current_task;
 extern struct pt_regs *kdb_current_regs;
 
-- 
2.24.0.432.g9d3f5f5b63-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
