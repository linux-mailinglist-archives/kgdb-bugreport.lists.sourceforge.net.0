Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9876FC7AC
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  9 May 2023 15:15:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pwNBp-0007aS-PG
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 09 May 2023 13:15:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <npiggin@gmail.com>) id 1pulef-0005Ce-CZ
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 05 May 2023 02:58:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:References:To:From:Subject:Cc:
 Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hsLRnxoIm7PGg3IcqPGZjQFk9R9fMjzy9q8PINnfXFY=; b=GVxat7tObhi32mrxb1RaXuBy3w
 3gV+OU1X35c7zV/xJ30vsz8iRGjvxIy5JwXastHcGiNbSUV1ENJ8cRz/9fdyuDqdx90EgceceUDBs
 nQrekpzg3GwG4TNylvqovv4KfJkE9Red9Wh327BbUoJgDzRmPTpZ55Z+g7e94657LFbI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Content-Type:
 Content-Transfer-Encoding:Mime-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hsLRnxoIm7PGg3IcqPGZjQFk9R9fMjzy9q8PINnfXFY=; b=DpjMZsrzP7oBKp7g6V6AR8PZ33
 A7ZfcKmlzuCT0wFcTiKJX3UrOWg63WBrHg2AAc3JBW94NwVAZyoCtwi+RDvIEOPpibZ7rz3Y15g/o
 w28+s+m+nQcndgD66/o45TL8Kehhj3Xdv5reWUHIU/5hrj7rDDxu9sS0dwfMZ5qHf8zU=;
Received: from mail-pg1-f170.google.com ([209.85.215.170])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1puleb-00ErhV-V2 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 05 May 2023 02:58:45 +0000
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-52c6504974dso1035124a12.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 May 2023 19:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683255516; x=1685847516;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hsLRnxoIm7PGg3IcqPGZjQFk9R9fMjzy9q8PINnfXFY=;
 b=D+ZkMGlj3dllnlZNoGLBYfX51aE2AfVLTyNhcKpmqUnLvAJFbaLkAALNmG14suaBOo
 QLbP8YZx8CzaGJVHeeZYzXP1BUK7fXrqyYhzHI8O+oK0CaWG441FhtZD1bdsRFPOc5Sf
 NgnT0a8J+MgslAr3DsB1DKhXhB1H42WRehFISyLPfFPT3LXYWeBKy42mSw5pwV+9FNL/
 extrR8E80Qcb9IeBl/BODwQYKnE3wX3Szyxj7XQ4EmKi2xIyBOKnc4bt+Doc2+dGBw9t
 yZ5tWt6I5j6ryZT/qURUBLIOanp7ngcWRZBa0Ps8YgveRDQa0iTZt13M4pShPjWftOLQ
 rFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683255516; x=1685847516;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hsLRnxoIm7PGg3IcqPGZjQFk9R9fMjzy9q8PINnfXFY=;
 b=ae/g0SDJvEccHMjj+x4LJNaCkMvkNtlkYitRYyClIxSdTyHfsubM4spHS7zTDLVFsR
 pzLm/xPzXixTgUAo/407/z2FiCe7WxwI3n9Dcxs5AUJN2uN2yE0lpnm27QvUyYrMZCtb
 Y93KpnLxFwjUlLNrnyd/YKC7ok8Xp4BU1JpUQBPIRuLP5MAnru6YYnaotHo6FV/ygx8Z
 yHTZufz90ziLd+cZC36/09WguMZVT2fv3N626UtlwGo6NZ9+l6RhCRR5jOTs4f/GQXfi
 Y5S5g2Q7yskuc7U/j8ZkpDz5grw1HorK4awsszR4ty/Y2emkXk98zVwyChJN08EpO5yl
 B26g==
X-Gm-Message-State: AC+VfDxHefr4SL/pYeKxiDoZiyxj3AZ7xt8bcWWRqm5wce7W0rextGDe
 ziqNf95+5j2E1Lyjth6Ws5Y=
X-Google-Smtp-Source: ACHHUZ68OZVP9DBpb3AsMVB/P11AAYngipplEgHSxlKuL+c359iDCmXs6WWhSER/b+lQxQyskV8vRw==
X-Received: by 2002:a05:6a21:9814:b0:f2:ea8e:b130 with SMTP id
 ue20-20020a056a21981400b000f2ea8eb130mr3553254pzb.62.1683255516209; 
 Thu, 04 May 2023 19:58:36 -0700 (PDT)
Received: from localhost ([203.59.190.92]) by smtp.gmail.com with ESMTPSA id
 p17-20020aa78611000000b006242f4a8945sm422040pfn.182.2023.05.04.19.58.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 19:58:35 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 05 May 2023 12:58:22 +1000
Message-Id: <CSE09YL4X0XY.1GAQWAFOOEK42@wheely>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Douglas Anderson" <dianders@chromium.org>, "Petr Mladek"
 <pmladek@suse.com>, "Andrew Morton" <akpm@linux-foundation.org>
X-Mailer: aerc 0.14.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.7.Id4133d3183e798122dc3b6205e7852601f289071@changeid>
In-Reply-To: <20230504151100.v4.7.Id4133d3183e798122dc3b6205e7852601f289071@changeid>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrote:
 > The perf hardlockup detector works by looking at interrupt counts and >
 seeing if they change from run to run. The interrupt counts are > [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.170 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.170 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [npiggin[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1puleb-00ErhV-V2
X-Mailman-Approved-At: Tue, 09 May 2023 13:15:34 +0000
Subject: Re: [Kgdb-bugreport] [PATCH v4 07/17] watchdog/hardlockup: Move
 perf hardlockup checking/panic to common watchdog.c
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
 Randy Dunlap <rdunlap@infradead.org>, Lecopzer
 Chen <lecopzer.chen@mediatek.com>, kgdb-bugreport@lists.sourceforge.net,
 ricardo.neri@intel.com, Stephane
 Eranian <eranian@google.com>, Guenter Roeck <groeck@chromium.org>,
 sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 mpe@ellerman.id.au, christophe.leroy@csgroup.eu, Chen-Yu
 Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 ravi.v.shankar@intel.com, Tzung-Bi Shih <tzungbi@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>,
 linux-arm-kernel@lists.infradead.org, ito-yuichi@fujitsu.com,
 linux-perf-users@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrote:
> The perf hardlockup detector works by looking at interrupt counts and
> seeing if they change from run to run. The interrupt counts are
> managed by the common watchdog code via its watchdog_timer_fn().
>
> Currently the API between the perf detector and the common code is a
> function: is_hardlockup(). When the hard lockup detector sees that
> function return true then it handles printing out debug info and
> inducing a panic if necessary.
>
> Let's change the API a little bit in preparation for the buddy
> hardlockup detector. The buddy hardlockup detector wants to print

I think the name change is a gratuitous. Especially since it's now
static.

watchdog_hardlockup_ is a pretty long prefix too, hardlockup_ 
should be enough?

Seems okay otherwise though.

Thanks,
Nick

> nearly the same debug info and have nearly the same panic
> behavior. That means we want to move all that code to the common
> file. For now, the code in the common file will only be there if the
> perf hardlockup detector is enabled, but eventually it will be
> selected by a common config.
>
> Right now, this _just_ moves the code from the perf detector file to
> the common file and changes the names. It doesn't make the changes
> that the buddy hardlockup detector will need and doesn't do any style
> cleanups. A future patch will do cleanup to make it more obvious what
> changed.
>
> With the above, we no longer have any callers of is_hardlockup()
> outside of the "watchdog.c" file, so we can remove it from the header,
> make it static, move it to the same "#ifdef" block as our new
> watchdog_hardlockup_check(), and rename it to make it obvious it's
> just for hardlockup detectors. While doing this, it can be noted that
> even if no hardlockup detectors were configured the existing code used
> to still have the code for counting/checking "hrtimer_interrupts" even
> if the perf hardlockup detector wasn't configured. We didn't need to
> do that, so move all the "hrtimer_interrupts" counting to only be
> there if the perf hardlockup detector is configured as well.
>
> This change is expected to be a no-op.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v4:
> - ("Move perf hardlockup checking/panic ...") new for v4.
>
>  include/linux/nmi.h    |  5 ++-
>  kernel/watchdog.c      | 92 +++++++++++++++++++++++++++++++++---------
>  kernel/watchdog_perf.c | 42 +------------------
>  3 files changed, 78 insertions(+), 61 deletions(-)
>
> diff --git a/include/linux/nmi.h b/include/linux/nmi.h
> index 35d09d70f394..c6cb9bc5dc80 100644
> --- a/include/linux/nmi.h
> +++ b/include/linux/nmi.h
> @@ -15,7 +15,6 @@
>  void lockup_detector_init(void);
>  void lockup_detector_soft_poweroff(void);
>  void lockup_detector_cleanup(void);
> -bool is_hardlockup(void);
>  
>  extern int watchdog_user_enabled;
>  extern int nmi_watchdog_user_enabled;
> @@ -88,6 +87,10 @@ extern unsigned int hardlockup_panic;
>  static inline void hardlockup_detector_disable(void) {}
>  #endif
>  
> +#if defined(CONFIG_HARDLOCKUP_DETECTOR_PERF)
> +void watchdog_hardlockup_check(struct pt_regs *regs);
> +#endif
> +
>  #if defined(CONFIG_HAVE_NMI_WATCHDOG) || defined(CONFIG_HARDLOCKUP_DETECTOR)
>  # define NMI_WATCHDOG_SYSCTL_PERM	0644
>  #else
> diff --git a/kernel/watchdog.c b/kernel/watchdog.c
> index c705a18b26bf..2d319cdf64b9 100644
> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c
> @@ -85,6 +85,78 @@ __setup("nmi_watchdog=", hardlockup_panic_setup);
>  
>  #endif /* CONFIG_HARDLOCKUP_DETECTOR */
>  
> +#if defined(CONFIG_HARDLOCKUP_DETECTOR_PERF)
> +
> +static DEFINE_PER_CPU(unsigned long, hrtimer_interrupts);
> +static DEFINE_PER_CPU(unsigned long, hrtimer_interrupts_saved);
> +static DEFINE_PER_CPU(bool, hard_watchdog_warn);
> +static unsigned long hardlockup_allcpu_dumped;
> +
> +static bool watchdog_hardlockup_is_lockedup(void)
> +{
> +	unsigned long hrint = __this_cpu_read(hrtimer_interrupts);
> +
> +	if (__this_cpu_read(hrtimer_interrupts_saved) == hrint)
> +		return true;
> +
> +	__this_cpu_write(hrtimer_interrupts_saved, hrint);
> +	return false;
> +}
> +
> +static void watchdog_hardlockup_interrupt_count(void)
> +{
> +	__this_cpu_inc(hrtimer_interrupts);
> +}
> +
> +void watchdog_hardlockup_check(struct pt_regs *regs)
> +{
> +	/* check for a hardlockup
> +	 * This is done by making sure our timer interrupt
> +	 * is incrementing.  The timer interrupt should have
> +	 * fired multiple times before we overflow'd.  If it hasn't
> +	 * then this is a good indication the cpu is stuck
> +	 */
> +	if (watchdog_hardlockup_is_lockedup()) {
> +		int this_cpu = smp_processor_id();
> +
> +		/* only print hardlockups once */
> +		if (__this_cpu_read(hard_watchdog_warn) == true)
> +			return;
> +
> +		pr_emerg("Watchdog detected hard LOCKUP on cpu %d\n",
> +			 this_cpu);
> +		print_modules();
> +		print_irqtrace_events(current);
> +		if (regs)
> +			show_regs(regs);
> +		else
> +			dump_stack();
> +
> +		/*
> +		 * Perform all-CPU dump only once to avoid multiple hardlockups
> +		 * generating interleaving traces
> +		 */
> +		if (sysctl_hardlockup_all_cpu_backtrace &&
> +				!test_and_set_bit(0, &hardlockup_allcpu_dumped))
> +			trigger_allbutself_cpu_backtrace();
> +
> +		if (hardlockup_panic)
> +			nmi_panic(regs, "Hard LOCKUP");
> +
> +		__this_cpu_write(hard_watchdog_warn, true);
> +		return;
> +	}
> +
> +	__this_cpu_write(hard_watchdog_warn, false);
> +	return;
> +}
> +
> +#else /* CONFIG_HARDLOCKUP_DETECTOR_PERF */
> +
> +static inline void watchdog_hardlockup_interrupt_count(void) { }
> +
> +#endif /* !CONFIG_HARDLOCKUP_DETECTOR_PERF */
> +
>  /*
>   * These functions can be overridden if an architecture implements its
>   * own hardlockup detector.
> @@ -176,8 +248,6 @@ static DEFINE_PER_CPU(unsigned long, watchdog_touch_ts);
>  static DEFINE_PER_CPU(unsigned long, watchdog_report_ts);
>  static DEFINE_PER_CPU(struct hrtimer, watchdog_hrtimer);
>  static DEFINE_PER_CPU(bool, softlockup_touch_sync);
> -static DEFINE_PER_CPU(unsigned long, hrtimer_interrupts);
> -static DEFINE_PER_CPU(unsigned long, hrtimer_interrupts_saved);
>  static unsigned long soft_lockup_nmi_warn;
>  
>  static int __init nowatchdog_setup(char *str)
> @@ -312,22 +382,6 @@ static int is_softlockup(unsigned long touch_ts,
>  }
>  
>  /* watchdog detector functions */
> -bool is_hardlockup(void)
> -{
> -	unsigned long hrint = __this_cpu_read(hrtimer_interrupts);
> -
> -	if (__this_cpu_read(hrtimer_interrupts_saved) == hrint)
> -		return true;
> -
> -	__this_cpu_write(hrtimer_interrupts_saved, hrint);
> -	return false;
> -}
> -
> -static void watchdog_interrupt_count(void)
> -{
> -	__this_cpu_inc(hrtimer_interrupts);
> -}
> -
>  static DEFINE_PER_CPU(struct completion, softlockup_completion);
>  static DEFINE_PER_CPU(struct cpu_stop_work, softlockup_stop_work);
>  
> @@ -359,7 +413,7 @@ static enum hrtimer_restart watchdog_timer_fn(struct hrtimer *hrtimer)
>  		return HRTIMER_NORESTART;
>  
>  	/* kick the hardlockup detector */
> -	watchdog_interrupt_count();
> +	watchdog_hardlockup_interrupt_count();
>  
>  	/* kick the softlockup detector */
>  	if (completion_done(this_cpu_ptr(&softlockup_completion))) {
> diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
> index c3d8ceb149da..5f3651b87ee7 100644
> --- a/kernel/watchdog_perf.c
> +++ b/kernel/watchdog_perf.c
> @@ -20,13 +20,11 @@
>  #include <asm/irq_regs.h>
>  #include <linux/perf_event.h>
>  
> -static DEFINE_PER_CPU(bool, hard_watchdog_warn);
>  static DEFINE_PER_CPU(bool, watchdog_nmi_touch);
>  static DEFINE_PER_CPU(struct perf_event *, watchdog_ev);
>  static DEFINE_PER_CPU(struct perf_event *, dead_event);
>  static struct cpumask dead_events_mask;
>  
> -static unsigned long hardlockup_allcpu_dumped;
>  static atomic_t watchdog_cpus = ATOMIC_INIT(0);
>  
>  notrace void arch_touch_nmi_watchdog(void)
> @@ -122,45 +120,7 @@ static void watchdog_overflow_callback(struct perf_event *event,
>  	if (!watchdog_check_timestamp())
>  		return;
>  
> -	/* check for a hardlockup
> -	 * This is done by making sure our timer interrupt
> -	 * is incrementing.  The timer interrupt should have
> -	 * fired multiple times before we overflow'd.  If it hasn't
> -	 * then this is a good indication the cpu is stuck
> -	 */
> -	if (is_hardlockup()) {
> -		int this_cpu = smp_processor_id();
> -
> -		/* only print hardlockups once */
> -		if (__this_cpu_read(hard_watchdog_warn) == true)
> -			return;
> -
> -		pr_emerg("Watchdog detected hard LOCKUP on cpu %d\n",
> -			 this_cpu);
> -		print_modules();
> -		print_irqtrace_events(current);
> -		if (regs)
> -			show_regs(regs);
> -		else
> -			dump_stack();
> -
> -		/*
> -		 * Perform all-CPU dump only once to avoid multiple hardlockups
> -		 * generating interleaving traces
> -		 */
> -		if (sysctl_hardlockup_all_cpu_backtrace &&
> -				!test_and_set_bit(0, &hardlockup_allcpu_dumped))
> -			trigger_allbutself_cpu_backtrace();
> -
> -		if (hardlockup_panic)
> -			nmi_panic(regs, "Hard LOCKUP");
> -
> -		__this_cpu_write(hard_watchdog_warn, true);
> -		return;
> -	}
> -
> -	__this_cpu_write(hard_watchdog_warn, false);
> -	return;
> +	watchdog_hardlockup_check(regs);
>  }
>  
>  static int hardlockup_detector_event_create(void)
> -- 
> 2.40.1.521.gf1e218fcd8-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
