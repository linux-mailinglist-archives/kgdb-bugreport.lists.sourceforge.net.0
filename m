Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D06465EA8C
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  3 Jul 2019 19:35:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hijAW-0002Wj-Jj
	for lists+kgdb-bugreport@lfdr.de; Wed, 03 Jul 2019 17:35:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1hijAU-0002Wa-Rc
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Jul 2019 17:35:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+UmPDjs3GC5y05O+oZrqETNtB8YeU/EW2F2rKy6gZYM=; b=hvI6uyMy9shBZQvHl950cXeV7+
 KSAoZYQRU2x3u/gOgqcgTiGC4M5sfdgQDT7ZrtP8m6Way6EKXYiDQ7H1Xb+JSjLS4X/99lQ8De/Kc
 9y1f8c2rKJlNCnbYa9xxCTHLR9gzMN+qTgUx5LE1e8sdSnOAx52zVaS1wACc9kJDjucc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=+UmPDjs3GC5y05O+oZrqETNtB8YeU/EW2F2rKy6gZYM=; b=N
 62mast9qifToAzv7aV4fuVJO6wIX6wQ7fEUCfCkmVlgztsmGjlKlE6ov9b/8UWc4w/JSTPaw+JNMp
 8rfeC6wVIXoeLobb/iGMSh6vBYGUUsZetkNHDo/rjld1XOM/xF3AMBDQxQXU6HItxVbhvUDR6C6Bs
 GKMSpdI9p3qx0lQc=;
Received: from mail-pf1-f194.google.com ([209.85.210.194])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hijAd-006Ytk-9B
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Jul 2019 17:35:52 +0000
Received: by mail-pf1-f194.google.com with SMTP id t16so1604252pfe.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 03 Jul 2019 10:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+UmPDjs3GC5y05O+oZrqETNtB8YeU/EW2F2rKy6gZYM=;
 b=CE+SFJ51m98HEAk8kgNmqvYvCWofjk5rGAhF3Elt5bcDGLdmEcucHq00QvIjP89zrX
 hu148gAghEBmxJ8NsPimHOa/aT1biE8OaAaFKWjfHLSqUHAzBkeRx6BhbS7YLKY+XI5s
 Zz9C4shehSMwv2zep4uH9Lx2318mHw/flZj+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+UmPDjs3GC5y05O+oZrqETNtB8YeU/EW2F2rKy6gZYM=;
 b=NyKGLEq1HwU+RGSWmrJvOIvGdb4ynutEjGCX5LQjnHBBp10xE8+gUe5vzfoMwOJYpl
 vx1gkEbbnUkpl9ahIprno3fLE6RoddSHmtjDBjAnkTdKW+eTovw/F1MlF/ONEPTbwLNx
 8iE9sL6baapA3kpXM/R7bFjSxruTXBxNehvPgpIKTTMjEK3Z4QkdKNh+nPvsGyUy1IP/
 quMwEVWs92QZb7uEFZb4t7CUyqwguQ8M5QHyvedZGwkmSGDC67dJMMzP0CETqSM/iiNp
 pRNI1DnwLQ52sxUS8XCXN8UwkODcu5iMJx5Wtxdi3AHs4BCLccjn7xyBx/ZzZd1Gk5/X
 xmqA==
X-Gm-Message-State: APjAAAUSpbB8qm28GjxNHWL3cCGo9mNuIeTQ13BDtnuNCF0uMrSNNilN
 NG70r8FEA3hME+AR3bn/ysOUbQncW4o=
X-Google-Smtp-Source: APXvYqxX1K1OeKVXQOBcW9auPYZkXDcwye8GnP0TxTOWeq4hZJnaeE2iK6rzD5yBrEYcFe8IYYAFqQ==
X-Received: by 2002:a63:6c04:: with SMTP id h4mr7204915pgc.94.1562173486714;
 Wed, 03 Jul 2019 10:04:46 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id u75sm2767289pgb.92.2019.07.03.10.04.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 10:04:46 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>
Date: Wed,  3 Jul 2019 10:03:54 -0700
Message-Id: <20190703170354.217312-1-dianders@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.194 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hijAd-006Ytk-9B
Subject: [Kgdb-bugreport] [PATCH] kgdb: Don't use a notifier to enter kgdb
 at panic; call directly
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
Cc: Feng Tang <feng.tang@intel.com>, Kees Cook <keescook@chromium.org>,
 kgdb-bugreport@lists.sourceforge.net, YueHaibing <yuehaibing@huawei.com>,
 Douglas Anderson <dianders@chromium.org>,
 "Steven Rostedt \(VMware\)" <rostedt@goodmis.org>,
 linux-kernel@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@suse.de>,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Right now kgdb/kdb hooks up to debug panics by registering for the
panic notifier.  This works OK except that it means that kgdb/kdb gets
called _after_ the CPUs in the system are taken offline.  That means
that if anything important was happening on those CPUs (like something
that might have contributed to the panic) you can't debug them.

Specifically I ran into a case where I got a panic because a task was
"blocked for more than 120 seconds" which was detected on CPU 2.  I
nicely got shown stack traces in the kernel log for all CPUs including
CPU 0, which was running 'PID: 111 Comm: kworker/0:1H' and was in the
middle of __mmc_switch().

I then ended up at the kdb prompt where switched over to kgdb to try
to look at local variables of the process on CPU 0.  I found that I
couldn't.  Digging more, I found that I had no info on any tasks
running on CPUs other than CPU 2 and that asking kdb for help showed
me "Error: no saved data for this cpu".  This was because all the CPUs
were offline.

Let's move the entry of kdb/kgdb to a direct call from panic() and
stop using the generic notifier.  Putting a direct call in allows us
to order things more properly and it also doesn't seem like we're
breaking any abstractions by calling into the debugger from the panic
function.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 include/linux/kgdb.h      |  2 ++
 kernel/debug/debug_core.c | 31 +++++++++++--------------------
 kernel/panic.c            |  8 ++++++++
 3 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
index fbf144aaa749..b072aeb1fd78 100644
--- a/include/linux/kgdb.h
+++ b/include/linux/kgdb.h
@@ -326,8 +326,10 @@ extern atomic_t			kgdb_active;
 	(raw_smp_processor_id() == atomic_read(&kgdb_active))
 extern bool dbg_is_early;
 extern void __init dbg_late_init(void);
+extern void kgdb_panic(const char *msg);
 #else /* ! CONFIG_KGDB */
 #define in_dbg_master() (0)
 #define dbg_late_init()
+static inline void kgdb_panic(const char *msg) {}
 #endif /* ! CONFIG_KGDB */
 #endif /* _KGDB_H_ */
diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 5cc608de6883..b26bf06cff9e 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -896,30 +896,25 @@ static struct sysrq_key_op sysrq_dbg_op = {
 };
 #endif
 
-static int kgdb_panic_event(struct notifier_block *self,
-			    unsigned long val,
-			    void *data)
+void kgdb_panic(const char *msg)
 {
+	if (!kgdb_io_module_registered)
+		return;
+
 	/*
-	 * Avoid entering the debugger if we were triggered due to a panic
-	 * We don't want to get stuck waiting for input from user in such case.
-	 * panic_timeout indicates the system should automatically
+	 * We don't want to get stuck waiting for input from user if
+	 * "panic_timeout" indicates the system should automatically
 	 * reboot on panic.
 	 */
 	if (panic_timeout)
-		return NOTIFY_DONE;
+		return;
 
 	if (dbg_kdb_mode)
-		kdb_printf("PANIC: %s\n", (char *)data);
+		kdb_printf("PANIC: %s\n", msg);
+
 	kgdb_breakpoint();
-	return NOTIFY_DONE;
 }
 
-static struct notifier_block kgdb_panic_event_nb = {
-       .notifier_call	= kgdb_panic_event,
-       .priority	= INT_MAX,
-};
-
 void __weak kgdb_arch_late(void)
 {
 }
@@ -968,8 +963,6 @@ static void kgdb_register_callbacks(void)
 			kgdb_arch_late();
 		register_module_notifier(&dbg_module_load_nb);
 		register_reboot_notifier(&dbg_reboot_notifier);
-		atomic_notifier_chain_register(&panic_notifier_list,
-					       &kgdb_panic_event_nb);
 #ifdef CONFIG_MAGIC_SYSRQ
 		register_sysrq_key('g', &sysrq_dbg_op);
 #endif
@@ -983,16 +976,14 @@ static void kgdb_register_callbacks(void)
 static void kgdb_unregister_callbacks(void)
 {
 	/*
-	 * When this routine is called KGDB should unregister from the
-	 * panic handler and clean up, making sure it is not handling any
+	 * When this routine is called KGDB should unregister from
+	 * handlers and clean up, making sure it is not handling any
 	 * break exceptions at the time.
 	 */
 	if (kgdb_io_module_registered) {
 		kgdb_io_module_registered = 0;
 		unregister_reboot_notifier(&dbg_reboot_notifier);
 		unregister_module_notifier(&dbg_module_load_nb);
-		atomic_notifier_chain_unregister(&panic_notifier_list,
-					       &kgdb_panic_event_nb);
 		kgdb_arch_exit();
 #ifdef CONFIG_MAGIC_SYSRQ
 		unregister_sysrq_key('g', &sysrq_dbg_op);
diff --git a/kernel/panic.c b/kernel/panic.c
index 4d9f55bf7d38..e2971168b059 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -12,6 +12,7 @@
 #include <linux/debug_locks.h>
 #include <linux/sched/debug.h>
 #include <linux/interrupt.h>
+#include <linux/kgdb.h>
 #include <linux/kmsg_dump.h>
 #include <linux/kallsyms.h>
 #include <linux/notifier.h>
@@ -219,6 +220,13 @@ void panic(const char *fmt, ...)
 		dump_stack();
 #endif
 
+	/*
+	 * If kgdb is enabled, give it a chance to run before we stop all
+	 * the other CPUs or else we won't be able to debug processes left
+	 * running on them.
+	 */
+	kgdb_panic(buf);
+
 	/*
 	 * If we have crashed and we have a crash kernel loaded let it handle
 	 * everything else.
-- 
2.22.0.410.gd8fdbe21b5-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
