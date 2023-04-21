Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A266EB5FE
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 22 Apr 2023 02:00:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pq0ft-0004IO-L0
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 22 Apr 2023 00:00:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rdunlap@infradead.org>) id 1pq0fj-0004IG-Es
 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 22 Apr 2023 00:00:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wT7haPhVSoi15WlZuxldv/S7DXyNS9NkPBcv78cvTg4=; b=DYlYeyGjxO3NMzQ5brJOjNq4Q1
 GOqAMVoZDYG0fA842fXo/Hi7b2QO6WKYr17DYMivosQLP9OyRisU4I/nmft2p+hyNyBpIjudeOZ9C
 6dR2vP1ADY9R31xIINMae8vc4Dvvua9n1JrecitHZP4gm2kZlF70VEwTiH2q248/2cHo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wT7haPhVSoi15WlZuxldv/S7DXyNS9NkPBcv78cvTg4=; b=RGX6LyZzy2ggOpy8GbFlLglw7T
 Vm8W33oBuMHc88yPXKZl4T1cxAffPD4kpNaMp6ahQtU8UZPQyfWjT/Z0kAbSs28XzqsDSwzkdReXL
 jA7qFOgmfLtc4rI0p2GBTYTu4/2UOoNDt3sy3uMRrKdvLu9CbILAaCi2WZ0PcUZUF+S4=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pq0fU-0008Ek-24 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 22 Apr 2023 00:00:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=wT7haPhVSoi15WlZuxldv/S7DXyNS9NkPBcv78cvTg4=; b=tQ/7kO5WGRK8mh5K/22TizxJCE
 8dl7RmFvZc6P0qnJMdMfT7j0HwqFG0khdt0z8RLU/vItY9MnPEY1HMUFr66kZaVUJlVIQhFFmS51k
 YPPvqQJtiFKbbePl3USkjZD65yB8SSl4N5Xf4S1Gc5/o2e1DRJwrpu6gyoB+frIzeXrahETRf9Uwg
 B8nTlhwW4PyMwhHt+sP/mRCKLNFJX8J0/u/mFxhcRG/r03gafiEjnyvSQ3MHEScTdxtYhZJNIavSW
 XGWmAcbjfdJstkqFbPRCH7vsY5EmQMJHELXlVI+rkH54u/LI45pARRBWcVVg+tva1IpoBiH3e4s7e
 SekzjI7w==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pq0f4-00C71y-2G; Fri, 21 Apr 2023 23:59:31 +0000
Message-ID: <d54fe26d-0f11-e422-d5f3-841c663b9d6f@infradead.org>
Date: Fri, 21 Apr 2023 16:59:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Douglas Anderson <dianders@chromium.org>, Petr Mladek <pmladek@suse.com>, 
 Andrew Morton <akpm@linux-foundation.org>
References: <20230421155255.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230421155255.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi-- On 4/21/23 15:53, Douglas Anderson wrote: > From: Colin
 Cross <ccross@android.com> > > Implement a hardlockup detector that can be
 enabled on SMP systems > that don't have an arch provided one or one [...]
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -3.3 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1pq0fU-0008Ek-24
Subject: Re: [Kgdb-bugreport] [PATCH] hardlockup: detect hard lockups using
 secondary (buddy) cpus
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Alexander Potapenko <glider@google.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>,
 Vlastimil Babka <vbabka@suse.cz>, Sami Tolvanen <samitolvanen@google.com>,
 kgdb-bugreport@lists.sourceforge.net, Miguel Ojeda <ojeda@kernel.org>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Marco Elver <elver@google.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>, Kees Cook <keescook@chromium.org>,
 John Ogness <john.ogness@linutronix.de>,
 Liam Howlett <liam.howlett@oracle.com>, Stephen Boyd <swboyd@chromium.org>,
 Nathan Chancellor <nathan@kernel.org>, linux-mediatek@lists.infradead.org,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Laurent Dufour <ldufour@linux.ibm.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Juergen Gross <jgross@suse.com>, Zhaoyang Huang <zhaoyang.huang@unisoc.com>,
 ito-yuichi@fujitsu.com, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Colin Cross <ccross@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi--

On 4/21/23 15:53, Douglas Anderson wrote:
> From: Colin Cross <ccross@android.com>
> 
> Implement a hardlockup detector that can be enabled on SMP systems
> that don't have an arch provided one or one implemented atop perf by

Is that                            one or more
?

> using interrupts on other cpus. Each cpu will use its softlockup
> hrtimer to check that the next cpu is processing hrtimer interrupts by
> verifying that a counter is increasing.
> 
> NOTE: unlike the other hard lockup detectors, the buddy one can't
> easily provide a backtrace on the CPU that locked up. It relies on
> some other mechanism in the system to get information about the locked
> up CPUs. This could be support for NMI backtraces like [1], it could
> be a mechanism for printing the PC of locked CPUs like [2], or it
> could be something else.
> 
> This style of hardlockup detector originated in some downstream
> Android trees and has been rebased on / carried in ChromeOS trees for
> quite a long time for use on arm and arm64 boards. Historically on
> these boards we've leveraged mechanism [2] to get information about
> hung CPUs, but we could move to [1].
> 
> NOTE: the buddy system is not really useful to enable on any
> architectures that have a better mechanism. On arm64 folks have been
> trying to get a better mechanism for years and there has even been
> recent posts of patches adding support [3]. However, nothing about the
> buddy system is tied to arm64 and several archs (even arm32, where it
> was originally developed) could find it useful.
> 
> [1] https://lore.kernel.org/r/20230419225604.21204-1-dianders@chromium.org
> [2] https://issuetracker.google.com/172213129
> [3] https://lore.kernel.org/linux-arm-kernel/20220903093415.15850-1-lecopzer.chen@mediatek.com/
> 
> Signed-off-by: Colin Cross <ccross@android.com>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> Signed-off-by: Guenter Roeck <groeck@chromium.org>
> Signed-off-by: Tzung-Bi Shih <tzungbi@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> This patch has been rebased in ChromeOS kernel trees many times, and
> each time someone had to do work on it they added their
> Signed-off-by. I've included those here. I've also left the author as
> Colin Cross since the core code is still his.
> 
> I'll also note that the CC list is pretty giant, but that's what
> get_maintainers came up with (plus a few other folks I thought would
> be interested). As far as I can tell, there's no true MAINTAINER
> listed for the existing watchdog code. Assuming people don't hate
> this, maybe it would go through Andrew Morton's tree?
> 
>  include/linux/nmi.h         |  18 ++++-
>  kernel/Makefile             |   1 +
>  kernel/watchdog.c           |  24 ++++--
>  kernel/watchdog_buddy_cpu.c | 141 ++++++++++++++++++++++++++++++++++++
>  lib/Kconfig.debug           |  19 ++++-
>  5 files changed, 192 insertions(+), 11 deletions(-)
>  create mode 100644 kernel/watchdog_buddy_cpu.c
> 

> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 39d1d93164bd..9eb86bc9f5ee 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -1036,6 +1036,9 @@ config HARDLOCKUP_DETECTOR_PERF
>  config HARDLOCKUP_CHECK_TIMESTAMP
>  	bool
>  
> +config HARDLOCKUP_DETECTOR_CORE
> +	bool
> +
>  #
>  # arch/ can define HAVE_HARDLOCKUP_DETECTOR_ARCH to provide their own hard
>  # lockup detector rather than the perf based detector.
> @@ -1045,6 +1048,7 @@ config HARDLOCKUP_DETECTOR
>  	depends on DEBUG_KERNEL && !S390
>  	depends on HAVE_HARDLOCKUP_DETECTOR_PERF || HAVE_HARDLOCKUP_DETECTOR_ARCH
>  	select LOCKUP_DETECTOR
> +	select HARDLOCKUP_DETECTOR_CORE
>  	select HARDLOCKUP_DETECTOR_PERF if HAVE_HARDLOCKUP_DETECTOR_PERF
>  	help
>  	  Say Y here to enable the kernel to act as a watchdog to detect
> @@ -1055,9 +1059,22 @@ config HARDLOCKUP_DETECTOR
>  	  chance to run.  The current stack trace is displayed upon detection
>  	  and the system will stay locked up.
>  
> +config HARDLOCKUP_DETECTOR_BUDDY_CPU
> +	bool "Buddy CPU hardlockup detector"
> +	depends on DEBUG_KERNEL && SMP
> +	depends on !HARDLOCKUP_DETECTOR && !HAVE_NMI_WATCHDOG
> +	depends on !S390
> +	select HARDLOCKUP_DETECTOR_CORE
> +	select SOFTLOCKUP_DETECTOR
> +	help
> +	  Say Y here to enable a hardlockup detector where CPUs check
> +	  each other for lockup. Each cpu uses its softlockup hrtimer

Preferably                            CPU

> +	  to check that the next cpu is processing hrtimer interrupts by

and                              CPU

> +	  verifying that a counter is increasing.
> +
>  config BOOTPARAM_HARDLOCKUP_PANIC
>  	bool "Panic (Reboot) On Hard Lockups"
> -	depends on HARDLOCKUP_DETECTOR
> +	depends on HARDLOCKUP_DETECTOR_CORE
>  	help
>  	  Say Y here to enable the kernel to panic on "hard lockups",
>  	  which are bugs that cause the kernel to loop in kernel

-- 
~Randy


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
