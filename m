Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EDA78C288
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 29 Aug 2023 12:47:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qawFk-0003bG-3S
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 29 Aug 2023 10:47:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sumit.garg@linaro.org>) id 1qawFi-0003b4-Li
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 29 Aug 2023 10:47:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uq0twIbHfJhR39j1Okq5KqdBEmQgm7OtHD/B0a98m4o=; b=SZimfsm1T5R0Ncl0d58ZIMnlkA
 4tiVNmAuU+ozGogxE9YtQo5u3Ml05D/Bv2JD9KiI1M1YEbJyIFKlK4IenP7fmB6anCHnNKxT/eNgJ
 R/TWTEVxQbu+oE5uaX9hvEcpsGmcpeZDkHK79LANO1DbIwuHOIuqeCszcpaSvCTnj5YM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uq0twIbHfJhR39j1Okq5KqdBEmQgm7OtHD/B0a98m4o=; b=AIRmFeBX3+6bDs/emlDPVsufIR
 S8R5Q4SSbJw6o2yNmIUXBXm1LAAtH4c7vrukOpNehopekvkUeFDbVa0gYnq9WgOgvxs5q66VRdsDV
 75QFIjKIZ+bv6rwlj1FUO5181L5Min19NWloDBCqg4aCYjSMbdDw7vniuNBXkx9J/S+U=;
Received: from mail-yw1-f174.google.com ([209.85.128.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qawFg-0005Cs-Hb for kgdb-bugreport@lists.sourceforge.net;
 Tue, 29 Aug 2023 10:47:17 +0000
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-59231a1ca9eso47943397b3.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 29 Aug 2023 03:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693306031; x=1693910831;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uq0twIbHfJhR39j1Okq5KqdBEmQgm7OtHD/B0a98m4o=;
 b=VpXNrurb4DCwV5kjeyavco5IM5Ut8nkDj2SGICS7qCP9sUPAUl2FUnBluhGpjJ9rvz
 XVV0BsUi+yQEBd5iiAwMyR4pKpccnWHAxsEUqeZzgGHh1g9lAMFo/JWeS+zDSXVRxC8Z
 GoOiNF33RgejV+9O8hOomHWjkeaDcCFlMpNeDkCfHWm20IVE/dyHxN3NKcDSAgDmrVz1
 k3fCQHjHE9oDBhvxpniq0cuX6Awm7zyIQn2QI17IRGfCenX+ezThqqgLviv402mf3xwE
 bwMru3vkmuVGcKZSqDOrajTKQy3rQMRC3eh5Vh0rHYCmpGocvWvt0gRUKxZx5s2Fcd18
 xE2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693306031; x=1693910831;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uq0twIbHfJhR39j1Okq5KqdBEmQgm7OtHD/B0a98m4o=;
 b=liuqTu7Jxkyfq9GgfO7A3nd+pBIc9pudrbX9pVQUh2J6FI5LsnJ7pNJNViQuqSX3K5
 XvIgq41EPsSpB72j63aXJqd+sQKsdw2+DkVDN+5gTk1yo2zAEaMXAxB8TERWzk/2F+4M
 7DS6ljA91T4Fn8ssS9JdkuJPOoulgFgDh2AU74675JPMZodjmaEiP9k+72ptofaIppqk
 gusFtaJF3ZUB3it2UcMgow0RR8gIpbezXXuwh5H0+gCmtBlPoYDyLseQKkz2Xq5vrgom
 3GMNgCP0/5SzwxVjy2I1KOVZhc+zgteHastxoEfd3lKCJyghvS8BIugK4E1IbDtg01Hi
 ud9A==
X-Gm-Message-State: AOJu0YwEXqs2SoHkndm86DLxb2IGbci57/4lLKzUgBLrHRUs08ZLgZk6
 00eTzcTn/L36Y+x2fBBvVN7vrQuNzDlPnbybq/fJEiwucDO0CQpmG9M=
X-Google-Smtp-Source: AGHT+IGH7wzy7FoFt53j1Wl8pOHg+HIIejrpPXYkORsQvwPy2CQYvDOVJGh+hxhV8WoG1gHRHPz9TAGqKsv7dZYykpA=
X-Received: by 2002:a05:6102:7cc:b0:44d:4e64:f175 with SMTP id
 y12-20020a05610207cc00b0044d4e64f175mr23582480vsg.5.1693305672186; Tue, 29
 Aug 2023 03:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230824153233.1006420-1-dianders@chromium.org>
 <20230824083012.v11.3.I7209db47ef8ec151d3de61f59005bbc59fe8f113@changeid>
In-Reply-To: <20230824083012.v11.3.I7209db47ef8ec151d3de61f59005bbc59fe8f113@changeid>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 29 Aug 2023 16:11:01 +0530
Message-ID: <CAFA6WYMJHr=r=3CvCq=nb1R_vt2jveJoyUXT4KsEtZea7wMF-w@mail.gmail.com>
To: Douglas Anderson <dianders@chromium.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 24 Aug 2023 at 21:03,
 Douglas Anderson <dianders@chromium.org>
 wrote: > > From: Mark Rutland <mark.rutland@arm.com> > > To enable NMI
 backtrace
 and KGDB's NMI cpu roundup, we need to free up > [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.174 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qawFg-0005Cs-Hb
Subject: Re: [Kgdb-bugreport] [PATCH v11 3/6] arm64: smp: Remove dedicated
 wakeup IPI
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Marc Zyngier <maz@kernel.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Chen-Yu Tsai <wens@csie.org>, Sami Tolvanen <samitolvanen@google.com>,
 kgdb-bugreport@lists.sourceforge.net, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Kees Cook <keescook@chromium.org>, Valentin Schneider <vschneid@redhat.com>,
 Stephen Boyd <swboyd@chromium.org>, Thomas Gleixner <tglx@linutronix.de>,
 Josh Poimboeuf <jpoimboe@kernel.org>, linux-arm-kernel@lists.infradead.org,
 D Scott Phillips <scott@os.amperecomputing.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>,
 ito-yuichi@fujitsu.com, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, 24 Aug 2023 at 21:03, Douglas Anderson <dianders@chromium.org> wrote:
>
> From: Mark Rutland <mark.rutland@arm.com>
>
> To enable NMI backtrace and KGDB's NMI cpu roundup, we need to free up
> at least one dedicated IPI.
>
> On arm64 the IPI_WAKEUP IPI is only used for the ACPI parking protocol,
> which itself is only used on some very early ARMv8 systems which
> couldn't implement PSCI.
>
> Remove the IPI_WAKEUP IPI, and rely on the IPI_RESCHEDULE IPI to wake
> CPUs from the parked state. This will cause a tiny amonut of redundant
> work to check the thread flags, but this is miniscule in relation to the
> cost of taking and handling the IPI in the first place. We can safely
> handle redundant IPI_RESCHEDULE IPIs, so there should be no functional
> impact as a result of this change.
>
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Sumit Garg <sumit.garg@linaro.org>
> Cc: Will Deacon <will@kernel.org>

Reviewed-by: Sumit Garg <sumit.garg@linaro.org>

-Sumit

> ---
> I have no idea how to test this. I just took Mark's patch and jammed
> it into my series. Logicially the patch seems reasonable to me.
>
> Changes in v11:
> - arch_send_wakeup_ipi() now takes an unsigned int.
>
> Changes in v10:
> - ("arm64: smp: Remove dedicated wakeup IPI") new for v10.
>
>  arch/arm64/include/asm/smp.h              |  4 ++--
>  arch/arm64/kernel/acpi_parking_protocol.c |  2 +-
>  arch/arm64/kernel/smp.c                   | 28 +++++++++--------------
>  3 files changed, 14 insertions(+), 20 deletions(-)
>
> diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
> index 9b31e6d0da17..efb13112b408 100644
> --- a/arch/arm64/include/asm/smp.h
> +++ b/arch/arm64/include/asm/smp.h
> @@ -89,9 +89,9 @@ extern void arch_send_call_function_single_ipi(int cpu);
>  extern void arch_send_call_function_ipi_mask(const struct cpumask *mask);
>
>  #ifdef CONFIG_ARM64_ACPI_PARKING_PROTOCOL
> -extern void arch_send_wakeup_ipi_mask(const struct cpumask *mask);
> +extern void arch_send_wakeup_ipi(unsigned int cpu);
>  #else
> -static inline void arch_send_wakeup_ipi_mask(const struct cpumask *mask)
> +static inline void arch_send_wakeup_ipi(unsigned int cpu)
>  {
>         BUILD_BUG();
>  }
> diff --git a/arch/arm64/kernel/acpi_parking_protocol.c b/arch/arm64/kernel/acpi_parking_protocol.c
> index b1990e38aed0..e1be29e608b7 100644
> --- a/arch/arm64/kernel/acpi_parking_protocol.c
> +++ b/arch/arm64/kernel/acpi_parking_protocol.c
> @@ -103,7 +103,7 @@ static int acpi_parking_protocol_cpu_boot(unsigned int cpu)
>                        &mailbox->entry_point);
>         writel_relaxed(cpu_entry->gic_cpu_id, &mailbox->cpu_id);
>
> -       arch_send_wakeup_ipi_mask(cpumask_of(cpu));
> +       arch_send_wakeup_ipi(cpu);
>
>         return 0;
>  }
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 960b98b43506..a5848f1ef817 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -72,7 +72,6 @@ enum ipi_msg_type {
>         IPI_CPU_CRASH_STOP,
>         IPI_TIMER,
>         IPI_IRQ_WORK,
> -       IPI_WAKEUP,
>         NR_IPI
>  };
>
> @@ -764,7 +763,6 @@ static const char *ipi_types[NR_IPI] __tracepoint_string = {
>         [IPI_CPU_CRASH_STOP]    = "CPU stop (for crash dump) interrupts",
>         [IPI_TIMER]             = "Timer broadcast interrupts",
>         [IPI_IRQ_WORK]          = "IRQ work interrupts",
> -       [IPI_WAKEUP]            = "CPU wake-up interrupts",
>  };
>
>  static void smp_cross_call(const struct cpumask *target, unsigned int ipinr);
> @@ -797,13 +795,6 @@ void arch_send_call_function_single_ipi(int cpu)
>         smp_cross_call(cpumask_of(cpu), IPI_CALL_FUNC);
>  }
>
> -#ifdef CONFIG_ARM64_ACPI_PARKING_PROTOCOL
> -void arch_send_wakeup_ipi_mask(const struct cpumask *mask)
> -{
> -       smp_cross_call(mask, IPI_WAKEUP);
> -}
> -#endif
> -
>  #ifdef CONFIG_IRQ_WORK
>  void arch_irq_work_raise(void)
>  {
> @@ -897,14 +888,6 @@ static void do_handle_IPI(int ipinr)
>                 break;
>  #endif
>
> -#ifdef CONFIG_ARM64_ACPI_PARKING_PROTOCOL
> -       case IPI_WAKEUP:
> -               WARN_ONCE(!acpi_parking_protocol_valid(cpu),
> -                         "CPU%u: Wake-up IPI outside the ACPI parking protocol\n",
> -                         cpu);
> -               break;
> -#endif
> -
>         default:
>                 pr_crit("CPU%u: Unknown IPI message 0x%x\n", cpu, ipinr);
>                 break;
> @@ -979,6 +962,17 @@ void arch_smp_send_reschedule(int cpu)
>         smp_cross_call(cpumask_of(cpu), IPI_RESCHEDULE);
>  }
>
> +#ifdef CONFIG_ARM64_ACPI_PARKING_PROTOCOL
> +void arch_send_wakeup_ipi(unsigned int cpu)
> +{
> +       /*
> +        * We use a scheduler IPI to wake the CPU as this avoids the need for a
> +        * dedicated IPI and we can safely handle spurious scheduler IPIs.
> +        */
> +       arch_smp_send_reschedule(cpu);
> +}
> +#endif
> +
>  #ifdef CONFIG_GENERIC_CLOCKEVENTS_BROADCAST
>  void tick_broadcast(const struct cpumask *mask)
>  {
> --
> 2.42.0.rc1.204.g551eb34607-goog
>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
