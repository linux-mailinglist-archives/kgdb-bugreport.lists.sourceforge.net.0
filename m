Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A60C20B12E
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 26 Jun 2020 14:14:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jonF6-0000US-5C
	for lists+kgdb-bugreport@lfdr.de; Fri, 26 Jun 2020 12:14:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jonF4-0000UK-Iv
 for kgdb-bugreport@lists.sourceforge.net; Fri, 26 Jun 2020 12:14:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lgJeax4YtrsAbRvaQNJ0gahjRNXXWAt78uuKg3Bv4Hw=; b=GJ/rxYeMXxI8qmk+NC5TwsTjQG
 KDPiYIOt8UDkBJoKJjS9Wfi5dqkZOd+3qkDXa17nintAeijk8XKVhUi5tkF84+GW/9BCZNwZkr+Uv
 VC2KnfqYuS2SAXJZp2t0DWJYfIHxQvTH0lVq3xIKisyGq21HvHo4FyinVr6NbwKN46yM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lgJeax4YtrsAbRvaQNJ0gahjRNXXWAt78uuKg3Bv4Hw=; b=JgXgAi4oginNb3i6TojFiYJdBB
 uhlHAWxaGNbAB4KqJJg2K/jNTUj8joMFuiaZ9jjCHS5CRGqSca10/+RWEt3uiz+AHIgucJVGQDh4w
 S0aG/aidLQ3lHhpbz4ZMMR6YMSRjom5Y8+S4m6Bsx2O5pl8VJTQvQT0MXbhJOjySpPGo=;
Received: from mail-wr1-f67.google.com ([209.85.221.67])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jonEz-001krm-Pq
 for kgdb-bugreport@lists.sourceforge.net; Fri, 26 Jun 2020 12:14:02 +0000
Received: by mail-wr1-f67.google.com with SMTP id j4so6821843wrp.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 26 Jun 2020 05:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lgJeax4YtrsAbRvaQNJ0gahjRNXXWAt78uuKg3Bv4Hw=;
 b=TondnGZm7ga94vOgOuPcI9V7a4tJqO2aGcDDV/78djiybvmgjHKzKS4+7K10rQHQBu
 81NvrYLXaNTiQ/EBI6rta4Aylj/hmxieM3c0588mnet/Qab20khhFbDn3wfRIm6/jRP6
 0pGeuR1Z5GjYiH8t/G3XstwwmYay5PHiAw33Aq7sab93YJi6ThKqwKon9bBU5f+I0KjD
 LwO6abZr35buFre8ECL4GG7pv3aaEsXveuw3VWushZ/yfSmJBfj25VpqALrZUM3Q6Dn9
 oOnXpYK7aZdmnUvRKLX9FC/aldtP2EZUlodje8VGkcZD76jU6Qxl/f/3PzU5f3NXfF2w
 mKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lgJeax4YtrsAbRvaQNJ0gahjRNXXWAt78uuKg3Bv4Hw=;
 b=pPWCreZjKOIPVGXD9I4pu0Qo2es8+fxp+29lh9hFw7SrDqRZNkVyCXoOQHLyUvKFIL
 EujO+jy9zNg7OJ6xUiiiGFI8qmZdxV1muFJyMUL8MtKDl0daaieVt7Ul6sQm1PaNIT8R
 FusOLHdLNoAZ0H9oY9jUb8AjHAKChpIH/n04GH8U6ucE8maM4dtYr8ccwuGfR/R5K1Wc
 /xSb1v9q/iOGAVSxPZ6GyiSB/N2vJ5M8WdsHW740VDCkh+Ww4Tj+zfFJ3pyLMoM75WcO
 LC4FXdtfVtMP0ran2CjWuo6rzp06cIeGRmOf3a5rPJglkqO2vQfwqvWUZRVgB6J0oVWW
 eaGQ==
X-Gm-Message-State: AOAM533nLBNL+rN30l3Qmle6rVgpuCYl3qn9N2g8c/df8vseJoQNenjS
 p59+3J13Qbn+lK25RcVxasVlCQ==
X-Google-Smtp-Source: ABdhPJxx20BY12FOVEn5PxX/xhe0RRoRONuEjTeYr7QcGsD2Wh4umYD4K9aB+iQ54fbVdvHUWrnQcA==
X-Received: by 2002:adf:9524:: with SMTP id 33mr1307384wrs.156.1593173631367; 
 Fri, 26 Jun 2020 05:13:51 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id q188sm14377194wma.46.2020.06.26.05.13.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 05:13:50 -0700 (PDT)
Date: Fri, 26 Jun 2020 13:13:48 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20200626121348.eeutt4py34f2yg3y@holly.lan>
References: <1591264879-25920-1-git-send-email-sumit.garg@linaro.org>
 <1591264879-25920-5-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1591264879-25920-5-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jonEz-001krm-Pq
Subject: Re: [Kgdb-bugreport] [PATCH v6 4/4] kdb: Switch to use safer
 dbg_io_ops over console APIs
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
Cc: pmladek@suse.com, kgdb-bugreport@lists.sourceforge.net,
 jason.wessel@windriver.com, linux-kernel@vger.kernel.org,
 sergey.senozhatsky@gmail.com, gregkh@linuxfoundation.org, jslaby@suse.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Greg

This patch touches some kgdb related code in both serial and usb trees.

Any objections to my queuing this via the kgdb tree?

After testing I've concluded that this, and its friends (which only
touch kgdb), fix enough problems that I plan to queue it for v5.8.


Daniel.


On Thu, Jun 04, 2020 at 03:31:19PM +0530, Sumit Garg wrote:
> In kgdb context, calling console handlers aren't safe due to locks used
> in those handlers which could in turn lead to a deadlock. Although, using
> oops_in_progress increases the chance to bypass locks in most console
> handlers but it might not be sufficient enough in case a console uses
> more locks (VT/TTY is good example).
> 
> Currently when a driver provides both polling I/O and a console then kdb
> will output using the console. We can increase robustness by using the
> currently active polling I/O driver (which should be lockless) instead
> of the corresponding console. For several common cases (e.g. an
> embedded system with a single serial port that is used both for console
> output and debugger I/O) this will result in no console handler being
> used.
> 
> In order to achieve this we need to reverse the order of preference to
> use dbg_io_ops (uses polling I/O mode) over console APIs. So we just
> store "struct console" that represents debugger I/O in dbg_io_ops and
> while emitting kdb messages, skip console that matches dbg_io_ops
> console in order to avoid duplicate messages. After this change,
> "is_console" param becomes redundant and hence removed.
> 
> Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  drivers/tty/serial/kgdb_nmi.c |  2 +-
>  drivers/tty/serial/kgdboc.c   | 32 ++++++++++++++++----------------
>  drivers/usb/early/ehci-dbgp.c |  3 ++-
>  include/linux/kgdb.h          |  5 ++---
>  kernel/debug/kdb/kdb_io.c     |  4 +++-
>  5 files changed, 24 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/tty/serial/kgdb_nmi.c b/drivers/tty/serial/kgdb_nmi.c
> index 5022447..6004c0c 100644
> --- a/drivers/tty/serial/kgdb_nmi.c
> +++ b/drivers/tty/serial/kgdb_nmi.c
> @@ -50,7 +50,7 @@ static int kgdb_nmi_console_setup(struct console *co, char *options)
>  	 * I/O utilities that messages sent to the console will automatically
>  	 * be displayed on the dbg_io.
>  	 */
> -	dbg_io_ops->is_console = true;
> +	dbg_io_ops->cons = co;
>  
>  	return 0;
>  }
> diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
> index 4139698..84ffede 100644
> --- a/drivers/tty/serial/kgdboc.c
> +++ b/drivers/tty/serial/kgdboc.c
> @@ -45,7 +45,6 @@ static struct platform_device *kgdboc_pdev;
>  
>  #if IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE)
>  static struct kgdb_io		kgdboc_earlycon_io_ops;
> -static struct console		*earlycon;
>  static int                      (*earlycon_orig_exit)(struct console *con);
>  #endif /* IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE) */
>  
> @@ -145,7 +144,7 @@ static void kgdboc_unregister_kbd(void)
>  #if IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE)
>  static void cleanup_earlycon(void)
>  {
> -	if (earlycon)
> +	if (kgdboc_earlycon_io_ops.cons)
>  		kgdb_unregister_io_module(&kgdboc_earlycon_io_ops);
>  }
>  #else /* !IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE) */
> @@ -178,7 +177,7 @@ static int configure_kgdboc(void)
>  		goto noconfig;
>  	}
>  
> -	kgdboc_io_ops.is_console = 0;
> +	kgdboc_io_ops.cons = NULL;
>  	kgdb_tty_driver = NULL;
>  
>  	kgdboc_use_kms = 0;
> @@ -198,7 +197,7 @@ static int configure_kgdboc(void)
>  		int idx;
>  		if (cons->device && cons->device(cons, &idx) == p &&
>  		    idx == tty_line) {
> -			kgdboc_io_ops.is_console = 1;
> +			kgdboc_io_ops.cons = cons;
>  			break;
>  		}
>  	}
> @@ -433,7 +432,8 @@ static int kgdboc_earlycon_get_char(void)
>  {
>  	char c;
>  
> -	if (!earlycon->read(earlycon, &c, 1))
> +	if (!kgdboc_earlycon_io_ops.cons->read(kgdboc_earlycon_io_ops.cons,
> +					       &c, 1))
>  		return NO_POLL_CHAR;
>  
>  	return c;
> @@ -441,7 +441,8 @@ static int kgdboc_earlycon_get_char(void)
>  
>  static void kgdboc_earlycon_put_char(u8 chr)
>  {
> -	earlycon->write(earlycon, &chr, 1);
> +	kgdboc_earlycon_io_ops.cons->write(kgdboc_earlycon_io_ops.cons, &chr,
> +					   1);
>  }
>  
>  static void kgdboc_earlycon_pre_exp_handler(void)
> @@ -461,7 +462,7 @@ static void kgdboc_earlycon_pre_exp_handler(void)
>  	 * boot if we detect this case.
>  	 */
>  	for_each_console(con)
> -		if (con == earlycon)
> +		if (con == kgdboc_earlycon_io_ops.cons)
>  			return;
>  
>  	already_warned = true;
> @@ -484,25 +485,25 @@ static int kgdboc_earlycon_deferred_exit(struct console *con)
>  
>  static void kgdboc_earlycon_deinit(void)
>  {
> -	if (!earlycon)
> +	if (!kgdboc_earlycon_io_ops.cons)
>  		return;
>  
> -	if (earlycon->exit == kgdboc_earlycon_deferred_exit)
> +	if (kgdboc_earlycon_io_ops.cons->exit == kgdboc_earlycon_deferred_exit)
>  		/*
>  		 * kgdboc_earlycon is exiting but original boot console exit
>  		 * was never called (AKA kgdboc_earlycon_deferred_exit()
>  		 * didn't ever run).  Undo our trap.
>  		 */
> -		earlycon->exit = earlycon_orig_exit;
> -	else if (earlycon->exit)
> +		kgdboc_earlycon_io_ops.cons->exit = earlycon_orig_exit;
> +	else if (kgdboc_earlycon_io_ops.cons->exit)
>  		/*
>  		 * We skipped calling the exit() routine so we could try to
>  		 * keep using the boot console even after it went away.  We're
>  		 * finally done so call the function now.
>  		 */
> -		earlycon->exit(earlycon);
> +		kgdboc_earlycon_io_ops.cons->exit(kgdboc_earlycon_io_ops.cons);
>  
> -	earlycon = NULL;
> +	kgdboc_earlycon_io_ops.cons = NULL;
>  }
>  
>  static struct kgdb_io kgdboc_earlycon_io_ops = {
> @@ -511,7 +512,6 @@ static struct kgdb_io kgdboc_earlycon_io_ops = {
>  	.write_char		= kgdboc_earlycon_put_char,
>  	.pre_exception		= kgdboc_earlycon_pre_exp_handler,
>  	.deinit			= kgdboc_earlycon_deinit,
> -	.is_console		= true,
>  };
>  
>  #define MAX_CONSOLE_NAME_LEN (sizeof((struct console *) 0)->name)
> @@ -557,10 +557,10 @@ static int __init kgdboc_earlycon_init(char *opt)
>  		goto unlock;
>  	}
>  
> -	earlycon = con;
> +	kgdboc_earlycon_io_ops.cons = con;
>  	pr_info("Going to register kgdb with earlycon '%s'\n", con->name);
>  	if (kgdb_register_io_module(&kgdboc_earlycon_io_ops) != 0) {
> -		earlycon = NULL;
> +		kgdboc_earlycon_io_ops.cons = NULL;
>  		pr_info("Failed to register kgdb with earlycon\n");
>  	} else {
>  		/* Trap exit so we can keep earlycon longer if needed. */
> diff --git a/drivers/usb/early/ehci-dbgp.c b/drivers/usb/early/ehci-dbgp.c
> index ea0d531..775cf70 100644
> --- a/drivers/usb/early/ehci-dbgp.c
> +++ b/drivers/usb/early/ehci-dbgp.c
> @@ -1058,7 +1058,8 @@ static int __init kgdbdbgp_parse_config(char *str)
>  		kgdbdbgp_wait_time = simple_strtoul(ptr, &ptr, 10);
>  	}
>  	kgdb_register_io_module(&kgdbdbgp_io_ops);
> -	kgdbdbgp_io_ops.is_console = early_dbgp_console.index != -1;
> +	if (early_dbgp_console.index != -1)
> +		kgdbdbgp_io_ops.cons = &early_dbgp_console;
>  
>  	return 0;
>  }
> diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> index c62d764..529116b 100644
> --- a/include/linux/kgdb.h
> +++ b/include/linux/kgdb.h
> @@ -276,8 +276,7 @@ struct kgdb_arch {
>   * the I/O driver.
>   * @post_exception: Pointer to a function that will do any cleanup work
>   * for the I/O driver.
> - * @is_console: 1 if the end device is a console 0 if the I/O device is
> - * not a console
> + * @cons: valid if the I/O device is a console; else NULL.
>   */
>  struct kgdb_io {
>  	const char		*name;
> @@ -288,7 +287,7 @@ struct kgdb_io {
>  	void			(*deinit) (void);
>  	void			(*pre_exception) (void);
>  	void			(*post_exception) (void);
> -	int			is_console;
> +	struct console		*cons;
>  };
>  
>  extern const struct kgdb_arch		arch_kgdb_ops;
> diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> index 0e4f2ed..683a799 100644
> --- a/kernel/debug/kdb/kdb_io.c
> +++ b/kernel/debug/kdb/kdb_io.c
> @@ -549,7 +549,7 @@ static void kdb_msg_write(const char *msg, int msg_len)
>  	if (msg_len == 0)
>  		return;
>  
> -	if (dbg_io_ops && !dbg_io_ops->is_console) {
> +	if (dbg_io_ops) {
>  		const char *cp = msg;
>  		int len = msg_len;
>  
> @@ -562,6 +562,8 @@ static void kdb_msg_write(const char *msg, int msg_len)
>  	for_each_console(c) {
>  		if (!(c->flags & CON_ENABLED))
>  			continue;
> +		if (c == dbg_io_ops->cons)
> +			continue;
>  		/*
>  		 * Set oops_in_progress to encourage the console drivers to
>  		 * disregard their internal spin locks: in the current calling
> -- 
> 2.7.4


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
