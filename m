Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADD71C3CC0
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  4 May 2020 16:20:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jVbxM-0000Ht-E2
	for lists+kgdb-bugreport@lfdr.de; Mon, 04 May 2020 14:20:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jVbxK-0000Hm-SF
 for kgdb-bugreport@lists.sourceforge.net; Mon, 04 May 2020 14:20:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gg7NmM+Hl82lwFdgF23a7OUMDRxdbsm38gnonOFK+XM=; b=YtGIKMdpDDmFDudLHBIEM8y48c
 yUMa56HlWf7lxvAft+0DQnhH5dZrQ5AUxvnZdPCHU0sYJZ7ZEHJF05eGpI2hdmdavm8xdZrOxO+Fi
 NzsXdmo0i7bXdZz/o/AQSjve/Dmyb+GAa5G6QmtDTBZtX4LX2sZ7/UltDXvyou3xjGrc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gg7NmM+Hl82lwFdgF23a7OUMDRxdbsm38gnonOFK+XM=; b=nMZh2zNCiaWmPqN9bdVlGLCnax
 q8GXK1AiD5ZygIgdmzP13CpM4gr1LE5zuAj8zqpRo0wFMZMfBpMu0AK3eVuRE9d1FnY78e7aZMpo+
 te6ri6+HRHLBcA5EsYuEb5yECSGN6bRBYfmjdStxNvbEOgWpEkOjPlgVcVpJ1wYHDeJk=;
Received: from mail-ed1-f68.google.com ([209.85.208.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jVbxG-006v2K-TF
 for kgdb-bugreport@lists.sourceforge.net; Mon, 04 May 2020 14:20:26 +0000
Received: by mail-ed1-f68.google.com with SMTP id d16so13670258edv.8
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 04 May 2020 07:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gg7NmM+Hl82lwFdgF23a7OUMDRxdbsm38gnonOFK+XM=;
 b=OtcfT3XmsZeMwk96Rl8rcxQGQ20k09Xulay6gvzipRn3NlRcQkFrbMfWOFPwWD0Udp
 KUxpQ9mpkVnLl4IJpDjdeAFyb7QY1Ztvksf88s71NjcGcFHwGDo3y2eI46Qem/VL545D
 DW1FadNzvOBtVQlPAoFy7v3ZePPe70S17W6p8017ITbzBYHGTYL2oVqGSrOj6Oj8kxNG
 0ctCirWtHZ/lM9u/cbRbG9gzO/ciEm8TLv7S3p5GoZTuhyoHcisnTuDIPOzvPuOAMENe
 10hqktoKB3Thb9hLD9lPf8eUJRAWkyCBvP+JEjye4H+fZN3qPIBF7BVh0WebTFVR1YFs
 7m0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gg7NmM+Hl82lwFdgF23a7OUMDRxdbsm38gnonOFK+XM=;
 b=j0fXCLUV/FTPqob6epfLQr3bELm+u/WOIaZJKMr3b1ojbjEhLtX1+lc33/unsTGjmf
 JNKRbYPZaUzA9H7vaxJB4cbEwQTNOHoJRK0crCZ46/qc6aKfvhnPdv+M8rZMxWk/uahU
 pLlBcKzhmpt/phnHFf0x1/+13VNtjyEpoJNlV0s7OHP1lEVRjSmeZpj1EQg/hFi01zOI
 3U45+Fpu4v6iRHIj0phO4pHYEI5N8cm/5E/E9JRpAA38gEoeAbB7ISM1oeJWfgZdlctp
 PZcRCMZVf/etc8E5fPS31vT35uzYfPs4D4kVTGl2poGaldVPUEIEXVh5vLM2tmyMMzFo
 e5Gg==
X-Gm-Message-State: AGi0Pua/93kCiFGNulVFrsZKOXvRuRnVzpH9UAl4wkyzKG6e0VswkCh4
 2vDKMN6WzMg5y2wrzTuv599J9yiHfWUuPQ==
X-Google-Smtp-Source: APiQypIOX7rEevV8DV08zsAzTwALQGpi+aP6uOBbCyr7RezF9Vt+lnOQuBRpDbnD1Wdb4rh7Uri8gQ==
X-Received: by 2002:adf:b246:: with SMTP id y6mr19864355wra.205.1588601597742; 
 Mon, 04 May 2020 07:13:17 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id q187sm13437406wma.41.2020.05.04.07.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 07:13:17 -0700 (PDT)
Date: Mon, 4 May 2020 15:13:15 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20200504141315.oo7uxb6y75l6tv32@holly.lan>
References: <20200428211351.85055-1-dianders@chromium.org>
 <20200428141218.v3.7.I8fba5961bf452ab92350654aa61957f23ecf0100@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428141218.v3.7.I8fba5961bf452ab92350654aa61957f23ecf0100@changeid>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.68 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jVbxG-006v2K-TF
Subject: Re: [Kgdb-bugreport] [PATCH v3 07/11] kgdboc: Add kgdboc_earlycon
 to support early kgdb using boot consoles
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
Cc: catalin.marinas@arm.com, corbet@lwn.net,
 kgdb-bugreport@lists.sourceforge.net, jason.wessel@windriver.com,
 hpa@zytor.com, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
 agross@kernel.org, bp@alien8.de, linux-serial@vger.kernel.org,
 gregkh@linuxfoundation.org, jslaby@suse.com, tglx@linutronix.de,
 will@kernel.org, mingo@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, Apr 28, 2020 at 02:13:47PM -0700, Douglas Anderson wrote:
> We want to enable kgdb to debug the early parts of the kernel.
> Unfortunately kgdb normally is a client of the tty API in the kernel
> and serial drivers don't register to the tty layer until fairly late
> in the boot process.
> 
> Serial drivers do, however, commonly register a boot console.  Let's
> enable the kgdboc driver to work with boot consoles to provide early
> debugging.
> 
> This change co-opts the existing read() function pointer that's part
> of "struct console".  It's assumed that if a boot console (with the
> flag CON_BOOT) has implemented read() that both the read() and write()
> function are polling functions.  That means they work without
> interrupts and read() will return immediately (with 0 bytes read) if
> there's nothing to read.  This should be a safe assumption since it
> appears that no current boot consoles implement read() right now and
> there seems no reason to do so unless they wanted to support
> "kgdboc_earlycon".
> 
> The console API isn't really intended to have clients work with it
> like we're doing.  Specifically there doesn't appear to be any way for
> clients to be notified about a boot console being unregistered.  We'll
> work around this by checking that our console is still valid before
> using it.  We'll also try to transition off of the boot console and
> onto the "tty" API as quickly as possible.
> 
> The normal/expected way to make all this work is to use
> "kgdboc_earlycon" and "kgdboc" together.  You should point them both
> to the same physical serial connection.  At boot time, as the system
> transitions from the boot console to the normal console, kgdb will
> switch over.  If you don't use things in the normal/expected way it's
> a bit of a buyer-beware situation.  Things thought about:
> 
> - If you specify only "kgdboc_earlycon" but not "kgdboc" and the boot
>   console vanishes at a weird time we'll panic if someone tries to
>   drop into kgdb.
> - If you use "keep_bootcon" (which is already a bit of a buyer-beware
>   option) and specify "kgdboc_earlycon" but not "kgdboc" we'll keep
>   trying to use your boot console for kgdb.
> - If your "kgdboc_earlycon" and "kgdboc" devices are not the same
>   device things should work OK, but it'll be your job to switch over
>   which device you're monitoring (including figuring out how to switch
>   over gdb in-flight if you're using it).

As mentioned in other threads. If we are changing the way we manage the
lifetime of the consoles I think it would be good to squash that change
down and simplify some of these cases.


> When trying to enable "kgdboc_earlycon" it should be noted that the
> names that are registered through the boot console layer and the tty
> layer are not the same for the same port.  For example when debugging
> on one board I'd need to pass "kgdboc_earlycon=qcom_geni
> kgdboc=ttyMSM0" to enable things properly.  Since digging up the boot
> console name is a pain and there will rarely be more than one boot
> console enabled, you can provide the "kgdboc_earlycon" parameter
> without specifying the name of the boot console.  In this case we'll
> just pick the first boot that implements read() that we find.
> 
> This new "kgdboc_earlycon" parameter should be contrasted to the
> existing "ekgdboc" parameter.  While both provide a way to debug very
> early, the usage and mechanisms are quite different.  Specifically
> "kgdboc_earlycon" is meant to be used in tandem with "kgdboc" and
> there is a transition from one to the other.  The "ekgdboc" parameter,
> on the other hand, replaces the "kgdboc" parameter.  It runs the same
> logic as the "kgdboc" parameter but just relies on your TTY driver
> being present super early.  The only known usage of the old "ekgdboc"
> parameter is documented as "ekgdboc=kbd earlyprintk=vga".  It should
> be noted that "kbd" has special treatment allowing it to init early as
> a tty device.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Tested-by: Sumit Garg <sumit.garg@linaro.org>
> ---
> I have kept Greg's Reviewed-by and Sumit's Tested-by tags on this
> commit despite changes that aren't totally trivial.  Please yell if
> you disagree with this.  Reasons:
> - Greg's Reviewed-by seemed more an overall acknowledgment that the
>   series wasn't totally insane rather than a detailed review.  I don't
>   think the changes from v2 to v3 change that.
> - Sumit's Tested-by seemed useful as confirmation that someone else
>   made this work on a machine that wasn't mine.  I don't believe that
>   the changes from v2 to v3 should affect anything here.
> 
> Changes in v3:
> - Add deinit() to I/O ops to know a driver can be replaced.
> - Don't just neuter input, panic if earlycon vanishes.
> - No extra param to kgdb_register_io_module().
> - Renamed earlycon_kgdboc to kgdboc_earlycon.
> - Simplify earlycon_kgdb deinit by using the deinit() function.
> 
> Changes in v2:
> - Assumes we have ("kgdb: Disable WARN_CONSOLE_UNLOCKED for all kgdb")
> - Fix kgdbts, tty/mips_ejtag_fdc, and usb/early/ehci-dbgp
> 
>  drivers/tty/serial/kgdboc.c | 136 ++++++++++++++++++++++++++++++++++++
>  include/linux/kgdb.h        |   4 ++
>  kernel/debug/debug_core.c   |  23 ++++--
>  3 files changed, 159 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
> index 519d8cfbfbed..7aca0a67fc0b 100644
> --- a/drivers/tty/serial/kgdboc.c
> +++ b/drivers/tty/serial/kgdboc.c
> @@ -21,6 +21,7 @@
>  #include <linux/input.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/serial_core.h>
>  
>  #define MAX_CONFIG_LEN		40
>  
> @@ -42,6 +43,13 @@ static int			kgdb_tty_line;
>  
>  static struct platform_device *kgdboc_pdev;
>  
> +#ifdef CONFIG_KGDB_SERIAL_CONSOLE

Isn't this always set for this file (see Makefile)?

I think all the instances of this check (and the diligent
#else clauses are redundant).

> +static struct kgdb_io		kgdboc_earlycon_io_ops;
> +struct console			*earlycon;

static?


> <snip>
> diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> index b072aeb1fd78..77a3c519478a 100644
> --- a/include/linux/kgdb.h
> +++ b/include/linux/kgdb.h
> @@ -1075,15 +1075,21 @@ EXPORT_SYMBOL_GPL(kgdb_schedule_breakpoint);
>   */
>  int kgdb_register_io_module(struct kgdb_io *new_dbg_io_ops)
>  {
> +	struct kgdb_io *old_dbg_io_ops;
>  	int err;
>  
>  	spin_lock(&kgdb_registration_lock);
>  
> -	if (dbg_io_ops) {
> -		spin_unlock(&kgdb_registration_lock);
> +	old_dbg_io_ops = dbg_io_ops;
> +	if (old_dbg_io_ops) {
> +		if (!old_dbg_io_ops->deinit) {
> +			spin_unlock(&kgdb_registration_lock);
>  
> -		pr_err("Another I/O driver is already registered with KGDB\n");
> -		return -EBUSY;
> +			pr_err("KGDB I/O driver %s can't replace %s.\n",
> +				new_dbg_io_ops->name, old_dbg_io_ops->name);
> +			return -EBUSY;
> +		}
> +		old_dbg_io_ops->deinit();
>  	}
>  
>  	if (new_dbg_io_ops->init) {
> @@ -1098,6 +1104,12 @@ int kgdb_register_io_module(struct kgdb_io *new_dbg_io_ops)
>  
>  	spin_unlock(&kgdb_registration_lock);
>  
> +	if (old_dbg_io_ops) {
> +		pr_info("Replaced I/O driver %s with %s\n",
> +			old_dbg_io_ops->name, new_dbg_io_ops->name);

I know that causes no trouble for the current deinit() method does but 
I'd be more comfortable if the core printed this before calling deinit()?


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
