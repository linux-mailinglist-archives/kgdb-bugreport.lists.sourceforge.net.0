Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7060C3B5AC3
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 28 Jun 2021 10:58:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lxn5u-0004b6-34
	for lists+kgdb-bugreport@lfdr.de; Mon, 28 Jun 2021 08:58:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <wens@kernel.org>) id 1lwnDx-0001An-9n
 for kgdb-bugreport@lists.sourceforge.net; Fri, 25 Jun 2021 14:54:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 Reply-To:In-Reply-To:References:MIME-Version:Sender:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DPwH2H8QE45l5L3vge4b8UAozUxiACgsBMzSlSaOfnM=; b=gQ7u52M4UzXcb1XNvwM/ebLalX
 5j0V1YnPi0hPPtMiWHnZVh2WFSIC7ZCPjxIpe+8wRUL3iGQxfAjVFTzSSMQNeLk/5DiW5hNs8VJX8
 OByj3HzNI/s3l/y2wjpYVj8Pj6uoWgyOA+8wcP9GXUhR2MoZ72pNF+2gZlycRc5VAAIM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:
 References:MIME-Version:Sender:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DPwH2H8QE45l5L3vge4b8UAozUxiACgsBMzSlSaOfnM=; b=Pis+WtUdELQ0P1RyJgQB67NJ5+
 41wW1m2+dBws060BZbPONCxDKPx5F77+Kqjp+Ofm8DQ/UUkLkIYx69qBfVH5VtgihH93UOhUiib3W
 1UyMiu6MGohKFIboY0ofYK3NB7AO4znHpSrCyPz7UpPrN8D1G3h524JXe6IDUDm5tWPE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lwnDt-0004eJ-5V
 for kgdb-bugreport@lists.sourceforge.net; Fri, 25 Jun 2021 14:54:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 636E561984
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 25 Jun 2021 14:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624632861;
 bh=4E0gJHmVQf3DAdKTz9RRWsCyT2UriHYgkJuXFju6qwk=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=sog8FFB9PdbR5HbctvZVXYwWmuL0bq1kf0vf5igVUFJuRuhpCuluyFbUnjj57529Y
 JeGX7GkW+J4AHjNR0RtLMEDgj9aJ5nn4HIVKqXHgsH2KfDrtJK/v2nArF68jsAPA3M
 ZQEXQhC1MrwC58VW2TkZPjrDck4qpDE3Quy6Y9urdBFakjrdQLUftI5HpG+3gbXhm5
 LeFozQ/YdTTq8QJcNa8Rck21UfabXDKK1n9uohFE/PK4On6GPLTMZnzj3VJZn1uZNp
 dXWhfx6co6BT/9O4AAwd4bGAd17Qpc7iwD2t4PB6r7eDVglq6sHNUbtpbuaRlMAgRV
 wYNkJFshDxH9Q==
Received: by mail-lj1-f170.google.com with SMTP id k8so12866950lja.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 25 Jun 2021 07:54:21 -0700 (PDT)
X-Gm-Message-State: AOAM533iVEVGEZ6tIh/0xpWK5bNUfk2us7xNpbGJzEeKtncPWXYSvf2Y
 5S/imBhg8TPjkFeO9RQrqkeJsJrrK+1tdddDygA=
X-Google-Smtp-Source: ABdhPJxrHnBWtk/8r5JziuSDB7JQedMAzgB4dDImce2eOUZ634eYmmPW1uIOpI7KWR41HQn91xgscPrMR2ghq94rJwY=
X-Received: by 2002:a2e:9ac3:: with SMTP id p3mr8915246ljj.94.1624632859618;
 Fri, 25 Jun 2021 07:54:19 -0700 (PDT)
MIME-Version: 1.0
References: <1604317487-14543-1-git-send-email-sumit.garg@linaro.org>
 <1604317487-14543-8-git-send-email-sumit.garg@linaro.org>
In-Reply-To: <1604317487-14543-8-git-send-email-sumit.garg@linaro.org>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 25 Jun 2021 22:54:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v67yfWbRA4MNa2f+pAJAyiEqeCaREziaPjvGcDzTw5Za=A@mail.gmail.com>
Message-ID: <CAGb2v67yfWbRA4MNa2f+pAJAyiEqeCaREziaPjvGcDzTw5Za=A@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lwnDt-0004eJ-5V
X-Mailman-Approved-At: Mon, 28 Jun 2021 08:58:16 +0000
Subject: Re: [Kgdb-bugreport] [PATCH v7 7/7] arm64: kgdb: Roundup cpus using
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
Reply-To: wens@kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, mpe@ellerman.id.au, will@kernel.org,
 daniel.thompson@linaro.org, Marc Zyngier <maz@kernel.org>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, mingo@redhat.com,
 kgdb-bugreport@lists.sourceforge.net, msys.mizuma@gmail.com,
 julien.thierry.kdev@gmail.com, Jason Cooper <jason@lakedaemon.net>,
 bp@alien8.de, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 tsbogend@alpha.franken.de, ito-yuichi@fujitsu.com,
 linux-kernel <linux-kernel@vger.kernel.org>, jason.wessel@windriver.com,
 David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Mon, Nov 2, 2020 at 7:47 PM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> arm64 platforms with GICv3 or later supports pseudo NMIs which can be
> leveraged to roundup CPUs which are stuck in hard lockup state with
> interrupts disabled that wouldn't be possible with a normal IPI.
>
> So instead switch to roundup CPUs using IPI turned as NMI. And in
> case a particular arm64 platform doesn't supports pseudo NMIs,
> it will switch back to default kgdb CPUs roundup mechanism.
>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  arch/arm64/kernel/ipi_nmi.c |  5 +++++
>  arch/arm64/kernel/kgdb.c    | 18 ++++++++++++++++++
>  2 files changed, 23 insertions(+)
>
> diff --git a/arch/arm64/kernel/ipi_nmi.c b/arch/arm64/kernel/ipi_nmi.c
> index 597dcf7..898d69c 100644
> --- a/arch/arm64/kernel/ipi_nmi.c
> +++ b/arch/arm64/kernel/ipi_nmi.c
> @@ -8,6 +8,7 @@
>
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
> +#include <linux/kgdb.h>
>  #include <linux/nmi.h>
>  #include <linux/smp.h>
>
> @@ -45,10 +46,14 @@ bool arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
>  static irqreturn_t ipi_nmi_handler(int irq, void *data)
>  {
>         irqreturn_t ret = IRQ_NONE;
> +       unsigned int cpu = smp_processor_id();
>
>         if (nmi_cpu_backtrace(get_irq_regs()))
>                 ret = IRQ_HANDLED;
>
> +       if (!kgdb_nmicallback(cpu, get_irq_regs()))

This fails to compile if CONFIG_KGDB isn't enabled.


ChenYu


> +               ret = IRQ_HANDLED;
> +
>         return ret;
>  }
>
> diff --git a/arch/arm64/kernel/kgdb.c b/arch/arm64/kernel/kgdb.c
> index 1a157ca3..371b176 100644
> --- a/arch/arm64/kernel/kgdb.c
> +++ b/arch/arm64/kernel/kgdb.c
> @@ -17,6 +17,7 @@
>
>  #include <asm/debug-monitors.h>
>  #include <asm/insn.h>
> +#include <asm/nmi.h>
>  #include <asm/traps.h>
>
>  struct dbg_reg_def_t dbg_reg_def[DBG_MAX_REG_NUM] = {
> @@ -353,3 +354,20 @@ int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt)
>         return aarch64_insn_write((void *)bpt->bpt_addr,
>                         *(u32 *)bpt->saved_instr);
>  }
> +
> +void kgdb_roundup_cpus(void)
> +{
> +       struct cpumask mask;
> +
> +       if (!arm64_supports_nmi()) {
> +               kgdb_smp_call_nmi_hook();
> +               return;
> +       }
> +
> +       cpumask_copy(&mask, cpu_online_mask);
> +       cpumask_clear_cpu(raw_smp_processor_id(), &mask);
> +       if (cpumask_empty(&mask))
> +               return;
> +
> +       arm64_send_nmi(&mask);
> +}
> --
> 2.7.4
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
