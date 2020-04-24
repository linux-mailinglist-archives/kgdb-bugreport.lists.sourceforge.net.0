Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBD21B8114
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 24 Apr 2020 22:47:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jS5EJ-0000Lh-Lf
	for lists+kgdb-bugreport@lfdr.de; Fri, 24 Apr 2020 20:47:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jS5EI-0000LG-6o
 for kgdb-bugreport@lists.sourceforge.net; Fri, 24 Apr 2020 20:47:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qeSr0lei+fRC9/QJxXSmPKueqlEcByGy/C+Sm2/krvg=; b=OCtsoGUktYM4Pou+bqo11oqT55
 SBflceRYbOwQKxSqIJwuCavMHw9POYWXWeq5MIgnh38WSwg7DndnERIYtR6IoDnYDs0z12UlwrEwV
 rTWGHn7aLDVMH+pKu6KSSNyQbt1n2MaPEDnA+x6tvtjJVKsHqJxJJ6h6s6a8ldqr02sA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qeSr0lei+fRC9/QJxXSmPKueqlEcByGy/C+Sm2/krvg=; b=DmoY6GQBZ0M07mr1lHYpSzfkgc
 WMH0BlqVWpIGf0IBG6RxSbpvtHY6R2vm1RT8dnZGBBRzne8ctBwSszo8YAZw3L27LRiNcC5dJh7dB
 hFToh398FOp6ne93BX3o1uQnPpdoYx9rHsUoX/JIbdXkMvdZMb3TVVzP7qjiIFx6ZkPA=;
Received: from mail-ua1-f66.google.com ([209.85.222.66])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jS5EG-00DHB6-9p
 for kgdb-bugreport@lists.sourceforge.net; Fri, 24 Apr 2020 20:47:22 +0000
Received: by mail-ua1-f66.google.com with SMTP id c24so10876122uap.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 24 Apr 2020 13:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qeSr0lei+fRC9/QJxXSmPKueqlEcByGy/C+Sm2/krvg=;
 b=Gy4e1DrYdXOs9V95msoY1FVrKuSQ1ZhCKigCD3DdHYa4vQSZF0/wZGOzsXWdhDRQMJ
 ntjWHIAzoYQW/EbWleAXGSfEnaY3ZJ7a7cSARn7y8iNmYUhWJlNIe/hR5f+f+ETIthcj
 +7H9KyKHdOyYM6Yq87MOT6M0ttEfo85nWdehE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qeSr0lei+fRC9/QJxXSmPKueqlEcByGy/C+Sm2/krvg=;
 b=rOMVwpK8EhkwsZOj5zL9YmwsG8Ha3+IPRIJYGVV4FXnwkXzPvlD/7wK0FpG5Frxktj
 DDZvHpGTwRteTQ9Baz9F3z4fHMQDUGzgKLamF6u3vKH9FCa8UCD46ZbEuHCdqqu6TJpd
 RTujRNXJvbgfPYRyhEAu4PZP0FezVvd0WOUCecadSux31gyhKjveHGpglcaYaS3lfsWs
 WHSqwKO7dwnt/D6JkGPbxEWIVuo3oFjEnNIqrUulSMeSs2BpR+n0L+HoyYYtjKX/6/uk
 0rLm1Vei2zqM7+NeVeinhDev6hNtF0EXlCTay+Thn25TuevGXBeZerecjal+aWhIq51+
 IQVA==
X-Gm-Message-State: AGi0Pua3COxtvHiMG0BONUF1I4+4ahKuLPwdj9OHGM/YoSh7rCKUV2Vq
 xaCs8ilAdsxzbjcwhS7cB3z7Xr48q90=
X-Google-Smtp-Source: APiQypLCr7hr/NUjPu1Fn40U6deUbAjzLIOTahWvemPkSPVHrY1HchZc+7JbPka2/L1Ew06MysrNRA==
X-Received: by 2002:a67:e9d2:: with SMTP id q18mr9688863vso.234.1587761233535; 
 Fri, 24 Apr 2020 13:47:13 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com.
 [209.85.222.53])
 by smtp.gmail.com with ESMTPSA id u196sm1861134vku.11.2020.04.24.13.47.11
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Apr 2020 13:47:12 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id t8so10892891uap.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 24 Apr 2020 13:47:11 -0700 (PDT)
X-Received: by 2002:ab0:b13:: with SMTP id b19mr8989653uak.91.1587761231452;
 Fri, 24 Apr 2020 13:47:11 -0700 (PDT)
MIME-Version: 1.0
References: <1587726554-32018-1-git-send-email-sumit.garg@linaro.org>
 <1587726554-32018-5-git-send-email-sumit.garg@linaro.org>
In-Reply-To: <1587726554-32018-5-git-send-email-sumit.garg@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 24 Apr 2020 13:46:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VSrVnx_R=Y38tQ=bw_o22zxWmm=+M+AaqmEMAtK66b-Q@mail.gmail.com>
Message-ID: <CAD=FV=VSrVnx_R=Y38tQ=bw_o22zxWmm=+M+AaqmEMAtK66b-Q@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jS5EG-00DHB6-9p
Subject: Re: [Kgdb-bugreport] [RFC Patch v1 4/4] arm64: kgdb: Round up cpus
 using IPI_CALL_NMI_FUNC
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jason Cooper <jason@lakedaemon.net>, Catalin Marinas <catalin.marinas@arm.com>,
 Jason Wessel <jason.wessel@windriver.com>, LKML <linux-kernel@vger.kernel.org>,
 julien.thierry.kdev@gmail.com, Marc Zyngier <maz@kernel.org>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Fri, Apr 24, 2020 at 4:11 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> arm64 platforms with GICv3 or later supports pseudo NMIs which can be
> leveraged to round up CPUs which are stuck in hard lockup state with
> interrupts disabled that wouldn't be possible with a normal IPI.
>
> So instead switch to round up CPUs using IPI_CALL_NMI_FUNC. And in
> case a particular arm64 platform doesn't supports pseudo NMIs,
> IPI_CALL_NMI_FUNC will act as a normal IPI which maintains existing
> kgdb functionality.
>
> Also, one thing to note here is that with CPUs running in NMI context,
> kernel has special handling for printk() which involves CPU specific
> buffers and defering printk() until exit from NMI context. But with kgdb
> we don't want to defer printk() especially backtrace on corresponding
> CPUs. So switch to normal printk() context instead prior to entering
> kgdb context.
>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  arch/arm64/kernel/kgdb.c | 15 +++++++++++++++
>  arch/arm64/kernel/smp.c  | 17 ++++++++++++++---
>  2 files changed, 29 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/kernel/kgdb.c b/arch/arm64/kernel/kgdb.c
> index 4311992..0851ead 100644
> --- a/arch/arm64/kernel/kgdb.c
> +++ b/arch/arm64/kernel/kgdb.c
> @@ -14,6 +14,7 @@
>  #include <linux/kgdb.h>
>  #include <linux/kprobes.h>
>  #include <linux/sched/task_stack.h>
> +#include <linux/smp.h>
>
>  #include <asm/debug-monitors.h>
>  #include <asm/insn.h>
> @@ -353,3 +354,17 @@ int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt)
>         return aarch64_insn_write((void *)bpt->bpt_addr,
>                         *(u32 *)bpt->saved_instr);
>  }
> +
> +#ifdef CONFIG_SMP
> +void kgdb_roundup_cpus(void)
> +{
> +       struct cpumask mask;
> +
> +       cpumask_copy(&mask, cpu_online_mask);
> +       cpumask_clear_cpu(raw_smp_processor_id(), &mask);
> +       if (cpumask_empty(&mask))
> +               return;
> +
> +       arch_send_call_nmi_func_ipi_mask(&mask);
> +}
> +#endif
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 27c8ee1..c7158f6e8 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -31,6 +31,7 @@
>  #include <linux/of.h>
>  #include <linux/irq_work.h>
>  #include <linux/kexec.h>
> +#include <linux/kgdb.h>
>  #include <linux/kvm_host.h>
>
>  #include <asm/alternative.h>
> @@ -976,9 +977,19 @@ void handle_IPI(int ipinr, struct pt_regs *regs)
>                 /* Handle it as a normal interrupt if not in NMI context */
>                 if (!in_nmi())
>                         irq_enter();
> -
> -               /* nop, IPI handlers for special features can be added here. */
> -
> +#ifdef CONFIG_KGDB

My vote would be to keep "ifdef"s out of the middle of functions.  Can
you put your code in "arch/arm64/kernel/kgdb.c" and then have a dummpy
no-op function if "CONFIG_KGDB" isn't defined?


> +               if (atomic_read(&kgdb_active) != -1) {
> +                       /*
> +                        * For kgdb to work properly, we need printk to operate
> +                        * in normal context.
> +                        */
> +                       if (in_nmi())
> +                               printk_nmi_exit();

It feels like all the printk management belongs in kgdb_nmicallback().
...or is there some reason that this isn't a problem for other
platforms using NMI?  Maybe it's just that nobody has noticed it yet?


> +                       kgdb_nmicallback(raw_smp_processor_id(), regs);

Why do you need to call raw_smp_processor_id()?  Are you expecting a
different value than the local variable "cpu"?


> +                       if (in_nmi())
> +                               printk_nmi_enter();
> +               }
> +#endif
>                 if (!in_nmi())
>                         irq_exit();
>                 break;

Not that I really know what I'm talking about since I really don't
know arm64 at this level very well, but I'll ask anyway and probably
look like a fool...  I had a note that said:

* Will Deacon says:
*
* the whole roundup code is sketchy and it's the only place in the kernel
* which tries to perform I-cache maintenance with irqs disabled, leading
* to this nasty hack in the arch code:
*
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/include/asm/cacheflush.h#n74

I presume that, if nothing else, the comment needs to be updated.
...but is the situation any better (or worse?) with your new solution?

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
