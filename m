Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD093261AD
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 26 Feb 2021 12:03:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lFath-00069I-I9
	for lists+kgdb-bugreport@lfdr.de; Fri, 26 Feb 2021 11:03:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <john.ogness@linutronix.de>) id 1lFNBy-00024C-NT
 for kgdb-bugreport@lists.sourceforge.net; Thu, 25 Feb 2021 20:24:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qDVKAKnnfPFs0Dxv5+kX2VVyNzrYE33K+BDYTVeJME8=; b=muLR7ANR+Y99IXAOKg3ki2hunB
 J3vJXPYw8ilTRchJRqX3hjl31/L3N1bpVyUB8PJa1p+AUGLsSZ3NI84XHaivmPkng91+pqsEepWAi
 c1pOX2Sx6o+J6/2uIeEaNxO5sgA4ruQHZoF0SqE9U7ktyH1OrYEQZi0vXfRx/p+Cn4jI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qDVKAKnnfPFs0Dxv5+kX2VVyNzrYE33K+BDYTVeJME8=; b=m
 tZykQAz7iohIapmecCYqee+2ZULfZyaorihoaQSYfAt77FGWuYNSGXhihCYYqPc1emZ/slR1HYsdX
 NpGQ0sUbQUAvc1KKAPAEhyBLLkwZIy0mOiQG4TxK5cUtgcq/wmvDggPjO4NW0XJgjZQmYhGBuOW02
 mXssD7D8kVrhGpfQ=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lFNBq-005QsB-U9
 for kgdb-bugreport@lists.sourceforge.net; Thu, 25 Feb 2021 20:24:58 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1614284679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=qDVKAKnnfPFs0Dxv5+kX2VVyNzrYE33K+BDYTVeJME8=;
 b=Itg1HgnAQey3puEfZXpKRRf1RkHbrPWXsodppd3f9/agHLs59mQxmZvHrDVfXhn7TF2e+X
 YgctQb8llo4ek4IXOH40pHKrSlSJUv+qmqSuRbNPlwERu5vmF3/VXIexN4FpY+8WHM5d4n
 3zHVITkWvbjhosz0zzfOytwQyTccmRTsG9uKDQ/PoVKslKdevkHeAS8FY/vBbTk7ZYAmwx
 j9C6lcv4wUAstQLOYdbQOINDWx2UjXbjMRmTNEt/9KnzbRIvSmj2EXQuCLrXAd5jyQHGnB
 6degQSHuHB1F0v3eFX0HxngBtbRJympKrqQjrUQzvVBIk1MNI805LQYIDMpUAg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1614284679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=qDVKAKnnfPFs0Dxv5+kX2VVyNzrYE33K+BDYTVeJME8=;
 b=R+fgiTn80NtyboUkoI+34S01BUhJK8k4MSy2VNzuYCNOKjN83g0YvSMQCLvesqnrTwxeYZ
 t+PogSzB5duz2fCg==
To: Petr Mladek <pmladek@suse.com>
Date: Thu, 25 Feb 2021 21:24:23 +0100
Message-Id: <20210225202438.28985-1-john.ogness@linutronix.de>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: get_maintainer.pl]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lFNBq-005QsB-U9
X-Mailman-Approved-At: Fri, 26 Feb 2021 11:03:00 +0000
Subject: [Kgdb-bugreport] [PATCH next v3 00/15] printk: remove logbuf_lock
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
Cc: linux-hyperv@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-mtd@lists.infradead.org, Michael Ellerman <mpe@ellerman.id.au>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Thomas Meyer <thomas@m3y3r.de>,
 Kees Cook <keescook@chromium.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Richard Weinberger <richard@nod.at>, Anton Vorontsov <anton@enomsg.org>,
 Joel Stanley <joel@jms.id.au>, Jordan Niethe <jniethe5@gmail.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, Wei Li <liwei391@huawei.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Alistair Popple <alistair@popple.id.au>, Jeff Dike <jdike@addtoit.com>,
 Colin Cross <ccross@android.com>, linux-um@lists.infradead.org,
 Wei Liu <wei.liu@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Nicholas Piggin <npiggin@gmail.com>,
 Oleg Nesterov <oleg@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Tony Luck <tony.luck@intel.com>,
 linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hello,

Here is v3 of a series to remove @logbuf_lock, exposing the
ringbuffer locklessly to both readers and writers. v2 is here [0].

Since @logbuf_lock was protecting much more than just the
ringbuffer, this series clarifies and cleans up the various
protections using comments, lockless accessors, atomic types, and a
new finer-grained @syslog_lock.

Removing @logbuf_lock required changing the semantics of the
kmsg_dumper callback in order to work locklessly. Since this
involved touching all the kmsg_dump users, we also decided [1] to
use this opportunity to clean up and clarify the kmsg_dump semantics
in general.

This series is based on next-20210225.

Changes since v2:

- use get_maintainer.pl to get the full list of developers that
  should at least see the changes in their respective areas

- do not disable interrupts in arch/um kmsg_dumper (because there is
  no need to)

- protect the mtd/mtdoops kmsg_dumper buffer against concurrent
  dumps

- update kerneldoc for kmsg_dump_get_line() (@len_out)

- remove ksmg_dump's @active flag

- change kmsg_dumper callback to:
  void (*dump)(enum kmsg_dump_reason reason);

- rename kmsg_dumper_iter to kmsg_dump_iter

- update kmsg_dumpers to use their own kmsg_dump_iter (and
  initialize it with kmsg_dump_rewind() if necessary)

John Ogness

[0] https://lkml.kernel.org/r/20210218081817.28849-1-john.ogness@linutronix.de
[1] https://lkml.kernel.org/r/YDeZAA08NKCHa4s%2F@alley

John Ogness (15):
  um: synchronize kmsg_dumper
  mtd: mtdoops: synchronize kmsg_dumper
  printk: limit second loop of syslog_print_all
  printk: kmsg_dump: remove unused fields
  printk: refactor kmsg_dump_get_buffer()
  printk: consolidate kmsg_dump_get_buffer/syslog_print_all code
  printk: introduce CONSOLE_LOG_MAX for improved multi-line support
  printk: use seqcount_latch for clear_seq
  printk: use atomic64_t for devkmsg_user.seq
  printk: add syslog_lock
  printk: kmsg_dumper: remove @active field
  printk: introduce a kmsg_dump iterator
  printk: remove logbuf_lock
  printk: kmsg_dump: remove _nolock() variants
  printk: console: remove unnecessary safe buffer usage

 arch/powerpc/kernel/nvram_64.c             |  14 +-
 arch/powerpc/platforms/powernv/opal-kmsg.c |   3 +-
 arch/powerpc/xmon/xmon.c                   |   6 +-
 arch/um/kernel/kmsg_dump.c                 |  15 +-
 drivers/hv/vmbus_drv.c                     |   7 +-
 drivers/mtd/mtdoops.c                      |  20 +-
 fs/pstore/platform.c                       |   8 +-
 include/linux/kmsg_dump.h                  |  49 +--
 kernel/debug/kdb/kdb_main.c                |  10 +-
 kernel/printk/internal.h                   |   4 +-
 kernel/printk/printk.c                     | 456 ++++++++++-----------
 kernel/printk/printk_safe.c                |  27 +-
 12 files changed, 309 insertions(+), 310 deletions(-)

-- 
2.20.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
