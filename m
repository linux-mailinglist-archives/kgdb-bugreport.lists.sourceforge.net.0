Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 88468700745
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 12 May 2023 13:55:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pxRN9-0006jy-Cn
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 12 May 2023 11:55:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1pxRN8-0006jo-DL
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 12 May 2023 11:55:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xyID2nrfRFvnCmCCEoDqrRJb/SLL4bOOzyPEcVWhIcg=; b=Ba3OFuBLu8ocshI7agQvs6elzA
 Kzpft3fgqkN6PMBIpf+YmskUC5Rb+B6imId0Cz86iKF8/LetWiSNltrCGsMUAMQLPIxMV+Ha+cqIu
 CIkMj93cUt/7rbvkzvmQUzj+UYBHFUvlMe3AwjaJi9dSjvRfxOyR9DlQkLAUC7bmwrUA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xyID2nrfRFvnCmCCEoDqrRJb/SLL4bOOzyPEcVWhIcg=; b=a4262G4VZg74+tiXWQJbHJ2Btm
 N4ZWvP1HgpzZePAikXXH+CNZL6R+2MZDLTkVVWn24wU9vluTggNQxdBM1Ubd0qKb9+AIQIt37lbmA
 LOuSeJNtwjZADvbRCLGuoMJHdGNyluBceML0VaBvaiRyeAF2hJP1BdWTa1t9tzdmkfjE=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pxRN7-004RK8-Ib for kgdb-bugreport@lists.sourceforge.net;
 Fri, 12 May 2023 11:55:42 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id D7F82221B0;
 Fri, 12 May 2023 11:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1683892526; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xyID2nrfRFvnCmCCEoDqrRJb/SLL4bOOzyPEcVWhIcg=;
 b=lEQ0yjMIPHRMyl9VsYuE8tD7yo0iFTwLUXaORxnhA7t8728sX0q4aRdF3iN6dqy1aC3q8/
 YPm1Tcs8DZ1wYKRHJ8/JPaw9/W3ekjR2+D3gmP9Tk3pQE/UABRQW6NVwrkr0j2R28omH/o
 DCRZdesZpFrDMAZ/mT4KGYDe+egXfWo=
Received: from suse.cz (unknown [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 6A61A2C152;
 Fri, 12 May 2023 11:55:25 +0000 (UTC)
Date: Fri, 12 May 2023 13:55:24 +0200
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <ZF4pLJUpvec7vvXT@alley>
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.12.I847d9ec852449350997ba00401d2462a9cb4302b@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230504151100.v4.12.I847d9ec852449350997ba00401d2462a9cb4302b@changeid>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu 2023-05-04 15:13:44, Douglas Anderson wrote: > The
 fact that there watchdog_hardlockup_enable(), > watchdog_hardlockup_disable(), 
 and watchdog_hardlockup_probe() are > declared __weak means tha [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1pxRN7-004RK8-Ib
Subject: Re: [Kgdb-bugreport] [PATCH v4 12/17] watchdog/hardlockup: Have the
 perf hardlockup use __weak functions more cleanly
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
From: Petr Mladek via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 mpe@ellerman.id.au, christophe.leroy@csgroup.eu, Chen-Yu Tsai <wens@csie.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com,
 Tzung-Bi Shih <tzungbi@chromium.org>, npiggin@gmail.com,
 Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>,
 linux-arm-kernel@lists.infradead.org, ito-yuichi@fujitsu.com,
 linux-perf-users@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu 2023-05-04 15:13:44, Douglas Anderson wrote:
> The fact that there watchdog_hardlockup_enable(),
> watchdog_hardlockup_disable(), and watchdog_hardlockup_probe() are
> declared __weak means that the configured hardlockup detector can
> define non-weak versions of those functions if it needs to. Instead of
> doing this, the perf hardlockup detector hooked itself into the
> default __weak implementation, which was a bit awkward. Clean this up.
> 
> >From comments, it looks as if the original design was done because the
> __weak function were expected to implemented by the architecture and
> not by the configured hardlockup detector. This got awkward when we
> tried to add the buddy lockup detector which was not arch-specific but
> wanted to hook into those same functions.
> 
> This is not expected to have any functional impact.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

I like this change:

Reviewed-by: Petr Mladek <pmladek@suse.com>

See a comment below.

> --- a/kernel/watchdog_perf.c
> +++ b/kernel/watchdog_perf.c
> @@ -147,12 +151,16 @@ void hardlockup_detector_perf_enable(void)
>  }
>  
>  /**
> - * hardlockup_detector_perf_disable - Disable the local event
> + * watchdog_hardlockup_disable - Disable the local event
> + *
> + * @cpu: The CPU to enable hard lockup on.
>   */
> -void hardlockup_detector_perf_disable(void)
> +void watchdog_hardlockup_disable(unsigned int cpu)
>  {
>  	struct perf_event *event = this_cpu_read(watchdog_ev);
>  
> +	WARN_ON_ONCE(cpu != smp_processor_id());
> +

It makes sense. But it just shows how the code is weird.
@cpu is passed as a parameter and the code expects that it is
running on the given CPU.

It seems that @cpu is passed as a parameter because this is
called from:

  + [CPUHP_AP_WATCHDOG_ONLINE].teardown.single()
    + lockup_detector_offline_cpu()
      + watchdog_disable()

and the CPU hotplug API passes @cpu parameter.

IMHO, the clean solution would be to use per_cpu*() instead
of this_cpu*() API everywhere in this code path.

But it is yet another cleanup. It seems to be out-of-scope of
this patchset.

>  	if (event) {
>  		perf_event_disable(event);
>  		this_cpu_write(watchdog_ev, NULL);

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
