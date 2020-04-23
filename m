Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E30741B5CED
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 23 Apr 2020 15:50:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jRcFX-00081X-OZ
	for lists+kgdb-bugreport@lfdr.de; Thu, 23 Apr 2020 13:50:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gregkh@linuxfoundation.org>) id 1jRcFW-00081P-1h
 for kgdb-bugreport@lists.sourceforge.net; Thu, 23 Apr 2020 13:50:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WZK8531Xv2eKN4jtKbNg4PDxWjeOzO00uX7Y8sAi+hY=; b=HLOPGwYogz4xHUMnGDJh/M2362
 Mi015uYAWE+b2MS/LjOtckCt09AW1DQtwcliFPoMCFKzdcdzWKF3M1GenxPjgJ94DiJWrDL+rqLi8
 Gjcb4pR8VquBKMcUL7fqiJ6sI9i9YwPiHFyL0pFD4zcrAL3+fp9b+ulqBNMxtU6renPE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WZK8531Xv2eKN4jtKbNg4PDxWjeOzO00uX7Y8sAi+hY=; b=i/vEAaFWEYbj/bnD8LU4INNAOC
 P5ZyPhTvF6kNtR0SCz97B2uTCenI1MoAP2GeF5Ro0W+cX0I/LHRmggaiLjl3/f7KSQOFAloCHPfZ1
 zj7azcJLACYUNQY4ipKlLBLdN+mwuXngXTkZBWKGPICSUbXld+buRY2ae/ElshLG+x0A=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jRcFT-00BHJr-9u
 for kgdb-bugreport@lists.sourceforge.net; Thu, 23 Apr 2020 13:50:42 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3BFEB20728;
 Thu, 23 Apr 2020 13:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587649833;
 bh=Zl7NuDjGvPHVLfMVDJIvKZWGpQWblUX8qdNJAHq1Tr8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rtRmKMGa59ZzrLxzNTg+TXuM9mxHpLgKLQhjZLLNvtfpddzm7hI1VwnniqsV6bwDM
 8N2/eCvUHDcmPP+1YOGNEgVBevpeEo4iTDASVgWq5AsAVxMYnUxdtxKHJBHn4Zn5Y9
 oqFsLK6AoMDPqJDKJaVwDNwTkxQhVsA5qPT2HBuE=
Date: Thu, 23 Apr 2020 15:50:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20200423135031.GA4091353@kroah.com>
References: <20200421211447.193860-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421211447.193860-1-dianders@chromium.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jRcFT-00BHJr-9u
Subject: Re: [Kgdb-bugreport] [PATCH v2 0/9] kgdb: Support late serial
 drivers; enable early debug w/ boot consoles
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, catalin.marinas@arm.com,
 bjorn.andersson@linaro.org, Nadav Amit <namit@vmware.com>, hpa@zytor.com,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, will@kernel.org,
 Matt Mullins <mmullins@fb.com>, daniel.thompson@linaro.org, corbet@lwn.net,
 x86@kernel.org, jinho lim <jordan.lim@samsung.com>, agross@kernel.org,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, Borislav Petkov <bp@suse.de>,
 Dave Martin <Dave.Martin@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org, jslaby@suse.com,
 Alexios Zavras <alexios.zavras@intel.com>, bp@alien8.de, tglx@linutronix.de,
 mingo@redhat.com, Allison Randal <allison@lohutok.net>,
 Juergen Gross <jgross@suse.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>, jason.wessel@windriver.com,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Enrico Weigelt <info@metux.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, Apr 21, 2020 at 02:14:38PM -0700, Douglas Anderson wrote:
> This whole pile of patches was motivated by me trying to get kgdb to
> work properly on a platform where my serial driver ended up being hit
> by the -EPROBE_DEFER virus (it wasn't practicing social distancing
> from other drivers).  Specifically my serial driver's parent device
> depended on a resource that wasn't available when its probe was first
> called.  It returned -EPROBE_DEFER which meant that when "kgdboc"
> tried to run its setup the serial driver wasn't there.  Unfortunately
> "kgdboc" never tried again, so that meant that kgdb was disabled until
> I manually enalbed it via sysfs.
> 
> While I could try to figure out how to get around the -EPROBE_DEFER
> somehow, the above problems could happen to anyone and -EPROBE_DEFER
> is generally considered something you just have to live with.  In any
> case the current "kgdboc" setup is a bit of a race waiting to happen.
> I _think_ I saw during early testing that even adding a msleep() in
> the typical serial driver's probe() is enough to trigger similar
> issues.
> 
> I decided that for the above race the best attitude to get kgdb to
> register at boot was probably "if you can't beat 'em, join 'em".
> Thus, "kgdboc" now jumps on the -EPROBE_DEFER bandwagon (now that my
> driver uses it it's no longer a virus).  It does so a little awkwardly
> because "kgdboc" hasn't normally had a "struct device" associated with
> it, but it's really not _that_ ugly to make a platform device and
> seems less ugly than alternatives.
> 
> Unfortunately now on my system the debugger is one of the last things
> to register at boot.  That's OK for debugging problems that show up
> significantly after boot, but isn't so hot for all the boot problems
> that I end up debugging.  This motivated me to try to get something
> working a little earlier.
> 
> My first attempt was to try to get the existing "ekgdboc" to work
> earlier.  I tried that for a bit until I realized that it needed to
> work at the tty layer and I couldn't find any serial drivers that
> managed to register themselves to the tty layer super early at boot.
> The only documented use of "ekgdboc" is "ekgdboc=kbd" and that's a bit
> of a special snowflake.  Trying to get my serial driver and all its
> dependencies to probe normally and register the tty driver super early
> at boot seemed like a bad way to go.  In fact, all the complexity
> needed to do something like this is why the system already has a
> special concept of a "boot console" that lives only long enough to
> transition to the normal console.
> 
> Leveraging the boot console seemed like a good way to go and that's
> what this series does.  I found that consoles could have a read()
> function, though I couldn't find anyone who implemented it.  I
> implemented it for two serial drivers for the devices I had easy
> access to, making the assumption that for boot consoles that we could
> assume read() and write() were polling-compatible (seems sane I
> think).
> 
> Now anyone who makes a small change to their serial driver can easily
> enable early kgdb debugging!
> 
> The devices I had for testing were:
> - arm32: rk3288-veyron-jerry
> - arm64: rk3399-gru-kevin
> - arm64: qcom-sc7180-trogdor (not mainline yet)
> 
> These are the devices I tested this series on.  I tried to test
> various combinations of enabling/disabling various options and I
> hopefully caught the corner cases, but I'd appreciate any extra
> testing people can do.  Notably I didn't test on x86, but (I think) I
> didn't touch much there so I shouldn't have broken anything.
> 
> When testing I found a few problems with actually dropping into the
> debugger super early on arm and arm64 devices.  Patches in this series
> should help with this.  For arm I just avoid dropping into the
> debugger until a little later and for arm64 I actually enable
> debugging super early.
> 
> I realize that bits of this series might feel a little hacky, though
> I've tried to do things in the cleanest way I could without overly
> interferring with the rest of the kernel.  If you hate the way I
> solved a problem I would love it if you could provide guidance on how
> you think I could solve the problem better.
> 
> This series (and my comments / documentation / commit messages) are
> now long enough that my eyes glaze over when I try to read it all over
> to double-check.  I've nontheless tried to double-check it, but I'm
> pretty sure I did something stupid.  Thank you ahead of time for
> pointing it out to me so I can fix it in v3.  If somehow I managed to
> not do anything stupid (really?) then thank you for double-checking me
> anyway.
> 
> Changes in v2:
> - ("kgdb: Disable WARN_CONSOLE_UNLOCKED for all kgdb") new for v2.
> - ("Revert "kgdboc: disable the console lock when in kgdb"") new for v2.
> - Assumes we have ("kgdb: Disable WARN_CONSOLE_UNLOCKED for all kgdb")
> - Fix kgdbts, tty/mips_ejtag_fdc, and usb/early/ehci-dbgp
> 
> Douglas Anderson (9):
>   kgdb: Disable WARN_CONSOLE_UNLOCKED for all kgdb
>   Revert "kgdboc: disable the console lock when in kgdb"
>   kgdboc: Use a platform device to handle tty drivers showing up late
>   kgdb: Delay "kgdbwait" to dbg_late_init() by default
>   arm64: Add call_break_hook() to early_brk64() for early kgdb
>   kgdboc: Add earlycon_kgdboc to support early kgdb using boot consoles
>   Documentation: kgdboc: Document new earlycon_kgdboc parameter
>   serial: qcom_geni_serial: Support earlycon_kgdboc
>   serial: 8250_early: Support earlycon_kgdboc
> 
>  .../admin-guide/kernel-parameters.txt         |  20 ++
>  Documentation/dev-tools/kgdb.rst              |  14 +
>  arch/arm64/include/asm/debug-monitors.h       |   2 +
>  arch/arm64/kernel/debug-monitors.c            |   2 +-
>  arch/arm64/kernel/kgdb.c                      |   5 +
>  arch/arm64/kernel/traps.c                     |   3 +
>  arch/x86/kernel/kgdb.c                        |   5 +
>  drivers/misc/kgdbts.c                         |   2 +-
>  drivers/tty/mips_ejtag_fdc.c                  |   2 +-
>  drivers/tty/serial/8250/8250_early.c          |  23 ++
>  drivers/tty/serial/kgdboc.c                   | 262 ++++++++++++++++--
>  drivers/tty/serial/qcom_geni_serial.c         |  32 +++
>  drivers/usb/early/ehci-dbgp.c                 |   2 +-
>  include/linux/kgdb.h                          |  25 +-
>  kernel/debug/debug_core.c                     |  48 +++-
>  15 files changed, 400 insertions(+), 47 deletions(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
