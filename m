Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8856B249ACF
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 19 Aug 2020 12:48:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k8Ldy-0000a9-0x
	for lists+kgdb-bugreport@lfdr.de; Wed, 19 Aug 2020 10:48:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <christian.brauner@ubuntu.com>) id 1k8Lds-0000YD-76
 for kgdb-bugreport@lists.sourceforge.net; Wed, 19 Aug 2020 10:48:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7iyPbs8r1ufPrxIGopq36f3QiblZRBECUjXttdG8VNc=; b=gLQS0MkYL9RutMJEuWwesAnHwQ
 1Rnw6pY0+NFIrqij/CMjqLooyrpuS6lJNMBAb/8bWmQi12K9E0elWR2PkQghraURqeIsqOuL97RSC
 D9EgCmXGKrbVdvdnpD+cSoO2N9W6/PEoOt+Qb0FAmuU678uvjV4jMqTH0fJ+t4r85RMs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7iyPbs8r1ufPrxIGopq36f3QiblZRBECUjXttdG8VNc=; b=hmYpcldT+uevl+wCKpIRlyYJ+/
 6Drtewxs+uBOsT2UiLhQmBeo5oWRZ+M2t7ckCnXuh53TqSIAqsKJF3Byi1FOl+wrcjkmzSwMFFEeI
 Fwp9vtt7b+W9gUaFvW+6CAzfqfR/3OqfnKjMwpl6vNwCLePsetoYP6HF4Pi6O0SYfGr0=;
Received: from youngberry.canonical.com ([91.189.89.112])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-SHA:128) (Exim 4.92.2) id 1k8Ldq-00CIon-Q5
 for kgdb-bugreport@lists.sourceforge.net; Wed, 19 Aug 2020 10:48:27 +0000
Received: from ip5f5af70b.dynamic.kabel-deutschland.de ([95.90.247.11]
 helo=wittgenstein.fritz.box) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.brauner@ubuntu.com>)
 id 1k8Ld4-0006IE-OF; Wed, 19 Aug 2020 10:47:38 +0000
From: Christian Brauner <christian.brauner@ubuntu.com>
To: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Wed, 19 Aug 2020 12:46:55 +0200
Message-Id: <20200819104655.436656-12-christian.brauner@ubuntu.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200819104655.436656-1-christian.brauner@ubuntu.com>
References: <20200819104655.436656-1-christian.brauner@ubuntu.com>
MIME-Version: 1.0
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: ubuntu.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [91.189.89.112 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k8Ldq-00CIon-Q5
Subject: [Kgdb-bugreport] [PATCH v2 11/11] sched: remove _do_fork()
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
 Kars de Jong <jongk@linux-m68k.org>, Matthew Wilcox <willy@infradead.org>,
 linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-ia64@vger.kernel.org, Christian Brauner <christian.brauner@ubuntu.com>,
 Thomas Gleixner <tglx@linutronix.de>, Tom Zanussi <zanussi@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, x86@kernel.org,
 Ley Foon Tan <ley.foon.tan@intel.com>, Christoph Hewllig <hch@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 uclinux-h8-devel@lists.sourceforge.jp, Fenghua Yu <fenghua.yu@intel.com>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Steven Rostedt <rostedt@goodmis.org>, linux-m68k@lists.linux-m68k.org,
 Borislav Petkov <bp@alien8.de>, Greentime Hu <green.hu@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Xiao Yang <yangx.jy@cn.fujitsu.com>,
 Tony Luck <tony.luck@intel.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Now that all callers of _do_fork() have been switched to kernel_clone() remove
the _do_fork() helper.

Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
/* v2 */
unchanged
---
 include/linux/sched/task.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/linux/sched/task.h b/include/linux/sched/task.h
index d4428039c3c1..85fb2f34c59b 100644
--- a/include/linux/sched/task.h
+++ b/include/linux/sched/task.h
@@ -84,10 +84,6 @@ extern void exit_files(struct task_struct *);
 extern void exit_itimers(struct signal_struct *);
 
 extern pid_t kernel_clone(struct kernel_clone_args *kargs);
-static inline long _do_fork(struct kernel_clone_args *kargs)
-{
-	return kernel_clone(kargs);
-}
 struct task_struct *fork_idle(int);
 struct mm_struct *copy_init_mm(void);
 extern pid_t kernel_thread(int (*fn)(void *), void *arg, unsigned long flags);
-- 
2.28.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
