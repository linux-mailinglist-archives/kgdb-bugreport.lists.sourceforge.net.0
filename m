Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 222B6303926
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 26 Jan 2021 10:39:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l4Kop-0008ND-Sf
	for lists+kgdb-bugreport@lfdr.de; Tue, 26 Jan 2021 09:39:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <emil.renner.berthing@gmail.com>) id 1l400H-0002d8-20
 for kgdb-bugreport@lists.sourceforge.net; Mon, 25 Jan 2021 11:25:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mybA+IIkOKUfsPE8aZqJZA/LpcRLze1XRIRef0pzfVA=; b=iMTCS+SWJE5keWJS9qkrA7Lehr
 0X6Hm/BT8d43apgvs90q0jYHwG9Un0a8zFtBgoLGHyURR+a5Gv3VFx6L9CLzQc222jNSFHjJH4uNj
 AV/Ajle6cybeYO3C/cHo3WxTYMcma0epoe5TLxFJvBppWOmVGjWVroIBDY83bphEv1D8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mybA+IIkOKUfsPE8aZqJZA/LpcRLze1XRIRef0pzfVA=; b=kC0gEnzHFT+WChHDbfXQnvq2JL
 EEa2D8mUDsGgD0fs1oIRyMvq2Kpx9KsgPSRec7iIbBrY7bkpPSRpt+Z+t+G2Q7Sw0BD0ARP5SXotu
 usuQYZZwd1Qg9CqfapCi04sXEclpye68+RzQfuqQmcPgLi9UYAgFr/AQUEyRd4HyhHlk=;
Received: from mail-yb1-f170.google.com ([209.85.219.170])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l400C-006X8J-2X
 for kgdb-bugreport@lists.sourceforge.net; Mon, 25 Jan 2021 11:25:53 +0000
Received: by mail-yb1-f170.google.com with SMTP id y128so12939071ybf.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 25 Jan 2021 03:25:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mybA+IIkOKUfsPE8aZqJZA/LpcRLze1XRIRef0pzfVA=;
 b=aTELklqPzTuXQOdFS/d9z2ZcQZeyJpgub7du9v14LHJ6YKzrwo0nDBb6yT2rO4ld4q
 2UOm5resc2Fg2s/r3F+9lkKakxxD9xAXsPTiaUaObIzN3TC52nbtBIJYuQRhrdH6NKlJ
 B39KIUPdDABV7ey/uHXSqGNhxRuWiJoghSHlIMsEkvujb/q2iJQfvc7lbQwXfknDfuRE
 yqdOGKsgEYiBpFr9XPBX22Z2RTG2fspQL59gZdmfoq0G9NyJX8xqJvSSRw8QY7qN1QVn
 H1x3GryvNesU7tF3/mXpcBycIEsaEx4+oWQUUQXWY04ZGLnExtvzZHUQI3pgfb1PvsF1
 qBMQ==
X-Gm-Message-State: AOAM5310o1bXJ3XBRCxKkMn3tXgvd5BB5LBlK0qwsZQhNrD9ubyxAyab
 wlly12MGtdVUNgY11Rw1BsB/sxf7ypsZYqq29PM=
X-Google-Smtp-Source: ABdhPJx0q+FoaFczNHxa2Z2c4WZ18GfoOBMpXH8A8XAiNI6j2FLuEoWkXwpADn/hBfSjc17vF8UFkpIzwN6IaMXJ1WM=
X-Received: by 2002:a25:ab8d:: with SMTP id v13mr150736ybi.479.1611573942420; 
 Mon, 25 Jan 2021 03:25:42 -0800 (PST)
MIME-Version: 1.0
References: <20210123184237.6970-1-kernel@esmil.dk>
 <20210125110311.pmqddpkh2c247tmx@maple.lan>
In-Reply-To: <20210125110311.pmqddpkh2c247tmx@maple.lan>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Mon, 25 Jan 2021 12:25:31 +0100
Message-ID: <CANBLGcxcpYucmFHtKydi=o_t=eaSbeEZBqY8C4xWLfjpxJkxBw@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (emil.renner.berthing[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.170 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.170 listed in wl.mailspike.net]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
X-Headers-End: 1l400C-006X8J-2X
X-Mailman-Approved-At: Tue, 26 Jan 2021 09:39:24 +0000
Subject: Re: [Kgdb-bugreport] [PATCH] kgdb: use new API for breakpoint
 tasklet
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
Cc: kgdb-bugreport@lists.sourceforge.net, Davidlohr Bueso <dbueso@suse.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, 25 Jan 2021 at 12:03, Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Sat, Jan 23, 2021 at 07:42:37PM +0100, Emil Renner Berthing wrote:
> > This converts the kgdb_tasklet_breakpoint to use the new API in
> > commit 12cc923f1ccc ("tasklet: Introduce new initialization API")
> >
> > The new API changes the argument passed to the callback function, but
> > fortunately the argument isn't used so it is straight forward to use
> > DECLARE_TASKLET() rather than DECLARE_TASKLET_OLD().
>
> This patch overlaps with a more ambitious patch from Davidlohr.
> Perhaps you can join in with the other thread since the discussion
> there is unresolved. See:
> https://lkml.org/lkml/2021/1/14/1320

Ah, that's cool. Getting rid of tasklets is much better than merely
trying to get rid of the old tasklet API. Please ignore this patch
then.

/Emil
>
> Daniel.
>
>
> >
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > ---
> >  kernel/debug/debug_core.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> > index af6e8b4fb359..98d44c2bb0a4 100644
> > --- a/kernel/debug/debug_core.c
> > +++ b/kernel/debug/debug_core.c
> > @@ -1090,13 +1090,13 @@ static void kgdb_unregister_callbacks(void)
> >   * such as is the case with kgdboe, where calling a breakpoint in the
> >   * I/O driver itself would be fatal.
> >   */
> > -static void kgdb_tasklet_bpt(unsigned long ing)
> > +static void kgdb_tasklet_bpt(struct tasklet_struct *unused)
> >  {
> >       kgdb_breakpoint();
> >       atomic_set(&kgdb_break_tasklet_var, 0);
> >  }
> >
> > -static DECLARE_TASKLET_OLD(kgdb_tasklet_breakpoint, kgdb_tasklet_bpt);
> > +static DECLARE_TASKLET(kgdb_tasklet_breakpoint, kgdb_tasklet_bpt);
> >
> >  void kgdb_schedule_breakpoint(void)
> >  {
> > --
> > 2.30.0
> >


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
