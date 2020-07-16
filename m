Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 009BD222BB3
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 16 Jul 2020 21:15:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jw9LO-0001OF-Pg
	for lists+kgdb-bugreport@lfdr.de; Thu, 16 Jul 2020 19:14:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <keescook@chromium.org>) id 1jw9LN-0001O6-5z
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Jul 2020 19:14:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DmwAjlYrRkrceLF5k8BiY0q5EpRy1ms1f0jDcB2PX04=; b=bvzixxNXSjj25eC0lcmppyHnmF
 kO2B0SSfPoxaSa64YWyo1do1v/GAN3Cjf5CLz1FW7QiJ6Jf1VjK0d5/EI0a2k4vwPESYoJa3GnWzp
 +ccHA1bT21BoclzZuxkl5JJup3E8+iRcKSSX+LCTRASVaQzNrXgoD+MzewIKPGGn0En0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DmwAjlYrRkrceLF5k8BiY0q5EpRy1ms1f0jDcB2PX04=; b=MFi/WcBGAljZuXlnk2n2YUlhKK
 SA6YCuQr43pQ0Jq3VR+M2qJ2BcWOjehJnYPfiEbnlH9roNWMj3Fdc8bfkZVQzEHn7nUL68xLcybq0
 /atVrdqw2mxN0UFFNNxjr7op+cPnGltAJRXIfoafBFkv2dsSNsB0uShBRrjKMmsi3Jms=;
Received: from mail-pl1-f196.google.com ([209.85.214.196])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jw9LJ-003PU0-PB
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Jul 2020 19:14:55 +0000
Received: by mail-pl1-f196.google.com with SMTP id x9so4291241plr.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 16 Jul 2020 12:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DmwAjlYrRkrceLF5k8BiY0q5EpRy1ms1f0jDcB2PX04=;
 b=GFAY7/qFyIYdH5WwlOR6lmpQdUB8pidv4p+YEiNNV+24D6QE2wlS74FWkZdBInZexv
 UOIim5XchmtCaZ3l4TQzzuOzonn1fB1BUMbSjBEdmwtfVzMcmZFxfBS2TADWV5S1ZbJV
 +LUOh6KntXrSBKz4ZwAcXC+80++YNoPqG5L4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DmwAjlYrRkrceLF5k8BiY0q5EpRy1ms1f0jDcB2PX04=;
 b=mP0m0saQARbyWOH5rrO11AuauDuHruc8nMkrbKGkwub71FAq5ESbFR39vkpGZ3B/2N
 HH6uLzZ34pSo85omjXCGVtNyrUN7++xJYCtvT/dXiUN8VzwCP3wieEn9ijY5qbcIaeCO
 cAcEA9V3lIjpcsQCz5jLtwwZ2Ig4RU/lFPjkK4b+c4PtLS0+nw2LjxiCDmrdsu4Af7Uu
 I4W94UB9jmHq9ctvrKo+JhBSPCQyH3kDGmRIonSaNgsHvjKVfJjAgpHLzQeNSZ3ejTox
 oivLxgWWgmUQSjy8Gp/6yJCYj4bmgScXmSfanrQrJnN/22AGtV3aCh01RluE4cvxR0cP
 e0lQ==
X-Gm-Message-State: AOAM53190BXOaonvO7NPljsoUS3+Yksf9L9oIvVdaoSnbmRTzt7/INVP
 ckamThjVv+o9H6GdEw4HKufxHw==
X-Google-Smtp-Source: ABdhPJzXMzbyTY5VJHPd4Edm3bSGjXJUJOwIzo3RSPKyMSZOc846WSYGarDg6OCvj6pUTCBmbdFM0Q==
X-Received: by 2002:a17:90a:318c:: with SMTP id
 j12mr6129543pjb.25.1594926888230; 
 Thu, 16 Jul 2020 12:14:48 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id s194sm5671642pgs.24.2020.07.16.12.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 12:14:47 -0700 (PDT)
Date: Thu, 16 Jul 2020 12:14:46 -0700
From: Kees Cook <keescook@chromium.org>
To: Peter Zijlstra <peterz@infradead.org>
Message-ID: <202007161214.102F6E6@keescook>
References: <20200716030847.1564131-1-keescook@chromium.org>
 <20200716075718.GM10769@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200716075718.GM10769@hirez.programming.kicks-ass.net>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.196 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.196 listed in wl.mailspike.net]
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
X-Headers-End: 1jw9LJ-003PU0-PB
Subject: Re: [Kgdb-bugreport] [PATCH 0/3] Modernize tasklet callback API
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
 kernel-hardening@lists.openwall.com, kgdb-bugreport@lists.sourceforge.net,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, alsa-devel@alsa-project.org,
 Allen Pais <allen.lkml@gmail.com>, netdev@vger.kernel.org,
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
 Wambui Karuga <wambui.karugax@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
 Heiko Carstens <hca@linux.ibm.com>, linux-input@vger.kernel.org,
 Ursula Braun <ubraun@linux.ibm.com>, Stephen Boyd <swboyd@chromium.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jaroslav Kysela <perex@perex.cz>,
 Felipe Balbi <balbi@kernel.org>, Kyungtae Kim <kt0755@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Kevin Curtis <kevin.curtis@farsite.co.uk>, linux-usb@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 Romain Perier <romain.perier@gmail.com>, Karsten Graul <kgraul@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Jul 16, 2020 at 09:57:18AM +0200, Peter Zijlstra wrote:
> On Wed, Jul 15, 2020 at 08:08:44PM -0700, Kees Cook wrote:
> > Hi,
> > 
> > This is the infrastructure changes to prepare the tasklet API for
> > conversion to passing the tasklet struct as the callback argument instead
> > of an arbitrary unsigned long. The first patch details why this is useful
> > (it's the same rationale as the timer_struct changes from a bit ago:
> > less abuse during memory corruption attacks, more in line with existing
> > ways of doing things in the kernel, save a little space in struct,
> > etc). Notably, the existing tasklet API use is much less messy, so there
> > is less to clean up.
> 
> I would _MUCH_ rather see tasklets go the way of the dodo, esp. given
> that:
> 
> >  drivers/input/keyboard/omap-keypad.c   |  2 +-
> >  drivers/input/serio/hil_mlc.c          |  2 +-
> >  drivers/net/wan/farsync.c              |  4 +--
> >  drivers/s390/crypto/ap_bus.c           |  2 +-
> >  drivers/staging/most/dim2/dim2.c       |  2 +-
> >  drivers/staging/octeon/ethernet-tx.c   |  2 +-
> >  drivers/tty/vt/keyboard.c              |  2 +-
> >  drivers/usb/gadget/udc/snps_udc_core.c |  6 ++---
> >  drivers/usb/host/fhci-sched.c          |  2 +-
> >  include/linux/interrupt.h              | 37 ++++++++++++++++++++++----
> >  kernel/backtracetest.c                 |  2 +-
> >  kernel/debug/debug_core.c              |  2 +-
> >  kernel/irq/resend.c                    |  2 +-
> >  kernel/softirq.c                       | 18 ++++++++++++-
> >  net/atm/pppoatm.c                      |  2 +-
> >  net/iucv/iucv.c                        |  2 +-
> >  sound/drivers/pcsp/pcsp_lib.c          |  2 +-
> >  17 files changed, 66 insertions(+), 25 deletions(-)
> 
> there appear to be hardly any users left.. Can't we stage an extinction
> event here instead?

Oh, I wish, but no. That's just the ones using DECLARE_TASKLET. There
are hundred(s?) more (see the referenced tree).

-- 
Kees Cook


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
