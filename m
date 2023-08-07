Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 495A8771DD2
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Aug 2023 12:18:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qSxJI-0005EF-25
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 07 Aug 2023 10:17:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mark.rutland@arm.com>) id 1qSxJH-0005E9-31
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Aug 2023 10:17:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qNZrcqTF7KswT5cHbPZG74YUwWazwpel/1kelT5zAVY=; b=MY8SVqcHN3W0uxUUxQ131WsWug
 fOf6DOqJZv33GkW6qX21A9lgsyN/fbHLT5u7OLgOo2k99jml+0XENwSPZvUZCPrLM8awqmS63jAxM
 hXBXcQv0j/401KwqQuysDOWMyiSVK8t5EbRr7FH/my3yaHQ8YYnTlDTJYdg1Z6vzQu0U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qNZrcqTF7KswT5cHbPZG74YUwWazwpel/1kelT5zAVY=; b=jSaqyDf/W6CEHqk+Jm5iVIpcg3
 A3vqg758MNKmq1hhYIdyrkdCa6/DWY1+q3vt2o5u5sWOVoMH5GvCWQKMNWreDJCAUmaXEFF64UTXb
 WcKJbHDSXm7ST4yCr/Uth8s4qOvwK9Kib/Yw6TRg8MaYgIbexZ5M2lrt7NlA51jgV3LE=;
Received: from foss.arm.com ([217.140.110.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1qSxJF-0005RZ-7Z for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Aug 2023 10:17:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE9E61FB;
 Mon,  7 Aug 2023 03:18:34 -0700 (PDT)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com
 [10.1.32.139])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A99AB3F59C;
 Mon,  7 Aug 2023 03:17:48 -0700 (PDT)
Date: Mon, 7 Aug 2023 11:17:45 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <ZNDEyT3mHCl0UQIV@FVFF77S0Q05N.cambridge.arm.com>
References: <20230601213440.2488667-1-dianders@chromium.org>
 <20230601143109.v9.4.I6d7f7d5fa0aa293c8c3374194947254b93114d37@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230601143109.v9.4.I6d7f7d5fa0aa293c8c3374194947254b93114d37@changeid>
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jun 01, 2023 at 02:31:48PM -0700, Douglas Anderson
 wrote: > From: Sumit Garg <sumit.garg@linaro.org> > > All current arm64
 interrupt
 controllers have at least 8 > IPIs. Currently we are only u [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [217.140.110.172 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1qSxJF-0005RZ-7Z
Subject: Re: [Kgdb-bugreport] [PATCH v9 4/7] arm64: smp: Assign and setup
 the debug IPI
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
Cc: Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Marc Zyngier <maz@kernel.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Ard Biesheuvel <ardb@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 kgdb-bugreport@lists.sourceforge.net, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Valentin Schneider <vschneid@redhat.com>, Stephen Boyd <swboyd@chromium.org>,
 Ben Dooks <ben-linux@fluff.org>, Thomas Gleixner <tglx@linutronix.de>,
 Josh Poimboeuf <jpoimboe@kernel.org>, linux-arm-kernel@lists.infradead.org,
 ito-yuichi@fujitsu.com, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Jun 01, 2023 at 02:31:48PM -0700, Douglas Anderson wrote:
> From: Sumit Garg <sumit.garg@linaro.org>
> 
> All current arm64 interrupt controllers have at least 8
> IPIs. Currently we are only using 7 of them on arm64. Let's use the
> 8th one as a debug IPI. This uses the new "debug IPI" infrastructure
> which will try to allocate this IPI as an NMI/pseudo NMI if possible.
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

I think with my suggestion on the prior patch, we don't need the additional
logic here.

> ---
> I could imagine that people object to using up the last free IPI on
> interrupt controllers with only 8 IPIs. However, it shouldn't be a big
> deal. If we later need an extra IPI, it shouldn't be too hard to
> combine some of the existing ones. Presumably we could just get rid of
> the "crash stop" IPI and have the normal "stop" IPI do the crash if
> "waiting_for_crash_ipi" is non-zero

TBH, I'd love to unify the logic for IPI_CPU_STOP and IPI_CPU_CRASH_STOP as
they have a bunch of pointless divergence.

We could also remove IPI_WAKEUP and replace that with something else (e.g.
IPI_CALL_FUNC with an empty function) in order to free up an IPI.

I'd *also* prefer to have separate IPI_CPU_BACKTRACE and IPI_CPU_DEBUG as the
backtrace logic is used for a bunch of things other than KGDB (e.g. RCU stalls,
panic), and that would clearly separate the logic for the two cases.

Thanks,
Mark.

> 
> Changes in v9:
> - Add a warning if we don't have enough IPIs for the NMI IPI
> - Renamed "NMI IPI" to "debug IPI" since it might not be backed by NMI.
> - Update commit description
> 
> Changes in v8:
> - debug_ipi_setup() and debug_ipi_teardown() no longer take cpu param
> 
>  arch/arm64/kernel/smp.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index edd63894d61e..db019b49d3bd 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -53,6 +53,8 @@
>  
>  #include <trace/events/ipi.h>
>  
> +#include "ipi_debug.h"
> +
>  DEFINE_PER_CPU_READ_MOSTLY(int, cpu_number);
>  EXPORT_PER_CPU_SYMBOL(cpu_number);
>  
> @@ -935,6 +937,8 @@ static void ipi_setup(int cpu)
>  
>  	for (i = 0; i < nr_ipi; i++)
>  		enable_percpu_irq(ipi_irq_base + i, 0);
> +
> +	debug_ipi_setup();
>  }
>  
>  #ifdef CONFIG_HOTPLUG_CPU
> @@ -947,6 +951,8 @@ static void ipi_teardown(int cpu)
>  
>  	for (i = 0; i < nr_ipi; i++)
>  		disable_percpu_irq(ipi_irq_base + i);
> +
> +	debug_ipi_teardown();
>  }
>  #endif
>  
> @@ -968,6 +974,11 @@ void __init set_smp_ipi_range(int ipi_base, int n)
>  		irq_set_status_flags(ipi_base + i, IRQ_HIDDEN);
>  	}
>  
> +	if (n > nr_ipi)
> +		set_smp_debug_ipi(ipi_base + nr_ipi);
> +	else
> +		WARN(1, "Not enough IPIs for NMI IPI\n");
> +
>  	ipi_irq_base = ipi_base;
>  
>  	/* Setup the boot CPU immediately */
> -- 
> 2.41.0.rc2.161.g9c6817b8e7-goog
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
