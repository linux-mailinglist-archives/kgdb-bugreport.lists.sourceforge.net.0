Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5292A3DF03D
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  3 Aug 2021 16:26:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1mAvN8-0002US-4D
	for lists+kgdb-bugreport@lfdr.de; Tue, 03 Aug 2021 14:26:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1mAvMy-0002TV-RG
 for kgdb-bugreport@lists.sourceforge.net; Tue, 03 Aug 2021 14:26:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Hyrev4qZ9gpvHA1KPCI74nwAO20DWHqFncjdod67xeY=; b=RoFVHuWGRu1OPacwOlWruei5G+
 JEhhL4w1LvNwqc1Iy5OU1ha4V5iyVIVthnlIEuHKARUvtc/igvc4iWK3mL0TI7R7IXr57tqr/TYyj
 /FnSCyO7eJTTa8GHVhAbDTvOV54QyV3JqPFW1RXNYiwTGyfPdBXK9UkSjiQBflUj5UWc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Hyrev4qZ9gpvHA1KPCI74nwAO20DWHqFncjdod67xeY=; b=X7n7Usmw75mBiXC6vVID3WwBjI
 edpvnn26T8oyvYZo50dYBUFBBlkkqW0FpPj3vILmo172LBWtbq2GdVnQj1ZEDC7pn7VwnpSZPhJIE
 lQjQ2ZmOGXb2k+S+P1QNyb8axyZl0SQ7Jv+t4sHcFR/N4y4zY83+qSoRMef/8y6TUqGc=;
Received: from mail-wm1-f53.google.com ([209.85.128.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mAvMu-0002LQ-47
 for kgdb-bugreport@lists.sourceforge.net; Tue, 03 Aug 2021 14:26:12 +0000
Received: by mail-wm1-f53.google.com with SMTP id n11so12608271wmd.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 03 Aug 2021 07:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Hyrev4qZ9gpvHA1KPCI74nwAO20DWHqFncjdod67xeY=;
 b=PYhmKlzHVcWBCe22CBKVh/KxzmRCtPAQBvU+UWPmJGHL6O8vEmHQ2VVS7padRiJfDv
 M0L+E63SYkCVgoWe8p7Jfd5Lvh/vsoT3Hi5J0VWPan3CZIXdxpFKAwATKpBrOAGhUKM7
 tW3YaxbCKIcKPv7p7/Kx3CzOZ9ev/Q1EULAYiP/qxyhk5ODDZcKhNo+GVGA0pf/cki+l
 62n2JMxkUOb0ktuQSYOHM48ZBedtzV4VW23uslZwi4WCIUhadBSmTJ4R3hh0SDk3xtii
 KUbHi5FBa2auiSaifO4Ufh18Eq/uukG0ta2ryDOAfVyzBOiYCbrAiIsw/XZP2hS2AE1J
 zzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Hyrev4qZ9gpvHA1KPCI74nwAO20DWHqFncjdod67xeY=;
 b=HBe9nvnWqONdgskHciPgeR/+iRD83XlLSoUbF0AUoAJkdGa37VeZVejb8kXNTfVvMq
 rgGMIcgY6ipVbfQv8kVRqsdN32McM0fZW6y1GueK4WzEvgcyGA8JhbrY+fDbeWfKnUup
 9qM5fHGdRd0k1eT0MVaHmd8UIPN1unrbyCV1rtFjoaT3fX7hNlQWjw58TgVtiBYoZ0on
 owfhPFw9JDwgEH56TyeuODh1VFEnPDMuRIVoo6cPrQ1TkA4wGBw/0lNDgGTnvdT5PxwT
 NQ3jMXumVcpPvC/ia/vV8SA5c/dLwy6o9F9jxcqrXi90PajWoa/DPfY9ZrfTVrkkWImj
 +8eA==
X-Gm-Message-State: AOAM530tKRkCVquHGwX0wjfjDZJ8Nbbuo74340nB9d9QbvFEZl3ZkMxT
 aRcyklZv1CBFbOZHaJpuSXb4EA==
X-Google-Smtp-Source: ABdhPJwBsXTY7UQoTg+5apK7w/53TzVRzoUSN5h/Ae6fXdtB2xBNWKpTQUndSfLu+uJJGNrrmH5HIw==
X-Received: by 2002:a7b:c0c1:: with SMTP id s1mr22633670wmh.130.1628000761410; 
 Tue, 03 Aug 2021 07:26:01 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id f7sm17949139wrr.54.2021.08.03.07.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 07:26:00 -0700 (PDT)
Date: Tue, 3 Aug 2021 15:25:58 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <20210803142558.cz7apumpgijs5y4y@maple.lan>
References: <20210803131301.5588-1-john.ogness@linutronix.de>
 <20210803131301.5588-4-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210803131301.5588-4-john.ogness@linutronix.de>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.53 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.53 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1mAvMu-0002LQ-47
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
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Chengyang Fan <cy.fan@huawei.com>,
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

On Tue, Aug 03, 2021 at 03:18:54PM +0206, John Ogness wrote:
> kgdb makes use of its own cpulock (@dbg_master_lock, @kgdb_active)
> during cpu roundup. This will conflict with the printk cpulock.

When the full vision is realized what will be the purpose of the printk
cpulock?

I'm asking largely because it's current role is actively unhelpful
w.r.t. kdb. It is possible that cautious use of in_dbg_master() might
be a better (and safer) solution. However it sounds like there is a
larger role planned for the printk cpulock...


> Therefore, a CPU must ensure that it is not holding the printk
> cpulock when calling kgdb_cpu_enter(). If it is, it must allow its
> printk context to complete first.
> 
> A new helper function kgdb_roundup_delay() is introduced for kgdb
> to determine if it is holding the printk cpulock. If so, a flag is
> set so that when the printk cpulock is released, kgdb will be
> re-triggered for that CPU.
> 
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> ---
>  arch/powerpc/include/asm/smp.h |  1 +
>  arch/powerpc/kernel/kgdb.c     | 10 +++++++-
>  arch/powerpc/kernel/smp.c      |  5 ++++
>  arch/x86/kernel/kgdb.c         |  9 ++++---
>  include/linux/kgdb.h           |  3 +++
>  include/linux/printk.h         |  8 ++++++
>  kernel/debug/debug_core.c      | 45 ++++++++++++++++++++--------------
>  kernel/printk/printk.c         | 12 +++++++++
>  8 files changed, 70 insertions(+), 23 deletions(-)
> 
> [...]
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 3d0c933937b4..1b546e117f10 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -44,6 +44,7 @@
>  #include <linux/irq_work.h>
>  #include <linux/ctype.h>
>  #include <linux/uio.h>
> +#include <linux/kgdb.h>
>  #include <linux/sched/clock.h>
>  #include <linux/sched/debug.h>
>  #include <linux/sched/task_stack.h>
> @@ -214,6 +215,7 @@ int devkmsg_sysctl_set_loglvl(struct ctl_table *table, int write,
>  #ifdef CONFIG_SMP
>  static atomic_t printk_cpulock_owner = ATOMIC_INIT(-1);
>  static atomic_t printk_cpulock_nested = ATOMIC_INIT(0);
> +static unsigned int kgdb_cpu = -1;

Is this the flag to provoke retriggering? It appears to be a write-only
variable (at least in this patch). How is it consumed?


Daniel.


>  /**
>   * __printk_wait_on_cpu_lock() - Busy wait until the printk cpu-reentrant
> @@ -325,6 +327,16 @@ void __printk_cpu_unlock(void)
>  			   -1); /* LMM(__printk_cpu_unlock:B) */
>  }
>  EXPORT_SYMBOL(__printk_cpu_unlock);
> +
> +bool kgdb_roundup_delay(unsigned int cpu)
> +{
> +	if (cpu != atomic_read(&printk_cpulock_owner))
> +		return false;
> +
> +	kgdb_cpu = cpu;
> +	return true;
> +}
> +EXPORT_SYMBOL(kgdb_roundup_delay);
>  #endif /* CONFIG_SMP */
>  
>  /* Number of registered extended console drivers. */
> -- 
> 2.20.1
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
