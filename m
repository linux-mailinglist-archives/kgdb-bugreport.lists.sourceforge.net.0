Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0243A1DB007
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 20 May 2020 12:22:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jbLs6-0002TC-Pk
	for lists+kgdb-bugreport@lfdr.de; Wed, 20 May 2020 10:22:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pmladek@suse.com>) id 1jbLs5-0002T4-Hn
 for kgdb-bugreport@lists.sourceforge.net; Wed, 20 May 2020 10:22:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=juXBKxLygGCPgkWIXf/+YwcrHV935SF6Y8y3UcJwBsE=; b=DI83ghlCxZjkWn7Ndf43np6561
 ZU2j2T4y9CEBpdDnoD7CMTqJAbbRsd9yRxB/UnDIGbDZesNS4lYjg5Nxyp69gwXhNJnFNiTZdHQDV
 t9OLMJIwiLYztcP6M0ruBm33ZCIg6z6FAVxeXlkPxqCMg09PrWf6o0UoXZcbU/c7+viw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=juXBKxLygGCPgkWIXf/+YwcrHV935SF6Y8y3UcJwBsE=; b=NgTe8abEMUmVtyZlfTcw2ux3AQ
 q4M7oCNwbMK6PRnmBBAQOSQ4hF0I6425af7qNwILqEqS76eqgJfwTAhK9q+t8IAB+aJ82R5COBQF9
 6+UupBkr7qaPm0EP3HTQmIduPvtV1M9CmoFSYJBer9X6dggLc1DGxJqpwquN2RH6a/jg=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jbLs3-00GU4k-TG
 for kgdb-bugreport@lists.sourceforge.net; Wed, 20 May 2020 10:22:45 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 29739AEC2;
 Wed, 20 May 2020 10:22:37 +0000 (UTC)
Date: Wed, 20 May 2020 12:22:33 +0200
From: Petr Mladek <pmladek@suse.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <20200520102233.GC3464@linux-b0ei>
References: <20200512142533.ta4uejwmq5gchtlx@holly.lan>
 <CAFA6WYOV7oPbYE=9fXueYMacb5wv0r9T6F8tmECt-Eafe-fctw@mail.gmail.com>
 <20200514084230.GO17734@linux-b0ei>
 <CAFA6WYPSsgdAB-wJC0e2YkVkW0XsqQsu5wrn4iB4M-cwvS7z2g@mail.gmail.com>
 <20200515085021.GS17734@linux-b0ei>
 <20200515103308.GD42471@jagdpanzerIV.localdomain>
 <20200515134806.5cw4xxnxw7k3223l@holly.lan>
 <20200518092139.GK7340@linux-b0ei>
 <20200520042102.GA938@jagdpanzerIV.localdomain>
 <20200520093557.lwwxnhvgmacipdce@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200520093557.lwwxnhvgmacipdce@holly.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jbLs3-00GU4k-TG
Subject: [Kgdb-bugreport] [PATCH v2] printk/kdb: Redirect printk messages
 into kdb in any context
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
Cc: John Ogness <john.ogness@linutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Steven Rostedt <rostedt@goodmis.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

kdb has to get messages on consoles even when the system is stopped.
It uses kdb_printf() internally and calls console drivers on its own.

It uses a hack to reuse an existing code. It sets "kdb_trap_printk"
global variable to redirect even the normal printk() into the
kdb_printf() variant.

The variable "kdb_trap_printk" is checked in printk_default() and
it is ignored when printk is redirected to printk_safe in NMI context.
Solve this by moving the check into printk_func().

It is obvious that it is not fully safe. But it does not make things
worse. The console drivers are already called in this context by
db_printf() direct calls.

Reported-by: Sumit Garg <sumit.garg@linaro.org>
Tested-by: Sumit Garg <sumit.garg@linaro.org>
Signed-off-by: Petr Mladek <pmladek@suse.com>
---
Changes in v2:

   + more detailed commit message

 kernel/printk/printk.c      | 14 +-------------
 kernel/printk/printk_safe.c |  7 +++++++
 2 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 9a9b6156270b..63a1aa377cd9 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -35,7 +35,6 @@
 #include <linux/memblock.h>
 #include <linux/syscalls.h>
 #include <linux/crash_core.h>
-#include <linux/kdb.h>
 #include <linux/ratelimit.h>
 #include <linux/kmsg_dump.h>
 #include <linux/syslog.h>
@@ -2036,18 +2035,7 @@ EXPORT_SYMBOL(vprintk);
 
 int vprintk_default(const char *fmt, va_list args)
 {
-	int r;
-
-#ifdef CONFIG_KGDB_KDB
-	/* Allow to pass printk() to kdb but avoid a recursion. */
-	if (unlikely(kdb_trap_printk && kdb_printf_cpu < 0)) {
-		r = vkdb_printf(KDB_MSGSRC_PRINTK, fmt, args);
-		return r;
-	}
-#endif
-	r = vprintk_emit(0, LOGLEVEL_DEFAULT, NULL, 0, fmt, args);
-
-	return r;
+	return vprintk_emit(0, LOGLEVEL_DEFAULT, NULL, 0, fmt, args);
 }
 EXPORT_SYMBOL_GPL(vprintk_default);
 
diff --git a/kernel/printk/printk_safe.c b/kernel/printk/printk_safe.c
index d9a659a686f3..7ccb821d0bfe 100644
--- a/kernel/printk/printk_safe.c
+++ b/kernel/printk/printk_safe.c
@@ -6,6 +6,7 @@
 #include <linux/preempt.h>
 #include <linux/spinlock.h>
 #include <linux/debug_locks.h>
+#include <linux/kdb.h>
 #include <linux/smp.h>
 #include <linux/cpumask.h>
 #include <linux/irq_work.h>
@@ -359,6 +360,12 @@ void __printk_safe_exit(void)
 
 __printf(1, 0) int vprintk_func(const char *fmt, va_list args)
 {
+#ifdef CONFIG_KGDB_KDB
+	/* Allow to pass printk() to kdb but avoid a recursion. */
+	if (unlikely(kdb_trap_printk && kdb_printf_cpu < 0))
+		return vkdb_printf(KDB_MSGSRC_PRINTK, fmt, args);
+#endif
+
 	/*
 	 * Try to use the main logbuf even in NMI. But avoid calling console
 	 * drivers that might have their own locks.
-- 
2.26.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
