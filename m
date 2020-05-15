Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB831D55B6
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 15 May 2020 18:18:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jZd2i-0001YH-K8
	for lists+kgdb-bugreport@lfdr.de; Fri, 15 May 2020 16:18:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jZd2h-0001Y4-1c
 for kgdb-bugreport@lists.sourceforge.net; Fri, 15 May 2020 16:18:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dzQ9ZWRTK7rD/i+H1Fdnru9+VEPfr4nmpUnSitdS5yc=; b=EzYWmkN2FdbF3cl+nD8aX89+tD
 pO6nS27CXG5O1z0Cgs/lkMmgc1bz351yNliRKBmfbRnpGaygFcgm6nw0O+5R4zWt7hwQKDTZLR601
 i1LDX0KDn4NEhaxgRzZ5jjiBxribVaJKwfdOApYcqVHSwi2Gt9Ouoz8PrSvb7vcfC2gk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dzQ9ZWRTK7rD/i+H1Fdnru9+VEPfr4nmpUnSitdS5yc=; b=K2WXp7QtlzmJMjWUQIQEliqcRN
 CmthusQSH4n3nSudqZipHD+/TyCjjHv25o9i4lqXB2cS6Qh3NzHtvyGxBKB8b0/3BJxDT8a6QPZ5F
 ouFoaKIKKEnLUCWsQIIA293gdJT7cQfocxYgvVB/ajj2MQqYjJTllwwAuj8ZmJ3oVmsA=;
Received: from mail-wm1-f67.google.com ([209.85.128.67])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jZd2a-0004So-Cz
 for kgdb-bugreport@lists.sourceforge.net; Fri, 15 May 2020 16:18:34 +0000
Received: by mail-wm1-f67.google.com with SMTP id z4so1727079wmi.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 15 May 2020 09:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dzQ9ZWRTK7rD/i+H1Fdnru9+VEPfr4nmpUnSitdS5yc=;
 b=qeXeGnfRgM72ebjuFUB6ERbL/h88bKA9mwClRvT0KfI4TXNsMYUMlqBYktfQqXjRZL
 0ighIUR4ASoO9pFh2zujdCDnCUNdLe8G3Xbip+Md8UTLMZlZAWSFElhZjjJZtjfCo8IP
 yA8H9lYeH4KP0RlH9R0bRro0VDoUhPSqPI83cpa1t1auVVtF5KyNQVDJrhi2ZR+fuiM8
 MNlH1B/3cKl8pLyl/T/qSBR6e6e0KcrYUucZsfnE7QV0H1DCojgKOT4FVS8MODPJ8CbS
 tQRLiRfDXqF852Lsj/2NmZOCZYqmHOembRHZtCpZcghpvqvUm5Zf/ciL6nT7qFRQeZz0
 jF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dzQ9ZWRTK7rD/i+H1Fdnru9+VEPfr4nmpUnSitdS5yc=;
 b=Dm4eEDRvUHp9s6Wdqqq2jfKloNjZaMKjKhVQcRV2Zy7vOPd6I1y6smErwe+SVO/fWx
 Q8ldswGs+KKBlbVRHXaKJkVlRFqxqY4fW0EFUKkfmBJZcAM4zjhosQhRLNj8NX2uL40c
 Su396+aZQNW+j/6bACcnUWNPynGrYiWSRk6BKASxSCtxT19TwNB/+bIJEQo4ZGy3ulI9
 TVHeKPsJpp7h/EL/iRHDibcOTDE//1+s5Q5kL4EIzZpVjyYNsFuxHA/7NuMxRxgIJCOH
 B+RwAg4CBfeU4Q0hRpitfZRV8tt7WpAs7N3zu4lVG5jUOAZ7obumIgrA9QNb6pxNcKvB
 Xvyg==
X-Gm-Message-State: AOAM531TnhwJrOsGLp5gYl5UplO7IVI9wD09ol8gQfIghunBOsEJf1Y4
 sTBAcsGgeSmsYL8oTkNBeS7GPg==
X-Google-Smtp-Source: ABdhPJw70SKNTdBO7mqaC0EQIvTVFUm5UR9NBgEfdtSQLl3OBanMBVtF7U5pOLOUXrhj3AZ4WtaL1w==
X-Received: by 2002:a05:600c:4147:: with SMTP id
 h7mr4710092wmm.178.1589559494828; 
 Fri, 15 May 2020 09:18:14 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id z124sm2931929wmg.20.2020.05.15.09.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 09:18:14 -0700 (PDT)
Date: Fri, 15 May 2020 17:18:12 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20200515161812.vs3ry35qcatgf7ut@holly.lan>
References: <20200507200850.60646-1-dianders@chromium.org>
 <20200507130644.v4.4.I3113aea1b08d8ce36dc3720209392ae8b815201b@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200507130644.v4.4.I3113aea1b08d8ce36dc3720209392ae8b815201b@changeid>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jZd2a-0004So-Cz
Subject: Re: [Kgdb-bugreport] [PATCH v4 04/12] kgdb: Delay "kgdbwait" to
 dbg_late_init() by default
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
Cc: x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
 gregkh@linuxfoundation.org, hpa@zytor.com, agross@kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, bjorn.andersson@linaro.org,
 mingo@redhat.com, bp@alien8.de, linux-serial@vger.kernel.org,
 jason.wessel@windriver.com, kgdb-bugreport@lists.sourceforge.net,
 jslaby@suse.com, tglx@linutronix.de, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, May 07, 2020 at 01:08:42PM -0700, Douglas Anderson wrote:
> Using kgdb requires at least some level of architecture-level
> initialization.  If nothing else, it relies on the architecture to
> pass breakpoints / crashes onto kgdb.
> 
> On some architectures this all works super early, specifically it
> starts working at some point in time before Linux parses
> early_params's.  On other architectures it doesn't.  A survey of a few
> platforms:
> 
> a) x86: Presumably it all works early since "ekgdboc" is documented to
>    work here.
> b) arm64: Catching crashes works; with a simple patch breakpoints can
>    also be made to work.
> c) arm: Nothing in kgdb works until
>    paging_init() -> devicemaps_init() -> early_trap_init()
> 
> Let's be conservative and, by default, process "kgdbwait" (which tells
> the kernel to drop into the debugger ASAP at boot) a bit later at
> dbg_late_init() time.  If an architecture has tested it and wants to
> re-enable super early debugging, they can select the
> ARCH_HAS_EARLY_DEBUG KConfig option.  We'll do this for x86 to start.
> It should be noted that dbg_late_init() is still called quite early in
> the system.
> 
> Note that this patch doesn't affect when kgdb runs its init.  If kgdb
> is set to initialize early it will still initialize when parsing
> early_param's.  This patch _only_ inhibits the initial breakpoint from
> "kgdbwait".  This means:
> 
> * Without any extra patches arm64 platforms will at least catch
>   crashes after kgdb inits.
> * arm platforms will catch crashes (and could handle a hardcoded
>   kgdb_breakpoint()) any time after early_trap_init() runs, even
>   before dbg_late_init().
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

I hope to pull this set into the kgdb tree shortly. Any objections to
the arch/x86 changes this would bring?


Daniel.


> ---
> 
> Changes in v4:
> - Add "if KGDB" to "select ARCH_HAS_EARLY_DEBUG" in Kconfig.
> 
> Changes in v3:
> - Change boolean weak function to KConfig.
> 
> Changes in v2: None
> 
>  arch/x86/Kconfig          |  1 +
>  kernel/debug/debug_core.c | 25 +++++++++++++++----------
>  lib/Kconfig.kgdb          | 18 ++++++++++++++++++
>  3 files changed, 34 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 1197b5596d5a..5f44955ee21c 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -60,6 +60,7 @@ config X86
>  	select ARCH_HAS_ACPI_TABLE_UPGRADE	if ACPI
>  	select ARCH_HAS_DEBUG_VIRTUAL
>  	select ARCH_HAS_DEVMEM_IS_ALLOWED
> +	select ARCH_HAS_EARLY_DEBUG		if KGDB
>  	select ARCH_HAS_ELF_RANDOMIZE
>  	select ARCH_HAS_FAST_MULTIPLIER
>  	select ARCH_HAS_FILTER_PGPROT
> diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> index 950dc667c823..503c1630ca76 100644
> --- a/kernel/debug/debug_core.c
> +++ b/kernel/debug/debug_core.c
> @@ -950,6 +950,14 @@ void kgdb_panic(const char *msg)
>  	kgdb_breakpoint();
>  }
>  
> +static void kgdb_initial_breakpoint(void)
> +{
> +	kgdb_break_asap = 0;
> +
> +	pr_crit("Waiting for connection from remote gdb...\n");
> +	kgdb_breakpoint();
> +}
> +
>  void __weak kgdb_arch_late(void)
>  {
>  }
> @@ -960,6 +968,9 @@ void __init dbg_late_init(void)
>  	if (kgdb_io_module_registered)
>  		kgdb_arch_late();
>  	kdb_init(KDB_INIT_FULL);
> +
> +	if (kgdb_io_module_registered && kgdb_break_asap)
> +		kgdb_initial_breakpoint();
>  }
>  
>  static int
> @@ -1055,14 +1066,6 @@ void kgdb_schedule_breakpoint(void)
>  }
>  EXPORT_SYMBOL_GPL(kgdb_schedule_breakpoint);
>  
> -static void kgdb_initial_breakpoint(void)
> -{
> -	kgdb_break_asap = 0;
> -
> -	pr_crit("Waiting for connection from remote gdb...\n");
> -	kgdb_breakpoint();
> -}
> -
>  /**
>   *	kgdb_register_io_module - register KGDB IO module
>   *	@new_dbg_io_ops: the io ops vector
> @@ -1099,7 +1102,8 @@ int kgdb_register_io_module(struct kgdb_io *new_dbg_io_ops)
>  	/* Arm KGDB now. */
>  	kgdb_register_callbacks();
>  
> -	if (kgdb_break_asap)
> +	if (kgdb_break_asap &&
> +	    (!dbg_is_early || IS_ENABLED(CONFIG_ARCH_HAS_EARLY_DEBUG)))
>  		kgdb_initial_breakpoint();
>  
>  	return 0;
> @@ -1169,7 +1173,8 @@ static int __init opt_kgdb_wait(char *str)
>  	kgdb_break_asap = 1;
>  
>  	kdb_init(KDB_INIT_EARLY);
> -	if (kgdb_io_module_registered)
> +	if (kgdb_io_module_registered &&
> +	    IS_ENABLED(CONFIG_ARCH_HAS_EARLY_DEBUG))
>  		kgdb_initial_breakpoint();
>  
>  	return 0;
> diff --git a/lib/Kconfig.kgdb b/lib/Kconfig.kgdb
> index 933680b59e2d..ffa7a76de086 100644
> --- a/lib/Kconfig.kgdb
> +++ b/lib/Kconfig.kgdb
> @@ -124,4 +124,22 @@ config KDB_CONTINUE_CATASTROPHIC
>  	  CONFIG_KDB_CONTINUE_CATASTROPHIC == 2. KDB forces a reboot.
>  	  If you are not sure, say 0.
>  
> +config ARCH_HAS_EARLY_DEBUG
> +	bool
> +	default n
> +	help
> +	  If an architecture can definitely handle entering the debugger
> +	  when early_param's are parsed then it select this config.
> +	  Otherwise, if "kgdbwait" is passed on the kernel command line it
> +	  won't actually be processed until dbg_late_init() just after the
> +	  call to kgdb_arch_late() is made.
> +
> +	  NOTE: Even if this isn't selected by an architecture we will
> +	  still try to register kgdb to handle breakpoints and crashes
> +	  when early_param's are parsed, we just won't act on the
> +	  "kgdbwait" parameter until dbg_late_init().  If you get a
> +	  crash and try to drop into kgdb somewhere between these two
> +	  places you might or might not end up being able to use kgdb
> +	  depending on exactly how far along the architecture has initted.
> +
>  endif # KGDB
> -- 
> 2.26.2.645.ge9eca65c58-goog
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
