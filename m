Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 742DC6F4706
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  2 May 2023 17:24:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ptrrD-0001hl-KU
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 02 May 2023 15:23:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1ptrrC-0001he-JC
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 02 May 2023 15:23:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uxhui/Ir4eT5sPQEaZT+4zpzC7jhoc2yOtRKPtRVLuQ=; b=cCBm88Qu4u3rLbb67naKyXVdwr
 bmk/aP/WqYZ1l/i8dQBq0t9eDbQ0yFNM5UOHgL4SuaBkDFg9Xo89yHch2qjfqPNvA+QnXKyET0eQq
 C399ElnUD6dRf0G/cUzQab8UWNqUrbj/vjfZJNI+JA8V4mwhcUTsjt/sFN+mZ7Zbto6o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uxhui/Ir4eT5sPQEaZT+4zpzC7jhoc2yOtRKPtRVLuQ=; b=OtF9pxx/a7XTD80FRDJH12NIbD
 0RWzpGAwsSFY7E4/TWSwuudN9V+/SzQ+gEZI2S1/npuyt/DUVXHVx2veeVhJb/HPEs2J4SBMtLqub
 09RzOKbR8gABXbyJMGDs2KV/eRklGka+f/i4OhanZc+LoMXNx59NIoRw+0UziuJK2Jik=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ptrrB-0001RB-4i for kgdb-bugreport@lists.sourceforge.net;
 Tue, 02 May 2023 15:23:58 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 4879F221BC;
 Tue,  2 May 2023 15:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1683041028; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uxhui/Ir4eT5sPQEaZT+4zpzC7jhoc2yOtRKPtRVLuQ=;
 b=aq3JR34r8i83T70pqTkemzrSH10xQCplmij5pIQyD0YK8z+itGyO9k/Zvwi7Qf+IAKSBhy
 eo5tEqIAixUbBkkCE5eSv5dIFEOV+IPzcaBToFTE8efSam2JM1pCB6A8Hp2m1P1M7YFOvF
 iPQTkRjELszxauRKGj1883nDqmBx4G8=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 1DBAC2C141;
 Tue,  2 May 2023 15:23:46 +0000 (UTC)
Date: Tue, 2 May 2023 17:23:45 +0200
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <ZFEqynvf5nqkzEvQ@alley>
References: <20230501082341.v3.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230501082341.v3.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon 2023-05-01 08:24:46, Douglas Anderson wrote: > From:
 Colin Cross <ccross@android.com> > > Implement a hardlockup detector that
 doesn't doesn't need any extra > arch-specific support code to det [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1ptrrB-0001RB-4i
Subject: [Kgdb-bugreport] cpu hotplug : was: Re: [PATCH v3] hardlockup:
 detect hard lockups using secondary (buddy) CPUs
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Catalin Marinas <catalin.marinas@arm.com>, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, Alexander Potapenko <glider@google.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Guenter Roeck <groeck@chromium.org>,
 Will Deacon <will@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Andi Kleen <ak@linux.intel.com>, Marc Zyngier <maz@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Matthias Kaehlcke <mka@chromium.org>, Vlastimil Babka <vbabka@suse.cz>,
 Sami Tolvanen <samitolvanen@google.com>, kgdb-bugreport@lists.sourceforge.net,
 Miguel Ojeda <ojeda@kernel.org>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 ravi.v.shankar@intel.com, Tzung-Bi Shih <tzungbi@chromium.org>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Liam Howlett <liam.howlett@oracle.com>, Stephen Boyd <swboyd@chromium.org>,
 Nathan Chancellor <nathan@kernel.org>, linux-mediatek@lists.infradead.org,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Laurent Dufour <ldufour@linux.ibm.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Juergen Gross <jgross@suse.com>, Zhaoyang Huang <zhaoyang.huang@unisoc.com>,
 ito-yuichi@fujitsu.com, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Colin Cross <ccross@android.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon 2023-05-01 08:24:46, Douglas Anderson wrote:
> From: Colin Cross <ccross@android.com>
> 
> Implement a hardlockup detector that doesn't doesn't need any extra
> arch-specific support code to detect lockups. Instead of using
> something arch-specific we will use the buddy system, where each CPU
> watches out for another one. Specifically, each CPU will use its
> softlockup hrtimer to check that the next CPU is processing hrtimer
> interrupts by verifying that a counter is increasing.
> 
> --- /dev/null
> +++ b/kernel/watchdog_buddy_cpu.c
> +int watchdog_nmi_enable(unsigned int cpu)
> +{
> +	/*
> +	 * The new CPU will be marked online before the first hrtimer interrupt
> +	 * runs on it.

It does not need to be the first hrtimer interrupt. The CPU might have
been offlined/onlined repeatedly. The counter might have any value.

> +      * If another CPU tests for a hardlockup on the new CPU
> +	 * before it has run its first hrtimer, it will get a false positive.
> +	 * Touch the watchdog on the new CPU to delay the first check for at
> +	 * least 3 sampling periods to guarantee one hrtimer has run on the new
> +	 * CPU.
> +	 */
> +	per_cpu(watchdog_touch, cpu) = true;

We should touch also the next_cpu:

	/*
	 * We are going to check the next CPU. Our watchdog_hrtimer
	 * need not be zero if the CPU has already been online earlier.
	 * Touch the watchdog on the next CPU to avoid false positive
	 * if we try to check it in less then 3 interrupts.
	 */
	next_cpu = watchdog_next_cpu(cpu);
	if (next_cpu < nr_cpu_ids)
		per_cpu(watchdog_touch, next_cpu) = true;

Alternative would be to clear watchdog_hrtimer. But it would kind-of
affect also the softlockup detector.


> +	/* Match with smp_rmb() in watchdog_check_hardlockup() */
> +	smp_wmb();
> +	cpumask_set_cpu(cpu, &watchdog_cpus);
> +	return 0;
> +}
> +
> +void watchdog_nmi_disable(unsigned int cpu)
> +{
> +	unsigned int next_cpu = watchdog_next_cpu(cpu);
> +
> +	/*
> +	 * Offlining this CPU will cause the CPU before this one to start
> +	 * checking the one after this one. If this CPU just finished checking
> +	 * the next CPU and updating hrtimer_interrupts_saved, and then the
> +	 * previous CPU checks it within one sample period, it will trigger a
> +	 * false positive. Touch the watchdog on the next CPU to prevent it.
> +	 */
> +	if (next_cpu < nr_cpu_ids)
> +		per_cpu(watchdog_touch, next_cpu) = true;
> +	/* Match with smp_rmb() in watchdog_check_hardlockup() */
> +	smp_wmb();
> +	cpumask_clear_cpu(cpu, &watchdog_cpus);
> +}
> +

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
