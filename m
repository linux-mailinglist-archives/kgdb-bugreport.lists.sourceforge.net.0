Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2996632B67A
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  3 Mar 2021 11:15:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lHOXm-0007rx-6r
	for lists+kgdb-bugreport@lfdr.de; Wed, 03 Mar 2021 10:15:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <john.ogness@linutronix.de>) id 1lHOXi-0007r8-J0
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Mar 2021 10:15:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N/VAkqWLBfS766I7n05L//Xhy4zYhpBosb29O0wTdfI=; b=E1X4TX9P/zddVXsZNGIDqfo0r7
 KOidQpp1PKoduBSYAeXodIALMXcxx0xrVJ9rjUxZ3jb9w3yn1Ky5BDQySfqN4ak+0omKrZ2KS1EZ+
 ogSM8YJ20DNnSm+nifhvTkhQLjAZ07wSNS8H9EQLIyeJr0s2W05G0UKMcg2sFLmIWbnE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=N/VAkqWLBfS766I7n05L//Xhy4zYhpBosb29O0wTdfI=; b=f
 fFNM70YyQsn2tMlYzgkfvidaW5yTrR3QYwh16sOcB6VTsN5+5gI1c2Kuwqp2piabfHIP8o9q89h8k
 gEPWgFwxQ71u46jWVp/c1iK8IdnWApynNTjr4isv34jLQ1prV5m73XiGQXe8V1eLj0sKtUrzTqwF/
 5KcQ261lMgsWsmjs=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lHOXd-00CN6s-8o
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Mar 2021 10:15:46 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1614766529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=N/VAkqWLBfS766I7n05L//Xhy4zYhpBosb29O0wTdfI=;
 b=PqRXCroIP1umtmHt8c1ZfO2I6XBiNXbdZol38HcPrbsLXce6jhNCPzL73X+NxuMXd9VicB
 2GT3tLSfL/RPGsg1xcWreJMLgg7ctu4acVEggflP6m0fWffYMd9g5MMJYZbQSUhV7/BhCl
 kObz+ZwiKqb9Arvy5udqLHUz3XGQeyi3ynwoKTYlr/mBTmlLtXFKolBpnxCqntVZOwFOhw
 jtZVyEPv9Z+rfaHWSPfE1AJbPHUkZwnEIzm3d+WghCeafjzT1gbK+JpBQah2oWq42SpmX6
 1EVYua2XPXwecaqR+MUsx3IazCaXKtWyRAm/rrlJNOayG6J8ZhCn5m4arNTfaA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1614766529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=N/VAkqWLBfS766I7n05L//Xhy4zYhpBosb29O0wTdfI=;
 b=QohrIokyE6gvAlbHH+2ScIj3BnDnIlGTQqJn9ICwNv8CCj3w8J2dv2/UuBk4gUkvEzJngE
 +7ihcslvjpCg8LCQ==
To: Petr Mladek <pmladek@suse.com>
Date: Wed,  3 Mar 2021 11:15:13 +0100
Message-Id: <20210303101528.29901-1-john.ogness@linutronix.de>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lHOXd-00CN6s-8o
Subject: [Kgdb-bugreport] [PATCH next v4 00/15] printk: remove logbuf_lock
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
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-mtd@lists.infradead.org, Michael Ellerman <mpe@ellerman.id.au>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Thomas Meyer <thomas@m3y3r.de>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Richard Weinberger <richard@nod.at>, Anton Vorontsov <anton@enomsg.org>,
 Jordan Niethe <jniethe5@gmail.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, Wei Li <liwei391@huawei.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>, Kees Cook <keescook@chromium.org>,
 Alistair Popple <alistair@popple.id.au>, Jeff Dike <jdike@addtoit.com>,
 Colin Cross <ccross@android.com>, linux-um@lists.infradead.org,
 Wei Liu <wei.liu@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Nicholas Piggin <npiggin@gmail.com>,
 Oleg Nesterov <oleg@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Tony Luck <tony.luck@intel.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hello,

Here is v4 of a series to remove @logbuf_lock, exposing the
ringbuffer locklessly to both readers and writers. v3 is
here [0].

Since @logbuf_lock was protecting much more than just the
ringbuffer, this series clarifies and cleans up the various
protections using comments, lockless accessors, atomic types,
and a new finer-grained @syslog_lock.

Removing @logbuf_lock required changing the semantics of the
kmsg_dumper callback in order to work locklessly. This series
adjusts all kmsg_dumpers and users of the kmsg_dump_get_*()
functions for the new semantics.

This series is based on next-20210303.

Changes since v3:

- disable interrupts in the arch/um kmsg_dumper

- reduce CONSOLE_LOG_MAX value from 4096 back to 1024 to revert
  the increasd 3KiB static memory footprint

- change the kmsg_dumper() callback prototype back to how it
  was because some dumpers need the registered object for
  container_of() usage

- for kmsg_dump_get_line()/kmsg_dump_get_buffer() restrict the
  minimal allowed sequence number to the cleared sequence number

John Ogness

[0] https://lore.kernel.org/lkml/20210225202438.28985-1-john.ogness@linutronix.de/

John Ogness (15):
  um: synchronize kmsg_dumper
  mtd: mtdoops: synchronize kmsg_dumper
  printk: limit second loop of syslog_print_all
  printk: kmsg_dump: remove unused fields
  printk: refactor kmsg_dump_get_buffer()
  printk: consolidate kmsg_dump_get_buffer/syslog_print_all code
  printk: introduce CONSOLE_LOG_MAX
  printk: use seqcount_latch for clear_seq
  printk: use atomic64_t for devkmsg_user.seq
  printk: add syslog_lock
  printk: kmsg_dumper: remove @active field
  printk: introduce a kmsg_dump iterator
  printk: remove logbuf_lock
  printk: kmsg_dump: remove _nolock() variants
  printk: console: remove unnecessary safe buffer usage

 arch/powerpc/kernel/nvram_64.c |   8 +-
 arch/powerpc/xmon/xmon.c       |   6 +-
 arch/um/kernel/kmsg_dump.c     |  13 +-
 drivers/hv/vmbus_drv.c         |   4 +-
 drivers/mtd/mtdoops.c          |  17 +-
 fs/pstore/platform.c           |   5 +-
 include/linux/kmsg_dump.h      |  47 ++--
 kernel/debug/kdb/kdb_main.c    |  10 +-
 kernel/printk/internal.h       |   4 +-
 kernel/printk/printk.c         | 464 +++++++++++++++++----------------
 kernel/printk/printk_safe.c    |  27 +-
 11 files changed, 310 insertions(+), 295 deletions(-)

-- 
2.20.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
