Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7969529F1BA
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 29 Oct 2020 17:39:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kYAxj-0005bS-76
	for lists+kgdb-bugreport@lfdr.de; Thu, 29 Oct 2020 16:39:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1kYAxh-0005bH-Bu
 for kgdb-bugreport@lists.sourceforge.net; Thu, 29 Oct 2020 16:39:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/X0z9D5StzrR2gJv46EfC2VHnTfH4ML+qlpUJ/1iF+I=; b=N0v7BEP62PEhi9JfrgSVuOBoR/
 MzDFRe8n89jmAIw3d68D0OetKl7+kkziJ2iAXQ5yRJkEYa5UkklLFbp6eWb1Gm6rY9Ns6qnbENKui
 cdgff5eHYQScQLJSyDztfCXtYNdBnqZe1+7CHVv5SWtTvdeK5JqlEcoRtnvHxikj/SpA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/X0z9D5StzrR2gJv46EfC2VHnTfH4ML+qlpUJ/1iF+I=; b=M1swAaqRE9XcsttpxQnRtrX7rO
 nwQX2yGNXAIrtlCdVMdlXB+yIIGFQ+OAnm5OMZib5Lx356jgkdYM2csGn5L+0M8jYb+7qWBH2rO3L
 LNKS9Gjnnz2YUOyjy8l3Ml/FoLuwqKtCeb5rkA0eoy2MtOUS/la1F95dFtVUk1Tm1ju4=;
Received: from mail-wm1-f67.google.com ([209.85.128.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kYAxW-00Bmdq-US
 for kgdb-bugreport@lists.sourceforge.net; Thu, 29 Oct 2020 16:39:41 +0000
Received: by mail-wm1-f67.google.com with SMTP id w23so443162wmi.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 29 Oct 2020 09:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/X0z9D5StzrR2gJv46EfC2VHnTfH4ML+qlpUJ/1iF+I=;
 b=DmLKqeKyk0dqGc6t7dPQVA0wlU3ut9WP5Rh3yL4ePCErzgdlGOIuiBAVWy6JE02iO8
 qmZz6QNdCCV6XoAl2wE00TWDN6gmpfTQFRyYFg5NfjZrx+2pA4hevSRi9C77jyGcxpNX
 EdzsLd2OkS7pXMGPsSBQAJUDczyBgJfq4oEDXYULZGP+D81NE8g3x7DgNMUe0MBgVy9r
 XJ7ay86U/4IeAevtZ9dW1JZK4z0s39CGt06HXG+JxTcOieqcQoek+pC5S+ZuCj80RdFg
 lGNZMD5d/iJpmwFM3fn6CJduPDJEFZgmzrKSq1sIg93bD+iCs20yNHBcYYdvNAfqM7vX
 mvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/X0z9D5StzrR2gJv46EfC2VHnTfH4ML+qlpUJ/1iF+I=;
 b=GSHsJkqsG34nFZLst8zu+eXmt4FZMk9yu8kwRKWGfpaXHAjk/U2+ujSLIhgjgDd2c1
 haTjDqpS9pS8P9C3C8QO+KfPesJOcRtza4eDXmWijysIVuSUl4I8+yEuw/Y/Nhk3pWiB
 Hf1rEMcaK2OzEs77nGh9oGzcQQ1rApKtW92FV3ir5nHzNR9AHXK+4c3WjOQ9Fon5iMl6
 vrRbJvXGG7yMb3A7ruEnSjeU1oNgMNUoAHXE15sTLu+3Y/Gvs3k5pYSUhkK6AsNHTRSm
 /uormyNXJBn621UU7fDkxNMuG8KVfy/JmeF4HkrrZgyy7+7j90jCVJKKu6lo1W4jzjFA
 4S1A==
X-Gm-Message-State: AOAM532qH9kDPPc0qJDE69W8FgbHx0MfZhDCCQpUEboEF1l0EhlDcjFW
 0CvFERrzQ8SJUc3FRyfkczmTHA==
X-Google-Smtp-Source: ABdhPJz8+N82idWXZIRdsSVKS2zkCkaLcMs+xln99ZpAybHKOEuFmSsokWfjx79UtnD64dnI0P9hEA==
X-Received: by 2002:a1c:3c44:: with SMTP id j65mr756676wma.13.1603989564464;
 Thu, 29 Oct 2020 09:39:24 -0700 (PDT)
Received: from holly.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id z6sm607926wmi.1.2020.10.29.09.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 09:39:23 -0700 (PDT)
Date: Thu, 29 Oct 2020 16:39:21 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20201029163921.dibail374cwwonvo@holly.lan>
References: <1603983387-8738-1-git-send-email-sumit.garg@linaro.org>
 <1603983387-8738-8-git-send-email-sumit.garg@linaro.org>
 <20201029162234.a5czyjy4eyto6aa4@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201029162234.a5czyjy4eyto6aa4@holly.lan>
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
X-Headers-End: 1kYAxW-00Bmdq-US
Subject: Re: [Kgdb-bugreport] [PATCH v6 7/7] arm64: kgdb: Roundup cpus using
 IPI as NMI
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

On Thu, Oct 29, 2020 at 04:22:34PM +0000, Daniel Thompson wrote:
> On Thu, Oct 29, 2020 at 08:26:27PM +0530, Sumit Garg wrote:
> > arm64 platforms with GICv3 or later supports pseudo NMIs which can be
> > leveraged to roundup CPUs which are stuck in hard lockup state with
> > interrupts disabled that wouldn't be possible with a normal IPI.
> > 
> > So instead switch to roundup CPUs using IPI turned as NMI. And in
> > case a particular arm64 platform doesn't supports pseudo NMIs,
> > it will switch back to default kgdb CPUs roundup mechanism.
> > 
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  arch/arm64/include/asm/kgdb.h |  9 +++++++++
> >  arch/arm64/kernel/ipi_nmi.c   |  5 +++++
> >  arch/arm64/kernel/kgdb.c      | 35 +++++++++++++++++++++++++++++++++++
> >  3 files changed, 49 insertions(+)
> > 
> > diff --git a/arch/arm64/include/asm/kgdb.h b/arch/arm64/include/asm/kgdb.h
> > index 21fc85e..c3d2425 100644
> > --- a/arch/arm64/include/asm/kgdb.h
> > +++ b/arch/arm64/include/asm/kgdb.h
> > @@ -24,6 +24,15 @@ static inline void arch_kgdb_breakpoint(void)
> >  extern void kgdb_handle_bus_error(void);
> >  extern int kgdb_fault_expected;
> >  
> > +#ifdef CONFIG_KGDB
> > +extern bool kgdb_ipi_nmicallback(int cpu, void *regs);
> > +#else
> > +static inline bool kgdb_ipi_nmicallback(int cpu, void *regs)
> > +{
> > +	return false;
> > +}
> > +#endif
> > +
> >  #endif /* !__ASSEMBLY__ */
> >  
> >  /*
> > diff --git a/arch/arm64/kernel/ipi_nmi.c b/arch/arm64/kernel/ipi_nmi.c
> > index 597dcf7..6ace182 100644
> > --- a/arch/arm64/kernel/ipi_nmi.c
> > +++ b/arch/arm64/kernel/ipi_nmi.c
> > @@ -8,6 +8,7 @@
> >  
> >  #include <linux/interrupt.h>
> >  #include <linux/irq.h>
> > +#include <linux/kgdb.h>
> >  #include <linux/nmi.h>
> >  #include <linux/smp.h>
> >  
> > @@ -45,10 +46,14 @@ bool arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
> >  static irqreturn_t ipi_nmi_handler(int irq, void *data)
> >  {
> >  	irqreturn_t ret = IRQ_NONE;
> > +	unsigned int cpu = smp_processor_id();
> >  
> >  	if (nmi_cpu_backtrace(get_irq_regs()))
> >  		ret = IRQ_HANDLED;
> >  
> > +	if (kgdb_ipi_nmicallback(cpu, get_irq_regs()))
> > +		ret = IRQ_HANDLED;
> > +
> >  	return ret;
> 
> It would be better to declare existing return value for
> kgdb_nmicallback() to be dangerously stupid and fix it so it returns an
> irqreturn_t (that's easy since most callers do not need to check the
> return value).
> 
> Then this code simply becomes:
> 
> 	return kgdb_nmicallback(cpu, get_irq_regs());

Actually, reflecting on this maybe it is better to keep kgdb_nmicallin()
and kgdb_nmicallback() aligned w.r.t. return codes (even if they are a
little unusual).

I'm still not sure why we'd keep kgdb_ipi_nmicallback() though.
kgdb_nmicallback() is intended to be called from arch code...


Daniel.


> 
> 
> >  }
> >  
> > diff --git a/arch/arm64/kernel/kgdb.c b/arch/arm64/kernel/kgdb.c
> > index 1a157ca3..c26e710 100644
> > --- a/arch/arm64/kernel/kgdb.c
> > +++ b/arch/arm64/kernel/kgdb.c
> > @@ -17,6 +17,7 @@
> >  
> >  #include <asm/debug-monitors.h>
> >  #include <asm/insn.h>
> > +#include <asm/nmi.h>
> >  #include <asm/traps.h>
> >  
> >  struct dbg_reg_def_t dbg_reg_def[DBG_MAX_REG_NUM] = {
> > @@ -353,3 +354,37 @@ int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt)
> >  	return aarch64_insn_write((void *)bpt->bpt_addr,
> >  			*(u32 *)bpt->saved_instr);
> >  }
> > +
> > +bool kgdb_ipi_nmicallback(int cpu, void *regs)
> > +{
> > +	if (atomic_read(&kgdb_active) != -1) {
> > +		kgdb_nmicallback(cpu, regs);
> > +		return true;
> > +	}
> > +
> > +	return false;
> > +}
> 
> I *really* don't like this function.
> 
> If the return code of kgdb_nmicallback() is broken then fix it, don't
> just wrap it and invent a new criteria for the return code.
> 
> To be honest I don't actually think the logic in kgdb_nmicallback() is
> broken. As mentioned above the return value has a weird definition (0
> for "handled it OK" and 1 for "nothing for me to do") but the logic to
> calculate the return code looks OK.
> 
> 
> > +
> > +static void kgdb_smp_callback(void *data)
> > +{
> > +	unsigned int cpu = smp_processor_id();
> > +
> > +	if (atomic_read(&kgdb_active) != -1)
> > +		kgdb_nmicallback(cpu, get_irq_regs());
> > +}
> 
> This is Unused. I presume it is litter from a previous revision of the
> code and can be deleted?
> 
> 
> > +
> > +bool kgdb_arch_roundup_cpus(void)
> > +{
> > +	struct cpumask mask;
> > +
> > +	if (!arm64_supports_nmi())
> > +		return false;
> > +
> > +	cpumask_copy(&mask, cpu_online_mask);
> > +	cpumask_clear_cpu(raw_smp_processor_id(), &mask);
> > +	if (cpumask_empty(&mask))
> > +		return false;
> 
> Why do we need to fallback if there is no work to do? There will still
> be no work to do when we call the fallback.
> 
> 
> Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
