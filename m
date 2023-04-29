Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3DC6F21AE
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 29 Apr 2023 02:36:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1psYZg-0006o0-Ls
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 29 Apr 2023 00:36:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rdunlap@infradead.org>) id 1psYZd-0006nu-D5
 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 29 Apr 2023 00:36:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/Amx0qPanX05nBJv5epCbcwnXgDtZvJnLUx29Ybm7qI=; b=DlqSSuEJCcMW564oSjnZGNOszR
 N7yiLOnBYGM2FikLq8r/vCQH8q/B6D4MhbqFKj/3MaPoWCXLF/ljQcG5t217PQqwNmIeh/bd1Au9C
 rcLkuqcdLam+D0/DyhpIsOVz5FUW124e3YboLahfudQLzxj0TGIqOTvIRNawftSiRQ7U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/Amx0qPanX05nBJv5epCbcwnXgDtZvJnLUx29Ybm7qI=; b=C3qph8qDkt4dh6zDzybSVW+MIS
 i9zlgRgXDCzucMgRf2px8dPfqe6EJVyrC9JLLNtWmD+uEfB/rukJuuLHdYxAeULAHaq/rGlG8HfDD
 yW7LDRefL/DKGbz8ybM71atm5qvtjXj4/rjuG5DFt8Jujx1I5QcW/aKdZR0ioFvCC2b8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1psYZY-0001g5-7g for kgdb-bugreport@lists.sourceforge.net;
 Sat, 29 Apr 2023 00:36:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=/Amx0qPanX05nBJv5epCbcwnXgDtZvJnLUx29Ybm7qI=; b=lyXhAFVQVRguE02Q1e9i6NPyIP
 BM365gOgviI255XwEzHfBqgUVTueSrkYwxzRRJi7sx898rViQz+LgdkBLmVlvlxC9/8J1u3psIvbK
 SVSOkZI67EXjhVbf+nDteXrfDKbqtC90Op2niz72kPhXgMAsfE9I1eUbrD19e4VS1e2BjHmQxFCL/
 sgBydIAMKLWl5tZMez3xbuRgRIKskGQj4g5WPmWBjPm3rSntYpsTLuWoTtp2aXqP0mZ+5XlfBK1hD
 7FvYQh0KDZzidM+nSNQnzhoO+UqXOGXhYtCbIBfWSsHNX6yFBd6Qo04cP+HxRuk0RQX2DgBMuRdZu
 gZhEFJBg==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1psYYz-00C0DK-0B; Sat, 29 Apr 2023 00:35:45 +0000
Message-ID: <217e697c-ad13-96ca-3829-a046469fd86a@infradead.org>
Date: Fri, 28 Apr 2023 17:35:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Douglas Anderson <dianders@chromium.org>, Petr Mladek <pmladek@suse.com>, 
 Andrew Morton <akpm@linux-foundation.org>
References: <20230428163507.v2.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230428163507.v2.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
X-Spam-Score: -3.9 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi-- On 4/28/23 16:37, Douglas Anderson wrote: > From: Colin
 Cross <ccross@android.com> > > Implement a hardlockup detector that doesn't
 doesn't need any extra > arch-specific support code to detect lockup [...]
 Content analysis details:   (-3.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.4 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1psYZY-0001g5-7g
Subject: Re: [Kgdb-bugreport] [PATCH v2] hardlockup: detect hard lockups
 using secondary (buddy) CPUs
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, Alexander Potapenko <glider@google.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Guenter Roeck <groeck@chromium.org>,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 Marc Zyngier <maz@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>,
 Vlastimil Babka <vbabka@suse.cz>, Sami Tolvanen <samitolvanen@google.com>,
 kgdb-bugreport@lists.sourceforge.net, Miguel Ojeda <ojeda@kernel.org>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com,
 Tzung-Bi Shih <tzungbi@chromium.org>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Liam Howlett <liam.howlett@oracle.com>, Stephen Boyd <swboyd@chromium.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 linux-mediatek@lists.infradead.org, David Gow <davidgow@google.com>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Laurent Dufour <ldufour@linux.ibm.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Juergen Gross <jgross@suse.com>, Zhaoyang Huang <zhaoyang.huang@unisoc.com>,
 ito-yuichi@fujitsu.com, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Colin Cross <ccross@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi--

On 4/28/23 16:37, Douglas Anderson wrote:
> From: Colin Cross <ccross@android.com>
> 
> Implement a hardlockup detector that doesn't doesn't need any extra
> arch-specific support code to detect lockups. Instead of using
> something arch-specific we will use the buddy system, where each CPU
> watches out for another one. Specifically, each CPU will use its
> softlockup hrtimer to check that the next CPU is processing hrtimer
> interrupts by verifying that a counter is increasing.
> 
> NOTE: unlike the other hard lockup detectors, the buddy one can't
> easily show what's happening on the CPU that locked up just by doing a
> simple backtrace. It relies on some other mechanism in the system to
> get information about the locked up CPUs. This could be support for
> NMI backtraces like [1], it could be a mechanism for printing the PC
> of locked CPUs at panic time like [2] / [3], or it could be something
> else. Even though that means we still rely on arch-specific code, this
> arch-specific code seems to often be implemented even on architectures
> that don't have a hardlockup detector.
> 
> This style of hardlockup detector originated in some downstream
> Android trees and has been rebased on / carried in ChromeOS trees for
> quite a long time for use on arm and arm64 boards. Historically on
> these boards we've leveraged mechanism [2] / [3] to get information
> about hung CPUs, but we could move to [1].
> 
> Although the original motivation for the buddy system was for use on
> systems without an arch-specific hardlockup detector, it can still be
> useful to use even on systems that _do_ have an arch-specific
> hardlockup detector. On x86, for instance, there is a 24-part patch
> series [4] in progress switching the arch-specific hard lockup
> detector from a scarce perf counter to a less-scarce hardware
> resource. Potentially the buddy system could be a simpler alternative
> to free up the perf counter but still get hard lockup detection.
> 
> Overall, pros (+) and cons (-) of the buddy system compared to an
> arch-specific hardlockup detector:
> + Usable on systems that don't have an arch-specific hardlockup
>   detector, like arm32 and arm64 (though it's being worked on for
>   arm64 [5]).
> + May free up scarce hardware resources.
> + If a CPU totally goes out to lunch (can't process NMIs) the buddy
>   system could still detect the problem (though it would be unlikely
>   to be able to get a stack trace).
> - If all CPUs are hard locked up at the same time the buddy system
>   can't detect it.
> - If we don't have SMP we can't use the buddy system.
> - The buddy system needs an arch-specific mechanism (possibly NMI
>   backtrace) to get info about the locked up CPU.
> 
> [1] https://lore.kernel.org/r/20230419225604.21204-1-dianders@chromium.org
> [2] https://issuetracker.google.com/172213129
> [3] https://docs.kernel.org/trace/coresight/coresight-cpu-debug.html
> [4] https://lore.kernel.org/lkml/20230301234753.28582-1-ricardo.neri-calderon@linux.intel.com/
> [5] https://lore.kernel.org/linux-arm-kernel/20220903093415.15850-1-lecopzer.chen@mediatek.com/
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
> Changes in v2:
> - cpu => CPU.
> - Reworked description and Kconfig based on v1 discussion.

or at least some of the comments from v1. :(

> - No code changes
> 
>  include/linux/nmi.h         |  18 ++++-
>  kernel/Makefile             |   1 +
>  kernel/watchdog.c           |  24 ++++--
>  kernel/watchdog_buddy_cpu.c | 141 ++++++++++++++++++++++++++++++++++++
>  lib/Kconfig.debug           |  23 +++++-
>  5 files changed, 196 insertions(+), 11 deletions(-)
>  create mode 100644 kernel/watchdog_buddy_cpu.c
> 

> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 39d1d93164bd..511eb14660b1 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug

> @@ -1055,9 +1059,26 @@ config HARDLOCKUP_DETECTOR
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

Be consistent in the use of "CPU". Change 2 occurrences of "cpu"
below to "CPU".

> +	  each other for lockup. Each cpu uses its softlockup hrtimer
> +	  to check that the next cpu is processing hrtimer interrupts by
> +	  verifying that a counter is increasing.
> +
> +	  This hardlockup detector is useful on systems that don't have
> +	  an arch-specific hardlockup detector or if resources needed
> +	  for the hardlockup detector are better used for other things.


-- 
~Randy


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
