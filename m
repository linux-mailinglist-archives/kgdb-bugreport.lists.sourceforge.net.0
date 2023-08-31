Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D7B78E9F3
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 31 Aug 2023 12:12:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qbefZ-0000bL-R8
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 31 Aug 2023 10:12:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mark.rutland@arm.com>) id 1qbefY-0000bC-EB
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 31 Aug 2023 10:12:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m4Zj+qWdT+53boGaeGishkX3APgdiRS1R2nQXx+qEEo=; b=F0WHwMRNXdyxCLDEJHY/3P9ZQt
 P2D1+bRNexvFJQ0ZdN+HtKKajjit8DlDv9nea1VhgR8++alFbBpRwJhG1JlxhhwaSzuLFuCCG+vzU
 ZVVI08mggLkWi9LtiSPhps+14cNYGtqvn4wbl8PLvjy/6o/0hbPneyrs3bDkKo8pJvlU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m4Zj+qWdT+53boGaeGishkX3APgdiRS1R2nQXx+qEEo=; b=NAw6t3+L/KWHW6P+3DKpXM3EgT
 byAUIB4THrEEqgKNRKkCf7t8Nr9oSJfmhylvm6cdzkyUHSQaPBvMRRwJaxsmj2NPaYsLVJX8owJL+
 yPSXvk+BUt0uRUHWSAU4zy9g0rXrINVfmKwQddBcKEeKeJfpg2pILDIGfJ3uRH5xvG4w=;
Received: from foss.arm.com ([217.140.110.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1qbefV-004cMo-Et for kgdb-bugreport@lists.sourceforge.net;
 Thu, 31 Aug 2023 10:12:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5DF75C15;
 Thu, 31 Aug 2023 03:13:27 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.3.201])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E2853F64C;
 Thu, 31 Aug 2023 03:12:42 -0700 (PDT)
Date: Thu, 31 Aug 2023 11:12:34 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <ZPBnkkDc9GSxrjmC@FVFF77S0Q05N>
References: <20230830191314.1618136-1-dianders@chromium.org>
 <20230830121115.v12.5.Ifadbfd45b22c52edcb499034dd4783d096343260@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230830121115.v12.5.Ifadbfd45b22c52edcb499034dd4783d096343260@changeid>
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Aug 30, 2023 at 12:11:26PM -0700, Douglas Anderson
 wrote: > There's no reason why IPI_CPU_STOP and IPI_CPU_CRASH_STOP can't
 be > handled as NMI. They are very simple and everything in them is [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [217.140.110.172 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1qbefV-004cMo-Et
Subject: Re: [Kgdb-bugreport] [PATCH v12 5/7] arm64: smp: IPI_CPU_STOP and
 IPI_CPU_CRASH_STOP should try for NMI
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

On Wed, Aug 30, 2023 at 12:11:26PM -0700, Douglas Anderson wrote:
> There's no reason why IPI_CPU_STOP and IPI_CPU_CRASH_STOP can't be
> handled as NMI. They are very simple and everything in them is
> NMI-safe. Mark them as things to use NMI for if NMI is available.
> 
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Misono Tomohiro <misono.tomohiro@fujitsu.com>
> Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> I don't actually have any good way to test/validate this patch. It's
> added to the series at Mark's request.

I've just sent out an LKDTM test that can be used to test this:

  http://lore.kernel.org/lkml/20230831101026.3122590-1-mark.rutland@arm.com

So FWIW:

Acked-by: Mark Rutland <mark.rutland@arm.com>
Tested-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> 
> (no changes since v10)
> 
> Changes in v10:
> - ("IPI_CPU_STOP and IPI_CPU_CRASH_STOP should try for NMI") new for v10.
> 
>  arch/arm64/kernel/smp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 28c904ca499a..800c59cf9b64 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -946,6 +946,8 @@ static bool ipi_should_be_nmi(enum ipi_msg_type ipi)
>  		return false;
>  
>  	switch (ipi) {
> +	case IPI_CPU_STOP:
> +	case IPI_CPU_CRASH_STOP:
>  	case IPI_CPU_BACKTRACE:
>  		return true;
>  	default:
> -- 
> 2.42.0.283.g2d96d420d3-goog
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
