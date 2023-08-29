Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4320378C283
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 29 Aug 2023 12:44:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qawCx-0003Aj-0s
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 29 Aug 2023 10:44:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sumit.garg@linaro.org>) id 1qawCv-0003Ad-PN
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 29 Aug 2023 10:44:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+S+OFM/SaIRDO4CZ1HS1+M3zY1M1wtDfmawa09i8kOs=; b=T0s2s18dFvAA4VxBtXUgntNziz
 rJeI1mAmE3HtV/wDxYGe/dc5lAZ77d5cl+VgQxT8GaW3L3tvqi8Tgv8DhhRIpmQOt85xV/Tq9amP2
 IWpmk4WIwkIlA1VkF3IiMcmVrunaeEns1Az6Ss7ZxgUztcUglbdgTs3DIMTv0pNgX7QE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+S+OFM/SaIRDO4CZ1HS1+M3zY1M1wtDfmawa09i8kOs=; b=c3yDO48V6ThHA64EmXA3DT68ZL
 rD6R6nks1KgKux5eK/cjeBvdp1T+NyFyGUIA60RDnpO+lnq2Ee+NGzmqTp2ru69+OQ5efYkooPHkJ
 g03H+d+10QY8Ssv2+vp9I33t65x+jR1CNFW7Oc7JeGIqfi2vg24lne9sxlQ++K2475K8=;
Received: from mail-oi1-f181.google.com ([209.85.167.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qawCt-000522-3l for kgdb-bugreport@lists.sourceforge.net;
 Tue, 29 Aug 2023 10:44:26 +0000
Received: by mail-oi1-f181.google.com with SMTP id
 5614622812f47-3a7d7df4e67so3002160b6e.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 29 Aug 2023 03:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693305857; x=1693910657;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+S+OFM/SaIRDO4CZ1HS1+M3zY1M1wtDfmawa09i8kOs=;
 b=rIyn0XW8ORmE9j4e/2qEwhncNhlp+G/xc3waPdXWOPCQ2GwjIqZzMP9fSmloAVKQ3p
 YNYjiaVN9bS+HnUflaiHKIj6l2q8hfpLCCxlUcGY1QqFoPd/Ugwe4IX19qFifAPvw4zV
 +Y5ccI0gaIT/SmEaJJ0YgIexJ5SdlUjs5vD5D8GbwE0fusoE1v7vSMRYMekXyqdiPrhM
 L8ASyOCRtSKF2wphB3ZwPUhd4BARCv2GZXPdFWpdt+VKGhvEqM0D4Wyaj5Pdbcnm7OfF
 CGLQLUWOs6WMhF8TpJ5qWtgAYI18PgbiznJrSdjrnANAluUvw9H79g2xXWf/ff2SNH8S
 JuHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693305857; x=1693910657;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+S+OFM/SaIRDO4CZ1HS1+M3zY1M1wtDfmawa09i8kOs=;
 b=aEatHorLP2k1P2tTXqMZ088jtsgAbfxp+odBMawF8POZhzJ1eM36V04l2OlcWBWfPv
 ++d3565aZ6fVloLJblg29buZjPZX4qQ2/WmicApsqIK/iLnu7cKGV70bl5jkpCqHC/qw
 Ot4dOCAIFMYdJ+Vmmeij9/wfo837OFVAwFih3NRnPpUijpjSKFDTfNYvtjaJys9A9a2m
 xPB+BQ/zB3spKi0yQEMv4yPagJuQdbZAtX/QEsYRpApPSRiHQjSGVsM54dYsrss9ebZL
 GW/6nJPM0mo/qJRZvEz5D5NhrnDF7h/xDeeGxr58JI2uHCqTvXnayg8suRwKHyqEAks0
 slXQ==
X-Gm-Message-State: AOJu0YyDjK3n+bC3mHMowjVD9FK5KAXA4OAXg35+9FSFzrHtPNM7pUM6
 SP3RHlQNBpFbyYGMaohsC7anryeXtOVEbVzXtWXB5VjOU0/AdvpNyhA=
X-Google-Smtp-Source: AGHT+IG4F5FrbB4LuavW+U011p9kyW0QyLMMxVW2gdfWcMm62cCwqrvaWq+v3KTsnGiFNLdYRP1OcPJsbCnuHRxqABU=
X-Received: by 2002:a67:eb0b:0:b0:44d:4904:e080 with SMTP id
 a11-20020a67eb0b000000b0044d4904e080mr21530579vso.31.1693305497289; Tue, 29
 Aug 2023 03:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230824153233.1006420-1-dianders@chromium.org>
 <20230824083012.v11.2.I4baba13e220bdd24d11400c67f137c35f07f82c7@changeid>
In-Reply-To: <20230824083012.v11.2.I4baba13e220bdd24d11400c67f137c35f07f82c7@changeid>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 29 Aug 2023 16:08:06 +0530
Message-ID: <CAFA6WYM2xTxBaNf8fjg3n0HotTaHezsB_e+eNgXK3PsSfWKx4A@mail.gmail.com>
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
 wrote: > > As per the (somewhat recent) comment before the definition of
 > `__cpuidle`, the tag is like `noinstr` but also marks [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.181 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.181 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qawCt-000522-3l
Subject: Re: [Kgdb-bugreport] [PATCH v11 2/6] arm64: idle: Tag the arm64
 idle functions as __cpuidle
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
 Daniel Thompson <daniel.thompson@linaro.org>, ito-yuichi@fujitsu.com,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 linux-perf-users@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Ingo Molnar <mingo@kernel.org>, Guo Ren <guoren@kernel.org>,
 Marc Zyngier <maz@kernel.org>, kgdb-bugreport@lists.sourceforge.net,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, 24 Aug 2023 at 21:03, Douglas Anderson <dianders@chromium.org> wrote:
>
> As per the (somewhat recent) comment before the definition of
> `__cpuidle`, the tag is like `noinstr` but also marks a function so it
> can be identified by cpu_in_idle(). Let's add these markings to arm64
> cpuidle functions
>
> With this change we get useful backtraces like:
>
>   NMI backtrace for cpu N skipped: idling at cpu_do_idle+0x94/0x98
>
> instead of useless backtraces when dumping all processors using
> nmi_cpu_backtrace().
>
> NOTE: this patch won't make cpu_in_idle() work perfectly for arm64,
> but it doesn't hurt and does catch some cases. Specifically an example
> that wasn't caught in my testing looked like this:
>
>  gic_cpu_sys_reg_init+0x1f8/0x314
>  gic_cpu_pm_notifier+0x40/0x78
>  raw_notifier_call_chain+0x5c/0x134
>  cpu_pm_notify+0x38/0x64
>  cpu_pm_exit+0x20/0x2c
>  psci_enter_idle_state+0x48/0x70
>  cpuidle_enter_state+0xb8/0x260
>  cpuidle_enter+0x44/0x5c
>  do_idle+0x188/0x30c
>
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>

Acked-by: Sumit Garg <sumit.garg@linaro.org>

-Sumit

> Changes in v11:
> - Updated commit message as per Stephen.
>
> Changes in v9:
> - Added to commit message that this doesn't catch all cases.
>
> Changes in v8:
> - "Tag the arm64 idle functions as __cpuidle" new for v8
>
>  arch/arm64/kernel/idle.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kernel/idle.c b/arch/arm64/kernel/idle.c
> index c1125753fe9b..05cfb347ec26 100644
> --- a/arch/arm64/kernel/idle.c
> +++ b/arch/arm64/kernel/idle.c
> @@ -20,7 +20,7 @@
>   *     ensure that interrupts are not masked at the PMR (because the core will
>   *     not wake up if we block the wake up signal in the interrupt controller).
>   */
> -void noinstr cpu_do_idle(void)
> +void __cpuidle cpu_do_idle(void)
>  {
>         struct arm_cpuidle_irq_context context;
>
> @@ -35,7 +35,7 @@ void noinstr cpu_do_idle(void)
>  /*
>   * This is our default idle handler.
>   */
> -void noinstr arch_cpu_idle(void)
> +void __cpuidle arch_cpu_idle(void)
>  {
>         /*
>          * This should do all the clock switching and wait for interrupt
> --
> 2.42.0.rc1.204.g551eb34607-goog
>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
