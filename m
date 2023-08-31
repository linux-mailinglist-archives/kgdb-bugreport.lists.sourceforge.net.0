Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A4278E9FB
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 31 Aug 2023 12:14:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qbegv-0000cM-7S
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 31 Aug 2023 10:14:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mark.rutland@arm.com>) id 1qbegu-0000cG-6p
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 31 Aug 2023 10:14:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ruz0wFPc3l/TqNSLMZ3I6tFcHpk3Q5NvNxGqrvq9TR8=; b=d8k/ZVe8vZHQLHvLnfvfRaTIbL
 N4c3qHemmnZu+8evBlQtvmxd0UqVckvsdqp6FTt0UaIifq2OJWEhbJY75Tx+3P3f9lMi4DUfEw1fK
 SZlVCYUNuzBLrTaw2oqjUHqNBvIrO1xovNQnirPeHRlLe4ezfn5ePU+CZpPaiBtdG96w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ruz0wFPc3l/TqNSLMZ3I6tFcHpk3Q5NvNxGqrvq9TR8=; b=Jt3LZNeteawQwYOwEMoPDXEgBr
 3bJhq2e7cu7kRMP3ybRAXP+ytMNI+yVUf4ulsg8cQ5PwnrONe6+vtJ56pcdg89XpfTVCRGechHZtz
 J76YrorYi8x8DQ1e2DRIKNYWEVBLg5JMFj4JrEXii63Zqp549kLTdTfDOxffltefRnx8=;
Received: from foss.arm.com ([217.140.110.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1qbegq-00014Y-1P for kgdb-bugreport@lists.sourceforge.net;
 Thu, 31 Aug 2023 10:14:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DFCCC15;
 Thu, 31 Aug 2023 03:14:50 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.3.201])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3EF463F64C;
 Thu, 31 Aug 2023 03:14:07 -0700 (PDT)
Date: Thu, 31 Aug 2023 11:14:04 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <ZPBn7CJ9ppIheCT4@FVFF77S0Q05N>
References: <20230830191314.1618136-1-dianders@chromium.org>
 <20230830121115.v12.6.I2ef26d1b3bfbed2d10a281942b0da7d9854de05e@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230830121115.v12.6.I2ef26d1b3bfbed2d10a281942b0da7d9854de05e@changeid>
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Aug 30, 2023 at 12:11:27PM -0700, Douglas Anderson
 wrote: > Up until now we've been using the generic (weak) implementation
 for > kgdb_roundup_cpus() when using kgdb on arm64. Let's move to a [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [217.140.110.172 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1qbegq-00014Y-1P
Subject: Re: [Kgdb-bugreport] [PATCH v12 6/7] arm64: kgdb: Implement
 kgdb_roundup_cpus() to enable pseudo-NMI roundup
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
 Catalin Marinas <catalin.marinas@arm.com>,
 Stephane Eranian <eranian@google.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Marc Zyngier <maz@kernel.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Chen-Yu Tsai <wens@csie.org>, kgdb-bugreport@lists.sourceforge.net,
 Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Valentin Schneider <vschneid@redhat.com>, Stephen Boyd <swboyd@chromium.org>,
 Tomohiro Misono <misono.tomohiro@fujitsu.com>,
 Thomas Gleixner <tglx@linutronix.de>, Josh Poimboeuf <jpoimboe@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 D Scott Phillips <scott@os.amperecomputing.com>, ito-yuichi@fujitsu.com,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Aug 30, 2023 at 12:11:27PM -0700, Douglas Anderson wrote:
> Up until now we've been using the generic (weak) implementation for
> kgdb_roundup_cpus() when using kgdb on arm64. Let's move to a custom
> one. The advantage here is that, when pseudo-NMI is enabled on a
> device, we'll be able to round up CPUs using pseudo-NMI. This allows
> us to debug CPUs that are stuck with interrupts disabled. If
> pseudo-NMIs are not enabled then we'll fallback to just using an IPI,
> which is still slightly better than the generic implementation since
> it avoids the potential situation described in the generic
> kgdb_call_nmi_hook().
> 
> Co-developed-by: Sumit Garg <sumit.garg@linaro.org>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> I debated whether this should be in "arch/arm64/kernel/smp.c" or if I
> should try to find a way for it to go into "arch/arm64/kernel/kgdb.c".
> In the end this is so little code that it didn't seem worth it to find
> a way to export the IPI defines or to otherwise come up with some API
> between kgdb.c and smp.c. If someone has strong feelings and wants
> this to change, please shout and give details of your preferred
> solution.

Putting this in smp.c seems fine to me.

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> 
> FWIW, it seems like ~half the other platforms put this in "smp.c" with
> an ifdef for KGDB and the other half put it in "kgdb.c" with an ifdef
> for SMP. :-P
> 
> (no changes since v10)
> 
> Changes in v10:
> - Don't allocate the cpumask on the stack; just iterate.
> - Moved kgdb calls to smp.c to avoid needing to export IPI info.
> - kgdb now has its own IPI.
> 
> Changes in v9:
> - Remove fallback for when debug IPI isn't available.
> - Renamed "NMI IPI" to "debug IPI" since it might not be backed by NMI.
> 
>  arch/arm64/kernel/smp.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 800c59cf9b64..1a53e57c81d0 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -32,6 +32,7 @@
>  #include <linux/irq_work.h>
>  #include <linux/kernel_stat.h>
>  #include <linux/kexec.h>
> +#include <linux/kgdb.h>
>  #include <linux/kvm_host.h>
>  #include <linux/nmi.h>
>  
> @@ -79,6 +80,7 @@ enum ipi_msg_type {
>  	 * with trace_ipi_*
>  	 */
>  	IPI_CPU_BACKTRACE = NR_IPI,
> +	IPI_KGDB_ROUNDUP,
>  	MAX_IPI
>  };
>  
> @@ -868,6 +870,22 @@ void arch_trigger_cpumask_backtrace(const cpumask_t *mask, int exclude_cpu)
>  	nmi_trigger_cpumask_backtrace(mask, exclude_cpu, arm64_backtrace_ipi);
>  }
>  
> +#ifdef CONFIG_KGDB
> +void kgdb_roundup_cpus(void)
> +{
> +	int this_cpu = raw_smp_processor_id();
> +	int cpu;
> +
> +	for_each_online_cpu(cpu) {
> +		/* No need to roundup ourselves */
> +		if (cpu == this_cpu)
> +			continue;
> +
> +		__ipi_send_single(ipi_desc[IPI_KGDB_ROUNDUP], cpu);
> +	}
> +}
> +#endif
> +
>  /*
>   * Main handler for inter-processor interrupts
>   */
> @@ -919,6 +937,10 @@ static void do_handle_IPI(int ipinr)
>  		nmi_cpu_backtrace(get_irq_regs());
>  		break;
>  
> +	case IPI_KGDB_ROUNDUP:
> +		kgdb_nmicallback(cpu, get_irq_regs());
> +		break;
> +
>  	default:
>  		pr_crit("CPU%u: Unknown IPI message 0x%x\n", cpu, ipinr);
>  		break;
> @@ -949,6 +971,7 @@ static bool ipi_should_be_nmi(enum ipi_msg_type ipi)
>  	case IPI_CPU_STOP:
>  	case IPI_CPU_CRASH_STOP:
>  	case IPI_CPU_BACKTRACE:
> +	case IPI_KGDB_ROUNDUP:
>  		return true;
>  	default:
>  		return false;
> -- 
> 2.42.0.283.g2d96d420d3-goog
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
