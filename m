Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E53FC3E0134
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  4 Aug 2021 14:31:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YcqSDT6kZKr+DjG08N/p60LUfUL1s9ZbouinioWNt3o=; b=Mx3G1AEyxcA+b7UWkbHJWpXzq
	EXNXjm4GrD47U8CobXoMPac7q5OTBdFA1aL3V8PsqSv3p7fJ1tl+AHFID69lOFxMuBSeZ+7mN5UPI
	pRv8Ez0o85vZfxAeDEPUGB4gpR+5wQX2LpM6UM76m19Qtx4tEWbflj6vY5Mh/2KEQfVB4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1mBG3r-0002gc-Nz
	for lists+kgdb-bugreport@lfdr.de; Wed, 04 Aug 2021 12:31:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pmladek@suse.com>) id 1mBG3q-0002gG-Ec
 for kgdb-bugreport@lists.sourceforge.net; Wed, 04 Aug 2021 12:31:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DC4/KiaX6Vt6MBJgEki+wBHi3z9bnh0HTsoiAX5JG+Y=; b=LdxkTOZS9NB/WXZg/7nqADaqg4
 WZ1F260repU8O5qbNDX5WKeDjjZi5Q6g+1KTJowKYcWoAjo4gmfqrdBxTF43xK3qCYVr1sYyT3Z9q
 +uHUAYnsD8pdw+Ue/UGPUNoXBi8TQgO/i3C5TRETCsxTizXtx/YX0zx7ZMvayCKh/WII=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DC4/KiaX6Vt6MBJgEki+wBHi3z9bnh0HTsoiAX5JG+Y=; b=T+fyh3Kx270KR4ddzfP4Kuqhpc
 UoE87epTHZQCdWX7iY62phKx2rBGr0seMnGOYxNwCXiyRbOSO78P9t0qCwySngLhqmTxN57BMWHA2
 Y6apBdGlnW52DYLae9It+LqZzRe+Vzi8pzm/zZgi9r/huYvkbgr8Ll7D4/Ir9YHlKW/I=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mBG3o-0002po-RV
 for kgdb-bugreport@lists.sourceforge.net; Wed, 04 Aug 2021 12:31:50 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 1C1141FDD3;
 Wed,  4 Aug 2021 12:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1628080298; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DC4/KiaX6Vt6MBJgEki+wBHi3z9bnh0HTsoiAX5JG+Y=;
 b=qv89K6eJX6qCyTdTbWC4KoIJyZrT3KxOobSvMJygB5ThmfxOox1BDe2omC2JBPPAoLMtGB
 bKFSc+u2up5Woqc9r/hhTWJ8Ov9DX5HAMaytSa9uS/AcZYXU1vxKGHzVBgdDIPMeXPJbGJ
 AqnoLG6rfavK0Kh86LcdVpnFJG8pEbA=
Received: from suse.cz (unknown [10.100.216.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 4A1B3A3B84;
 Wed,  4 Aug 2021 12:31:37 +0000 (UTC)
Date: Wed, 4 Aug 2021 14:31:36 +0200
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <YQqIqKjRcNhZSaAZ@alley>
References: <20210803131301.5588-1-john.ogness@linutronix.de>
 <20210803131301.5588-4-john.ogness@linutronix.de>
 <20210803142558.cz7apumpgijs5y4y@maple.lan>
 <87tuk635rb.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87tuk635rb.fsf@jogness.linutronix.de>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1mBG3o-0002po-RV
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
From: Petr Mladek via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Chengyang Fan <cy.fan@huawei.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Ingo Molnar <mingo@redhat.com>,
 kgdb-bugreport@lists.sourceforge.net, Nicholas Piggin <npiggin@gmail.com>,
 Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jason Wessel <jason.wessel@windriver.com>, linuxppc-dev@lists.ozlabs.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue 2021-08-03 17:36:32, John Ogness wrote:
> On 2021-08-03, Daniel Thompson <daniel.thompson@linaro.org> wrote:
> > On Tue, Aug 03, 2021 at 03:18:54PM +0206, John Ogness wrote:
> >> kgdb makes use of its own cpulock (@dbg_master_lock, @kgdb_active)
> >> during cpu roundup. This will conflict with the printk cpulock.
> >
> >> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> >> index 3d0c933937b4..1b546e117f10 100644
> >> --- a/kernel/printk/printk.c
> >> +++ b/kernel/printk/printk.c
> >> @@ -214,6 +215,7 @@ int devkmsg_sysctl_set_loglvl(struct ctl_table *table, int write,
> >>  #ifdef CONFIG_SMP
> >>  static atomic_t printk_cpulock_owner = ATOMIC_INIT(-1);
> >>  static atomic_t printk_cpulock_nested = ATOMIC_INIT(0);
> >> +static unsigned int kgdb_cpu = -1;
> >
> > Is this the flag to provoke retriggering? It appears to be a write-only
> > variable (at least in this patch). How is it consumed?
> 
> Critical catch! Thank you. I am quite unhappy to see these hunks were
> accidentally dropped when generating this series.
> 
> @@ -3673,6 +3675,9 @@ EXPORT_SYMBOL(__printk_cpu_trylock);
>   */
>  void __printk_cpu_unlock(void)
>  {
> +	bool trigger_kgdb = false;
> +	unsigned int cpu;
> +
>  	if (atomic_read(&printk_cpulock_nested)) {
>  		atomic_dec(&printk_cpulock_nested);
>  		return;
> @@ -3683,6 +3688,12 @@ void __printk_cpu_unlock(void)
>  	 * LMM(__printk_cpu_unlock:A)
>  	 */
>  
> +	cpu = smp_processor_id();
> +	if (kgdb_cpu == cpu) {
> +		trigger_kgdb = true;
> +		kgdb_cpu = -1;
> +	}

Just in case that this approach is used in the end.

This code looks racy. kgdb_roundup_delay() seems to be called in NMI
context. NMI might happen at this point and set kgdb_cpu after
it was checked.

I am afraid that it won't be easy to make this safe using a single
global variable. A solution might be a per-CPU variable set
by kgdb_roundup_delay() when it owns printk_cpu_lock.
__printk_cpu_unlock() would call kgdb_roundup_cpu(cpu) when
the variable is set.

Nit: The name "kgdb_cpu" is too generic. It is not clear what is
     so special about this CPU. I would call the per-CPU variable
     "kgdb_delayed_roundup" or so.


Best Regards,
Petr

>  	/*
>  	 * Guarantee loads and stores from this CPU when it was the
>  	 * lock owner are visible to the next lock owner. This pairs
> @@ -3703,6 +3714,21 @@ void __printk_cpu_unlock(void)
>  	 */
>  	atomic_set_release(&printk_cpulock_owner,
>  			   -1); /* LMM(__printk_cpu_unlock:B) */
> +
> +	if (trigger_kgdb) {
> +		pr_warn("re-triggering kgdb roundup for CPU#%d\n", cpu);
> +		kgdb_roundup_cpu(cpu);
> +	}
>  }


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
