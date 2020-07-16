Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8301B222D34
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 16 Jul 2020 22:48:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jwAo4-0005XV-Ak
	for lists+kgdb-bugreport@lfdr.de; Thu, 16 Jul 2020 20:48:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dmitry.torokhov@gmail.com>) id 1jwAo3-0005XP-Mw
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Jul 2020 20:48:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E+1tVGknt5yYZ8eT3cfGaVP/Gx6TNLloqdwWVn2c4ZM=; b=lys/qA89KbWaOnF+CkI4Zd5QyG
 W5aoSNB4b15p+wLHRY/P7/FC8NVfDxiIYA40673fECi4bGkUjDo958Le63mDGMEpK+s0Erh9JeZBC
 FfZ9ZbvQFquxwvZd4/uzVMsFHRymJEYG7QVHvUfEoFlok33mJyBoIFhRt1l0SeYLTvhw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E+1tVGknt5yYZ8eT3cfGaVP/Gx6TNLloqdwWVn2c4ZM=; b=Wi2ypImjP4kBRX0IVSkHLcd9uK
 gYpVa5gkqfVKniQpSWHUCRhlG8q4b3gqMyZHdOWcoRDsCI2GMCEBpJBT52CoSTtIhjTZRdngLo7Mr
 TaUxCxHGYTDBF9XH9/qgQ+35aIdc4wBycFkSBble48z8vmR4YQoFdog2/GyBdn3ba/+w=;
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jwAo1-006Vs1-QS
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Jul 2020 20:48:39 +0000
Received: by mail-io1-f68.google.com with SMTP id f23so7488669iof.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 16 Jul 2020 13:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E+1tVGknt5yYZ8eT3cfGaVP/Gx6TNLloqdwWVn2c4ZM=;
 b=CLn8nEZ9Umx3u1uxQ6iB8vnvAwGkRUs5ZG9EfQL8CJiHvyLP8M7b6NUIAKo+LBuY4f
 8/9k4vjIky1k6ccVtwc1XCLpJ9OIXcaSnSgOd0xYtfqQA5VkwUEJhpc/XojQNud255Fp
 CS65GQl3KtSyU2zn3gjZRqpQReiLPt5Jdwt/SCKKel4uYCiyIFetSEXJKpr/nhCoi0IP
 Fh7/R7sRei2OUkuvv/y1qWAnzOrzRAxFmPwXU3sJhnRHuwo9BC1LeRHApdtIROKUBM0Y
 PuMZgqnjotBdORPgdDy9QbhiTqpBvHJsERxZbAO44L6pd99V8/cw6eA29lB/55EAquIA
 5X2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E+1tVGknt5yYZ8eT3cfGaVP/Gx6TNLloqdwWVn2c4ZM=;
 b=SfOX1TLfmc8M55awCxxYwdcBluWpkewVuMq8lU0+48SYiEaCuYHwhlEcENwtwh9Y1C
 97avqNgbbla+IZRmycmU1Newva+crypohtcTgou2DhwkHp7QHKEhWoSamBOv+SQQ3l+3
 YCgA31OfmYPPEBhdNCfwO5WMa5W4fiMoCLima2rirdUOKBiXWTJQTxG+QjbbDfgI8K/n
 diDZDPZ8AvcaahnD5cnhVRYPdUOBLpbQ/GE86g4S48Z/7ffG/YXfa7Z8HsJAB+6o7hRN
 2OG3VKiAVBTmnEfstS5PBIbwfHPucj72vpgmssXKonnz+tf/CiyoqPrhR67JdvwcPnfR
 33Hg==
X-Gm-Message-State: AOAM5303httMMylnN9x5RnhN95yZtI98Zr9FUnmEtyUqiRCbSM0IP0k2
 wZm7W6GdwECX8PbIgaHe7EQldqna84DYhRf5OB0=
X-Google-Smtp-Source: ABdhPJzpsbm7TwGhHG6RzXDqgC6/209E5TMuTQBViDF3W3srNDclU8jiNSeIW3HzQAj2kQTZKYQslP0k+o4Ij2ZF6uA=
X-Received: by 2002:a5d:9c0e:: with SMTP id 14mr6302830ioe.109.1594932511887; 
 Thu, 16 Jul 2020 13:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200716030847.1564131-1-keescook@chromium.org>
 <20200716075718.GM10769@hirez.programming.kicks-ass.net>
 <202007161214.102F6E6@keescook>
In-Reply-To: <202007161214.102F6E6@keescook>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 16 Jul 2020 13:48:20 -0700
Message-ID: <CAKdAkRQHRobiG-RpifyrAmV9ENgENn_woPBVXpRrhKwRBf9Esw@mail.gmail.com>
To: Kees Cook <keescook@chromium.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.68 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (dmitry.torokhov[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jwAo1-006Vs1-QS
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

On Thu, Jul 16, 2020 at 12:14 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, Jul 16, 2020 at 09:57:18AM +0200, Peter Zijlstra wrote:
> > On Wed, Jul 15, 2020 at 08:08:44PM -0700, Kees Cook wrote:
> > > Hi,
> > >
> > > This is the infrastructure changes to prepare the tasklet API for
> > > conversion to passing the tasklet struct as the callback argument instead
> > > of an arbitrary unsigned long. The first patch details why this is useful
> > > (it's the same rationale as the timer_struct changes from a bit ago:
> > > less abuse during memory corruption attacks, more in line with existing
> > > ways of doing things in the kernel, save a little space in struct,
> > > etc). Notably, the existing tasklet API use is much less messy, so there
> > > is less to clean up.
> >
> > I would _MUCH_ rather see tasklets go the way of the dodo, esp. given
> > that:
> >
> > >  drivers/input/keyboard/omap-keypad.c   |  2 +-
> > >  drivers/input/serio/hil_mlc.c          |  2 +-
> > >  drivers/net/wan/farsync.c              |  4 +--
> > >  drivers/s390/crypto/ap_bus.c           |  2 +-
> > >  drivers/staging/most/dim2/dim2.c       |  2 +-
> > >  drivers/staging/octeon/ethernet-tx.c   |  2 +-
> > >  drivers/tty/vt/keyboard.c              |  2 +-
> > >  drivers/usb/gadget/udc/snps_udc_core.c |  6 ++---
> > >  drivers/usb/host/fhci-sched.c          |  2 +-
> > >  include/linux/interrupt.h              | 37 ++++++++++++++++++++++----
> > >  kernel/backtracetest.c                 |  2 +-
> > >  kernel/debug/debug_core.c              |  2 +-
> > >  kernel/irq/resend.c                    |  2 +-
> > >  kernel/softirq.c                       | 18 ++++++++++++-
> > >  net/atm/pppoatm.c                      |  2 +-
> > >  net/iucv/iucv.c                        |  2 +-
> > >  sound/drivers/pcsp/pcsp_lib.c          |  2 +-
> > >  17 files changed, 66 insertions(+), 25 deletions(-)
> >
> > there appear to be hardly any users left.. Can't we stage an extinction
> > event here instead?
>
> Oh, I wish, but no. That's just the ones using DECLARE_TASKLET. There
> are hundred(s?) more (see the referenced tree).

Still, do we really need tasklets? Can we substitute timers executing
immediately in their place?

Thanks.

-- 
Dmitry


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
