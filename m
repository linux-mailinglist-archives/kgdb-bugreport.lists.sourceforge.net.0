Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 763363DF17D
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  3 Aug 2021 17:30:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1mAwNW-0004X6-9X
	for lists+kgdb-bugreport@lfdr.de; Tue, 03 Aug 2021 15:30:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <john.ogness@linutronix.de>) id 1mAwNV-0004X0-35
 for kgdb-bugreport@lists.sourceforge.net; Tue, 03 Aug 2021 15:30:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JYAidDTtZlwD0eAmDJGiwHLKb2zrViR5iopfW/47ycc=; b=T7wZvg00sNSkxJcb3cPuLSjQi
 mR4dxUjAgr12Ge3sdbdG97+vCz1oq4D2gcAbqAuhSbKtIpqhJk6i+8KhegMvv1TszcjDanH2GN+Q+
 E37fcg2iSDNsPpn97zgx6HhZya43YX9/QbTlRGv2n27fNvjR7Hw/lHdr31C3Oob6v7gGo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JYAidDTtZlwD0eAmDJGiwHLKb2zrViR5iopfW/47ycc=; b=gFwa9teYfQ5tdiOHl7timcl/9a
 346Zsf4wFe6eZr5lUYNjsVLzk3EN038YtZGpuB8LA4ZgfRMce24KeNyLqbE4Rc/hJ39mSxH5vv/43
 Ex2ZPYRa7IpXvWhbPc13PS5wougCssF2I3H6gmXYCgCJUpkAOd6uk/3jAhNE8wna82aw=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mAwNO-0005Fz-0Q
 for kgdb-bugreport@lists.sourceforge.net; Tue, 03 Aug 2021 15:30:48 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1628004633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JYAidDTtZlwD0eAmDJGiwHLKb2zrViR5iopfW/47ycc=;
 b=OqjOI/FbmrK18S3ZvolMVu6MnmqMbOBo9jrdeXX3wxV7sqCVpdjTRar0H7i0ExNzY5bR/X
 PdP6sVQRAPdOYEMbxPgbQpXhiP/YVGhgrClPXAfjkOLUjk6nKsl2opF1S0+2EWZi8fdTVQ
 OyF18c9yESpVQ1ED39gaPl7oFtEgs51vYZX7ouRviNrfeq89w+mkATGMlPRG116iVVa1sP
 aAVNstXlI6g5+Od+hSIym7JtGUKKUBCybkbw6Tq9/SDXhAX0rTcnPPRvsN0GraIj3Cb00c
 qPHfZgWp/+9IGkAMNPiGT1MYOTT8EI5B06YAqc4VThaM1sSv5Bxo5RItB4a/cg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1628004633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JYAidDTtZlwD0eAmDJGiwHLKb2zrViR5iopfW/47ycc=;
 b=+B9KGpXLz+WiAwY5HjTHSwrgLkU2AO4ktjbvjOzrUjWKgCCoYGx8mHsRRMGq0543zI3G5c
 yoN+x2AyyiqMdSCw==
To: Daniel Thompson <daniel.thompson@linaro.org>
In-Reply-To: <20210803142558.cz7apumpgijs5y4y@maple.lan>
References: <20210803131301.5588-1-john.ogness@linutronix.de>
 <20210803131301.5588-4-john.ogness@linutronix.de>
 <20210803142558.cz7apumpgijs5y4y@maple.lan>
Date: Tue, 03 Aug 2021 17:36:32 +0206
Message-ID: <87tuk635rb.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not exist)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1mAwNO-0005Fz-0Q
Subject: Re: [Kgdb-bugreport] [PATCH printk v1 03/10] kgdb: delay roundup if
 holding printk cpulock
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, "H.
 Peter Anvin" <hpa@zytor.com>, Chengyang Fan <cy.fan@huawei.com>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Ingo Molnar <mingo@redhat.com>,
 kgdb-bugreport@lists.sourceforge.net, Petr Mladek <pmladek@suse.com>,
 Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jason Wessel <jason.wessel@windriver.com>, linuxppc-dev@lists.ozlabs.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 2021-08-03, Daniel Thompson <daniel.thompson@linaro.org> wrote:
> On Tue, Aug 03, 2021 at 03:18:54PM +0206, John Ogness wrote:
>> kgdb makes use of its own cpulock (@dbg_master_lock, @kgdb_active)
>> during cpu roundup. This will conflict with the printk cpulock.
>
> When the full vision is realized what will be the purpose of the printk
> cpulock?
>
> I'm asking largely because it's current role is actively unhelpful
> w.r.t. kdb. It is possible that cautious use of in_dbg_master() might
> be a better (and safer) solution. However it sounds like there is a
> larger role planned for the printk cpulock...

The printk cpulock is used as a synchronization mechanism for
implementing atomic consoles, which need to be able to safely interrupt
the console write() activity at any time and immediately continue with
their own printing. The ultimate goal is to move all console printing
into per-console dedicated kthreads, so the primary function of the
printk cpulock is really to immediately _stop_ the CPU/kthread
performing write() in order to allow write_atomic() (from any context on
any CPU) to safely and reliably take over.

Atomic consoles are actually quite similar to the kgdb_io ops. For
example, comparing:

serial8250_console_write_atomic() + serial8250_console_putchar_locked()

with

serial8250_put_poll_char()

The difference is that serial8250_console_write_atomic() is line-based
and synchronizing with serial8250_console_write() so that if the kernel
crashes while outputing to the console, write() can be interrupted by
write_atomic() and cleanly formatted crash data can be output.

Also serial8250_put_poll_char() is calling into __pm_runtime_resume(),
which includes a spinlock and possibly sleeping. This would not be
acceptable for atomic consoles. Although, as Andy pointed out [0], I
will need to figure out how to deal with suspended consoles. Or just
implement a policy that registered atomic consoles may never be
suspended.

I had not considered merging kgdb_io ops with atomic console ops. But
now that I look at it more closely, there may be some useful overlap. I
will consider this. Thank you for this idea.

>> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
>> index 3d0c933937b4..1b546e117f10 100644
>> --- a/kernel/printk/printk.c
>> +++ b/kernel/printk/printk.c
>> @@ -214,6 +215,7 @@ int devkmsg_sysctl_set_loglvl(struct ctl_table *table, int write,
>>  #ifdef CONFIG_SMP
>>  static atomic_t printk_cpulock_owner = ATOMIC_INIT(-1);
>>  static atomic_t printk_cpulock_nested = ATOMIC_INIT(0);
>> +static unsigned int kgdb_cpu = -1;
>
> Is this the flag to provoke retriggering? It appears to be a write-only
> variable (at least in this patch). How is it consumed?

Critical catch! Thank you. I am quite unhappy to see these hunks were
accidentally dropped when generating this series.

@@ -3673,6 +3675,9 @@ EXPORT_SYMBOL(__printk_cpu_trylock);
  */
 void __printk_cpu_unlock(void)
 {
+	bool trigger_kgdb = false;
+	unsigned int cpu;
+
 	if (atomic_read(&printk_cpulock_nested)) {
 		atomic_dec(&printk_cpulock_nested);
 		return;
@@ -3683,6 +3688,12 @@ void __printk_cpu_unlock(void)
 	 * LMM(__printk_cpu_unlock:A)
 	 */
 
+	cpu = smp_processor_id();
+	if (kgdb_cpu == cpu) {
+		trigger_kgdb = true;
+		kgdb_cpu = -1;
+	}
+
 	/*
 	 * Guarantee loads and stores from this CPU when it was the
 	 * lock owner are visible to the next lock owner. This pairs
@@ -3703,6 +3714,21 @@ void __printk_cpu_unlock(void)
 	 */
 	atomic_set_release(&printk_cpulock_owner,
 			   -1); /* LMM(__printk_cpu_unlock:B) */
+
+	if (trigger_kgdb) {
+		pr_warn("re-triggering kgdb roundup for CPU#%d\n", cpu);
+		kgdb_roundup_cpu(cpu);
+	}
 }
 EXPORT_SYMBOL(__printk_cpu_unlock);

John Ogness

[0] https://lore.kernel.org/lkml/YQlKAeXS9MPmE284@smile.fi.intel.com


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
