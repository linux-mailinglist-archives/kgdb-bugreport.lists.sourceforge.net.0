Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC551B702E
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 24 Apr 2020 11:00:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jRuC1-0001Qe-TP
	for lists+kgdb-bugreport@lfdr.de; Fri, 24 Apr 2020 09:00:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jRuC0-0001QX-5z
 for kgdb-bugreport@lists.sourceforge.net; Fri, 24 Apr 2020 09:00:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vtIuMHtDQNbUkYiyGCewCL5qq4bdMRkvjQNJoxEX90Y=; b=cvs5QY16Pwf+4+fv+G9ZOS54pK
 M2MP4uDqdss0JO5DB7EyJ5hD0wPq1M8zOY4R8Owr+Kc7bV2ynt0Nn3SNdMcYwPlJr4mRahrgVAeea
 wKkpjxvaI6wJCe8viTJRtM+rLURHe+InIxa0cWK8IZ6NAeADXdnap1gFAjDxtSL4RSDs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vtIuMHtDQNbUkYiyGCewCL5qq4bdMRkvjQNJoxEX90Y=; b=lNCvSn6lkJiWCFvkcMDGLCCdy8
 YLgub8YLpcwfixgAsQ9ucGkZABGZZtR5LW9SfilmO485ADK1zQpCSkSAe1euXbvmu5aTbnUJl8yAV
 YodQcEpVsBh1MKmtnTWyJ/QJLsw76b4yTaML4xwxAHeAYPNhUYOInkT88w+yOYf5amK0=;
Received: from mail-wr1-f67.google.com ([209.85.221.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jRuBv-008iSH-5K
 for kgdb-bugreport@lists.sourceforge.net; Fri, 24 Apr 2020 09:00:16 +0000
Received: by mail-wr1-f67.google.com with SMTP id k13so9812027wrw.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 24 Apr 2020 02:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vtIuMHtDQNbUkYiyGCewCL5qq4bdMRkvjQNJoxEX90Y=;
 b=E5TR5U/ti8UbcZkhHjHp05W4nW0Fdwmum61DYClA3pnOQk28f3S4Sm7dJms3ttbTa4
 u5Hk8HLtQ3JTejDM+6l0RYq6mBdhrlQQvtoonaS2QVQvJ+UCJj4xM48AChxCSBRnGucl
 /OK/rjE3XwHyVm0vbMaMuW52akQSLqQ1VbNtnEh0ma/fMRVDT0SVdfEzNCOQsWl+eHiX
 CCiQYNTkoYQ44KgBXNFN9FjtI4LFkP8hOeAL8KrYpM4hvBSH8hy1B6msiMYQ4z40mK6n
 e832Na1hjua3X5gLLZ+uzaO0gaMAvXyD+CVbWgtS1C/YpqrRwgyw4Hac3526NtkQ33g4
 +Nmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vtIuMHtDQNbUkYiyGCewCL5qq4bdMRkvjQNJoxEX90Y=;
 b=L9WbDTvxbEbgHykVW5biNCY2RHIRBA36pDW3An0y7IuC0E/wVSNNjr4XIa2ujc6gLQ
 BdEK4rL3r0WO8zWpq4EEAVPufA1M2tEEKNkCByqPGzIzjxBVdZYH9zJWI4kNUsHYG+UF
 0iUngBwMsAP3UCrKmNRZt35fBmMk0jPOu3dckmpA4q6srek6+ZiCBBJR0w4prZeYSFAr
 axxj6zNDA7LgUR7dsxBY90w0FWxoH8LuyFljNoMiUCZXehUNIGq/WDjf9E3A3H/22XFN
 /gEvNOPvrUGXRChBL6A1+eBMKd/KpaeLjmyS+I7r7NC0+yKPog/61malyAVwhaz4PtCV
 Z2Yw==
X-Gm-Message-State: AGi0PuZMJ5YjKaS3PUBph63NCOCtLMHynkrXWzvV5piWqRbLbb50R0KN
 4hRjmTeFh4cjepm3oZl5XPMRAz+H0Cyt7riYMVs7ZkP5GslNHg==
X-Google-Smtp-Source: APiQypIkXSYq75oud+geYKztGp1zVvLyeV4eAXIhZHV9gbwzB249EXNzN7DCYI5YSTmzyhHFC4UvTl5L8v3vPzL+ux4=
X-Received: by 2002:ac2:5544:: with SMTP id l4mr5256550lfk.122.1587717183077; 
 Fri, 24 Apr 2020 01:33:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200421211447.193860-1-dianders@chromium.org>
In-Reply-To: <20200421211447.193860-1-dianders@chromium.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 24 Apr 2020 14:02:51 +0530
Message-ID: <CAFA6WYMsN1Ep0WE2ngR4jzLuOHz7aDYP7ZL1Pmome2W9A9qKig@mail.gmail.com>
To: Douglas Anderson <dianders@chromium.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.67 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.67 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jRuBv-008iSH-5K
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, catalin.marinas@arm.com,
 bjorn.andersson@linaro.org, Nadav Amit <namit@vmware.com>, hpa@zytor.com,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Matt Mullins <mmullins@fb.com>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, will@kernel.org, x86@kernel.org,
 jinho lim <jordan.lim@samsung.com>, agross@kernel.org,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Allison Randal <allison@lohutok.net>, linux-serial@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, Borislav Petkov <bp@suse.de>,
 Dave Martin <Dave.Martin@arm.com>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org, jslaby@suse.com,
 Alexios Zavras <alexios.zavras@intel.com>, bp@alien8.de, tglx@linutronix.de,
 mingo@redhat.com, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Juergen Gross <jgross@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 James Morse <james.morse@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 jason.wessel@windriver.com, Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Enrico Weigelt <info@metux.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Doug,

On Wed, 22 Apr 2020 at 02:45, Douglas Anderson <dianders@chromium.org> wrote:
>
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
> testing people can do.

earlycon_kgdboc sounds like a really cool feature. So I gave it a try
on my arm64 machine (Developerbox) and it works like a charm. So for
patch 6/9 you can add:

Tested-by: Sumit Garg <sumit.garg@linaro.org>

Plus, in order to enable earlycon_kgdboc on Developerbox I had to
implement the read() function in the early console driver for
amba-pl011 (see patch [1]). It would be great if you could pick that
patch [1] too as part of this series.

[1] https://lkml.org/lkml/2020/4/24/173

-Sumit

>  Notably I didn't test on x86, but (I think) I
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
>
> --
> 2.26.1.301.g55bc3eb7cb9-goog
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
