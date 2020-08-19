Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B026224A23D
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 19 Aug 2020 16:58:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k8PXb-0001MQ-K1
	for lists+kgdb-bugreport@lfdr.de; Wed, 19 Aug 2020 14:58:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1k8PXZ-0001Lz-PV
 for kgdb-bugreport@lists.sourceforge.net; Wed, 19 Aug 2020 14:58:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gNx7n7webYaK+hMWxyNwV8aV+v87tKouMeg3PXkBAf4=; b=HkzuDdNOiuswz739jHE/CSFXEP
 myFtPCkyfM+cQdIIme4DvNezOV+uOsk+BkWJmdnYWBqTM8CIYk6rUyTuxoIeqyWpixnkaabOADGlc
 NLcp580nNHDRet1XWEVyTAMrfX0ppz68TkCajlHmfigZ9WwG2H7Gp2VAwVk0JMJFGaoo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gNx7n7webYaK+hMWxyNwV8aV+v87tKouMeg3PXkBAf4=; b=X7zh9zS4rwxAHqFJZBoWRJ9WVQ
 TMheMK7zpppg8IaBq/tjms54g4rwoHdh4NJFWAI+oJkG/fopTC9ILUYxtLdYqZASa6nnC4UAJX+Oq
 +r4yzZIHpti54bbxRub6UDoQZLsIcTmlIAAvjNdPTuuF/o4RdlVcY0Tl9QhTT2aTzrqg=;
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k8PXV-00GBOR-NJ
 for kgdb-bugreport@lists.sourceforge.net; Wed, 19 Aug 2020 14:58:13 +0000
Received: by mail-wr1-f68.google.com with SMTP id z18so21815910wrm.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 19 Aug 2020 07:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gNx7n7webYaK+hMWxyNwV8aV+v87tKouMeg3PXkBAf4=;
 b=n8MmBW8b3ksN9T8Gafo3ZMOc4bhTXtjR+GeS0Rvibq/PzoG8Ye3N53BDrp8svnlv1n
 NCO6QXaVozSNJMjlnQ5OShKx2UtailwRjMYqmmmurY9gvYVamal0vEIVKsDhh8K+8W26
 WPEmayEJ3i7jIMuYtQRfCZ/+8a4/zcqFTDJpsQffHWVTTjOiGoLEoP2XGxgbqsgf/DDj
 g8kTBETSBr9PCC/YyD3BzuaZDEj4xbQidp8pcS2SN8qiHkb+Aa3m1UDHtXXnDy9A2zpf
 s+zE/8aI9eShP/kv/B+r9e3vocR244XTBvjbPCq4/aLjlqFZ6LbVgGFYOeq7pX62hhHU
 PKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gNx7n7webYaK+hMWxyNwV8aV+v87tKouMeg3PXkBAf4=;
 b=D0Zp2XLL6JMNkqBp5FPSlK16BnvxOD/IKKp2HaFy2TTRSgGL7AUKijpiGPztxDAf5s
 RZpSRH08+CkOO9opKLqYH3uVfUbdgpORWcKH92h5ER/A+4kXtVk3WM4PRKi8JVbqg2y3
 eLfU/lvCWMXDDec1rl9QnjacSpZai2Nq0CfrYp4dO9c2n6GAJIFTaH1l3OurpRi5sh20
 X2N+06FMLX9aJOKSuv1TpzMcRrXR759VMIGSsOXXcQ4kmLKPfTCuxrlkKBPZb0a0+yZY
 1t8/eYNjyKe/J8SA+HKfPBslgA7AN/ISc0CWsU/xEdyvcFgdy7XGgtecnGOjbLtTJg0d
 lBUg==
X-Gm-Message-State: AOAM532znqJ1/1Mj2x1ll4t7mzDMtplNf4MuwjYUkBF/BZBY0FzrsG+O
 cY1KQVjh1ysGsSYvSpcNjy7t/g==
X-Google-Smtp-Source: ABdhPJzdW54EsERHAQyBaPPEEG3Xqf5CZuQ5mXiSSV+v29L8rIqau0aRKvT5VQZe07WUqRDjP2geRQ==
X-Received: by 2002:adf:f64f:: with SMTP id x15mr27108964wrp.180.1597849074997; 
 Wed, 19 Aug 2020 07:57:54 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id h5sm44726104wrc.97.2020.08.19.07.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 07:57:53 -0700 (PDT)
Date: Wed, 19 Aug 2020 15:57:51 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Christian Brauner <christian.brauner@ubuntu.com>
Message-ID: <20200819145751.uqblo3zh66nqnxmn@holly.lan>
References: <20200819104655.436656-1-christian.brauner@ubuntu.com>
 <20200819104655.436656-10-christian.brauner@ubuntu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200819104655.436656-10-christian.brauner@ubuntu.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k8PXV-00GBOR-NJ
Subject: Re: [Kgdb-bugreport] [PATCH v2 09/11] kgdbts: switch to
 kernel_clone()
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
Cc: Alexandre Chartre <alexandre.chartre@oracle.com>, linux-doc@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Kars de Jong <jongk@linux-m68k.org>, Matthew Wilcox <willy@infradead.org>,
 linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-ia64@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-arch@vger.kernel.org, Tom Zanussi <zanussi@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, x86@kernel.org,
 Ley Foon Tan <ley.foon.tan@intel.com>, Christoph Hewllig <hch@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, uclinux-h8-devel@lists.sourceforge.jp,
 Fenghua Yu <fenghua.yu@intel.com>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Steven Rostedt <rostedt@goodmis.org>,
 linux-m68k@lists.linux-m68k.org, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Xiao Yang <yangx.jy@cn.fujitsu.com>, Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Aug 19, 2020 at 12:46:53PM +0200, Christian Brauner wrote:
> The old _do_fork() helper is removed in favor of the new kernel_clone() helper.
> The latter adheres to naming conventions for kernel internal syscall helpers.
> 
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jason Wessel <jason.wessel@windriver.com>
> Cc: kgdb-bugreport@lists.sourceforge.net
> Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>

Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
Tested-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

> ---
> /* v2 */
> unchanged
> ---
>  drivers/misc/kgdbts.c | 48 +++++++++++++++++++++----------------------
>  1 file changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/misc/kgdbts.c b/drivers/misc/kgdbts.c
> index d5d2af4d10e6..945701bce553 100644
> --- a/drivers/misc/kgdbts.c
> +++ b/drivers/misc/kgdbts.c
> @@ -33,16 +33,16 @@
>   * You can also specify optional tests:
>   * N## = Go to sleep with interrupts of for ## seconds
>   *       to test the HW NMI watchdog
> - * F## = Break at do_fork for ## iterations
> + * F## = Break at kernel_clone for ## iterations
>   * S## = Break at sys_open for ## iterations
>   * I## = Run the single step test ## iterations
>   *
> - * NOTE: that the do_fork and sys_open tests are mutually exclusive.
> + * NOTE: that the kernel_clone and sys_open tests are mutually exclusive.
>   *
>   * To invoke the kgdb test suite from boot you use a kernel start
>   * argument as follows:
>   * 	kgdbts=V1 kgdbwait
> - * Or if you wanted to perform the NMI test for 6 seconds and do_fork
> + * Or if you wanted to perform the NMI test for 6 seconds and kernel_clone
>   * test for 100 forks, you could use:
>   * 	kgdbts=V1N6F100 kgdbwait
>   *
> @@ -74,7 +74,7 @@
>   * echo kgdbts=V1S10000 > /sys/module/kgdbts/parameters/kgdbts
>   * fg # and hit control-c
>   * fg # and hit control-c
> - * ## This tests break points on do_fork
> + * ## This tests break points on kernel_clone
>   * while [ 1 ] ; do date > /dev/null ; done &
>   * while [ 1 ] ; do date > /dev/null ; done &
>   * echo kgdbts=V1F1000 > /sys/module/kgdbts/parameters/kgdbts
> @@ -209,8 +209,8 @@ static unsigned long lookup_addr(char *arg)
>  		addr = (unsigned long)kgdbts_break_test;
>  	else if (!strcmp(arg, "sys_open"))
>  		addr = (unsigned long)do_sys_open;
> -	else if (!strcmp(arg, "do_fork"))
> -		addr = (unsigned long)_do_fork;
> +	else if (!strcmp(arg, "kernel_clone"))
> +		addr = (unsigned long)kernel_clone;
>  	else if (!strcmp(arg, "hw_break_val"))
>  		addr = (unsigned long)&hw_break_val;
>  	addr = (unsigned long) dereference_function_descriptor((void *)addr);
> @@ -310,7 +310,7 @@ static int check_and_rewind_pc(char *put_str, char *arg)
>  
>  	if (arch_needs_sstep_emulation && sstep_addr &&
>  	    ip + offset == sstep_addr &&
> -	    ((!strcmp(arg, "sys_open") || !strcmp(arg, "do_fork")))) {
> +	    ((!strcmp(arg, "sys_open") || !strcmp(arg, "kernel_clone")))) {
>  		/* This is special case for emulated single step */
>  		v2printk("Emul: rewind hit single step bp\n");
>  		restart_from_top_after_write = 1;
> @@ -596,19 +596,19 @@ static struct test_struct singlestep_break_test[] = {
>  };
>  
>  /*
> - * Test for hitting a breakpoint at do_fork for what ever the number
> + * Test for hitting a breakpoint at kernel_clone for what ever the number
>   * of iterations required by the variable repeat_test.
>   */
> -static struct test_struct do_fork_test[] = {
> +static struct test_struct do_kernel_clone_test[] = {
>  	{ "?", "S0*" }, /* Clear break points */
> -	{ "do_fork", "OK", sw_break, }, /* set sw breakpoint */
> +	{ "kernel_clone", "OK", sw_break, }, /* set sw breakpoint */
>  	{ "c", "T0*", NULL, get_thread_id_continue }, /* Continue */
> -	{ "do_fork", "OK", sw_rem_break }, /*remove breakpoint */
> -	{ "g", "do_fork", NULL, check_and_rewind_pc }, /* check location */
> +	{ "kernel_clone", "OK", sw_rem_break }, /*remove breakpoint */
> +	{ "g", "kernel_clone", NULL, check_and_rewind_pc }, /* check location */
>  	{ "write", "OK", write_regs, emul_reset }, /* Write registers */
>  	{ "s", "T0*", emul_sstep_get, emul_sstep_put }, /* Single step */
> -	{ "g", "do_fork", NULL, check_single_step },
> -	{ "do_fork", "OK", sw_break, }, /* set sw breakpoint */
> +	{ "g", "kernel_clone", NULL, check_single_step },
> +	{ "kernel_clone", "OK", sw_break, }, /* set sw breakpoint */
>  	{ "7", "T0*", skip_back_repeat_test }, /* Loop based on repeat_test */
>  	{ "D", "OK", NULL, final_ack_set }, /* detach and unregister I/O */
>  	{ "", "", get_cont_catch, put_cont_catch },
> @@ -935,11 +935,11 @@ static void run_bad_read_test(void)
>  	kgdb_breakpoint();
>  }
>  
> -static void run_do_fork_test(void)
> +static void run_kernel_clone_test(void)
>  {
>  	init_simple_test();
> -	ts.tst = do_fork_test;
> -	ts.name = "do_fork_test";
> +	ts.tst = do_kernel_clone_test;
> +	ts.name = "do_kernel_clone_test";
>  	/* Activate test with initial breakpoint */
>  	kgdb_breakpoint();
>  }
> @@ -967,7 +967,7 @@ static void run_singlestep_break_test(void)
>  static void kgdbts_run_tests(void)
>  {
>  	char *ptr;
> -	int fork_test = 0;
> +	int clone_test = 0;
>  	int do_sys_open_test = 0;
>  	int sstep_test = 1000;
>  	int nmi_sleep = 0;
> @@ -981,7 +981,7 @@ static void kgdbts_run_tests(void)
>  
>  	ptr = strchr(config, 'F');
>  	if (ptr)
> -		fork_test = simple_strtol(ptr + 1, NULL, 10);
> +		clone_test = simple_strtol(ptr + 1, NULL, 10);
>  	ptr = strchr(config, 'S');
>  	if (ptr)
>  		do_sys_open_test = simple_strtol(ptr + 1, NULL, 10);
> @@ -1025,16 +1025,16 @@ static void kgdbts_run_tests(void)
>  		run_nmi_sleep_test(nmi_sleep);
>  	}
>  
> -	/* If the do_fork test is run it will be the last test that is
> +	/* If the kernel_clone test is run it will be the last test that is
>  	 * executed because a kernel thread will be spawned at the very
>  	 * end to unregister the debug hooks.
>  	 */
> -	if (fork_test) {
> -		repeat_test = fork_test;
> -		printk(KERN_INFO "kgdbts:RUN do_fork for %i breakpoints\n",
> +	if (clone_test) {
> +		repeat_test = clone_test;
> +		printk(KERN_INFO "kgdbts:RUN kernel_clone for %i breakpoints\n",
>  			repeat_test);
>  		kthread_run(kgdbts_unreg_thread, NULL, "kgdbts_unreg");
> -		run_do_fork_test();
> +		run_kernel_clone_test();
>  		return;
>  	}
>  
> -- 
> 2.28.0
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
