Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 989A578EA04
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 31 Aug 2023 12:15:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qbei0-0003BY-CQ
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 31 Aug 2023 10:15:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mark.rutland@arm.com>) id 1qbehz-0003BS-I9
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 31 Aug 2023 10:15:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EKgw+n9+nd/zVFaVnxW1zkVg4zBBYSraXWQp2zNDN0o=; b=ik7pkvgzkfNxPtEiMUzROWbeMQ
 bZpHWsJhS2NHlaMHUYPk0kJt2cK48GPryqTQgEKMcXONTiY8qNvUFziNWVy65WsFQZ6nPIOywT+if
 1V6ZHrS4aAewD1VgMMUnThm1W5PKeCSsl6/ASVV39QigBi3AMvYpu5bDUCYXSjMc4edM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EKgw+n9+nd/zVFaVnxW1zkVg4zBBYSraXWQp2zNDN0o=; b=dKQswlD0/mnIWPbxcjZuzAp6nB
 sAuupapm3mp7C36uIIaf7+1pUuTocYhHrPbsMCvktsU11LEZrdbqYA4iqicx48xKUkhTuwtqjXMNg
 h/7MPRDSEzajlcYs2LBNoG5fWFHH/f6ebJUZdslolrSA8tJG3ji2GhU6k5eLwUYxU4nc=;
Received: from foss.arm.com ([217.140.110.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1qbehy-004cTH-Sd for kgdb-bugreport@lists.sourceforge.net;
 Thu, 31 Aug 2023 10:15:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 187F7C15;
 Thu, 31 Aug 2023 03:16:01 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.3.201])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 42A9D3F64C;
 Thu, 31 Aug 2023 03:15:18 -0700 (PDT)
Date: Thu, 31 Aug 2023 11:15:15 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <ZPBoMx8fsFRnC8gI@FVFF77S0Q05N>
References: <20230830191314.1618136-1-dianders@chromium.org>
 <20230830121115.v12.7.I625d393afd71e1766ef73d3bfaac0b347a4afd19@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230830121115.v12.7.I625d393afd71e1766ef73d3bfaac0b347a4afd19@changeid>
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Aug 30, 2023 at 12:11:28PM -0700, Douglas Anderson
 wrote: > Mark the three IPI-related globals in smp.c as "__ro_after_init"
 since > they are only ever set in set_smp_ipi_range(), which is mar [...]
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [217.140.110.172 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1qbehy-004cTH-Sd
Subject: Re: [Kgdb-bugreport] [PATCH v12 7/7] arm64: smp: Mark IPI globals
 as __ro_after_init
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

On Wed, Aug 30, 2023 at 12:11:28PM -0700, Douglas Anderson wrote:
> Mark the three IPI-related globals in smp.c as "__ro_after_init" since
> they are only ever set in set_smp_ipi_range(), which is marked
> "__init". This is a better and more secure marking than the old
> "__read_mostly".
> 
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> This patch is almost completely unrelated to the rest of the series
> other than the fact that it would cause a merge conflict with the
> series if sent separately. I tacked it on to this series in response
> to Stephen's feedback on v11 of this series [1]. If someone hates it
> (not sure why they would), it could be dropped. If someone loves it,
> it could be promoted to the start of the series and/or land on its own
> (resolving merge conflicts).
> 
> [1] https://lore.kernel.org/r/CAE-0n52iVDgZa8XT8KTMj12c_ESSJt7f7A0fuZ_oAMMqpGcSzA@mail.gmail.com

This looks reasonable to me, so:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> 
> Changes in v12:
> - ("arm64: smp: Mark IPI globals as __ro_after_init") new for v12.
> 
>  arch/arm64/kernel/smp.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 1a53e57c81d0..814d9aa93b21 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -84,9 +84,9 @@ enum ipi_msg_type {
>  	MAX_IPI
>  };
>  
> -static int ipi_irq_base __read_mostly;
> -static int nr_ipi __read_mostly = NR_IPI;
> -static struct irq_desc *ipi_desc[MAX_IPI] __read_mostly;
> +static int ipi_irq_base __ro_after_init;
> +static int nr_ipi __ro_after_init = NR_IPI;
> +static struct irq_desc *ipi_desc[MAX_IPI] __ro_after_init;
>  
>  static void ipi_setup(int cpu);
>  
> -- 
> 2.42.0.283.g2d96d420d3-goog
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
