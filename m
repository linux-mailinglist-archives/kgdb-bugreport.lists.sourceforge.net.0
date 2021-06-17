Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F40633AB0FA
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 17 Jun 2021 12:09:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ltoxq-00009E-VT
	for lists+kgdb-bugreport@lfdr.de; Thu, 17 Jun 2021 10:09:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <daniel.thompson@linaro.org>) id 1ltoxq-000097-2e
 for kgdb-bugreport@lists.sourceforge.net; Thu, 17 Jun 2021 10:09:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=85427KYEYrrxwKEdUbPTushEwCA9Yj+mHAXG+be0wiQ=; b=RHNd2c5K+nV/nlRGCHzoM+PkJN
 F4WrFNLhUlZaTeKHb100nUgaGC+hURewWE6qXT2CE5t2dEu4DMdQ/WOLNFW7ekMi3hIZ7oUjY3iPC
 nR+heniCPACn/pbAcEovS4OAy1KEBFLrZOgEKbNb/xLvc8WQu3nQYsIsfI/YuJr6jJwM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=85427KYEYrrxwKEdUbPTushEwCA9Yj+mHAXG+be0wiQ=; b=H6hylw10gRyBcJHng9nuX6+XK/
 bFoM0lK/XHVwFjJdQKdkPPejHfXJrCgvQUjelf0XOOooZ0DZjAgjUIABaL0sD0HRdr7j8pccob65B
 G5bRLfrm8iiyaUyqGKXbgvRYl4xJG8xU3lWJgFibqF1uc0teARFJLRPyhHWUj1qk0UGw=;
Received: from mail-wr1-f43.google.com ([209.85.221.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1ltoxf-0004ZJ-TJ
 for kgdb-bugreport@lists.sourceforge.net; Thu, 17 Jun 2021 10:09:34 +0000
Received: by mail-wr1-f43.google.com with SMTP id v9so6092052wrx.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 17 Jun 2021 03:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=85427KYEYrrxwKEdUbPTushEwCA9Yj+mHAXG+be0wiQ=;
 b=ttYfq9i1x7QIrjWzVzFNF0/Yga/Dz40ydsjJEj7uh+PXkMrnUJ2hsdHlomTa6ESs76
 r5zfisWrMys099EXuEPMVK+u1L1+X5n2KNDi95fCUeId8585XBWfYmDhhXGNf6+eIVFF
 roAW5awVpHV4M/3kPttlNbeE1lpFW7P1e+8KWAKTUlnowl/KKyF8ozr0de38aXeUR3p+
 Ejg9E3i+kWn7nPnEPbOb0D7EJq+/NkMe7LY/zK7X+wK+ow4yT5KohD6RkKmc25l/MEiW
 3kbCASbl2CfsT+ldYu2eGdR/MNLH6GumtSF23MqAutzAJHveVt11yFZkfCYDME2XFnH7
 YP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=85427KYEYrrxwKEdUbPTushEwCA9Yj+mHAXG+be0wiQ=;
 b=RIIooNkbo0E3vUmHjbP7/2iRTio+/6JYy+NgvdLeMsE4ZKsviP4EuwIwobZhnTT8+5
 A519go8OKxgqEt07OO7jHcOY/JEpRAYR9edJcXCsTLRanxiSsZ17HQo9wVDnkthRuJOH
 gp4X0wBVze2WeNvT4ncXws3Ae0WMN2vZSCo7KENj7nfCItEf7zxZmZQCkThKharP12yF
 0DcL7A77PXox61l+3OR6DEQ9+frwb7yiGnLNV8pzN7akR085XKyDTP61So6wuHM0qGDw
 h0anXfm5zTSuQY+SYGB98nF2BBY7Px1EdNbZLROeyiUW8txRTDcfIYQ9YU607zzG8bvi
 +AIA==
X-Gm-Message-State: AOAM531ZXVH8iPp/hCiOiK8Ad9lc9HoYH9G12wXgu6z8F2kojC9j4MDx
 sFXsfGb//QrjREuehTKAg2JuSw==
X-Google-Smtp-Source: ABdhPJyMRnQGkJqXInfJRRkjjvjeyqgSs/jdM6jdSZaC5UXJ6ejRI+yr8yC8Hw65Qu43dQuGuEf4dw==
X-Received: by 2002:a5d:6d8b:: with SMTP id l11mr4647383wrs.21.1623924558847; 
 Thu, 17 Jun 2021 03:09:18 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id h18sm4993756wrs.64.2021.06.17.03.09.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 03:09:18 -0700 (PDT)
Date: Thu, 17 Jun 2021 11:09:16 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Message-ID: <20210617100916.ynovtwbtsq7eaabw@maple.lan>
References: <20210529110305.9446-1-thunder.leizhen@huawei.com>
 <20210529110305.9446-3-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210529110305.9446-3-thunder.leizhen@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.43 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.43 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1ltoxf-0004ZJ-TJ
Subject: Re: [Kgdb-bugreport] [PATCH v2 2/4] kgdb: Fix spelling mistakes
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>,
 Balbir Singh <bsingharora@gmail.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Daniel Jordan <daniel.m.jordan@oracle.com>, Ingo Molnar <mingo@redhat.com>,
 "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
 Darren Hart <dvhart@infradead.org>, Eric Biederman <ebiederm@xmission.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 linux-crypto <linux-crypto@vger.kernel.org>,
 John Stultz <john.stultz@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Barry Song <song.bao.hua@hisilicon.com>, Stephen Boyd <sboyd@kernel.org>,
 kexec <kexec@lists.infradead.org>, Oleg Nesterov <oleg@redhat.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Jessica Yu <jeyu@kernel.org>, Tejun Heo <tj@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Sat, May 29, 2021 at 07:03:03PM +0800, Zhen Lei wrote:
> Fix some spelling mistakes in comments:
> initalization ==> initialization
> detatch ==> detach
> represntation ==> representation
> hexidecimal ==> hexadecimal
> delimeter ==> delimiter
> architecure ==> architecture
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>

Applied, thanks.


> ---
>  include/linux/kgdb.h           | 8 ++++----
>  kernel/debug/debug_core.c      | 2 +-
>  kernel/debug/kdb/kdb_main.c    | 8 ++++----
>  kernel/debug/kdb/kdb_private.h | 2 +-
>  4 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> index 392a3670944c..258cdde8d356 100644
> --- a/include/linux/kgdb.h
> +++ b/include/linux/kgdb.h
> @@ -105,9 +105,9 @@ extern int dbg_set_reg(int regno, void *mem, struct pt_regs *regs);
>   */
>  
>  /**
> - *	kgdb_arch_init - Perform any architecture specific initalization.
> + *	kgdb_arch_init - Perform any architecture specific initialization.
>   *
> - *	This function will handle the initalization of any architecture
> + *	This function will handle the initialization of any architecture
>   *	specific callbacks.
>   */
>  extern int kgdb_arch_init(void);
> @@ -229,9 +229,9 @@ extern int kgdb_arch_set_breakpoint(struct kgdb_bkpt *bpt);
>  extern int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt);
>  
>  /**
> - *	kgdb_arch_late - Perform any architecture specific initalization.
> + *	kgdb_arch_late - Perform any architecture specific initialization.
>   *
> - *	This function will handle the late initalization of any
> + *	This function will handle the late initialization of any
>   *	architecture specific callbacks.  This is an optional function for
>   *	handling things like late initialization of hw breakpoints.  The
>   *	default implementation does nothing.
> diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> index 4708aec492df..a1f26766eb90 100644
> --- a/kernel/debug/debug_core.c
> +++ b/kernel/debug/debug_core.c
> @@ -1032,7 +1032,7 @@ dbg_notify_reboot(struct notifier_block *this, unsigned long code, void *x)
>  	/*
>  	 * Take the following action on reboot notify depending on value:
>  	 *    1 == Enter debugger
> -	 *    0 == [the default] detatch debug client
> +	 *    0 == [the default] detach debug client
>  	 *   -1 == Do nothing... and use this until the board resets
>  	 */
>  	switch (kgdbreboot) {
> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index 622410c45da1..d8ee5647b732 100644
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -253,7 +253,7 @@ static char *kdballocenv(size_t bytes)
>   * Parameters:
>   *	match	A character string representing a numeric value
>   * Outputs:
> - *	*value  the unsigned long represntation of the env variable 'match'
> + *	*value  the unsigned long representation of the env variable 'match'
>   * Returns:
>   *	Zero on success, a kdb diagnostic on failure.
>   */
> @@ -356,7 +356,7 @@ static void kdb_printenv(void)
>   * Parameters:
>   *	arg	A character string representing a numeric value
>   * Outputs:
> - *	*value  the unsigned long represntation of arg.
> + *	*value  the unsigned long representation of arg.
>   * Returns:
>   *	Zero on success, a kdb diagnostic on failure.
>   */
> @@ -470,7 +470,7 @@ static int kdb_check_regs(void)
>   *	symbol name, and offset to the caller.
>   *
>   *	The argument may consist of a numeric value (decimal or
> - *	hexidecimal), a symbol name, a register name (preceded by the
> + *	hexadecimal), a symbol name, a register name (preceded by the
>   *	percent sign), an environment variable with a numeric value
>   *	(preceded by a dollar sign) or a simple arithmetic expression
>   *	consisting of a symbol name, +/-, and a numeric constant value
> @@ -894,7 +894,7 @@ static void parse_grep(const char *str)
>   *	Limited to 20 tokens.
>   *
>   *	Real rudimentary tokenization. Basically only whitespace
> - *	is considered a token delimeter (but special consideration
> + *	is considered a token delimiter (but special consideration
>   *	is taken of the '=' sign as used by the 'set' command).
>   *
>   *	The algorithm used to tokenize the input string relies on
> diff --git a/kernel/debug/kdb/kdb_private.h b/kernel/debug/kdb/kdb_private.h
> index ccbed9089808..170c69aedebb 100644
> --- a/kernel/debug/kdb/kdb_private.h
> +++ b/kernel/debug/kdb/kdb_private.h
> @@ -64,7 +64,7 @@
>  
>  /*
>   * KDB_MAXBPT describes the total number of breakpoints
> - * supported by this architecure.
> + * supported by this architecture.
>   */
>  #define KDB_MAXBPT	16
>  
> -- 
> 2.25.1


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
