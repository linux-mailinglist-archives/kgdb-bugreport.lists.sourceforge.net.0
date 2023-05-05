Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC906FC7AD
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  9 May 2023 15:15:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pwNBq-0007ai-4d
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 09 May 2023 13:15:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <npiggin@gmail.com>) id 1pulhs-0001m3-MR
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 05 May 2023 03:02:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:References:To:From:Subject:Cc:
 Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4PZDk7grPMVm0G4plF1AOyfal6UfKUjeqMY34ZW+ZAQ=; b=F41dugLBom3JP1RJ0EeeZejHb0
 gOfOA+c7gXyp2zOKMg/zgH/udI6yCLhTebU+uFWETNZkAx+QgKvSPESy1xSjaEBwGBYEQAc7sGVbx
 SYa+hNP/xhVUoaRSYr9LxALdYYAwWpPbKPkkdvgbfyu18ExGBIbPn6HNFfLNf8FrranY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Content-Type:
 Content-Transfer-Encoding:Mime-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4PZDk7grPMVm0G4plF1AOyfal6UfKUjeqMY34ZW+ZAQ=; b=WkErksnpMy2OOh8TMoHTCDbTGv
 6OLrT8vcqJEo7nXV1Ga/LhZGE0JnIKxRFUa9EAr7K2eGzUjW/iwQos4Ey7J2r0pMZNTH5Sp5GzOm3
 JudlUxsiSW6lywouPoiXmVjUXwHkJvcKgAquS9FAe+adp3jerFSwSGQLNQ8LhOi/B0iM=;
Received: from mail-pg1-f178.google.com ([209.85.215.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pulhq-0002pL-QF for kgdb-bugreport@lists.sourceforge.net;
 Fri, 05 May 2023 03:02:04 +0000
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-5191796a483so868216a12.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 May 2023 20:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683255717; x=1685847717;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4PZDk7grPMVm0G4plF1AOyfal6UfKUjeqMY34ZW+ZAQ=;
 b=l8NOWx+JbMx094FOTHTTAYeieKLG6l+RoxKooetFCoRg01JgRpRgmVK4EEnqQGp5Rv
 Wo7jd5ZE+BhoTQ83yfVxkRWDV8+8fYgzKrUQG+mG2SKoUwQzV4PiqCThKZNktLEkx80D
 dbZRbHCpWflzRiQ+5dUIKlwArRroFaTk4Ds/n3538KW17NDJa0a+h/l5niHUznruDebe
 bM/9WMTgDrGpzcJNg2dEdXkiWqJTXpKVuu+xjnqek1SKKSYnqTk3zeH62sRwe7eJhyjM
 UEdL7abKjXNavxqB2b/VypuWuDH+efkVGB6cwaNtCumipgGM0sxe7eY6ZqTznd4UjVkh
 DJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683255717; x=1685847717;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4PZDk7grPMVm0G4plF1AOyfal6UfKUjeqMY34ZW+ZAQ=;
 b=kqzv7fWZSB6RBkzi4xWPY93bTD8ZPyxv6QkeA+SqxwD2Depizx9oMGEI9TwC1J3hgG
 xWoqDOBShvfFATKCZ8ybduDBVYogfDbKpZzREyIpUYL9skTyH5DIGt8r6BC96up27Aok
 pGZEylxNDQ4WHKhqHkne0I9uAWCwdAukaLxuYetwfprFZLpBalgLPlZs0MUA9vy5+WLD
 cTFgUEPUgmn3HxISesm4fCqHMBqabR05QDZc0uTbvDYhUSI4xDLiAXjAJSRbUzvYxiaG
 CNf4sXzJJ8J7oRa+hnnA+K7hqjweWaPRNgG9vhRaMrt7ujhqKeBpVeCUeEnBvbf/FiOM
 0rKA==
X-Gm-Message-State: AC+VfDxQUGZQWl4w+Ifx89szOKFUAjyAnb9xrHHakJZs8Fc4bXVNfq1L
 h4uK4wtstCa4Odo9ta8Tx3A=
X-Google-Smtp-Source: ACHHUZ5Ox+yCPXhRH+Zo/Bf0YWlPnoiHwxarQldt5h1nNQM5kPEVVWcuprv1MbKY8J2RKwbHQwgMKQ==
X-Received: by 2002:a17:903:187:b0:1a2:8c7e:f301 with SMTP id
 z7-20020a170903018700b001a28c7ef301mr6214939plg.45.1683255717124; 
 Thu, 04 May 2023 20:01:57 -0700 (PDT)
Received: from localhost ([203.59.190.92]) by smtp.gmail.com with ESMTPSA id
 jj22-20020a170903049600b0019fea4d61c9sm354034plb.198.2023.05.04.20.01.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 20:01:56 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 05 May 2023 13:01:41 +1000
Message-Id: <CSE0CI3TFK72.2I4E5TJIRHDGM@wheely>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Douglas Anderson" <dianders@chromium.org>, "Petr Mladek"
 <pmladek@suse.com>, "Andrew Morton" <akpm@linux-foundation.org>
X-Mailer: aerc 0.14.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.8.I818492c326b632560b09f20d2608455ecf9d3650@changeid>
In-Reply-To: <20230504151100.v4.8.I818492c326b632560b09f20d2608455ecf9d3650@changeid>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrote:
 > These are tiny style changes: > - Add a blank line before a "return". >
 - Renames two globals to use the "watchdog_hld" prefix. Particularly static
 ones don't really need the namespace prefixes. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [npiggin[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.178 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.178 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pulhq-0002pL-QF
X-Mailman-Approved-At: Tue, 09 May 2023 13:15:34 +0000
Subject: Re: [Kgdb-bugreport] [PATCH v4 08/17] watchdog/hardlockup: Style
 changes to watchdog_hardlockup_check() / ..._is_lockedup()
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
> These are tiny style changes:
> - Add a blank line before a "return".
> - Renames two globals to use the "watchdog_hld" prefix.

Particularly static ones don't really need the namespace prefixes.

Not sure if processed is better than warn. allcpu_dumped is better
than dumped_stacks though because the all-CPUs-dump is a particular
thing.

Other style bits seem fine.

Thanks,
Nick

> - Store processor id in "unsigned int" rather than "int".
> - Minor comment rewording.
> - Use "else" rather than extra returns since it seemed more symmetric.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v4:
> - ("Style changes to watchdog_hardlockup_check ...") new for v4.
>
>  kernel/watchdog.c | 32 +++++++++++++++-----------------
>  1 file changed, 15 insertions(+), 17 deletions(-)
>
> diff --git a/kernel/watchdog.c b/kernel/watchdog.c
> index 2d319cdf64b9..f46669c1671d 100644
> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c
> @@ -89,8 +89,8 @@ __setup("nmi_watchdog=", hardlockup_panic_setup);
>  
>  static DEFINE_PER_CPU(unsigned long, hrtimer_interrupts);
>  static DEFINE_PER_CPU(unsigned long, hrtimer_interrupts_saved);
> -static DEFINE_PER_CPU(bool, hard_watchdog_warn);
> -static unsigned long hardlockup_allcpu_dumped;
> +static DEFINE_PER_CPU(bool, watchdog_hardlockup_processed);
> +static unsigned long watchdog_hardlockup_dumped_stacks;
>  
>  static bool watchdog_hardlockup_is_lockedup(void)
>  {
> @@ -100,6 +100,7 @@ static bool watchdog_hardlockup_is_lockedup(void)
>  		return true;
>  
>  	__this_cpu_write(hrtimer_interrupts_saved, hrint);
> +
>  	return false;
>  }
>  
> @@ -110,21 +111,20 @@ static void watchdog_hardlockup_interrupt_count(void)
>  
>  void watchdog_hardlockup_check(struct pt_regs *regs)
>  {
> -	/* check for a hardlockup
> -	 * This is done by making sure our timer interrupt
> -	 * is incrementing.  The timer interrupt should have
> -	 * fired multiple times before we overflow'd.  If it hasn't
> +	/*
> +	 * Check for a hardlockup by making sure the CPU's timer
> +	 * interrupt is incrementing. The timer interrupt should have
> +	 * fired multiple times before we overflow'd. If it hasn't
>  	 * then this is a good indication the cpu is stuck
>  	 */
>  	if (watchdog_hardlockup_is_lockedup()) {
> -		int this_cpu = smp_processor_id();
> +		unsigned int this_cpu = smp_processor_id();
>  
> -		/* only print hardlockups once */
> -		if (__this_cpu_read(hard_watchdog_warn) == true)
> +		/* Only handle hardlockups once. */
> +		if (__this_cpu_read(watchdog_hardlockup_processed))
>  			return;
>  
> -		pr_emerg("Watchdog detected hard LOCKUP on cpu %d\n",
> -			 this_cpu);
> +		pr_emerg("Watchdog detected hard LOCKUP on cpu %d\n", this_cpu);
>  		print_modules();
>  		print_irqtrace_events(current);
>  		if (regs)
> @@ -137,18 +137,16 @@ void watchdog_hardlockup_check(struct pt_regs *regs)
>  		 * generating interleaving traces
>  		 */
>  		if (sysctl_hardlockup_all_cpu_backtrace &&
> -				!test_and_set_bit(0, &hardlockup_allcpu_dumped))
> +		    !test_and_set_bit(0, &watchdog_hardlockup_dumped_stacks))
>  			trigger_allbutself_cpu_backtrace();
>  
>  		if (hardlockup_panic)
>  			nmi_panic(regs, "Hard LOCKUP");
>  
> -		__this_cpu_write(hard_watchdog_warn, true);
> -		return;
> +		__this_cpu_write(watchdog_hardlockup_processed, true);
> +	} else {
> +		__this_cpu_write(watchdog_hardlockup_processed, false);
>  	}
> -
> -	__this_cpu_write(hard_watchdog_warn, false);
> -	return;
>  }
>  
>  #else /* CONFIG_HARDLOCKUP_DETECTOR_PERF */
> -- 
> 2.40.1.521.gf1e218fcd8-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
