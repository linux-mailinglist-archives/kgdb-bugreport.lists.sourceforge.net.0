Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6996132B67B
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  3 Mar 2021 11:15:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lHOXn-0003cI-Bp
	for lists+kgdb-bugreport@lfdr.de; Wed, 03 Mar 2021 10:15:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <john.ogness@linutronix.de>) id 1lHOXm-0003c6-5H
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Mar 2021 10:15:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5o9MzMrMVFlLOrKhgcDQAebO+43Y5uWT9SA1yv2Ku+g=; b=VZp81CDYdQ/Xo4LRkPxeWtVG1Q
 WX0vQDnzp32Rgufr5Aw5RqliJdP11C3SUeGM4aUrgkl/xIpli3GEzIGOrpQgj6tttMvXAJAznmWVI
 2OnSYDLAxXlHTVgUJZxMBo9eFVWJvKh5bQxFb+HW3hRtvagjrAfNzMrSV7laP+zyX9/I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5o9MzMrMVFlLOrKhgcDQAebO+43Y5uWT9SA1yv2Ku+g=; b=Sb+z7BYNqnYGSfR2oeRSJwlmzD
 vn7omKBoMkHjcJ+WzezaxigO8KPNctR/gucHCviRCc/6gtQ67Uqjv1ebnE/s+iUByhUiVkilJMCXT
 j1WG/h4DMX0svUF9YyJOownjn3vxA8GaHrais0/kQMGGP5zjrTkh+UDosHdwfMLjFUSU=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lHOXf-0000lA-1X
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Mar 2021 10:15:50 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1614766534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5o9MzMrMVFlLOrKhgcDQAebO+43Y5uWT9SA1yv2Ku+g=;
 b=bwFSA/rrtpSQRBUFgvjdXyepSjJgb+fxucVlBOc+8jJJHB2sj6Ae9JWiYGZ92uSYBYQe51
 3UmPfP0BVxpeFbz9uCkYvzRLNaoKX24SO0aMY8MQhip1AqZAAXAEc82gnyaEOm7x9yjqFO
 cbK55PeRX2htHvbnZZqaaSRHodmFEmlZldRSr/wh7r01k2H1aBuc+a/2xHWOPXIoLoCgbJ
 XZaq60bOHR0tEUrwAwnpU+/ewCewVX6Knj/Mhje4bFAtSYdWQVskamKKBEbvWK4zHw+za1
 AF1ia9QLG0SLgNAsQEFOGdDlXF01GcqVjWPqtzfiHMJOsTh/YNommPga9UXSQw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1614766534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5o9MzMrMVFlLOrKhgcDQAebO+43Y5uWT9SA1yv2Ku+g=;
 b=b4AIUKighv58GLWloH8f5crxzzmO16h7hplt8+zY51ZxO6SaKEWxthJ+u996O+DdnU+3Wc
 4LdHTBFSjSCqHOBQ==
To: Petr Mladek <pmladek@suse.com>
Date: Wed,  3 Mar 2021 11:15:24 +0100
Message-Id: <20210303101528.29901-12-john.ogness@linutronix.de>
In-Reply-To: <20210303101528.29901-1-john.ogness@linutronix.de>
References: <20210303101528.29901-1-john.ogness@linutronix.de>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lHOXf-0000lA-1X
Subject: [Kgdb-bugreport] [PATCH next v4 11/15] printk: kmsg_dumper: remove
 @active field
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
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Kees Cook <keescook@chromium.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Jordan Niethe <jniethe5@gmail.com>,
 Wei Li <liwei391@huawei.com>, Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Alistair Popple <alistair@popple.id.au>, Steven Rostedt <rostedt@goodmis.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Nicholas Piggin <npiggin@gmail.com>,
 Oleg Nesterov <oleg@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

All 6 kmsg_dumpers do not benefit from the @active flag:

  (provide their own synchronization)
  - arch/powerpc/kernel/nvram_64.c
  - arch/um/kernel/kmsg_dump.c
  - drivers/mtd/mtdoops.c
  - fs/pstore/platform.c

  (only dump on KMSG_DUMP_PANIC, which does not require
  synchronization)
  - arch/powerpc/platforms/powernv/opal-kmsg.c
  - drivers/hv/vmbus_drv.c

The other 2 kmsg_dump users also do not rely on @active:

  (hard-code @active to always be true)
  - arch/powerpc/xmon/xmon.c
  - kernel/debug/kdb/kdb_main.c

Therefore, @active can be removed.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
Reviewed-by: Petr Mladek <pmladek@suse.com>
---
 arch/powerpc/xmon/xmon.c    |  2 +-
 include/linux/kmsg_dump.h   |  2 --
 kernel/debug/kdb/kdb_main.c |  2 +-
 kernel/printk/printk.c      | 10 +---------
 4 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 3fe37495f63d..80ed3e1becf9 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -3001,7 +3001,7 @@ print_address(unsigned long addr)
 static void
 dump_log_buf(void)
 {
-	struct kmsg_dumper dumper = { .active = 1 };
+	struct kmsg_dumper dumper;
 	unsigned char buf[128];
 	size_t len;
 
diff --git a/include/linux/kmsg_dump.h b/include/linux/kmsg_dump.h
index 070c994ff19f..84eaa2090efa 100644
--- a/include/linux/kmsg_dump.h
+++ b/include/linux/kmsg_dump.h
@@ -36,7 +36,6 @@ enum kmsg_dump_reason {
  * 		through the record iterator
  * @max_reason:	filter for highest reason number that should be dumped
  * @registered:	Flag that specifies if this is already registered
- * @active:	Flag that specifies if this is currently dumping
  * @cur_seq:	Points to the oldest message to dump
  * @next_seq:	Points after the newest message to dump
  */
@@ -44,7 +43,6 @@ struct kmsg_dumper {
 	struct list_head list;
 	void (*dump)(struct kmsg_dumper *dumper, enum kmsg_dump_reason reason);
 	enum kmsg_dump_reason max_reason;
-	bool active;
 	bool registered;
 
 	/* private state of the kmsg iterator */
diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 930ac1b25ec7..315169d5e119 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -2101,7 +2101,7 @@ static int kdb_dmesg(int argc, const char **argv)
 	int adjust = 0;
 	int n = 0;
 	int skip = 0;
-	struct kmsg_dumper dumper = { .active = 1 };
+	struct kmsg_dumper dumper;
 	size_t len;
 	char buf[201];
 
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index e794a08de00f..ce4cc64ba7c9 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3408,8 +3408,6 @@ void kmsg_dump(enum kmsg_dump_reason reason)
 			continue;
 
 		/* initialize iterator with data about the stored records */
-		dumper->active = true;
-
 		logbuf_lock_irqsave(flags);
 		dumper->cur_seq = latched_seq_read_nolock(&clear_seq);
 		dumper->next_seq = prb_next_seq(prb);
@@ -3417,9 +3415,6 @@ void kmsg_dump(enum kmsg_dump_reason reason)
 
 		/* invoke dumper which will iterate over records */
 		dumper->dump(dumper, reason);
-
-		/* reset iterator */
-		dumper->active = false;
 	}
 	rcu_read_unlock();
 }
@@ -3454,9 +3449,6 @@ bool kmsg_dump_get_line_nolock(struct kmsg_dumper *dumper, bool syslog,
 
 	prb_rec_init_rd(&r, &info, line, size);
 
-	if (!dumper->active)
-		goto out;
-
 	/* Read text or count text lines? */
 	if (line) {
 		if (!prb_read_valid(prb, dumper->cur_seq, &r))
@@ -3542,7 +3534,7 @@ bool kmsg_dump_get_buffer(struct kmsg_dumper *dumper, bool syslog,
 	bool ret = false;
 	bool time = printk_time;
 
-	if (!dumper->active || !buf || !size)
+	if (!buf || !size)
 		goto out;
 
 	logbuf_lock_irqsave(flags);
-- 
2.20.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
