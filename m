Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C2C222DD2
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 16 Jul 2020 23:24:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jwBMl-0008TZ-8f
	for lists+kgdb-bugreport@lfdr.de; Thu, 16 Jul 2020 21:24:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <keescook@chromium.org>) id 1jwBMj-0008TP-Up
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Jul 2020 21:24:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GuRiIW4nk04qSodan0OUo2QjHoiXfRAFsMTlj/9iRXw=; b=HwxZrqJy8UvYCP0yyEdW0o8GoH
 e6pXXlMtB2ll4ukOSou2pf+XTmGcEWiBc8munEVRw2JS0es5RluFCp6QGhas7+AUZ+AkbsKHMJqlI
 ajuUPczWhAhbLDyucDc3ukgQ4DW9vrAvGk07kzAhjC+cTtv+vBTxzFA7x8tAN40HYeOo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GuRiIW4nk04qSodan0OUo2QjHoiXfRAFsMTlj/9iRXw=; b=QAOD25T8oxyZXUUXD4Qc77L/ix
 0iGs0B9cHLAA4HUeM0kkm8R/ec66XGi9qbuzaiqKok7I1/9DxzUplqPpirUh910k4VYRPHXq1GXsj
 J/zsQrYfHkYOPbd/BfEAln1BbQlKJNCB/fbUurk02pSDOQmz+QDn/OgKL4TUY+F46PLk=;
Received: from mail-pl1-f194.google.com ([209.85.214.194])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jwBMh-00B6g5-VU
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Jul 2020 21:24:29 +0000
Received: by mail-pl1-f194.google.com with SMTP id p1so4435788pls.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 16 Jul 2020 14:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GuRiIW4nk04qSodan0OUo2QjHoiXfRAFsMTlj/9iRXw=;
 b=g8LC2DWSxvHGrs2YfNgqk3VpuTWmyx3EVdSYPeLpfd8l0h3R8fxuksSBwA40ai4ADZ
 kvo6yqRa0fHbA8eJUx9ZhH7+OM1Pi2G/tAj5fqTQQNaJxqtiMUti5yjEE1XiAduQJjm5
 0svDx9VcKd8b8SNp5t3SPolgR9wFDAMRS57OI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GuRiIW4nk04qSodan0OUo2QjHoiXfRAFsMTlj/9iRXw=;
 b=s+FF51Nq0Z9ny2K/D/fhAindBQE/mJ44k1KEBtjKkPA9LSzVTvChtQZk4qvC27ON2G
 MX0wImgzg1eUgNW5RC6UR0XSV1WU4mwGXLmGKYagX5UXT5EgrRrGcgchNAkZzadqGMhS
 IILezR7OtnaHcGX83JPV2X6SegUVC4QD5vj4oOgRmohioyh/nuybscGk5fiwBCy1KTKh
 7CNQJcXclPtqz6yZ5zEE560RchdWnvdyWJalBMoPk30oY//3jgcuXO9cELmOnGfneA94
 qaqo1jrE+g0mZ+qbWJms6p9YzR05j3x9fw4w8oYtDZc7q19/dteGsOgkeQZp8ieAD3jv
 xmew==
X-Gm-Message-State: AOAM5305wVhhcoPFHpQSb10MOLU9EfxaS1h9j1hxMvgMv4U4f6eYLgof
 EHlQFcx7FbwQCW7GQE3o/iDqrw==
X-Google-Smtp-Source: ABdhPJyP3qLO1Y3SOoBLYTFQL4BEKccE2HwZrJKw7OBU3VgLMhd+dox46Tq8jY21pcPLVhtrgaAB+g==
X-Received: by 2002:a17:90a:1089:: with SMTP id
 c9mr6859603pja.180.1594934662399; 
 Thu, 16 Jul 2020 14:24:22 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id r25sm1515610pgv.88.2020.07.16.14.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 14:24:21 -0700 (PDT)
Date: Thu, 16 Jul 2020 14:24:20 -0700
From: Kees Cook <keescook@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Message-ID: <202007161416.9C1B8F3D26@keescook>
References: <20200716030847.1564131-1-keescook@chromium.org>
 <20200716075718.GM10769@hirez.programming.kicks-ass.net>
 <202007161214.102F6E6@keescook>
 <CAKdAkRQHRobiG-RpifyrAmV9ENgENn_woPBVXpRrhKwRBf9Esw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKdAkRQHRobiG-RpifyrAmV9ENgENn_woPBVXpRrhKwRBf9Esw@mail.gmail.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.194 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jwBMh-00B6g5-VU
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
 kernel-hardening@lists.openwall.com, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Allen Pais <allen.lkml@gmail.com>, netdev <netdev@vger.kernel.org>,
 Christian Gromm <christian.gromm@microchip.com>, Will Deacon <will@kernel.org>,
 devel@driverdev.osuosl.org, linux-s390@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "David S. Miller" <davem@davemloft.net>,
 Masahiro Yamada <masahiroy@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Julian Wiedmann <jwi@linux.ibm.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Nishka Dasgupta <nishkadg.linux@gmail.com>, Jiri Slaby <jslaby@suse.com>,
 Jakub Kicinski <kuba@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Wambui Karuga <wambui.karugax@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>,
 lkml <linux-kernel@vger.kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 Ursula Braun <ubraun@linux.ibm.com>, Stephen Boyd <swboyd@chromium.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jaroslav Kysela <perex@perex.cz>,
 Felipe Balbi <balbi@kernel.org>, Kyungtae Kim <kt0755@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Kevin Curtis <kevin.curtis@farsite.co.uk>,
 USB list <linux-usb@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Romain Perier <romain.perier@gmail.com>, Karsten Graul <kgraul@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Jul 16, 2020 at 01:48:20PM -0700, Dmitry Torokhov wrote:
> On Thu, Jul 16, 2020 at 12:14 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Thu, Jul 16, 2020 at 09:57:18AM +0200, Peter Zijlstra wrote:
> > > On Wed, Jul 15, 2020 at 08:08:44PM -0700, Kees Cook wrote:
> > > > Hi,
> > > >
> > > > This is the infrastructure changes to prepare the tasklet API for
> > > > conversion to passing the tasklet struct as the callback argument instead
> > > > of an arbitrary unsigned long. The first patch details why this is useful
> > > > (it's the same rationale as the timer_struct changes from a bit ago:
> > > > less abuse during memory corruption attacks, more in line with existing
> > > > ways of doing things in the kernel, save a little space in struct,
> > > > etc). Notably, the existing tasklet API use is much less messy, so there
> > > > is less to clean up.
> > >
> > > I would _MUCH_ rather see tasklets go the way of the dodo, esp. given
> > > that:
> > >
> > > >  drivers/input/keyboard/omap-keypad.c   |  2 +-
> > > >  drivers/input/serio/hil_mlc.c          |  2 +-
> > > >  drivers/net/wan/farsync.c              |  4 +--
> > > >  drivers/s390/crypto/ap_bus.c           |  2 +-
> > > >  drivers/staging/most/dim2/dim2.c       |  2 +-
> > > >  drivers/staging/octeon/ethernet-tx.c   |  2 +-
> > > >  drivers/tty/vt/keyboard.c              |  2 +-
> > > >  drivers/usb/gadget/udc/snps_udc_core.c |  6 ++---
> > > >  drivers/usb/host/fhci-sched.c          |  2 +-
> > > >  include/linux/interrupt.h              | 37 ++++++++++++++++++++++----
> > > >  kernel/backtracetest.c                 |  2 +-
> > > >  kernel/debug/debug_core.c              |  2 +-
> > > >  kernel/irq/resend.c                    |  2 +-
> > > >  kernel/softirq.c                       | 18 ++++++++++++-
> > > >  net/atm/pppoatm.c                      |  2 +-
> > > >  net/iucv/iucv.c                        |  2 +-
> > > >  sound/drivers/pcsp/pcsp_lib.c          |  2 +-
> > > >  17 files changed, 66 insertions(+), 25 deletions(-)
> > >
> > > there appear to be hardly any users left.. Can't we stage an extinction
> > > event here instead?
> >
> > Oh, I wish, but no. That's just the ones using DECLARE_TASKLET. There
> > are hundred(s?) more (see the referenced tree).
> 
> Still, do we really need tasklets? Can we substitute timers executing
> immediately in their place?

If there is a direct replacement, then sure, I'd be happy to do
whatever, however it does not look mechanical to me. If there is a
mechanical way that will convert these two directories (as an example of
various complexities):

drivers/crypto/ccp/
drivers/gpu/drm/i915/gt/

then let's get it documented. But if not, let's write up a paragraph for
the deprecated.rst, mark it as deprecated in comments, and modernize the
API (which is a mostly mechanical change) to avoid it being a problem
for CFI, for memory corruption, and heap space, etc.

-- 
Kees Cook


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
