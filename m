Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFB32EA8C7
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  5 Jan 2021 11:32:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kwjdz-00047F-FM
	for lists+kgdb-bugreport@lfdr.de; Tue, 05 Jan 2021 10:32:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kwjds-000472-JP
 for kgdb-bugreport@lists.sourceforge.net; Tue, 05 Jan 2021 10:32:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BF/W0F7I0sQl/2SjY2Big80fEVdnu8HJD7TNcu3Hrw8=; b=eEGiiNBtESS3JiqB2RRC5q+Vm/
 oY07zwXurXangWeWrQtWLy+c4fv6Q8NHhY/6dCDkTczunbyYIGfHHxOAQeCDywtbs3rKICAAe3Qan
 2CwXnrQRgZy4+7ZrVv5W9YyuuXAp5QjDUMiWjueMCdued53/OwwWGh0z73GzrXzGqaZg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BF/W0F7I0sQl/2SjY2Big80fEVdnu8HJD7TNcu3Hrw8=; b=WTs3Ms+gXMKN0b5+8RnxGoNKfx
 KlUSiAcbFWiv0ZJK9MzQUqx2QYuSS72GLUfGM76jm3W1otrSi2yZRKu/IzymSm3+ja7BxqKc7B7TO
 Src4gTuwGQ/Y/H/Jm8Hzo5LWD7bQwE3XIvTAlWS+wQYtEt5dSsT8ElDoQuC+zn985o4Q=;
Received: from mail-lf1-f41.google.com ([209.85.167.41])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kwjdg-00Fesf-3n
 for kgdb-bugreport@lists.sourceforge.net; Tue, 05 Jan 2021 10:32:44 +0000
Received: by mail-lf1-f41.google.com with SMTP id o17so71431413lfg.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 05 Jan 2021 02:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BF/W0F7I0sQl/2SjY2Big80fEVdnu8HJD7TNcu3Hrw8=;
 b=WcsCZMAW0WfLlax593niHcETCLihQaZabjx461xA4Ti/O0MiDUpIdz5hPMQTq2lTHg
 RAlthd26x6VA2Lnk0DJI64jA+OPsQBFcDyldG8Mx+FHR5UrXjfCfizVgLPZcdZAgNpoJ
 VKbV7aP53+6J1/BpVv8SF5+hLWKUIGw+Els+fY6EKjsiGgyWj/q7Y2sK/3v2RpopaR5J
 q18bS/jYyDwlO6Zn6KYDDQa/vbN3bzUtqTsdWlDVDxFcyt0XkisCmfQZ2sy/UUiZrNiE
 5I2taT7kfpLmnvD9z67zcyk+/0T1LWexOvRaSj6nIl305NxVerxlt37GUW/GUcFF0Hgs
 J6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BF/W0F7I0sQl/2SjY2Big80fEVdnu8HJD7TNcu3Hrw8=;
 b=nxZsBjdPCR/uW9IhvTflaxtvFucK5dvyFZgDlzj1ODuNGH+KQ4P/pR6zlTowB82oxB
 iikd9ZSjmmWxWRcxckeYyzXvbIDYlMOQeUcXupt4LGz9ebQvgAKmhz7eqZxopiCE8jRV
 2ybE57gQhMhQTdrnc8PcXap2m2AJc2FwMIHFoYBPh7j2q6G7wPTzNxHpKPXhLzBFud+m
 vmH0rCqcPkwlbK2uXjPLCwioSHW9BczeLUYA8GMnJC3GDyy0HMnb4lncvb/UIxQNV6Tg
 Mz4Wza0K8NbNRDxLTsrzM8sAosFyWcNQOmH0ZZ7NbEZi1b/FKW9txSPjeTV+aumZFhXw
 CtrQ==
X-Gm-Message-State: AOAM533dhfPYfwfDwdgXpcmggfKZnVQMvCq93dopsE8/ejmbAkeX1Rxm
 p37lscxXUEf1qF55i1ZoufyTrGiToNVwmLQmSJ6O7A==
X-Google-Smtp-Source: ABdhPJyB5nU8iG4ZiM1XgoAnMghgoieL6fH8RQ+kD7uMBYLEis/7X5njWUiXGyOyS4niD7D/ME/DrHT1/gKca48QMaE=
X-Received: by 2002:a05:651c:1192:: with SMTP id
 w18mr35852534ljo.40.1609842745386; 
 Tue, 05 Jan 2021 02:32:25 -0800 (PST)
MIME-Version: 1.0
References: <1604317487-14543-1-git-send-email-sumit.garg@linaro.org>
 <1604317487-14543-5-git-send-email-sumit.garg@linaro.org>
In-Reply-To: <1604317487-14543-5-git-send-email-sumit.garg@linaro.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 5 Jan 2021 16:02:14 +0530
Message-ID: <CAFA6WYNKmo6GgD1BDXGqF2b+2SdJ48=62J00agt67BKJq2an4Q@mail.gmail.com>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>, mingo@redhat.com,
 mpe@ellerman.id.au, Thomas Gleixner <tglx@linutronix.de>, bp@alien8.de, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 tsbogend@alpha.franken.de
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.41 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.41 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kwjdg-00Fesf-3n
Subject: Re: [Kgdb-bugreport] [PATCH v7 4/7] nmi: backtrace: Allow runtime
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
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, ito-yuichi@fujitsu.com,
 Jason Cooper <jason@lakedaemon.net>, kgdb-bugreport@lists.sourceforge.net,
 x86@kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, julien.thierry.kdev@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hello arch maintainers,

On Mon, 2 Nov 2020 at 17:16, Sumit Garg <sumit.garg@linaro.org> wrote:
>
> Add a boolean return to arch_trigger_cpumask_backtrace() to support a
> use-case where a particular architecture detects at runtime if it supports
> NMI backtrace or it would like to fallback to default implementation using
> SMP cross-calls.
>
> Currently such an architecture example is arm64 supporting pseudo NMIs
> feature which is only available on platforms which have support for GICv3
> or later version.
>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  arch/arm/include/asm/irq.h       |  2 +-
>  arch/arm/kernel/smp.c            |  3 ++-
>  arch/mips/include/asm/irq.h      |  2 +-
>  arch/mips/kernel/process.c       |  3 ++-
>  arch/powerpc/include/asm/nmi.h   |  2 +-
>  arch/powerpc/kernel/stacktrace.c |  3 ++-
>  arch/sparc/include/asm/irq_64.h  |  2 +-
>  arch/sparc/kernel/process_64.c   |  4 +++-
>  arch/x86/include/asm/irq.h       |  2 +-
>  arch/x86/kernel/apic/hw_nmi.c    |  3 ++-
>  include/linux/nmi.h              | 12 ++++--------
>  11 files changed, 20 insertions(+), 18 deletions(-)

Do you have any comments here? It would be nice to have your ack here.

-Sumit

>
> diff --git a/arch/arm/include/asm/irq.h b/arch/arm/include/asm/irq.h
> index 46d4114..54b0180 100644
> --- a/arch/arm/include/asm/irq.h
> +++ b/arch/arm/include/asm/irq.h
> @@ -31,7 +31,7 @@ void handle_IRQ(unsigned int, struct pt_regs *);
>  void init_IRQ(void);
>
>  #ifdef CONFIG_SMP
> -extern void arch_trigger_cpumask_backtrace(const cpumask_t *mask,
> +extern bool arch_trigger_cpumask_backtrace(const cpumask_t *mask,
>                                            bool exclude_self);
>  #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
>  #endif
> diff --git a/arch/arm/kernel/smp.c b/arch/arm/kernel/smp.c
> index 48099c6e..bb20a43 100644
> --- a/arch/arm/kernel/smp.c
> +++ b/arch/arm/kernel/smp.c
> @@ -856,7 +856,8 @@ static void raise_nmi(cpumask_t *mask)
>         __ipi_send_mask(ipi_desc[IPI_CPU_BACKTRACE], mask);
>  }
>
> -void arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
> +bool arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
>  {
>         nmi_trigger_cpumask_backtrace(mask, exclude_self, raise_nmi);
> +       return true;
>  }
> diff --git a/arch/mips/include/asm/irq.h b/arch/mips/include/asm/irq.h
> index c5d3517..34f3b42 100644
> --- a/arch/mips/include/asm/irq.h
> +++ b/arch/mips/include/asm/irq.h
> @@ -78,7 +78,7 @@ extern int cp0_fdc_irq;
>
>  extern int get_c0_fdc_int(void);
>
> -void arch_trigger_cpumask_backtrace(const struct cpumask *mask,
> +bool arch_trigger_cpumask_backtrace(const struct cpumask *mask,
>                                     bool exclude_self);
>  #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
>
> diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
> index 75ebd8d..d19e672 100644
> --- a/arch/mips/kernel/process.c
> +++ b/arch/mips/kernel/process.c
> @@ -735,9 +735,10 @@ static void raise_backtrace(cpumask_t *mask)
>         }
>  }
>
> -void arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
> +bool arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
>  {
>         nmi_trigger_cpumask_backtrace(mask, exclude_self, raise_backtrace);
> +       return true;
>  }
>
>  int mips_get_process_fp_mode(struct task_struct *task)
> diff --git a/arch/powerpc/include/asm/nmi.h b/arch/powerpc/include/asm/nmi.h
> index 84b4cfe..a5eb3e2 100644
> --- a/arch/powerpc/include/asm/nmi.h
> +++ b/arch/powerpc/include/asm/nmi.h
> @@ -9,7 +9,7 @@ static inline void arch_touch_nmi_watchdog(void) {}
>  #endif
>
>  #if defined(CONFIG_NMI_IPI) && defined(CONFIG_STACKTRACE)
> -extern void arch_trigger_cpumask_backtrace(const cpumask_t *mask,
> +extern bool arch_trigger_cpumask_backtrace(const cpumask_t *mask,
>                                            bool exclude_self);
>  #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
>  #endif
> diff --git a/arch/powerpc/kernel/stacktrace.c b/arch/powerpc/kernel/stacktrace.c
> index b644065..22b112a 100644
> --- a/arch/powerpc/kernel/stacktrace.c
> +++ b/arch/powerpc/kernel/stacktrace.c
> @@ -264,8 +264,9 @@ static void raise_backtrace_ipi(cpumask_t *mask)
>         }
>  }
>
> -void arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
> +bool arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
>  {
>         nmi_trigger_cpumask_backtrace(mask, exclude_self, raise_backtrace_ipi);
> +       return true;
>  }
>  #endif /* defined(CONFIG_PPC_BOOK3S_64) && defined(CONFIG_NMI_IPI) */
> diff --git a/arch/sparc/include/asm/irq_64.h b/arch/sparc/include/asm/irq_64.h
> index 4d748e9..35c01ff 100644
> --- a/arch/sparc/include/asm/irq_64.h
> +++ b/arch/sparc/include/asm/irq_64.h
> @@ -87,7 +87,7 @@ static inline unsigned long get_softint(void)
>         return retval;
>  }
>
> -void arch_trigger_cpumask_backtrace(const struct cpumask *mask,
> +bool arch_trigger_cpumask_backtrace(const struct cpumask *mask,
>                                     bool exclude_self);
>  #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
>
> diff --git a/arch/sparc/kernel/process_64.c b/arch/sparc/kernel/process_64.c
> index a75093b..9182001 100644
> --- a/arch/sparc/kernel/process_64.c
> +++ b/arch/sparc/kernel/process_64.c
> @@ -248,7 +248,7 @@ static void __global_reg_poll(struct global_reg_snapshot *gp)
>         }
>  }
>
> -void arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
> +bool arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
>  {
>         struct thread_info *tp = current_thread_info();
>         struct pt_regs *regs = get_irq_regs();
> @@ -303,6 +303,8 @@ void arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
>         memset(global_cpu_snapshot, 0, sizeof(global_cpu_snapshot));
>
>         spin_unlock_irqrestore(&global_cpu_snapshot_lock, flags);
> +
> +       return true;
>  }
>
>  #ifdef CONFIG_MAGIC_SYSRQ
> diff --git a/arch/x86/include/asm/irq.h b/arch/x86/include/asm/irq.h
> index 528c8a7..b7668e0 100644
> --- a/arch/x86/include/asm/irq.h
> +++ b/arch/x86/include/asm/irq.h
> @@ -47,7 +47,7 @@ extern void init_ISA_irqs(void);
>  extern void __init init_IRQ(void);
>
>  #ifdef CONFIG_X86_LOCAL_APIC
> -void arch_trigger_cpumask_backtrace(const struct cpumask *mask,
> +bool arch_trigger_cpumask_backtrace(const struct cpumask *mask,
>                                     bool exclude_self);
>
>  #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
> diff --git a/arch/x86/kernel/apic/hw_nmi.c b/arch/x86/kernel/apic/hw_nmi.c
> index 34a992e..e7dcd28 100644
> --- a/arch/x86/kernel/apic/hw_nmi.c
> +++ b/arch/x86/kernel/apic/hw_nmi.c
> @@ -34,10 +34,11 @@ static void nmi_raise_cpu_backtrace(cpumask_t *mask)
>         apic->send_IPI_mask(mask, NMI_VECTOR);
>  }
>
> -void arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
> +bool arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
>  {
>         nmi_trigger_cpumask_backtrace(mask, exclude_self,
>                                       nmi_raise_cpu_backtrace);
> +       return true;
>  }
>
>  static int nmi_cpu_backtrace_handler(unsigned int cmd, struct pt_regs *regs)
> diff --git a/include/linux/nmi.h b/include/linux/nmi.h
> index 750c7f3..cedbfc1 100644
> --- a/include/linux/nmi.h
> +++ b/include/linux/nmi.h
> @@ -143,26 +143,22 @@ static inline void touch_nmi_watchdog(void)
>  #ifdef arch_trigger_cpumask_backtrace
>  static inline bool trigger_all_cpu_backtrace(void)
>  {
> -       arch_trigger_cpumask_backtrace(cpu_online_mask, false);
> -       return true;
> +       return arch_trigger_cpumask_backtrace(cpu_online_mask, false);
>  }
>
>  static inline bool trigger_allbutself_cpu_backtrace(void)
>  {
> -       arch_trigger_cpumask_backtrace(cpu_online_mask, true);
> -       return true;
> +       return arch_trigger_cpumask_backtrace(cpu_online_mask, true);
>  }
>
>  static inline bool trigger_cpumask_backtrace(struct cpumask *mask)
>  {
> -       arch_trigger_cpumask_backtrace(mask, false);
> -       return true;
> +       return arch_trigger_cpumask_backtrace(mask, false);
>  }
>
>  static inline bool trigger_single_cpu_backtrace(int cpu)
>  {
> -       arch_trigger_cpumask_backtrace(cpumask_of(cpu), false);
> -       return true;
> +       return arch_trigger_cpumask_backtrace(cpumask_of(cpu), false);
>  }
>
>  /* generic implementation */
> --
> 2.7.4
>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
