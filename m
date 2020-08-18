Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB2E249A5D
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 19 Aug 2020 12:28:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k8LL0-0007xr-4F
	for lists+kgdb-bugreport@lfdr.de; Wed, 19 Aug 2020 10:28:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <christian.brauner@ubuntu.com>) id 1k85t3-0001Ii-G0
 for kgdb-bugreport@lists.sourceforge.net; Tue, 18 Aug 2020 17:59:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OXHCJJNmjf8innNDMJ/Txw8diJVOZt5pDfhZRr7HQfA=; b=TRUYdTTb3rSIIkc85lXPGrf9eS
 GupOqabWOpQK2+HiC2q4H3rQZToacgHNSroHrtn0714tovRChit+nBX//z37RtBeEBchENndkcFkU
 fdPEvHarG4QDKiZ+vay5/U0G7oyyQRJ6P/rB7kHi+i1T+warQ7yWbnJeqY9ip+BOGfsA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=OXHCJJNmjf8innNDMJ/Txw8diJVOZt5pDfhZRr7HQfA=; b=R
 MAcVuYZh0rseEVuVLQaQXTzjaVmPSkqFdPfLpONOkQMK+Z6u4Pr+j1qJ/2x8wEzOc2jRZ+M2P4wZV
 QP1uDiHtqlYSeNVmigEHVkCopbZbC7L58GvVGDfkxi+dqClcqedv+su1CgU59bibdV2hrVHYkXm/N
 Dc5cI2G6G6WPhMwE=;
Received: from youngberry.canonical.com ([91.189.89.112])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-SHA:128) (Exim 4.92.2) id 1k85t1-00FSg5-Jx
 for kgdb-bugreport@lists.sourceforge.net; Tue, 18 Aug 2020 17:59:05 +0000
Received: from ip5f5af70b.dynamic.kabel-deutschland.de ([95.90.247.11]
 helo=wittgenstein.fritz.box) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.brauner@ubuntu.com>)
 id 1k85V6-0003E9-LE; Tue, 18 Aug 2020 17:34:20 +0000
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Christoph Hewllig <hch@infradead.org>, linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arch@vger.kernel.org
Date: Tue, 18 Aug 2020 19:34:00 +0200
Message-Id: <20200818173411.404104-1-christian.brauner@ubuntu.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: kprobe_ftrace.tc]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [91.189.89.112 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k85t1-00FSg5-Jx
X-Mailman-Approved-At: Wed, 19 Aug 2020 10:28:55 +0000
Subject: [Kgdb-bugreport] [PATCH 00/11] Introduce kernel_clone(),
 kill _do_fork()
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
 Ley Foon Tan <ley.foon.tan@intel.com>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
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

Hey everyone,

This is a follow-up to the do_fork() cleanup from last cycle based on a
short discussion this was merged.
Last cycle we removed copy_thread_tls() and the associated Kconfig
option for each architecture. Now we are only left with copy_thread().
Part of this work was removing the old do_fork() legacy clone()-style
calling convention in favor of the new struct kernel_clone args calling
convention.
The only remaining function callable outside of kernel/fork.c is
_do_fork(). It doesn't really follow the naming of kernel-internal
syscall helpers as Christoph righly pointed out. Switch all callers and
references to kernel_clone() and remove _do_fork() once and for all.

For all architectures I have done a full git rebase v5.9-rc1 -x "make
-j31". There were no built failures and the changes were fairly
mechanical.

The only helpers we have left now are kernel_thread() and kernel_clone()
where kernel_thread() just calls kernel_clone().

Thanks!
Christian

Christian Brauner (11):
  fork: introduce kernel_clone()
  h8300: switch to kernel_clone()
  ia64: switch to kernel_clone()
  m68k: switch to kernel_clone()
  nios2: switch to kernel_clone()
  sparc: switch to kernel_clone()
  x86: switch to kernel_clone()
  kprobes: switch to kernel_clone()
  kgdbts: switch to kernel_clone()
  tracing: switch to kernel_clone()
  sched: remove _do_fork()

 Documentation/trace/histogram.rst             |  4 +-
 arch/h8300/kernel/process.c                   |  2 +-
 arch/ia64/kernel/process.c                    |  4 +-
 arch/m68k/kernel/process.c                    | 10 ++--
 arch/nios2/kernel/process.c                   |  2 +-
 arch/sparc/kernel/process.c                   |  6 +--
 arch/x86/kernel/sys_ia32.c                    |  2 +-
 drivers/misc/kgdbts.c                         | 48 +++++++++----------
 include/linux/sched/task.h                    |  2 +-
 kernel/fork.c                                 | 14 +++---
 samples/kprobes/kprobe_example.c              |  6 +--
 samples/kprobes/kretprobe_example.c           |  4 +-
 .../test.d/dynevent/add_remove_kprobe.tc      |  2 +-
 .../test.d/dynevent/clear_select_events.tc    |  2 +-
 .../test.d/dynevent/generic_clear_event.tc    |  2 +-
 .../test.d/ftrace/func-filter-stacktrace.tc   |  4 +-
 .../ftrace/test.d/kprobe/add_and_remove.tc    |  2 +-
 .../ftrace/test.d/kprobe/busy_check.tc        |  2 +-
 .../ftrace/test.d/kprobe/kprobe_args.tc       |  4 +-
 .../ftrace/test.d/kprobe/kprobe_args_comm.tc  |  2 +-
 .../test.d/kprobe/kprobe_args_string.tc       |  4 +-
 .../test.d/kprobe/kprobe_args_symbol.tc       | 10 ++--
 .../ftrace/test.d/kprobe/kprobe_args_type.tc  |  2 +-
 .../ftrace/test.d/kprobe/kprobe_ftrace.tc     | 14 +++---
 .../ftrace/test.d/kprobe/kprobe_multiprobe.tc |  2 +-
 .../test.d/kprobe/kprobe_syntax_errors.tc     | 12 ++---
 .../ftrace/test.d/kprobe/kretprobe_args.tc    |  4 +-
 .../selftests/ftrace/test.d/kprobe/profile.tc |  2 +-
 28 files changed, 87 insertions(+), 87 deletions(-)


base-commit: 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5
-- 
2.28.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
