Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F99700B0A
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 12 May 2023 17:09:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pxUOT-0007ev-H0
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 12 May 2023 15:09:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1pxUOS-0007eh-64
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 12 May 2023 15:09:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xZTBhI8WbVwatkb4NYJFwNjU8zCWiGxjcfs72+Uqg0s=; b=DwJPhlobB/NQSm6a37il32ZGzb
 qjMCqJ6Q46nOuoAPkfHuwZX2vLxQDpG/2G2Fb2tm1wibwBMStreCi/d1ybrEPwWEUQj+V9doacZUW
 kY2nP25qo5Bn9/Zt0jpCCfmA/PCBQYECb+QUT/mh8CdDzjPVAs5fZXv0bvy/Y/LGJx5M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xZTBhI8WbVwatkb4NYJFwNjU8zCWiGxjcfs72+Uqg0s=; b=FaAlhs025jpb8kyBjTp/VD6gnU
 tD6I4iKuid4FG74Jti9gdGxW2eRby/s8ocGJT3th+uOvMssH0hiS2yisYRbIa8S7A3NIPWMuMIjJc
 ef/QaQPuFKTwfWwivXjxVRiRvKIcNIxcTMa9X0Wz6OhI9k4bqqyTHGi0tCo+VGl0qCk4=;
Received: from mail-ej1-f43.google.com ([209.85.218.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pxUOS-0001uz-CA for kgdb-bugreport@lists.sourceforge.net;
 Fri, 12 May 2023 15:09:16 +0000
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-965fc25f009so1552731766b.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 12 May 2023 08:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683904150; x=1686496150;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xZTBhI8WbVwatkb4NYJFwNjU8zCWiGxjcfs72+Uqg0s=;
 b=wx+XAANT6soxJellXwKx4gNVKyRNPdhoKz1HyNURZuWaUzOOqSWAW+aVtT1V1lCk4+
 TRp0VasL9WWyDUKnfWTXnnH90p1xHSrqRo0CYv0ePS6Uz6orUgIofblqpIaX7ilx7ABM
 t1WctoGSZnA+JLu+n5rVOsLnpFAQbf3MceLN6pF34tCR73s16bTi4ZCYF03V0nPo+BbG
 qKhqEPpog0d4FIGEHUFG/6NuUWA6e+QWxxwQb2sh3DVsjwsrWWDhGNn3RMVeUZXUY3O+
 A2irk+UM79Hv9rKxLfe5RcIvFz60m3o9xcrIvOZpb3Noabc9yQ2g8SuK/NKD4K2u87zB
 g7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683904150; x=1686496150;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xZTBhI8WbVwatkb4NYJFwNjU8zCWiGxjcfs72+Uqg0s=;
 b=GILDMHcau6dSnb3ZT9em0wg5BluWcQTpqsWXZImYR+VhExl6R/NgheXpVBZGsvq9G8
 U1h1HhuZ+mVvsTj5lSfS9bkFyjpxXQwG3fai/W+o/B3+Ms5yQN3UPOibdI2cghRlwuXS
 pHw0F3Vo1Ait8IJ5Z2xuUDqfsEFZhrC/hoMYa3Xw3XmAT0x6Ld5mNnky9sv8WHdkythY
 JkaaHC8atyGWBzZs3wBlMKdbu1Lgp6C4k4SsTFxwA02JQpKSlQh+ucz13mgNksx0iWGM
 giolrjZ6u/8oSzmfCzriOVzXmBUxN44rr7Ibog/9YenUXpWZCOrbodL3eEMXVkHyri7k
 LDyQ==
X-Gm-Message-State: AC+VfDz1EbJV58f+5VJlWJHDKmmj74C/MtPmCu+wULC56U6cO8GrrAWQ
 r3ohJ1Y1JmhShBD3FfqretnJ2drAoNTa2ny03PDF6Pcu
X-Google-Smtp-Source: ACHHUZ4kNwv3cDr0xN4V/C2Hts5rmuiXYr3NgdImv65NIcgXDbOUwrHJnIlxUMCK1b/wB4987mMUKg==
X-Received: by 2002:a5d:51c4:0:b0:306:37ec:656c with SMTP id
 n4-20020a5d51c4000000b0030637ec656cmr17349120wrv.66.1683900053995; 
 Fri, 12 May 2023 07:00:53 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b003047ae72b14sm23588654wrq.82.2023.05.12.07.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 07:00:53 -0700 (PDT)
Date: Fri, 12 May 2023 15:00:51 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20230512140051.GA217273@aspen.lan>
References: <20230419225604.21204-1-dianders@chromium.org>
 <20230419155341.v8.9.I2ef26d1b3bfbed2d10a281942b0da7d9854de05e@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230419155341.v8.9.I2ef26d1b3bfbed2d10a281942b0da7d9854de05e@changeid>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 19, 2023 at 03:56:03PM -0700, Douglas Anderson
 wrote: > From: Sumit Garg <sumit.garg@linaro.org> > > arm64 platforms with
 GICv3 or later supports pseudo NMIs which can be > leveraged to ro [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.43 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.218.43 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pxUOS-0001uz-CA
Subject: Re: [Kgdb-bugreport] [PATCH v8 09/10] arm64: kgdb: Roundup cpus
 using IPI as NMI
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
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, ito-yuichi@fujitsu.com,
 Alexandru Elisei <alexandru.elisei@arm.com>, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, linux-perf-users@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Marc Zyngier <maz@kernel.org>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Apr 19, 2023 at 03:56:03PM -0700, Douglas Anderson wrote:
> From: Sumit Garg <sumit.garg@linaro.org>
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
> Tested-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> (no changes since v1)
>
>  arch/arm64/kernel/ipi_nmi.c |  5 +++++
>  arch/arm64/kernel/kgdb.c    | 18 ++++++++++++++++++
>  2 files changed, 23 insertions(+)
>
> diff --git a/arch/arm64/kernel/ipi_nmi.c b/arch/arm64/kernel/ipi_nmi.c
> index c592e92b8cbf..2adaaf1519e5 100644
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
>  	irqreturn_t ret = IRQ_NONE;
> +	unsigned int cpu = smp_processor_id();

Does this play nice with CONFIG_DEBUG_PREEMPT? I may have missed
something about the NMI entry but a quick scan of the arm64
arch_irq_disabled() suggests that debug_smp_processor_id() will issue
warnings at this point...

Other than I didn't see anything I don't like here.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
