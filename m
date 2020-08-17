Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F4034245BDB
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 17 Aug 2020 07:21:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k7Xa7-0007OE-Q3
	for lists+kgdb-bugreport@lfdr.de; Mon, 17 Aug 2020 05:21:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1k7Xa6-0007O2-Jz
 for kgdb-bugreport@lists.sourceforge.net; Mon, 17 Aug 2020 05:21:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8wbtEbHtU9M4Jod/JrcC7BZqQ8yoT12QXGXyBKx7JXA=; b=J+EwIaojFGzU2siwSvX5ayZeoJ
 xBwLjSrIngAQNlh8PczYK3nrJYV5q7zeCF7UjmRJ5iWIg5EaT9MBpAuvmZP2wstdlGOyIicT3jREp
 Vty6i1fpZA0EooJDrpMYUeWM0gJdz3+Lo+j04wUHbOrBcE+9J2uSXN0L4zZsrgK2qiE4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8wbtEbHtU9M4Jod/JrcC7BZqQ8yoT12QXGXyBKx7JXA=; b=BkS80lezzWCgM2ZbgyA+tbpBTb
 E4b7MaMb7bvBEr4bXAhuqrxdbf2qgz/jZS80+s+J58+fAoDkbg+9gLOh54WcJAMNcWhvRnQToA1rX
 dKFlbduSs+a5PYMwsshY2A0jUVGfxY/naOge9xQFEnG+m0cLpO+CqLGnuF3qi5N94pRA=;
Received: from mail-lj1-f195.google.com ([209.85.208.195])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k7Xa4-00Gnp2-13
 for kgdb-bugreport@lists.sourceforge.net; Mon, 17 Aug 2020 05:21:14 +0000
Received: by mail-lj1-f195.google.com with SMTP id i10so16064030ljn.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sun, 16 Aug 2020 22:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8wbtEbHtU9M4Jod/JrcC7BZqQ8yoT12QXGXyBKx7JXA=;
 b=AdKggnTL3w6eZGHsRkx/100sgIDTgVVJxjW/eLCKNep4uW4Yl3iMpb4KJ/hcYsaTMx
 wP8SFf2QchKBG7PVGLeRaaVoNVzX1/pwr8T4EVeDUQhCo14ZxN8K2MYSOWOlZzFkEP5M
 Ciq0EA/yuDtUAFgNLJJGqxOJZhwMMqQoYlYyHZZb4R7DlqeXWidG15ku96JwrEUYkecI
 8V6nyYxnw1wRy+xl1yfpgjlbh7n23OlsCIBXBzIFKFF4pVNcWMD2+SmoShkRxWfhxW2U
 fzykn0JV7r4VvJ1UM79GY/+iTN3SMoxwqLsYQmQmfutFRaxf0iASb0eXZ3RO9itt5p3T
 S8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8wbtEbHtU9M4Jod/JrcC7BZqQ8yoT12QXGXyBKx7JXA=;
 b=Jgvxx1uW0hNVFBVN6EnFOxnubrKRB1pSdQGBi36iH9dhLSra1917qgxQZEOrrHIkzT
 svuj/ncgJUKt49Zjkifr62PDo9YGRFDRaCmEdSgoZdsq3INyB87r30iFnxbAHRtOOL5b
 HwGtL4i67Y6xg2d9SFXy5D65QwMSzj0dmteV+zEwOzJfXSzh3+zGS7cNX6SrArymMEE0
 6i2kkhPxvfkkQhZdJo7lcpHvyyOJyGFNMLScpfUDVwDsrohato1qqGQIUtRI05NeaxuT
 aHF1U5Y7mRzfFIs/ky7jBfK9QgaNzOuwkANgbeTBQNbdqm2NbofumA1J7iYtz9nQt9Y1
 zDuw==
X-Gm-Message-State: AOAM532x7zfRwrinYln/EG5GuFVD675tTvRTzPExOJ/JSP1ibCqZDzwS
 xzFV1pTGUIfdqkpUqQxGOQhvNyDmN+XsdJUZTveb0TgLidU=
X-Google-Smtp-Source: ABdhPJx5Xf4vEf6FrlCe2817ep57MgRm1K5c+hgJrods56LEUJS2xB8Xl7414M0vSYBeVkIvAAnFai/v6XBsFEsLoD4=
X-Received: by 2002:a19:8705:: with SMTP id j5mr6468504lfd.122.1597641177454; 
 Sun, 16 Aug 2020 22:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200811135801.GA416071@kroah.com>
 <CAFA6WYMN8i96rEZuHLnskB+4k0o=K9vF1_we83P04h2BSoGjmQ@mail.gmail.com>
 <20200811145816.GA424033@kroah.com>
 <CAD=FV=UD=cTn6jwpYS-C-=1ORd-4azZ8ZiBR6om++2sMS1nmMg@mail.gmail.com>
 <CAFA6WYPBdOiVsKR_hSLpigN_1b9jimXKaqyRZjvKSx3xpAmLjA@mail.gmail.com>
 <CAD=FV=WccmFRkV4UUTLSYR9+7210h00Si=nG4tRs3BBuweA6ng@mail.gmail.com>
 <CAD=FV=V8UhQVQvcAp6XCmT3=6FYM=_zPELy4FTj4kMKUswaR8Q@mail.gmail.com>
 <CAFA6WYPxieH6ZTa_BFdaLuiwbqAs6r7eKmxG7ci4XtyRONGN7g@mail.gmail.com>
 <20200813101703.566thqmnc2d7cb3n@holly.lan>
 <CAFA6WYPd-fcDkYNk1KrjYwD=FH3FBvjDGEoxCBBN9CRidoVXbw@mail.gmail.com>
 <20200814141822.opahh33nfc5yodkb@holly.lan>
In-Reply-To: <20200814141822.opahh33nfc5yodkb@holly.lan>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 17 Aug 2020 10:42:43 +0530
Message-ID: <CAFA6WYO3YmgCftr-hFdiHGHATeox9en_HZvgnAL=zhoa=OEi_w@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.195 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k7Xa4-00Gnp2-13
Subject: Re: [Kgdb-bugreport] [RFC 0/5] Introduce NMI aware serial drivers
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 kgdb-bugreport@lists.sourceforge.net,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, 14 Aug 2020 at 19:48, Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Fri, Aug 14, 2020 at 05:36:36PM +0530, Sumit Garg wrote:
> > On Thu, 13 Aug 2020 at 15:47, Daniel Thompson
> > <daniel.thompson@linaro.org> wrote:
> > >
> > > On Thu, Aug 13, 2020 at 02:55:12PM +0530, Sumit Garg wrote:
> > > > On Thu, 13 Aug 2020 at 05:38, Doug Anderson <dianders@chromium.org> wrote:
> > > > > On Wed, Aug 12, 2020 at 8:27 AM Doug Anderson <dianders@chromium.org> wrote:
> > > > > > One
> > > > > > last worry is that I assume that most people testing (and even
> > > > > > automated testing labs) will either always enable NMI or won't enable
> > > > > > NMI.  That means that everyone will be only testing one codepath or
> > > > > > the other and (given the complexity) the non-tested codepath will
> > > > > > break.
> > > > > >
> > > >
> > > > The current patch-set only makes this NMI to work when debugger (kgdb)
> > > > is enabled which I think is mostly suitable for development
> > > > environments. So most people testing will involve existing IRQ mode
> > > > only.
> > > >
> > > > However, it's very much possible to make NMI mode as default for a
> > > > particular serial driver if the underlying irqchip supports it but it
> > > > depends if we really see any production level usage of NMI debug
> > > > feature.
> > >
> > > The effect of this patch is not to make kgdb work from NMI it is to make
> > > (some) SysRqs work from NMI. I think that only allowing it to deploy for
> > > kgdb users is a mistake.
> > >
> > > Having it deploy automatically for kgdb users might be OK but it seems
> > > sensible to make this feature available for other users too.
> >
> > I think I wasn't clear enough in my prior reply. Actually I meant to
> > say that this patch-set enables NMI support for a particular serial
> > driver via ".poll_init()" interface and the only current user of that
> > interface is kgdb.
> >
> > So if there are other users interested in this feature, they can use
> > ".poll_init()" interface as well to enable it.
>
> Huh?
>
> We appear to speaking interchangably about users (people who sit in
> front of the machine and want a stack trace) and sub-systems ;-).
>
> I don't think other SysRq commands have quite such a direct relationship
> between the sub-system and the sysrq command. For example who are you
> expecting to call .poll_init() if a user wants to use the SysRq to
> provoke a stack trace?
>

Ah, I see. So you meant to provide a user-space interface to
dynamically enable/disable NMI debug, correct? It will require IRQ <->
NMI switching at runtime which should be doable safely.

-Sumit

>
> Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
