	by mail.lfdr.de (Postfix) with ESMTPS id 8CD111A4C33
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 11 Apr 2020 00:46:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	id 1jN2Ps-00080N-CB
	for lists+kgdb-bugreport@lfdr.de; Fri, 10 Apr 2020 22:46:28 +0000
 (envelope-from <dianders@chromium.org>) id 1jN2Pr-00080B-47
 for kgdb-bugreport@lists.sourceforge.net; Fri, 10 Apr 2020 22:46:27 +0000
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 bh=zWmbbFUQQjeDm+gMt8s5CKmqbSjpsn0Bs7Vf6igbDN0=; b=Yb0XM2RirbKZzk42k7O08d3lph
 BH2oCCdQB0U9ZeFZXeZS7isDTBDupYu/RUv+lPWQ4ytXpAMCIpwpgbnvuTxprxJd6gNYntWmSLzjA
 UPgw9SHKPuObQKw/OOhlD+rck4rRACv1lnM49/mHTNBKKZMOi4waVCS/Nq0nXw1P7RLc=;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zWmbbFUQQjeDm+gMt8s5CKmqbSjpsn0Bs7Vf6igbDN0=; b=K
 24t//eVbK19HUXCclw40sNlzKtaE8tLtE7bimwlFp7uxS0QZGOiqsjQzzUk9R4H1EhzqHPY/uUbaX
 iYwdFyUuDqMrr4REisHPYKXmydo6LQhzFgTuBO3ICSlomVFKHE/SirSmcP6hxeVY1sSv9uLI3YXPn
 zd8dj9sGuVXtWyTk=;
Received: from mail-pf1-f195.google.com ([209.85.210.195])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 id 1jN2Pm-00B3pD-NN
 for kgdb-bugreport@lists.sourceforge.net; Fri, 10 Apr 2020 22:46:26 +0000
Received: by mail-pf1-f195.google.com with SMTP id k15so1622730pfh.6
 Fri, 10 Apr 2020 15:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zWmbbFUQQjeDm+gMt8s5CKmqbSjpsn0Bs7Vf6igbDN0=;
 b=e3lTJwDeR+Nav+528OsUsNEAU/mQAvnOqDzBkyDMHmonykZKMLV0VVtUTENE3pD7Q6
 GnFU+SMC26o3A55F4t3Tt68x4vLPjqJkRXN3RzuTpsdN8C5J50qTnKOpIr9VsyCZ+cLV
 i9mbvKSAC+qjGIAx9O/tI70iccionOxKrTrQw=
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zWmbbFUQQjeDm+gMt8s5CKmqbSjpsn0Bs7Vf6igbDN0=;
 b=FQJxpIBdFdynpPApofgWZ2kDhITxsRRjSd5P3BpCRDmzLwaxdEthe5n2hCDbQn54MP
 bKx3LWhpL6yzZIfmiShHnBQWw/xHprc3Acl1Zqwo0S5V7XhpxEAi4NzAR08MRwrNQcm5
 sNUkntpvKpXCrzLavG/6ac3y/nUk6MFVxM5cLjQLbvodqBPs7xNAB8jXWUuMP4xXDoFS
 ZWKkZeoUPABlwkunqxQ4yeS2UVIQhSx0X1Y7Ylp9Zn/WC0ADBTQZzGvsUgLo/AzpM7qO
 O3Z8VzTuE8jhDs2A3yPhE4SxiIEoiwcibiepNzfn9Muw2/EHXE0kikWufQC1rJkSl+51
 dccw==
X-Gm-Message-State: AGi0PuaEtt/e/Zpb7vn+QhoZQbHOWxd+75gXVhsGyMQ6afX0jTMNpD+L
 ENBTRr7YMb8EcSGL2jA9Cd3Ik1sEs8MAog==
X-Google-Smtp-Source: APiQypL5THpk7QNDWCyORXPdUOyrfq0oJPG9LZXBe4qj/CEWRQMdNwTa2WA43xoyV7Mu3AgOv45XPQ==
X-Received: by 2002:a65:5b4f:: with SMTP id y15mr6701497pgr.134.1586557099575; 
 Fri, 10 Apr 2020 15:18:19 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id x2sm2646600pfq.92.2020.04.10.15.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2020 15:18:19 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
 gregkh@linuxfoundation.org
Date: Fri, 10 Apr 2020 15:17:19 -0700
Message-Id: <20200410221726.36442-1-dianders@chromium.org>
X-Mailer: git-send-email 2.26.0.110.g2183baf09c-goog
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
 trust [209.85.210.195 listed in list.dnswl.org]
 [209.85.210.195 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jN2Pm-00B3pD-NN
Subject: [Kgdb-bugreport] [PATCH 0/7] kgdb: Support late serial drivers;
 enable early debug w/ boot consoles
Cc: Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, catalin.marinas@arm.com,
 bjorn.andersson@linaro.org, Nadav Amit <namit@vmware.com>, hpa@zytor.com,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, will@kernel.org,
 Matt Mullins <mmullins@fb.com>, corbet@lwn.net, x86@kernel.org,
 jinho lim <jordan.lim@samsung.com>, agross@kernel.org,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, Dave Martin <Dave.Martin@arm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, linux-arm-msm@vger.kernel.org,
 jslaby@suse.com, Alexios Zavras <alexios.zavras@intel.com>, bp@alien8.de,
 Josh Poimboeuf <jpoimboe@redhat.com>, tglx@linutronix.de, mingo@redhat.com,
 Allison Randal <allison@lohutok.net>, Juergen Gross <jgross@suse.com>,
 Oliver Neukum <oneukum@suse.com>, linux-kernel@vger.kernel.org,
 James Morse <james.morse@arm.com>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>, Enrico Weigelt <info@metux.net>
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
pointing it out to me so I can fix it in v2.  If somehow I managed to
not do anything stupid (really?) then thank you for double-checking me
anyway.


Douglas Anderson (7):
  kgdboc: Use a platform device to handle tty drivers showing up late
  kgdb: Delay "kgdbwait" to dbg_late_init() by default
  arm64: Add call_break_hook() to early_brk64() for early kgdb
  kgdboc: Add earlycon_kgdboc to support early kgdb using boot consoles
  Documentation: kgdboc: Document new earlycon_kgdboc parameter
  serial: qcom_geni_serial: Support earlycon_kgdboc
  serial: 8250_early: Support earlycon_kgdboc
 .../admin-guide/kernel-parameters.txt         |  20 ++
 Documentation/dev-tools/kgdb.rst              |  14 +
 arch/arm64/include/asm/debug-monitors.h       |   2 +
 arch/arm64/kernel/debug-monitors.c            |   2 +-
 arch/arm64/kernel/kgdb.c                      |   5 +
 arch/arm64/kernel/traps.c                     |   3 +
 arch/x86/kernel/kgdb.c                        |   5 +
 drivers/tty/serial/8250/8250_early.c          |  23 ++
 drivers/tty/serial/kgdboc.c                   | 266 ++++++++++++++++--
 drivers/tty/serial/qcom_geni_serial.c         |  32 +++
 include/linux/kgdb.h                          |  25 +-
 kernel/debug/debug_core.c                     |  44 ++-
 12 files changed, 401 insertions(+), 40 deletions(-)
2.26.0.110.g2183baf09c-goog