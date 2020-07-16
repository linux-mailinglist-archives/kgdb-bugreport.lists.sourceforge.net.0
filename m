Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 36917222134
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 16 Jul 2020 13:17:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jw1sq-0003M2-Vy
	for lists+kgdb-bugreport@lfdr.de; Thu, 16 Jul 2020 11:17:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <keescook@chromium.org>) id 1jvuGa-0003rx-5r
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Jul 2020 03:09:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/eo13gw5fJCvhJnxKm6L26qmA1xy2iBEtE20aAjPg9o=; b=UXYo9HwnCNC1oXJiXxz/XebydY
 qf8nLb3VJH6G8hZ44Ed5ks9nanYxfMR3KESAUFriGDM1kPMW21wEWMC+WQUvhrXpWVMF85vpE07y7
 PXBxo18LcoSkByC6dZyvfaCwIPEUo0Up+Q8xTuNmyjuVXDakUIJ76tDdv3S1+pY0Td+s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/eo13gw5fJCvhJnxKm6L26qmA1xy2iBEtE20aAjPg9o=; b=a
 G9N/nXOth2mdaKYk7SLBPQYbsS5Gri2NCvGSzmMpCDzc20UMywQINGipfWekzTT4KllTyIPISeKN+
 5BPH1rpdxDXGhYl6nFh/dsCzYOnpQZEhXw9W/zomWEdygS9YeXrJFCCHFpbnyNH0SQznePLUF2P0U
 uE42r+wDyj5lE0uY=;
Received: from mail-pj1-f65.google.com ([209.85.216.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jvuGY-009cTp-KQ
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Jul 2020 03:09:00 +0000
Received: by mail-pj1-f65.google.com with SMTP id k71so4097711pje.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 15 Jul 2020 20:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/eo13gw5fJCvhJnxKm6L26qmA1xy2iBEtE20aAjPg9o=;
 b=ntnEdubbdqpGPgOV96gJLeIOeDJD9bl8sWEZchgJzsbJoRlAxafbTPHiU+bBiSM9Ay
 Bb6I6dJreCIWt+SNvx3uSnD715S/LsJbtTBKRxlploZohP5A0IMBAo41xfxzSg+BNCgv
 UyZA7zqZ2jt8SIod07xOd5QbCCRaueqNa4gOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/eo13gw5fJCvhJnxKm6L26qmA1xy2iBEtE20aAjPg9o=;
 b=NZM/yYhP2HkxAg6waa4zXtqLUiNatZiswkWy1V6wlJkIp/cdX3gI3J37oV6BxT3cNS
 4kMQqk/tauhfUYT06hCWPm3BCdmu2xIzEHC8IatjmPaz7vL7eqYoKzvMBVygtNO5J3Xg
 mSu0wnmdXFzqT3VCIbqPq74RBYvTLa4R6b7BPm2fLhYdTK7JfQvqQCZKByuTtZ9tljq7
 nRRjTJkKm5VpUl/fiii1btVaanjPCEslzclw1JqQW0tN10rRWQyXEQCya2y0tkrePMe1
 gLoYyhhSF9jCr3oskB2HJWB8Rjlnc+RoSRuz6r8h+rPsH2uYWzzJzn7G5j0hHswrKSo5
 wAKw==
X-Gm-Message-State: AOAM53000XrfnwvS/oqKaZ4SsC8HR1buJzrbcyOUrzzrgxyW69AVejUm
 C9sxJE9Cy85u9N4vNXBi7/Dl6Q==
X-Google-Smtp-Source: ABdhPJyJvjSFUmwOZKl8hOEZtdbgisML9TaMY9zA2DquJ5wPNkSNvu+LzxqBXFwknWNq3+GQp8EoZw==
X-Received: by 2002:a17:902:ee8b:: with SMTP id
 a11mr1923650pld.26.1594868932899; 
 Wed, 15 Jul 2020 20:08:52 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id x7sm2909172pfp.96.2020.07.15.20.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 20:08:51 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 15 Jul 2020 20:08:44 -0700
Message-Id: <20200716030847.1564131-1-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.65 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jvuGY-009cTp-KQ
X-Mailman-Approved-At: Thu, 16 Jul 2020 11:16:59 +0000
Subject: [Kgdb-bugreport] [PATCH 0/3] Modernize tasklet callback API
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
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Oscar Carter <oscar.carter@gmx.com>, Mitchell Blank Jr <mitch@sfgoth.com>,
 kernel-hardening@lists.openwall.com, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, alsa-devel@alsa-project.org,
 Allen Pais <allen.lkml@gmail.com>,
 Christian Gromm <christian.gromm@microchip.com>, Will Deacon <will@kernel.org>,
 devel@driverdev.osuosl.org, Jonathan Corbet <corbet@lwn.net>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "David S. Miller" <davem@davemloft.net>,
 Masahiro Yamada <masahiroy@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Julian Wiedmann <jwi@linux.ibm.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Nishka Dasgupta <nishkadg.linux@gmail.com>, Jiri Slaby <jslaby@suse.com>,
 Jakub Kicinski <kuba@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Wambui Karuga <wambui.karugax@gmail.com>, Kees Cook <keescook@chromium.org>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-input@vger.kernel.org, Ursula Braun <ubraun@linux.ibm.com>,
 Stephen Boyd <swboyd@chromium.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jaroslav Kysela <perex@perex.cz>,
 Felipe Balbi <balbi@kernel.org>, Kyungtae Kim <kt0755@gmail.com>,
 netdev@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Kevin Curtis <kevin.curtis@farsite.co.uk>, linux-usb@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 Romain Perier <romain.perier@gmail.com>, Karsten Graul <kgraul@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

This is the infrastructure changes to prepare the tasklet API for
conversion to passing the tasklet struct as the callback argument instead
of an arbitrary unsigned long. The first patch details why this is useful
(it's the same rationale as the timer_struct changes from a bit ago:
less abuse during memory corruption attacks, more in line with existing
ways of doing things in the kernel, save a little space in struct,
etc). Notably, the existing tasklet API use is much less messy, so there
is less to clean up.

It's not clear to me which tree this should go through... Greg since it
starts with a USB clean-up, -tip for timer or interrupt, or if I should
just carry it. I'm open to suggestions, but if I don't hear otherwise,
I'll just carry it.

My goal is to have this merged for v5.9-rc1 so that during the v5.10
development cycle the new API will be available. The entire tree of
changes is here[1] currently, but to split it up by maintainer the
infrastructure changes need to be landed first.

Review and Acks appreciated! :)

Thanks,

-Kees

[1] https://github.com/allenpais/tasklets/commits/tasklets_V2

Kees Cook (2):
  usb: gadget: udc: Avoid tasklet passing a global
  treewide: Replace DECLARE_TASKLET() with DECLARE_TASKLET_OLD()

Romain Perier (1):
  tasklet: Introduce new initialization API

 drivers/input/keyboard/omap-keypad.c   |  2 +-
 drivers/input/serio/hil_mlc.c          |  2 +-
 drivers/net/wan/farsync.c              |  4 +--
 drivers/s390/crypto/ap_bus.c           |  2 +-
 drivers/staging/most/dim2/dim2.c       |  2 +-
 drivers/staging/octeon/ethernet-tx.c   |  2 +-
 drivers/tty/vt/keyboard.c              |  2 +-
 drivers/usb/gadget/udc/snps_udc_core.c |  6 ++---
 drivers/usb/host/fhci-sched.c          |  2 +-
 include/linux/interrupt.h              | 37 ++++++++++++++++++++++----
 kernel/backtracetest.c                 |  2 +-
 kernel/debug/debug_core.c              |  2 +-
 kernel/irq/resend.c                    |  2 +-
 kernel/softirq.c                       | 18 ++++++++++++-
 net/atm/pppoatm.c                      |  2 +-
 net/iucv/iucv.c                        |  2 +-
 sound/drivers/pcsp/pcsp_lib.c          |  2 +-
 17 files changed, 66 insertions(+), 25 deletions(-)

-- 
2.25.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
