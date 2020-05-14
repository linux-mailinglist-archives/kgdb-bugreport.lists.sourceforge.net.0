Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FA01D2A86
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 14 May 2020 10:43:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jZ9Su-0005UN-TV
	for lists+kgdb-bugreport@lfdr.de; Thu, 14 May 2020 08:43:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pmladek@suse.com>) id 1jZ9St-0005UD-RR
 for kgdb-bugreport@lists.sourceforge.net; Thu, 14 May 2020 08:43:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5iSUz4RzShc46MC67Q/iaDq2PFyj21LilB84xi2bBaM=; b=BadcfaC46xAg4DzSKndZkX6Jrv
 Gr/8kgODx86uAN7Us0vdS+1e6uDwdQ3t3ihWU3skoMlOH/8m9k7biqGQ8ZGLnHacIH8/ht47L41GP
 xDWkczIjU4ejlUbSXuwd3A5r/ZNzJi77XpWWIUkoOCp2fLTriC9u4zyEdacPB6PXdvFg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5iSUz4RzShc46MC67Q/iaDq2PFyj21LilB84xi2bBaM=; b=mCl48qQ8XApfI8xfO0hwYQU120
 pGtv8WEXeQ7fbdHHUYXpxoGfn6qIE3Wfrog0ZFZSL+664tNn6dmmRHxjQYuNE/EGlg3HxwAc/yRMc
 17NQIylVXS4gxm3VEMvIutZqRaK/FgmynpS3tIZPPQImPLZKX4oMRt2bvxxBKXGmoHwg=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jZ9Ss-00FALb-4E
 for kgdb-bugreport@lists.sourceforge.net; Thu, 14 May 2020 08:43:39 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 99CA3AF48;
 Thu, 14 May 2020 08:43:24 +0000 (UTC)
Date: Thu, 14 May 2020 10:42:36 +0200
From: Petr Mladek <pmladek@suse.com>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20200514084230.GO17734@linux-b0ei>
References: <1589273314-12060-1-git-send-email-sumit.garg@linaro.org>
 <20200512142533.ta4uejwmq5gchtlx@holly.lan>
 <CAFA6WYOV7oPbYE=9fXueYMacb5wv0r9T6F8tmECt-Eafe-fctw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFA6WYOV7oPbYE=9fXueYMacb5wv0r9T6F8tmECt-Eafe-fctw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jZ9Ss-00FALb-4E
Subject: Re: [Kgdb-bugreport] [PATCH] kgdb: Fix broken handling of printk()
 in NMI context
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Steven Rostedt <rostedt@goodmis.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed 2020-05-13 19:04:48, Sumit Garg wrote:
> On Tue, 12 May 2020 at 19:55, Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> >
> > On Tue, May 12, 2020 at 02:18:34PM +0530, Sumit Garg wrote:
> > > Since commit 42a0bb3f7138 ("printk/nmi: generic solution for safe printk
> > > in NMI"), kgdb entry in NMI context defaults to use safe NMI printk()
> >
> > I didn't see the author on Cc: nor any of the folks whose hands it
> > passed through. It would definitely be good to involve them in this
> > discussion.
> >
> 
> Thanks for updating the Cc: list.
> 
> >
> > > which involves CPU specific buffers and deferred printk() until exit from
> > > NMI context.
> > >
> > > But kgdb being a stop-the-world debugger, we don't want to defer printk()
> > > especially backtrace on corresponding CPUs. So instead switch to normal
> > > printk() mode in kgdb_cpu_enter() if entry is in NMI context.
> >
> > So, firstly I should *definitely* take a mea cupla for not shouting
> > about this at the time (I was on Cc:... twice). Only thing I can say
> > confidently is that the test suite didn't yell about this and so I
> > didn't look at this as closely as I should have done (and that it
> > didn't yell is mostly because I'm still building out the test suite
> > coverage).
> >
> > Anyhow...
> >
> > This feels a little like we are smearing the printk() interception logic
> > across the kernel in ways that make things hard to read. If we accepted
> > this patch we then have, the new NMI interception logic, the old kdb
> > interception logic and some hacks in the kgdb trap handler to defang the
> > NMI interception logic and force the kdb logic to kick in.
> >
> > Wouldn't it be better to migrate kdb interception logic up a couple of
> > levels so that it continues to function even when we are in nmi printk
> > mode. That way *all* the printk() interception code would end up in
> > one place.
> >
> 
> Yes it would be better to have all printk() interception code at one
> place. Let me see if I can come up with an integrated logic.

It might be enough to move the kdb_check from vprintk_default()
to vprintk_func().

I have never used kdb. I did not know that it was able to stop
kernel in any context.

Would this work? It is only compile tested!

From 14ae6c9f0cbd1479cb898c864c7ab46e20f3cf6f Mon Sep 17 00:00:00 2001
From: Petr Mladek <pmladek@suse.com>
Date: Thu, 14 May 2020 10:37:44 +0200
Subject: [PATCH] printk/kdb: Redirect printk messages into kdb in any context

kdb is able to stop kernel even in NMI context where printk() is redirected
to the printk_safe() lockless variant. Move the check and redirect to kdb
even in this case.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/printk.c      | 14 +-------------
 kernel/printk/printk_safe.c |  8 ++++++++
 2 files changed, 9 insertions(+), 13 deletions(-)

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
index d9a659a686f3..81734497c625 100644
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
@@ -359,6 +360,13 @@ void __printk_safe_exit(void)
 
 __printf(1, 0) int vprintk_func(const char *fmt, va_list args)
 {
+#ifdef CONFIG_KGDB_KDB
+	/* Allow to pass printk() to kdb but avoid a recursion. */
+	if (unlikely(kdb_trap_printk && kdb_printf_cpu < 0)) {
+		return vkdb_printf(KDB_MSGSRC_PRINTK, fmt, args);
+	}
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
