Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 439D07891B4
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 26 Aug 2023 00:27:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qZfHO-0000pL-0d
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 25 Aug 2023 22:27:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <swboyd@chromium.org>) id 1qZfHI-0000ou-28
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 25 Aug 2023 22:27:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 References:In-Reply-To:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ozIL3ztcMY/CjRnACD5tsgtlWnLwTY4DlCvApQ3YGH8=; b=HGWO4QQj+e3Okko2Pg6b/zQElJ
 wxNH3qPc+oaknz7j5qLhtRYYXFPapO02DgkKS4nIZo0FbMkdkqbfpTNggGccdBgb919EC7e1yhF12
 QRFM0s3JMkYDQNztHZ4I51pA2Mp5IBD2q2saCUfy44MAlKEGEYPUSFqr8tPh3Fos0B6s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:References:In-Reply-To:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ozIL3ztcMY/CjRnACD5tsgtlWnLwTY4DlCvApQ3YGH8=; b=VjJRYVAou6GXPTefHFPEcNFd1j
 Qv0snpBi5ehJ4i9YkUSHUIHOi5yTbawugNW11KLZMsB5rw4E2s6OCEuyDBs7kBN2PNpOQC2V7/dii
 2GLtnHW+bWUvqEf3AB85009a/UMvvvPiBfeXferzkxro7aZheKR85rRLTTjKi/zPkHMA=;
Received: from mail-lf1-f45.google.com ([209.85.167.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qZfHC-00FbZn-Qe for kgdb-bugreport@lists.sourceforge.net;
 Fri, 25 Aug 2023 22:27:38 +0000
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-50078eba7afso2194370e87.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 25 Aug 2023 15:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693002448; x=1693607248;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=ozIL3ztcMY/CjRnACD5tsgtlWnLwTY4DlCvApQ3YGH8=;
 b=Ov9w9fm79WxSQCPhsJOvhtQl9wezVlm7usWwtpySiNQyWRnOHMCtrRKP9iDDQR5wiz
 uEpyEOsQCfAUrxRj+Fg1pOoOZoau8Ac9zH+X6lspQB/f3kBk6JhesTbnZ0eI8Wyqz+pM
 i9X06ciV6i1kAwgpoqX6YVyLxG8jQ2oS3Eua4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693002448; x=1693607248;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ozIL3ztcMY/CjRnACD5tsgtlWnLwTY4DlCvApQ3YGH8=;
 b=EfNPFyV5xUJzmUY826P/m15NulTJ7CU8Gi1OlQAHMoSjn3qqHWj2GP1ZUv+Xtgb5N6
 WWgl7AOT/65We3/TmYLKJtHEjY0SHwaIug1SSK0dvNDCViUPNtriZfD3kxOJcxJcRj6Q
 xSsFbFq6GAqr27AF3JmSqSiy0umU/ZBxB37yCUqPOrGPWZBFyecDIiXaZ+7c2mEUmRI9
 aOV9wvf3JLAridF1s9mFSlA42P3SHQeFXYAq3kFThbc60K8xqNoXy7uadiHKNxdWJ2Ow
 x14MQOmIBapGSogUQ25pDZQMMmrnRYPg4ddd3L+26Csupy2do6vG40foQpDH92BbIzrL
 KrMw==
X-Gm-Message-State: AOJu0YzbAKmSFbOkhjPJ+Heina0nGIHhUk5Z/FEevQ5gUdgUxKbjSksx
 xlZYj8BKUyMLLo1d0YviQjDTADHaVgMmZ74pCIH7dQ==
X-Google-Smtp-Source: AGHT+IFQRv+LRhmJpKCQ1JJuh/OxEc+CDv/RRDR6yVXx8WifztG0VJqHHXmhp+GvZCUxdtO/gLoTkhk63iMCDLx4NVQ=
X-Received: by 2002:a05:6512:b94:b0:4ff:8c0f:a745 with SMTP id
 b20-20020a0565120b9400b004ff8c0fa745mr17432931lfv.54.1693002448042; Fri, 25
 Aug 2023 15:27:28 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Aug 2023 17:27:27 -0500
MIME-Version: 1.0
In-Reply-To: <20230824083012.v11.4.Ie6c132b96ebbbcddbf6954b9469ed40a6960343c@changeid>
References: <20230824153233.1006420-1-dianders@chromium.org>
 <20230824083012.v11.4.Ie6c132b96ebbbcddbf6954b9469ed40a6960343c@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 25 Aug 2023 17:27:27 -0500
Message-ID: <CAE-0n52iVDgZa8XT8KTMj12c_ESSJt7f7A0fuZ_oAMMqpGcSzA@mail.gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Douglas Anderson <dianders@chromium.org>, Marc Zyngier <maz@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Sumit Garg <sumit.garg@linaro.org>, 
 Will Deacon <will@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Quoting Douglas Anderson (2023-08-24 08:30:30) > diff --git
 a/arch/arm64/include/asm/irq.h b/arch/arm64/include/asm/irq.h > index
 fac08e18bcd5..50ce8b697ff3
 100644 > --- a/arch/arm64/include/asm/irq.h [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.45 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.45 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qZfHC-00FbZn-Qe
Subject: Re: [Kgdb-bugreport] [PATCH v11 4/6] arm64: smp: Add arch support
 for backtrace using pseudo-NMI
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
Cc: Valentin Schneider <vschneid@redhat.com>, ito-yuichi@fujitsu.com,
 D Scott Phillips <scott@os.amperecomputing.com>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Josh Poimboeuf <jpoimboe@kernel.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
 linux-perf-users@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Quoting Douglas Anderson (2023-08-24 08:30:30)
> diff --git a/arch/arm64/include/asm/irq.h b/arch/arm64/include/asm/irq.h
> index fac08e18bcd5..50ce8b697ff3 100644
> --- a/arch/arm64/include/asm/irq.h
> +++ b/arch/arm64/include/asm/irq.h
> @@ -6,6 +6,9 @@
>
>  #include <asm-generic/irq.h>
>
> +void arch_trigger_cpumask_backtrace(const cpumask_t *mask, int exclude_cpu);

Some nits, but otherwise

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

> +#define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
> +
>  struct pt_regs;
>
>  int set_handle_irq(void (*handle_irq)(struct pt_regs *));
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index a5848f1ef817..c8896cbc5327 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -72,12 +73,18 @@ enum ipi_msg_type {
>         IPI_CPU_CRASH_STOP,
>         IPI_TIMER,
>         IPI_IRQ_WORK,
> -       NR_IPI
> +       NR_IPI,
> +       /*
> +        * Any enum >= NR_IPI and < MAX_IPI is special and not tracable
> +        * with trace_ipi_*
> +        */
> +       IPI_CPU_BACKTRACE = NR_IPI,
> +       MAX_IPI
>  };
>
>  static int ipi_irq_base __read_mostly;
>  static int nr_ipi __read_mostly = NR_IPI;
> -static struct irq_desc *ipi_desc[NR_IPI] __read_mostly;
> +static struct irq_desc *ipi_desc[MAX_IPI] __read_mostly;

Side note: it would be nice to mark ipi_desc as __ro_after_init. Same
for nr_ipi and ipi_irq_base.

>
>  static void ipi_setup(int cpu);
>
> @@ -845,6 +852,22 @@ static void __noreturn ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs
>  #endif
>  }
>
> +static void arm64_backtrace_ipi(cpumask_t *mask)
> +{
> +       __ipi_send_mask(ipi_desc[IPI_CPU_BACKTRACE], mask);
> +}
> +
> +void arch_trigger_cpumask_backtrace(const cpumask_t *mask, int exclude_cpu)

Can this be 'bool exclude_self' instead of int? That matches all other
implementations from what I can tell.

> +{
> +       /*
> +        * NOTE: though nmi_trigger_cpumask_backtrace has "nmi_" in the name,

USe nmi_trigger_cpumask_backtrace() to indicate function.

> +        * nothing about it truly needs to be implemented using an NMI, it's
> +        * just that it's _allowed_ to work with NMIs. If ipi_should_be_nmi()
> +        * returned false our backtrace attempt will just use a regular IPI.
> +        */
> +       nmi_trigger_cpumask_backtrace(mask, exclude_cpu, arm64_backtrace_ipi);


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
