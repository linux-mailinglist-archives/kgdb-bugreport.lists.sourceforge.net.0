Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B43611BCE49
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 28 Apr 2020 23:14:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jTXYh-0004MK-Hl
	for lists+kgdb-bugreport@lfdr.de; Tue, 28 Apr 2020 21:14:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jTXYf-0004M8-Sg
 for kgdb-bugreport@lists.sourceforge.net; Tue, 28 Apr 2020 21:14:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=blBX9PWhrLwlRC4CxObQ1qK+sOW74s4G2bfD1JGu8J0=; b=RTjNDG5cJSuWBgnKMysEK8Y93P
 sbwpqUMBkVqWHN0q3h4p5X/NaHjlliVvef76GdtSr+Afz9fPI1LOeOJafx1f6ufEkGDGG235pV6BX
 8HeM9taKNXJIu3jphK+CkEXXDQcVCsYGuVZ5YCmab6xlyig8GJaDcTbBu/lHTfr4C4Og=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=blBX9PWhrLwlRC4CxObQ1qK+sOW74s4G2bfD1JGu8J0=; b=V
 XaW1qISxcas9TmS481ttKIy6GgTnnmJhIOUmh2T1/uvuHuGhI8jkXKE7YBNXYFICb2UGa5IUacazq
 EaP/Lq308CFEnhCKF8Ue13C6GvLyan9y5UB9Cp8tCKfC/QNomBnabN73SPLOBMCxvaMwsGgqHQQ3l
 XoCuHuLjTOENPntM=;
Received: from mail-pj1-f67.google.com ([209.85.216.67])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jTXYe-002zI4-3B
 for kgdb-bugreport@lists.sourceforge.net; Tue, 28 Apr 2020 21:14:25 +0000
Received: by mail-pj1-f67.google.com with SMTP id a32so47253pje.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 28 Apr 2020 14:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=blBX9PWhrLwlRC4CxObQ1qK+sOW74s4G2bfD1JGu8J0=;
 b=UNNXZ0gcnR3k6hJj/LbVp66fJcTUI1AFvWnj3RHMoXFYmyCcp6PtCAYQY6fvgKQeJD
 MNV2wxAxPwLdM2hLs+qKupu4j9AUnqtqg77PSykw/jl+HCbCHt+4x9VIpHELo/PYeprO
 ilL6JtVgwda3tXbtK2W1ejaJ71UjYuT29uXvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=blBX9PWhrLwlRC4CxObQ1qK+sOW74s4G2bfD1JGu8J0=;
 b=FBwJ0T5BMVnZoxnZ7/4je/SH9OcXDLo5IosRzKhKWqIfj2SElqkmKoPt5EBw+ranFB
 nVNGGWOrLxvV/Kv8z0jamllCIb7CpslHRPgQjVDikn04EDBVHPKU4pWMGyzi3TEmiiod
 PKkNt+8cKIa8oLLbCEE9tFkCrgYmQmlUlXAH8sKXUI+Hq4EMJrlvpdl2bLEQJnAiE8YH
 OiFiucqwl7hdDABr99p7VfZ2qfExTnMLEIvgmS2P0ALh4COJb7/AuIGmbIgexrZY9FBG
 CvFXHmT2tTKs/71fl7mrP8fBIA+9Gz2WZvxypmIq7o/20Y9B96ysZzgXwCtJuia4dCCU
 ogBA==
X-Gm-Message-State: AGi0PuY/PNwyghndLUqK6TGbLfY9Qw5bLhHEVqq7WilbcFh9my6dfjJ3
 UpDhlB11AdPpLKwgKlN1KhBFJw==
X-Google-Smtp-Source: APiQypLBYIwFGtYJq3pkWPIKkLwZi7SFfBVlMgfwE6B5z2rF+bbbLHTii8gKjfoQdnIZvUKuTl6BCA==
X-Received: by 2002:a17:90a:718c:: with SMTP id
 i12mr7485056pjk.58.1588108458221; 
 Tue, 28 Apr 2020 14:14:18 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id 18sm2988202pjf.30.2020.04.28.14.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 14:14:17 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 gregkh@linuxfoundation.org
Date: Tue, 28 Apr 2020 14:13:40 -0700
Message-Id: <20200428211351.85055-1-dianders@chromium.org>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jTXYe-002zI4-3B
Subject: [Kgdb-bugreport] [PATCH v3 00/11] kgdb: Support late serial drivers;
 enable early debug w/ boot consoles
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
 kgdb-bugreport@lists.sourceforge.net, bjorn.andersson@linaro.org,
 hpa@zytor.com, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 corbet@lwn.net, will@kernel.org, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 jinho lim <jordan.lim@samsung.com>, agross@kernel.org,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
 catalin.marinas@arm.com, Dave Martin <Dave.Martin@arm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, linux-arm-msm@vger.kernel.org,
 jslaby@suse.com, Alexios Zavras <alexios.zavras@intel.com>, bp@alien8.de,
 tglx@linutronix.de, mingo@redhat.com, Allison Randal <allison@lohutok.net>,
 Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
 James Morse <james.morse@arm.com>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

This whole pile of patches was motivated by me trying to get kgdb to
work properly on a platform where my serial driver ended up being hit
by the -EPROBE_DEFER virus (it wasn't practicing social distancing
from other drivers).  Specifically my serial driver's parent device
depended on a resource that wasn't available when its probe was first
called.  It returned -EPROBE_DEFER which meant that when "kgdboc"
tried to run its setup the serial driver wasn't there.  Unfortunately
"kgdboc" never tried again, so that meant that kgdb was disabled until
I manually enalbed it via sysfs.

While I could try to figure out how to get around the -EPROBE_DEFER
somehow, the above problems could happen to anyone and -EPROBE_DEFER
is generally considered something you just have to live with.  In any
case the current "kgdboc" setup is a bit of a race waiting to happen.
I _think_ I saw during early testing that even adding a msleep() in
the typical serial driver's probe() is enough to trigger similar
issues.

I decided that for the above race the best attitude to get kgdb to
register at boot was probably "if you can't beat 'em, join 'em".
Thus, "kgdboc" now jumps on the -EPROBE_DEFER bandwagon (now that my
driver uses it it's no longer a virus).  It does so a little awkwardly
because "kgdboc" hasn't normally had a "struct device" associated with
it, but it's really not _that_ ugly to make a platform device and
seems less ugly than alternatives.

Unfortunately now on my system the debugger is one of the last things
to register at boot.  That's OK for debugging problems that show up
significantly after boot, but isn't so hot for all the boot problems
that I end up debugging.  This motivated me to try to get something
working a little earlier.

My first attempt was to try to get the existing "ekgdboc" to work
earlier.  I tried that for a bit until I realized that it needed to
work at the tty layer and I couldn't find any serial drivers that
managed to register themselves to the tty layer super early at boot.
The only documented use of "ekgdboc" is "ekgdboc=kbd" and that's a bit
of a special snowflake.  Trying to get my serial driver and all its
dependencies to probe normally and register the tty driver super early
at boot seemed like a bad way to go.  In fact, all the complexity
needed to do something like this is why the system already has a
special concept of a "boot console" that lives only long enough to
transition to the normal console.

Leveraging the boot console seemed like a good way to go and that's
what this series does.  I found that consoles could have a read()
function, though I couldn't find anyone who implemented it.  I
implemented it for two serial drivers for the devices I had easy
access to, making the assumption that for boot consoles that we could
assume read() and write() were polling-compatible (seems sane I
think).

Now anyone who makes a small change to their serial driver can easily
enable early kgdb debugging!

The devices I had for testing were:
- arm32: rk3288-veyron-jerry
- arm64: rk3399-gru-kevin
- arm64: qcom-sc7180-trogdor (not mainline yet)

These are the devices I tested this series on.  I tried to test
various combinations of enabling/disabling various options and I
hopefully caught the corner cases, but I'd appreciate any extra
testing people can do.  Notably I didn't test on x86, but (I think) I
didn't touch much there so I shouldn't have broken anything.

When testing I found a few problems with actually dropping into the
debugger super early on arm and arm64 devices.  Patches in this series
should help with this.  For arm I just avoid dropping into the
debugger until a little later and for arm64 I actually enable
debugging super early.

I realize that bits of this series might feel a little hacky, though
I've tried to do things in the cleanest way I could without overly
interferring with the rest of the kernel.  If you hate the way I
solved a problem I would love it if you could provide guidance on how
you think I could solve the problem better.

This series (and my comments / documentation / commit messages) are
now long enough that my eyes glaze over when I try to read it all over
to double-check.  I've nontheless tried to double-check it, but I'm
pretty sure I did something stupid.  Thank you ahead of time for
pointing it out to me so I can fix it in v4.  If somehow I managed to
not do anything stupid (really?) then thank you for double-checking me
anyway.

NOTE: v3 of the patch series tacks on support for an extra serial
driver from Sumit Garg.  I've piled it onto the end of my series at
his request just to keep everything together.

Changes in v3:
- ("kgdb: Prevent infinite recursive entries to the debugger") new for v3.
- ("serial: amba-pl011: Support kgdboc_earlycon") pulled into my v3.
- Add deinit() to I/O ops to know a driver can be replaced.
- Added example in kgdb.rst
- Change boolean weak function to KConfig.
- Don't just neuter input, panic if earlycon vanishes.
- No extra param to kgdb_register_io_module().
- Removed unneeded sentence in kerenel-parameters doc.
- Renamed earlycon_kgdboc to kgdboc_earlycon.
- Simplify earlycon_kgdb deinit by using the deinit() function.
- Suggest people use kgdboc_earlycon instead of ekgdboc.
- { ; } ==> { }

Changes in v2:
- ("Revert "kgdboc: disable the console lock when in kgdb"") new for v2.
- ("kgdb: Disable WARN_CONSOLE_UNLOCKED for all kgdb") new for v2.
- Assumes we have ("kgdb: Disable WARN_CONSOLE_UNLOCKED for all kgdb")
- Fix kgdbts, tty/mips_ejtag_fdc, and usb/early/ehci-dbgp

Douglas Anderson (10):
  kgdb: Disable WARN_CONSOLE_UNLOCKED for all kgdb
  Revert "kgdboc: disable the console lock when in kgdb"
  kgdboc: Use a platform device to handle tty drivers showing up late
  kgdb: Delay "kgdbwait" to dbg_late_init() by default
  arm64: Add call_break_hook() to early_brk64() for early kgdb
  kgdb: Prevent infinite recursive entries to the debugger
  kgdboc: Add kgdboc_earlycon to support early kgdb using boot consoles
  Documentation: kgdboc: Document new kgdboc_earlycon parameter
  serial: qcom_geni_serial: Support kgdboc_earlycon
  serial: 8250_early: Support kgdboc_earlycon

Sumit Garg (1):
  serial: amba-pl011: Support kgdboc_earlycon

 .../admin-guide/kernel-parameters.txt         |  20 ++
 Documentation/dev-tools/kgdb.rst              |  24 ++
 arch/arm64/Kconfig                            |   1 +
 arch/arm64/include/asm/debug-monitors.h       |   2 +
 arch/arm64/kernel/debug-monitors.c            |   2 +-
 arch/arm64/kernel/traps.c                     |   3 +
 arch/x86/Kconfig                              |   1 +
 drivers/tty/serial/8250/8250_early.c          |  23 ++
 drivers/tty/serial/amba-pl011.c               |  32 +++
 drivers/tty/serial/kgdboc.c                   | 266 ++++++++++++++++--
 drivers/tty/serial/qcom_geni_serial.c         |  32 +++
 include/linux/kgdb.h                          |   4 +
 kernel/debug/debug_core.c                     |  53 +++-
 lib/Kconfig.kgdb                              |  18 ++
 14 files changed, 437 insertions(+), 44 deletions(-)

-- 
2.26.2.303.gf8c07b1a785-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
