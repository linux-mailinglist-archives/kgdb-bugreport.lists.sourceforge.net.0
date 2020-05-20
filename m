Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B03441DB8FC
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 20 May 2020 18:08:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jbRGP-0006qc-Fq
	for lists+kgdb-bugreport@lfdr.de; Wed, 20 May 2020 16:08:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jbRGO-0006q6-Oh
 for kgdb-bugreport@lists.sourceforge.net; Wed, 20 May 2020 16:08:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9X29AKPgSRTeiMIz2DwlUf1mEfOfpjq4CbjeVik0R4o=; b=cEzu/bBw8oG0nkE7aOs+r4YpcE
 /SW+zcrtFaN/K69/aHgTL81+KBmIxZNGt8/kwlVlmrP/Rc/sal+MDLmwtCwl+HURIO9680Lz19ed+
 q7e4OhC41kM+o78RnsT/H0pMpU9NM+PxE+OfsbPDjUVpyY7AR03OnWVtV/RKC7hCB99Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9X29AKPgSRTeiMIz2DwlUf1mEfOfpjq4CbjeVik0R4o=; b=LUA9edJZLmGV4lEPMx1fZWphbz
 ArOVoeO/9L8+dsUI9sq757hUlGT1jPQcgHmaa6cvKI38JW3uPvaAmcEUxAWRKjBIWcTc6OUNcW9ee
 WVKtpTCRD7Yq6rhAMeOtR8AfZ2p4l43RO+1ribFOIfBU0kIN9YYwN4uoI1kD+Q8L7hGA=;
Received: from mail-wr1-f67.google.com ([209.85.221.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jbRGK-00GoZ0-ST
 for kgdb-bugreport@lists.sourceforge.net; Wed, 20 May 2020 16:08:12 +0000
Received: by mail-wr1-f67.google.com with SMTP id s8so3699926wrt.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 20 May 2020 09:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9X29AKPgSRTeiMIz2DwlUf1mEfOfpjq4CbjeVik0R4o=;
 b=Iw+6J6FgX1lHR29lNCdTgOctq5/M7Gc0d38gi8K7OqpVloK49QPxDCTKzIY/SHf3pA
 NR86MiOyzSa5vRCPbMbvLcxjJArIpH2gSYW1aS17shpcS5qAvwCKuWYkI+ji3KfLFwoA
 uHzaoVbgnYn5ChYIsKYqAlTMC35pEzunaBn6WqVgps/MxaSOu75nxh49qsBaDBH3nZRh
 2s4AgH6/jqE+uf3uCiY4nVMio7e0R9wVv3VenxJBHdb6KZ2u9pXQPG5D+0UojobEU8YZ
 FsqHotBSEBi8gOYOwH4hElS8aCTxk0CRVP9HTbxMBPB/BdEBZM2driwhM3f1J8vUPFk/
 rHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9X29AKPgSRTeiMIz2DwlUf1mEfOfpjq4CbjeVik0R4o=;
 b=PZP/YHE8KGz8XTusNXK4x+vqRFvt31ifJWd5zcuogjp+qMeA/A4HhtnyEPRUrAym/w
 Njanw/4Utt5W+7viTA+R5Q8zHZbI3vReCZ1i+lO6dcK4xTm6rPNzSXGq0f78EqiyySJ+
 uqhCiBdXv7eyfkI4E9dHh08Tx5wtjfSUEwI05pa9tEqMlvXODE8erdhRFCoyIJKHemJr
 X3vvPwP+qOVK7NH4BTgsZpVNdp9nVbbbAybREqdwvEjFiPJqWXgZDMziOyViX2aLg5rC
 P6vAdo+Q8Fwy4R4nhAXVxxYPEUtKsc59XmH5QPldJnekUP+VVBc9VqrWH458lCxcH7fC
 tAAQ==
X-Gm-Message-State: AOAM5308j1aBN97UOrUTiOwd1oUhUKXvFHUKMT6g4OX8jXNzpX5aDiSm
 xG1o1lxSAYy2+ikkQafCDMcrbA==
X-Google-Smtp-Source: ABdhPJz2yVFKYuqNnJ26jFSxpfcPQbqW+whz1hqMQpRBZTL5U//k/1XfaOG637uqQhysPk2gnnuEMQ==
X-Received: by 2002:adf:a151:: with SMTP id r17mr4676896wrr.161.1589990875413; 
 Wed, 20 May 2020 09:07:55 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id j16sm3292414wru.13.2020.05.20.09.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 09:07:54 -0700 (PDT)
Date: Wed, 20 May 2020 17:07:52 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Petr Mladek <pmladek@suse.com>
Message-ID: <20200520160752.mnkpptc2efscolcs@holly.lan>
References: <CAFA6WYOV7oPbYE=9fXueYMacb5wv0r9T6F8tmECt-Eafe-fctw@mail.gmail.com>
 <20200514084230.GO17734@linux-b0ei>
 <CAFA6WYPSsgdAB-wJC0e2YkVkW0XsqQsu5wrn4iB4M-cwvS7z2g@mail.gmail.com>
 <20200515085021.GS17734@linux-b0ei>
 <20200515103308.GD42471@jagdpanzerIV.localdomain>
 <20200515134806.5cw4xxnxw7k3223l@holly.lan>
 <20200518092139.GK7340@linux-b0ei>
 <20200520042102.GA938@jagdpanzerIV.localdomain>
 <20200520093557.lwwxnhvgmacipdce@holly.lan>
 <20200520102233.GC3464@linux-b0ei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200520102233.GC3464@linux-b0ei>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jbRGK-00GoZ0-ST
Subject: Re: [Kgdb-bugreport] [PATCH v2] printk/kdb: Redirect printk
 messages into kdb in any context
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

On Wed, May 20, 2020 at 12:22:33PM +0200, Petr Mladek wrote:
> kdb has to get messages on consoles even when the system is stopped.
> It uses kdb_printf() internally and calls console drivers on its own.
> 
> It uses a hack to reuse an existing code. It sets "kdb_trap_printk"
> global variable to redirect even the normal printk() into the
> kdb_printf() variant.
> 
> The variable "kdb_trap_printk" is checked in printk_default() and
> it is ignored when printk is redirected to printk_safe in NMI context.
> Solve this by moving the check into printk_func().
> 
> It is obvious that it is not fully safe. But it does not make things
> worse. The console drivers are already called in this context by
> db_printf() direct calls.
> 
> Reported-by: Sumit Garg <sumit.garg@linaro.org>
> Tested-by: Sumit Garg <sumit.garg@linaro.org>
> Signed-off-by: Petr Mladek <pmladek@suse.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
> Changes in v2:
> 
>    + more detailed commit message
> 
>  kernel/printk/printk.c      | 14 +-------------
>  kernel/printk/printk_safe.c |  7 +++++++
>  2 files changed, 8 insertions(+), 13 deletions(-)
> 
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 9a9b6156270b..63a1aa377cd9 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -35,7 +35,6 @@
>  #include <linux/memblock.h>
>  #include <linux/syscalls.h>
>  #include <linux/crash_core.h>
> -#include <linux/kdb.h>
>  #include <linux/ratelimit.h>
>  #include <linux/kmsg_dump.h>
>  #include <linux/syslog.h>
> @@ -2036,18 +2035,7 @@ EXPORT_SYMBOL(vprintk);
>  
>  int vprintk_default(const char *fmt, va_list args)
>  {
> -	int r;
> -
> -#ifdef CONFIG_KGDB_KDB
> -	/* Allow to pass printk() to kdb but avoid a recursion. */
> -	if (unlikely(kdb_trap_printk && kdb_printf_cpu < 0)) {
> -		r = vkdb_printf(KDB_MSGSRC_PRINTK, fmt, args);
> -		return r;
> -	}
> -#endif
> -	r = vprintk_emit(0, LOGLEVEL_DEFAULT, NULL, 0, fmt, args);
> -
> -	return r;
> +	return vprintk_emit(0, LOGLEVEL_DEFAULT, NULL, 0, fmt, args);
>  }
>  EXPORT_SYMBOL_GPL(vprintk_default);
>  
> diff --git a/kernel/printk/printk_safe.c b/kernel/printk/printk_safe.c
> index d9a659a686f3..7ccb821d0bfe 100644
> --- a/kernel/printk/printk_safe.c
> +++ b/kernel/printk/printk_safe.c
> @@ -6,6 +6,7 @@
>  #include <linux/preempt.h>
>  #include <linux/spinlock.h>
>  #include <linux/debug_locks.h>
> +#include <linux/kdb.h>
>  #include <linux/smp.h>
>  #include <linux/cpumask.h>
>  #include <linux/irq_work.h>
> @@ -359,6 +360,12 @@ void __printk_safe_exit(void)
>  
>  __printf(1, 0) int vprintk_func(const char *fmt, va_list args)
>  {
> +#ifdef CONFIG_KGDB_KDB
> +	/* Allow to pass printk() to kdb but avoid a recursion. */
> +	if (unlikely(kdb_trap_printk && kdb_printf_cpu < 0))
> +		return vkdb_printf(KDB_MSGSRC_PRINTK, fmt, args);
> +#endif
> +
>  	/*
>  	 * Try to use the main logbuf even in NMI. But avoid calling console
>  	 * drivers that might have their own locks.
> -- 
> 2.26.1
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
