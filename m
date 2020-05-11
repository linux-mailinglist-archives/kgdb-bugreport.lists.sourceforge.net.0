Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D84FC1CDDF8
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 11 May 2020 16:59:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jY9tz-0004A3-Lu
	for lists+kgdb-bugreport@lfdr.de; Mon, 11 May 2020 14:59:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <will@kernel.org>) id 1jY9tz-00049l-32
 for kgdb-bugreport@lists.sourceforge.net; Mon, 11 May 2020 14:59:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wBjI6H3dpi9kVpVrZ65OufTBdZNABS94Y5SG1FJqpGU=; b=lnKDENkgN2ndmSI3wz+EEFWcDZ
 oHXkQNZ5yZyzv0qNSZ93Zm9/tjC7jDP0Vs4FLqmB23AQ7vnGyzQ70vqHPU+IN7zMYWv0NAp3N3P5Y
 YsVUW5d2rdCxay2Z+fPSBf3q1PlFapALMwNUhZ0FEr6zKFIw30QKUIkxMTYCfUwhBT0s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wBjI6H3dpi9kVpVrZ65OufTBdZNABS94Y5SG1FJqpGU=; b=Mw1KLY3WiY5wRRQvb7jaW1l0Jk
 +TNu/WbDPQRyQzxfeFj51GXf7EK71C1mnwblUFnC0D2xCZI5N0rmlrEm0MxEd4r7S1e5L1HXQP5yW
 Ej0dbFZQw8RIGsnRFpybI2bNovOkzOlivYvaQDYOX8k6tsyfuLr6XuvzFEdTBb9rlsfU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jY9tv-004NBm-Ds
 for kgdb-bugreport@lists.sourceforge.net; Mon, 11 May 2020 14:59:30 +0000
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B959420643;
 Mon, 11 May 2020 14:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589209157;
 bh=h6Ea4lLoHxX7Auk/jUvpA6sDRTJxI89bcfhFCCCylgg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wKZwMCRGb/qPVQrXagi72UbQrDDDpUCfscELhKXUCYWtWz/96oJ3TsTAVuOo9hq3N
 OTup9e3bn90dJWWmHxlKrSdmxAXWW+8b1fClhGGt1d9f8pbz6odwWVeOYY4PQ/tUpC
 Fx64l5wovGXZdTUhdEqOyQyid+5J32xaXo4AOdek=
Date: Mon, 11 May 2020 15:59:09 +0100
From: Will Deacon <will@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20200511145908.GA22040@willie-the-truck>
References: <20200428211351.85055-1-dianders@chromium.org>
 <20200428141218.v3.5.I22067ad43e77ddfd4b64c2d49030628480f9e8d9@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428141218.v3.5.I22067ad43e77ddfd4b64c2d49030628480f9e8d9@changeid>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jY9tv-004NBm-Ds
Subject: Re: [Kgdb-bugreport] [PATCH v3 05/11] arm64: Add call_break_hook()
 to early_brk64() for early kgdb
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
Cc: Mark Rutland <mark.rutland@arm.com>, catalin.marinas@arm.com,
 bjorn.andersson@linaro.org, hpa@zytor.com, daniel.thompson@linaro.org,
 corbet@lwn.net, jinho lim <jordan.lim@samsung.com>, agross@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, Dave Martin <Dave.Martin@arm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, jslaby@suse.com,
 Alexios Zavras <alexios.zavras@intel.com>, bp@alien8.de, tglx@linutronix.de,
 mingo@redhat.com, Allison Randal <allison@lohutok.net>,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 James Morse <james.morse@arm.com>, "Eric W. Biederman" <ebiederm@xmission.com>,
 jason.wessel@windriver.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Doug,

On Tue, Apr 28, 2020 at 02:13:45PM -0700, Douglas Anderson wrote:
> diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
> index 48222a4760c2..59c353dfc8e9 100644
> --- a/arch/arm64/kernel/debug-monitors.c
> +++ b/arch/arm64/kernel/debug-monitors.c
> @@ -297,7 +297,7 @@ void unregister_kernel_break_hook(struct break_hook *hook)
>  	unregister_debug_hook(&hook->node);
>  }
>  
> -static int call_break_hook(struct pt_regs *regs, unsigned int esr)
> +int call_break_hook(struct pt_regs *regs, unsigned int esr)
>  {
>  	struct break_hook *hook;
>  	struct list_head *list;
> diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> index cf402be5c573..a8173f0c1774 100644
> --- a/arch/arm64/kernel/traps.c
> +++ b/arch/arm64/kernel/traps.c
> @@ -1044,6 +1044,9 @@ int __init early_brk64(unsigned long addr, unsigned int esr,
>  	if ((comment & ~KASAN_BRK_MASK) == KASAN_BRK_IMM)
>  		return kasan_handler(regs, esr) != DBG_HOOK_HANDLED;
>  #endif
> +	if (call_break_hook(regs, esr) == DBG_HOOK_HANDLED)
> +		return 0;

I think this just means we're not running debug_traps_init() early enough,
and actually the KASAN early handler is unnecessary too.

If we call debug_traps_init() directly from setup_arch() and drop the
arch_initcall(), can we then drop early_brk64 entirely?

Will


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
