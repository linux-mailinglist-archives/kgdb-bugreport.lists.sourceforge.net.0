Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD30129EF9C
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 29 Oct 2020 16:21:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kY9k7-0005LR-Em
	for lists+kgdb-bugreport@lfdr.de; Thu, 29 Oct 2020 15:21:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1kY9k5-0005Kv-HT
 for kgdb-bugreport@lists.sourceforge.net; Thu, 29 Oct 2020 15:21:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JzHSvmUsV227fQsl4wNt959KTE87kP0KBA8sqcTaQtk=; b=DHm3yQiyOpzC7I1ACjhwHCEnvW
 LaVbR+UOf0gvm2F/x5TpNn1BvvEH9Rn3nqI/RZdDqHhNQAejA8n6VSf6/DAB7X13h1QTmxDjimhxA
 of/ubaiQ/oxDO2C1U0sB8wDbMd8Kg0hM2AZF6meE0Pg2nf/LrJPL9yoR7Jq4FkpA/WF0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JzHSvmUsV227fQsl4wNt959KTE87kP0KBA8sqcTaQtk=; b=T/9oevb02TvvhnvatxuKbyKpeZ
 NozNU3FIhEGsbCvJOf7e/xad2ywCCZYSh4dbnuu+N+/UNpJYXsVTrs+jEpW5ZmOlfC2Hh40gUxMd3
 zd/KEHRLw2R7WqLIvcIOpLmuZ5blPsoP7YjKV/if6HLDOe7zVy6rxZHB0UtCmCpEFfqs=;
Received: from mail-wm1-f67.google.com ([209.85.128.67])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kY9ju-001AlW-Vb
 for kgdb-bugreport@lists.sourceforge.net; Thu, 29 Oct 2020 15:21:33 +0000
Received: by mail-wm1-f67.google.com with SMTP id e2so236987wme.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 29 Oct 2020 08:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JzHSvmUsV227fQsl4wNt959KTE87kP0KBA8sqcTaQtk=;
 b=ZPvsMX4nw+ff9jknDVrXMuSq3+wAcoKuseGW3S3Y8U2WIl6JkRHjo46QxE4y1FJ+W9
 mwZO4IGK1lo4Kw8dQIBwqtGcnkLb8xuCEWJBn0uszViOY7bQgtKAMB7kwsi8Vup8z4Ks
 Ss4Kvb7pD5g6wwYPyRo5mjVaIQGibcQjI0hmIlku2TnbOvcVNZuM8CC9kwfKJrprBl0P
 jKDbv+agSdPALk3umxC0GE4YpgXO1la4jpyCk4P0q5KCIa/VLylDlEMD4oG/TlP1zaqI
 zHXNSdSWc9HI5yLac98t8PDDAmrp6SEBTW83IZZpYLiba3x8YNKA9/hmg5h3IfgNGfK+
 QkAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JzHSvmUsV227fQsl4wNt959KTE87kP0KBA8sqcTaQtk=;
 b=m0C6OfGZN8q4epE2c8pqy2QQ6151e2eUA4IrawyOcJuvWC/IKV0zt/5K00j5YoD6Nv
 hKmfMxnjYP5Ddr9VwTeF9Cabpfn/ajr5mY5cLwJVICsjDBxW0gEPE4s3P3TUg3APSD97
 Pw0i79XUHoneVd/oRjBCloAUH1mvKVvhQX5WnvyB+LWh/X6eE2HMPVIqZHoCM0kpMvC9
 yoA/K0gq+JcnVPKbg3lCAJ/cZkc6xn2Mo77TZC94EJ0yszvbDHEEqckrLObN9k6VlVv4
 /g2IDHtfBYboH3KB4KoCFvcHzGEfZeR7qKha5xrchX4Ku5etMCusRwc1SFbxlaYY6r0/
 JpOw==
X-Gm-Message-State: AOAM530ChvFfb4qGcAhkYwDImPsuLUsmj+u/ffLMaR8O5Pzbe5+0mJkO
 /B2E/xRrOARYh98IUn+uGiSqLA==
X-Google-Smtp-Source: ABdhPJx1p2SY/MipkhW/f0dmQ/6HAtDeZEqTbAFlKHZreX2asO0rDbAzZbcJTZL6uueIabM80cxCkA==
X-Received: by 2002:a1c:3c44:: with SMTP id j65mr356319wma.13.1603984869372;
 Thu, 29 Oct 2020 08:21:09 -0700 (PDT)
Received: from holly.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id l1sm6546244wrb.1.2020.10.29.08.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 08:21:08 -0700 (PDT)
Date: Thu, 29 Oct 2020 15:21:06 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20201029152106.gj66mjnathsdqtoe@holly.lan>
References: <1603983387-8738-1-git-send-email-sumit.garg@linaro.org>
 <1603983387-8738-7-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1603983387-8738-7-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kY9ju-001AlW-Vb
Subject: Re: [Kgdb-bugreport] [PATCH v6 6/7] kgdb: roundup: Allow runtime
 arch specific override
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
Cc: mark.rutland@arm.com, tsbogend@alpha.franken.de,
 linux-kernel@vger.kernel.org, jason@lakedaemon.net, ito-yuichi@fujitsu.com,
 maz@kernel.org, x86@kernel.org, linux@armlinux.org.uk,
 jason.wessel@windriver.com, mingo@redhat.com, bp@alien8.de, mpe@ellerman.id.au,
 catalin.marinas@arm.com, kgdb-bugreport@lists.sourceforge.net,
 msys.mizuma@gmail.com, tglx@linutronix.de, julien.thierry.kdev@gmail.com,
 will@kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Oct 29, 2020 at 08:26:26PM +0530, Sumit Garg wrote:
> Add a new API kgdb_arch_roundup_cpus() for a particular archichecture to
> override default kgdb roundup and if it detects at runtime to not support
> NMI roundup then it can fallback to default implementation using async
> SMP cross-calls.
> 
> Currently such an architecture example is arm64 supporting pseudo NMIs
> feature which is only available on platforms which have support for GICv3
> or later version.
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  arch/powerpc/kernel/kgdb.c |  3 ++-
>  arch/sparc/kernel/smp_64.c |  3 ++-
>  arch/x86/kernel/kgdb.c     |  6 ++++--
>  include/linux/kgdb.h       |  5 +++--
>  kernel/debug/debug_core.c  | 10 +++++++++-
>  5 files changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/kgdb.c b/arch/powerpc/kernel/kgdb.c
> index 4090802..126575d 100644
> --- a/arch/powerpc/kernel/kgdb.c
> +++ b/arch/powerpc/kernel/kgdb.c
> @@ -125,9 +125,10 @@ static int kgdb_debugger_ipi(struct pt_regs *regs)
>  }
>  
>  #ifdef CONFIG_SMP
> -void kgdb_roundup_cpus(void)
> +bool kgdb_arch_roundup_cpus(void)
>  {
>  	smp_send_debugger_break();
> +	return true;
>  }
>  #endif
>  
> diff --git a/arch/sparc/kernel/smp_64.c b/arch/sparc/kernel/smp_64.c
> index e38d8bf..c459c83 100644
> --- a/arch/sparc/kernel/smp_64.c
> +++ b/arch/sparc/kernel/smp_64.c
> @@ -1014,9 +1014,10 @@ void flush_dcache_page_all(struct mm_struct *mm, struct page *page)
>  }
>  
>  #ifdef CONFIG_KGDB
> -void kgdb_roundup_cpus(void)
> +bool kgdb_arch_roundup_cpus(void)
>  {
>  	smp_cross_call(&xcall_kgdb_capture, 0, 0, 0);
> +	return true;
>  }
>  #endif
>  
> diff --git a/arch/x86/kernel/kgdb.c b/arch/x86/kernel/kgdb.c
> index ff7878d..1b756d9 100644
> --- a/arch/x86/kernel/kgdb.c
> +++ b/arch/x86/kernel/kgdb.c
> @@ -404,7 +404,8 @@ static void kgdb_disable_hw_debug(struct pt_regs *regs)
>  
>  #ifdef CONFIG_SMP
>  /**
> - *	kgdb_roundup_cpus - Get other CPUs into a holding pattern
> + *	kgdb_arch_roundup_cpus - Get other CPUs into a holding pattern
> + *				 in an architectural specific manner
>   *
>   *	On SMP systems, we need to get the attention of the other CPUs
>   *	and get them be in a known state.  This should do what is needed
> @@ -414,9 +415,10 @@ static void kgdb_disable_hw_debug(struct pt_regs *regs)
>   *
>   *	On non-SMP systems, this is not called.
>   */
> -void kgdb_roundup_cpus(void)
> +bool kgdb_arch_roundup_cpus(void)
>  {
>  	apic_send_IPI_allbutself(NMI_VECTOR);
> +	return true;
>  }
>  #endif
>  
> diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> index 0d6cf64..f9db5b8 100644
> --- a/include/linux/kgdb.h
> +++ b/include/linux/kgdb.h
> @@ -200,7 +200,8 @@ kgdb_arch_handle_qxfer_pkt(char *remcom_in_buffer,
>  extern void kgdb_call_nmi_hook(void *ignored);
>  
>  /**
> - *	kgdb_roundup_cpus - Get other CPUs into a holding pattern
> + *	kgdb_arch_roundup_cpus - Get other CPUs into a holding pattern
> + *				 in an architectural specific manner
>   *
>   *	On SMP systems, we need to get the attention of the other CPUs
>   *	and get them into a known state.  This should do what is needed
> @@ -210,7 +211,7 @@ extern void kgdb_call_nmi_hook(void *ignored);
>   *
>   *	On non-SMP systems, this is not called.
>   */
> -extern void kgdb_roundup_cpus(void);
> +extern bool kgdb_arch_roundup_cpus(void);
>  
>  /**
>   *	kgdb_arch_set_pc - Generic call back to the program counter
> diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> index 1e75a89..27e401c 100644
> --- a/kernel/debug/debug_core.c
> +++ b/kernel/debug/debug_core.c
> @@ -241,13 +241,21 @@ void __weak kgdb_call_nmi_hook(void *ignored)
>  }
>  NOKPROBE_SYMBOL(kgdb_call_nmi_hook);
>  
> -void __weak kgdb_roundup_cpus(void)
> +bool __weak kgdb_arch_roundup_cpus(void)
> +{
> +	return false;

Do we really need to introduce all these boolean return values just to
call a bit of library code when one of the architectures wants to
fallback to a generic implementation?

Why not something more like:

void kgdb_smp_call_nmi_hook(void)
{
    /* original weak version of kgdb_roundup_cpus goes here */
}

void __weak kgdb_roundup_cpus(void)
{
    kgdb_smp_call_nmi_hook();
}

arm64 can now simply call the new library function if a fallback is needed. 

Note that same question applies to the backtrace changes...


Daniel.


> +}
> +
> +static void kgdb_roundup_cpus(void)
>  {
>  	call_single_data_t *csd;
>  	int this_cpu = raw_smp_processor_id();
>  	int cpu;
>  	int ret;
>  
> +	if (kgdb_arch_roundup_cpus())
> +		return;
> +
>  	for_each_online_cpu(cpu) {
>  		/* No need to roundup ourselves */
>  		if (cpu == this_cpu)
> -- 
> 2.7.4
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
