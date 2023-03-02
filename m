Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 896D46A8A0B
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  2 Mar 2023 21:14:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pXpKG-0004HK-W5
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 02 Mar 2023 20:14:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1pXpKA-0004H9-IC
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 02 Mar 2023 20:14:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D2GmDQ33TZwTGvN+c+rgjG9GQD86x22dctGsZ2aRYhU=; b=bq+TYPr+BwBP7tPLYWXKxl1BZl
 J8HLozibN4/Oc+tnK5ryc1Fzia8tIu/DNtRtddsyDMYJ9BJ6x+g7nyE6EFoi34wfrKrlJVdLC//ys
 arcgR/AbZ9D/7hH792jKuLSDGAiloEpgFfDk1W4kepMGlARsGeZSL3TUOPgI1CxXkJPA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=D2GmDQ33TZwTGvN+c+rgjG9GQD86x22dctGsZ2aRYhU=; b=j
 FOOyc3Q6Mg0HVi3TJVBLTd2P3vBC/W7qSnEDRf7zdKJPYP+2oGi8cPiQ2r1qQEGNjmCrD9FnQkZau
 b1n0AdVt0GtYYqJLbCPdDl7r3DuzWarIjjt6vW2ktBO4V0HXSbSz2uJvvnl8PcRgy4y24AGrwDBnu
 ZOKtHvsL6/jfNoiQ=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pXpK4-00017B-PT for kgdb-bugreport@lists.sourceforge.net;
 Thu, 02 Mar 2023 20:14:45 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1677787062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=D2GmDQ33TZwTGvN+c+rgjG9GQD86x22dctGsZ2aRYhU=;
 b=2ZUpJVw4wQGZxTHOu1XghQeRM+/IIbCHtyQgO4x18XrKpHNMkPyJfbv2fflw4/0RiMSBvG
 s9onjVj3sNCz0mbDK9+jjI27L4ijjVgtFfmGTPyxVoy190mNBvbiDt6zoS3dLP+nbEKJ27
 JFem9xXowtmza1CKpR6x3lmwhezGIf0/K43MQn5q1YHcn8zL36DTxyclfkq0FOY/nAZfQK
 1tkizcJ3rp7aa4zKiha695dqGXqgB2Ir48wUMJlRDLJugqLAoSjGNEcZH3P5TKz5ouXeTf
 gv/z/LIUDnmSJSMfTVvQaiI02n5W/ePhGWf3Q4bBvievY1aUSYtrYWLnyBC2bA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1677787062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=D2GmDQ33TZwTGvN+c+rgjG9GQD86x22dctGsZ2aRYhU=;
 b=GOuy1zDQx4DZonejgJJLELiBYZUJ4B7seis0cXTfogH/a/P/CzNWvRiwvsEtz+mo+G69Et
 wwYd6UFg01USNYBA==
To: Petr Mladek <pmladek@suse.com>
Date: Thu,  2 Mar 2023 21:02:00 +0106
Message-Id: <20230302195618.156940-1-john.ogness@linutronix.de>
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, This is v1 of a series to bring in a new threaded/atomic
 console infrastructure. The history, motivation, and various explanations
 and examples are available in the cover letter of tglx's RFC series [ [...]
 Content analysis details:   (-1.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not
 exist)
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [193.142.43.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pXpK4-00017B-PT
Subject: [Kgdb-bugreport] [PATCH printk v1 00/18] threaded/atomic console
 support
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Neeraj Upadhyay <quic_neeraju@quicinc.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Aaron Tomlin <atomlin@redhat.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 David Gow <davidgow@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 rcu@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, tangmeng <tangmeng@uniontech.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

This is v1 of a series to bring in a new threaded/atomic console
infrastructure. The history, motivation, and various explanations and
examples are available in the cover letter of tglx's RFC series
[0]. From that series, patches 1-18 have been mainlined as of the 6.3
merge window. What remains, patches 19-29, is what this series
represents.

Since the RFC there has been significant changes involving bug-fixing,
refactoring, renaming, and feature completion. Despite the many
changes in the code, the concept and design has been preserved.

The key points to the threaded/atomic (aka NOBKL) consoles are:

- Each console has its own kthread and uses a new write_thread()
  console callback that is always called from sleepable context. The
  kthreads of different consoles do not contend with each other and do
  not use the global console lock.

- Each console uses a new write_atomic() console callback that is able
  to write from any context (including NMI). The threaded/atomic
  infrastructure provides supporting functions to help atomic console
  drivers to synchronize with their own threaded and re-entrant atomic
  counterparts.

- Until the console threads are available, atomic printing is
  performed. The threaded printing is able to take over shortly before
  SMP is brought online so machines with many CPUs should be able to
  boot at full speed without being held back by console printing.

- When console threads are shutdown (on system reboot and shutdown),
  again the atomic consoles take over. This ensures the final message
  make it out to the consoles.

- When panic, WARN, and NMI stall detection occurs, the atomic
  consoles temporarily take over printing until the related messages
  have been output.  In this case the full set of related messages are
  stored into the printk ringbuffer before the atomic consoles begin
  flushing the ringbuffer to the consoles.

- Atomic printing is split into 3 priorities. For example, upon
  shutdown (when kthreads are not available), the console output will
  be normal priority atomic printing. This could be interrupted by a
  WARN on another CPU (emergency priority). And that could be
  interrupted by a panic on yet another CPU (panic priority). And of
  course any atomic printing priority can interrupt the kthread
  printer.

- The transition between kthread and any atomic printing or to any
  elevated priority atomic printing is synchronized using an atomic_t
  state variable per console. The state variable acts like a spinlock
  but with special properties that the spinning can timeout and even a
  hostile takeover based on the atomic priorities is possible. After
  outputting each byte, a console printing context checks the state
  variable to ensure it is still the owner of the console. If it is
  not (for example, in the case of a hostile takeover) it will
  immediately abort any continued use of the console and rely on the
  new owner to flush the messages.

- Using the console state variable, console drivers can mark unsafe
  regions in their code where ownership transition is not
  possible. Combined with the timeout feature, a handover protocol,
  and the possibility for a hostile takeover, this allows drivers to
  make safe decisions about when and how console ownership is
  transferred to another context. It also allows the printk
  infrastructure to make safe decisions in panic situations, such as
  only outputting to atomic consoles where safe takeovers are
  possible. And only after handling all other panic responsibilities,
  attempting unsafe takeovers for the consoles that have not yet
  transferred ownership.

- In order to support hostile takeovers (where a CPU with a higher
  priority context can steal ownership from another CPU) without CPUs
  clobbering each others buffers, each CPU has its own set of string
  print buffers.

The existing legacy consoles continue to function unmodified as before
and legacy consoles can work next to NOBKL consoles (i.e. a legacy
virtual terminal graphics console and network console will work with a
NOBKL uart8250 console). However, in order to have the full
benefit/reliability of NOBKL consoles, a system should use _only_
NOBKL consoles.

We believe that this series covers all printk features and usage to
allow new threaded/atomic consoles to be able to replace the legacy
consoles.  However, this will be a gradual transition as individual
console drivers are updated to support the NOBKL requirements.

This series does not include any changes to console drivers to allow
them to act as NOBKL consoles. That will be a follow-up series, once a
finalized infrastructure is in place. However, I will reply to this
message with an all-in-one uart8250 patch that fully implements NOBKL
support. The patch will allow you to perform runtime tests with the
NOBKL consoles on the uart8250.

John Ogness

[0] https://lore.kernel.org/lkml/20220910221947.171557773@linutronix.de

John Ogness (7):
  kdb: do not assume write() callback available
  printk: Add NMI check to down_trylock_console_sem()
  printk: Consolidate console deferred printing
  printk: Add per-console suspended state
  printk: nobkl: Stop threads on shutdown/reboot
  rcu: Add atomic write enforcement for rcu stalls
  printk: Perform atomic flush in console_flush_on_panic()

Thomas Gleixner (11):
  printk: Add non-BKL console basic infrastructure
  printk: nobkl: Add acquire/release logic
  printk: nobkl: Add buffer management
  printk: nobkl: Add sequence handling
  printk: nobkl: Add print state functions
  printk: nobkl: Add emit function and callback functions for atomic
    printing
  printk: nobkl: Introduce printer threads
  printk: nobkl: Add printer thread wakeups
  printk: nobkl: Add write context storage for atomic writes
  printk: nobkl: Provide functions for atomic write enforcement
  kernel/panic: Add atomic write enforcement to warn/panic

 fs/proc/consoles.c           |    1 +
 include/linux/console.h      |  174 ++++
 include/linux/printk.h       |    9 +
 kernel/debug/kdb/kdb_io.c    |    2 +
 kernel/panic.c               |   17 +
 kernel/printk/Makefile       |    2 +-
 kernel/printk/internal.h     |  103 +-
 kernel/printk/printk.c       |  307 ++++--
 kernel/printk/printk_nobkl.c | 1820 ++++++++++++++++++++++++++++++++++
 kernel/printk/printk_safe.c  |    9 +-
 kernel/rcu/tree_stall.h      |    6 +
 11 files changed, 2362 insertions(+), 88 deletions(-)
 create mode 100644 kernel/printk/printk_nobkl.c


base-commit: 10d639febe5629687dac17c4a7500a96537ce11a
-- 
2.30.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
