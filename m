Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E98F249A58
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 19 Aug 2020 12:28:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k8LKz-0007wr-Ol
	for lists+kgdb-bugreport@lfdr.de; Wed, 19 Aug 2020 10:28:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <christian.brauner@ubuntu.com>) id 1k85sK-0001CR-Dq
 for kgdb-bugreport@lists.sourceforge.net; Tue, 18 Aug 2020 17:58:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oTF2sime/4sFHm86GW4LAHbLNaXPgKmERYCEldjDxcM=; b=fznniWcKb+RwUq+W4X+QiAeSmR
 JwDbr94TnewTALR3q2h9oyELq8VVDoc4iSqHfwY4iVMfsK8LhfRJlNFLgoTrqvr+B0uiSnWkhTGbm
 yOJ/9+han9w+ROEaGq0wQlJrFWl68/VLpXLRuojCSJ2w8qArEmDrDKQpeRRhb6RM1rOg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oTF2sime/4sFHm86GW4LAHbLNaXPgKmERYCEldjDxcM=; b=L40Yq+d5HJXxVJL+4o8hXK56fP
 F7g3e4miHIWzllohE3Pmtw+F+iltIialMkSPDfTbCHh7XtAEC8J42i1FVXiOGyIFPule+35tDEPgc
 /+uq+Whn6IUF4Z2kYomhmASNl35Dje2+nT1dDkdmJ8AEKZH3NAVoAjI6bbIn9q6AUIog=;
Received: from youngberry.canonical.com ([91.189.89.112])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-SHA:128) (Exim 4.92.2) id 1k85sJ-00BePe-2G
 for kgdb-bugreport@lists.sourceforge.net; Tue, 18 Aug 2020 17:58:20 +0000
Received: from ip5f5af70b.dynamic.kabel-deutschland.de ([95.90.247.11]
 helo=wittgenstein.fritz.box) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.brauner@ubuntu.com>)
 id 1k85V8-0003E9-2j; Tue, 18 Aug 2020 17:34:22 +0000
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Christoph Hewllig <hch@infradead.org>, linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arch@vger.kernel.org
Date: Tue, 18 Aug 2020 19:34:01 +0200
Message-Id: <20200818173411.404104-2-christian.brauner@ubuntu.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200818173411.404104-1-christian.brauner@ubuntu.com>
References: <20200818173411.404104-1-christian.brauner@ubuntu.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [91.189.89.112 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k85sJ-00BePe-2G
X-Mailman-Approved-At: Wed, 19 Aug 2020 10:28:55 +0000
Subject: [Kgdb-bugreport] [PATCH 01/11] fork: introduce kernel_clone()
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
Cc: Alexandre Chartre <alexandre.chartre@oracle.com>, linux-doc@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Kars de Jong <jongk@linux-m68k.org>, linux-kselftest@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-ia64@vger.kernel.org,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Thomas Gleixner <tglx@linutronix.de>, Tom Zanussi <zanussi@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, x86@kernel.org,
 Ley Foon Tan <ley.foon.tan@intel.com>, Ingo Molnar <mingo@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 uclinux-h8-devel@lists.sourceforge.jp, Fenghua Yu <fenghua.yu@intel.com>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Steven Rostedt <rostedt@goodmis.org>, linux-m68k@lists.linux-m68k.org,
 Borislav Petkov <bp@alien8.de>, Greentime Hu <green.hu@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Xiao Yang <yangx.jy@cn.fujitsu.com>,
 Tony Luck <tony.luck@intel.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

The old _do_fork() helper doesn't follow naming conventions of in-kernel
helpers for syscalls. The process creation cleanup in [1] didn't change the
name to something more reasonable mainly because _do_fork() was used in quite a
few places. So sending this as a separate series seemed the better strategy.

This commit renames _do_fork() to kernel_clone() but keeps _do_fork() as a
simple static inline wrapper around kernel_clone().
Follow-up patches will switch each caller of _do_fork() and each place where it
is referenced over to kernel_clone(). After all these changes are done, we can
remove _do_fork() completely and will only be left with kernel_clone().

[1]: 9ba27414f2ec ("Merge tag 'fork-v5.9' of git://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux")
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>
Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
 include/linux/sched/task.h |  6 +++++-
 kernel/fork.c              | 14 +++++++-------
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/include/linux/sched/task.h b/include/linux/sched/task.h
index a98965007eef..d9ef07359c96 100644
--- a/include/linux/sched/task.h
+++ b/include/linux/sched/task.h
@@ -83,7 +83,11 @@ extern void do_group_exit(int);
 extern void exit_files(struct task_struct *);
 extern void exit_itimers(struct signal_struct *);
 
-extern long _do_fork(struct kernel_clone_args *kargs);
+extern int kernel_clone(struct kernel_clone_args *kargs);
+static inline long _do_fork(struct kernel_clone_args *kargs)
+{
+	return kernel_clone(kargs);
+}
 struct task_struct *fork_idle(int);
 struct mm_struct *copy_init_mm(void);
 extern pid_t kernel_thread(int (*fn)(void *), void *arg, unsigned long flags);
diff --git a/kernel/fork.c b/kernel/fork.c
index 4d32190861bd..34e37cee239f 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2384,7 +2384,7 @@ struct mm_struct *copy_init_mm(void)
  *
  * args->exit_signal is expected to be checked for sanity by the caller.
  */
-long _do_fork(struct kernel_clone_args *args)
+int kernel_clone(struct kernel_clone_args *args)
 {
 	u64 clone_flags = args->flags;
 	struct completion vfork;
@@ -2477,7 +2477,7 @@ pid_t kernel_thread(int (*fn)(void *), void *arg, unsigned long flags)
 		.stack_size	= (unsigned long)arg,
 	};
 
-	return _do_fork(&args);
+	return kernel_clone(&args);
 }
 
 #ifdef __ARCH_WANT_SYS_FORK
@@ -2488,7 +2488,7 @@ SYSCALL_DEFINE0(fork)
 		.exit_signal = SIGCHLD,
 	};
 
-	return _do_fork(&args);
+	return kernel_clone(&args);
 #else
 	/* can not support in nommu mode */
 	return -EINVAL;
@@ -2504,7 +2504,7 @@ SYSCALL_DEFINE0(vfork)
 		.exit_signal	= SIGCHLD,
 	};
 
-	return _do_fork(&args);
+	return kernel_clone(&args);
 }
 #endif
 
@@ -2542,7 +2542,7 @@ SYSCALL_DEFINE5(clone, unsigned long, clone_flags, unsigned long, newsp,
 		.tls		= tls,
 	};
 
-	return _do_fork(&args);
+	return kernel_clone(&args);
 }
 #endif
 
@@ -2700,7 +2700,7 @@ SYSCALL_DEFINE2(clone3, struct clone_args __user *, uargs, size_t, size)
 	if (!clone3_args_valid(&kargs))
 		return -EINVAL;
 
-	return _do_fork(&kargs);
+	return kernel_clone(&kargs);
 }
 #endif
 
@@ -2863,7 +2863,7 @@ int unshare_fd(unsigned long unshare_flags, unsigned int max_fds,
 /*
  * unshare allows a process to 'unshare' part of the process
  * context which was originally shared using clone.  copy_*
- * functions used by _do_fork() cannot be used here directly
+ * functions used by kernel_clone() cannot be used here directly
  * because they modify an inactive task_struct that is being
  * constructed. Here we are modifying the current, active,
  * task_struct.
-- 
2.28.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
