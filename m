Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BB255222C0C
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 16 Jul 2020 21:41:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jw9lR-0002Xk-HS
	for lists+kgdb-bugreport@lfdr.de; Thu, 16 Jul 2020 19:41:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <keescook@chromium.org>) id 1jw9lQ-0002Xd-HR
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Jul 2020 19:41:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3gOxjYioleYNPMJFOYuFriXJ1YWGB4fcC91h6vBo3AM=; b=PiOLWARdE0j7srTNWMARrHV5oa
 Hkkw3X8bcp8gqt1RD+bu4v6d2O83juwleposwvVHZ0j69Y/BhyCCtT4+jq4noTAo/xNoqlaYeT0VS
 zo61d0+H2Khrnpr5hvY62L7Di2XPw1L2WDhicmzIwIa8wMaX72eSJUK3jdZag7hAjcy8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3gOxjYioleYNPMJFOYuFriXJ1YWGB4fcC91h6vBo3AM=; b=SbU3N1BDeOzR4LQoO9/dHf3bE0
 d7AWpjrNxG759VbK3WK9oICdWT1CM4ddAQ0pt+i6AmCxiW96nxNu2R79B2CTtnVyCIcj0IJDvW356
 CREZAMmBIy9Y67KXvpOMax9sFWZgey1iEIds8vhX/oWzf0cfnwE5pWRVD5QG2OPJhkT8=;
Received: from mail-pl1-f194.google.com ([209.85.214.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jw9lK-003RB8-0i
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Jul 2020 19:41:52 +0000
Received: by mail-pl1-f194.google.com with SMTP id b9so4314908plx.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 16 Jul 2020 12:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3gOxjYioleYNPMJFOYuFriXJ1YWGB4fcC91h6vBo3AM=;
 b=Fr2pMUFudxKVbymBQqlGxui5jPhioRVxbJPrydkQ5elV1iKym/58d4sNFYGtty3uRp
 ppQt1KX9e/iTFclG5XD8YE50MucJPCYqheHk4WCaco8MBAvjPQqzFnbKFDy8R/MWo2Hy
 sg4MwHJ75FbB5KhjWajQt52DC+O4j6U0z5B7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3gOxjYioleYNPMJFOYuFriXJ1YWGB4fcC91h6vBo3AM=;
 b=lJryl6k9TyEIMwHsKbtIjT6R9pV2kkrd/S7+EA6pPwWU8jlUAZLaGMKNUmgULtg8dH
 E6hcdTsylxXzlYeNJbMx9FTHYQVdYmT05+m7oZOxqLpnSi9nd8nx/nBcHYnZULTNHwvO
 sNoM/ScbNF/T1OhvNrG4Bl2+7eF/Flmx/6OwwkvaWmBygt3gtkGyzdo+jmI800Vg57ZX
 U681GhLWmSP1Wnx3s419kItygJCL4rSx3vDORnIevrnlLAtfX9/RwS0RyWKHT59brURM
 YUM2plMBSJqzLysRVRJ/rNvcBulofGyamoft312ySTifnI9wpD17Jzo7JMps0z8+b8zc
 JUfQ==
X-Gm-Message-State: AOAM532Y/vhGhqlrCcOwn6V4XzOn/quzqU7Zfi3RcvxeTZnFqoIVVyAO
 sdeaPGXSmvSC8nIeH3ksqwtZ2Q==
X-Google-Smtp-Source: ABdhPJxOpv1P54xTLFHMOCkbV36YgtJta4Xy1e3mGKWxQZVIYwZy7MSHr7Sn/WN5zPxdQ5Dy/Lrr9w==
X-Received: by 2002:a17:902:b60e:: with SMTP id
 b14mr4854255pls.81.1594928500423; 
 Thu, 16 Jul 2020 12:41:40 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id j13sm754883pjz.8.2020.07.16.12.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 12:41:39 -0700 (PDT)
Date: Thu, 16 Jul 2020 12:41:38 -0700
From: Kees Cook <keescook@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <202007161240.B58F7FE@keescook>
References: <20200716030847.1564131-1-keescook@chromium.org>
 <20200716030847.1564131-2-keescook@chromium.org>
 <20200716072823.GA971895@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200716072823.GA971895@kroah.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.194 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.194 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jw9lK-003RB8-0i
Subject: Re: [Kgdb-bugreport] [PATCH 1/3] usb: gadget: udc: Avoid tasklet
 passing a global
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
 Oscar Carter <oscar.carter@gmx.com>, Mitchell Blank Jr <mitch@sfgoth.com>,
 kernel-hardening@lists.openwall.com, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Christian Gromm <christian.gromm@microchip.com>,
 Kevin Curtis <kevin.curtis@farsite.co.uk>, Will Deacon <will@kernel.org>,
 devel@driverdev.osuosl.org, linux-s390@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Masahiro Yamada <masahiroy@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Julian Wiedmann <jwi@linux.ibm.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Nishka Dasgupta <nishkadg.linux@gmail.com>, Jiri Slaby <jslaby@suse.com>,
 Jakub Kicinski <kuba@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Wambui Karuga <wambui.karugax@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, linux-input@vger.kernel.org,
 Ursula Braun <ubraun@linux.ibm.com>, Stephen Boyd <swboyd@chromium.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jaroslav Kysela <perex@perex.cz>,
 Felipe Balbi <balbi@kernel.org>, Kyungtae Kim <kt0755@gmail.com>,
 netdev@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Allen Pais <allen.lkml@gmail.com>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>,
 Karsten Graul <kgraul@linux.ibm.com>, Romain Perier <romain.perier@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Jul 16, 2020 at 09:28:23AM +0200, Greg Kroah-Hartman wrote:
> On Wed, Jul 15, 2020 at 08:08:45PM -0700, Kees Cook wrote:
> > There's no reason for the tasklet callback to set an argument since it
> > always uses a global. Instead, use the global directly, in preparation
> > for converting the tasklet subsystem to modern callback conventions.
> > 
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  drivers/usb/gadget/udc/snps_udc_core.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/usb/gadget/udc/snps_udc_core.c b/drivers/usb/gadget/udc/snps_udc_core.c
> > index 3fcded31405a..afdd28f332ce 100644
> > --- a/drivers/usb/gadget/udc/snps_udc_core.c
> > +++ b/drivers/usb/gadget/udc/snps_udc_core.c
> > @@ -96,9 +96,7 @@ static int stop_pollstall_timer;
> >  static DECLARE_COMPLETION(on_pollstall_exit);
> >  
> >  /* tasklet for usb disconnect */
> > -static DECLARE_TASKLET(disconnect_tasklet, udc_tasklet_disconnect,
> > -		(unsigned long) &udc);
> > -
> > +static DECLARE_TASKLET(disconnect_tasklet, udc_tasklet_disconnect, 0);
> >  
> >  /* endpoint names used for print */
> >  static const char ep0_string[] = "ep0in";
> > @@ -1661,7 +1659,7 @@ static void usb_disconnect(struct udc *dev)
> >  /* Tasklet for disconnect to be outside of interrupt context */
> >  static void udc_tasklet_disconnect(unsigned long par)
> >  {
> > -	struct udc *dev = (struct udc *)(*((struct udc **) par));
> > +	struct udc *dev = udc;
> >  	u32 tmp;
> >  
> >  	DBG(dev, "Tasklet disconnect\n");
> 
> Feel free to just take this in your tree, no need to wait for the USB
> stuff to land.
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Okay, thanks! I'll carry this series for v5.9, unless I hear otherwise
from Thomas. :)

-- 
Kees Cook


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
