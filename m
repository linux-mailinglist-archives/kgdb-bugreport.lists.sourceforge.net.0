Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC47210040
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  1 Jul 2020 00:57:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jqPBh-0005PD-Do
	for lists+kgdb-bugreport@lfdr.de; Tue, 30 Jun 2020 22:57:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jqPBg-0005P7-M3
 for kgdb-bugreport@lists.sourceforge.net; Tue, 30 Jun 2020 22:57:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VbGXuOfSs3SrhfGmixjAA7HW6MvnNruHqNQ7aQ/L0IE=; b=TGUPo1LAMli2b0NA1A9NWpzTXK
 RuwROZF0clUGILWoNMit+PjtCZdpUl/UC26ZRqlc9sixaCcbWeOqLLtI+SL3SVI5WUNXJQWvT5fjR
 gC5LutVT2fM6FgG4yAnzGDssUvsrGBmuoBHlFicjK4ScB+VUKxLuJzCAALE+LAT9sJ5o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VbGXuOfSs3SrhfGmixjAA7HW6MvnNruHqNQ7aQ/L0IE=; b=gdwx8aaFGi33KMNFKKOnCVRgol
 Y1EDNZj9omUNFkXEyESxl6XH1JzalfhwEKTVX3LUDZNy645iF49UZvkJWscyym+aPrOs6fy0SSbdf
 wDS+SOdM2EmxTgplE516bDH9dyAL+D5DWPH773DGBhwGipJto3ZVEi1CH/DDl8ZoIXDE=;
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jqPBe-006X4S-GY
 for kgdb-bugreport@lists.sourceforge.net; Tue, 30 Jun 2020 22:57:12 +0000
Received: by mail-ot1-f65.google.com with SMTP id 95so9247848otw.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 30 Jun 2020 15:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VbGXuOfSs3SrhfGmixjAA7HW6MvnNruHqNQ7aQ/L0IE=;
 b=NF/vD/8AXpdGaDqEJYQA3NKa9GL5IsMBqMyfRB9D+WMKuxgRmn5tfrM2qqo/ZN7zBf
 ZZU1EXKKxYBK7xmyoQ+GMYkqjPozbBqcpEUlMRGUKTozz8QR6TV67RDLOO6JI8aBreYD
 c7SE9+nMjTA5IRz9HLMiPwMad5289iVRbMfLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VbGXuOfSs3SrhfGmixjAA7HW6MvnNruHqNQ7aQ/L0IE=;
 b=MQnKetr+REGSzzVdgPomY9e0QKYHFILBdk7gZfIaevlfR/8ghcpK1zQnqeqM1l9IO/
 HdLWyat+HiVdJOCSXroGDlHYFrz1k9qU8x4yFGNE/j6mszf5f0KHOqMX9+FiitybLYso
 UfYvATxw/spUGtx25Rjym7AD75Lya6a2XJRoLCVr61APLY5OD6qHB9IszF9x7HXlT7c2
 G+Cd+wSTMWOACPZn8nMPDz8qUFUTpa5hKuUdBer6HAanwTs1Qc91QW52NKYRTYj9yzwh
 eBoLddd9ZgG+TBoJRay1c0o2sfAsDOlFAnvtU1bfO93u4DwNulGcn9ODDWr8ChwdHkXI
 VbSA==
X-Gm-Message-State: AOAM531xzOhRcL+VpEmiHaF8s2XnnmJVcs6ENLXvJhR418p46ejqTYCG
 wC931IYQCOcStMCNHQcKjYPs5OS/W/Q=
X-Google-Smtp-Source: ABdhPJwBN/UMz1zCjHIfhMJmHqXMRnA0TYGNxbcSvpE2TMmyGVOh0IvOSf6aHSFeC7M5XGhsEnAkzQ==
X-Received: by 2002:a9f:3b18:: with SMTP id i24mr16350891uah.52.1593556018191; 
 Tue, 30 Jun 2020 15:26:58 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com.
 [209.85.221.174])
 by smtp.gmail.com with ESMTPSA id x25sm577980vsg.21.2020.06.30.15.26.57
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2020 15:26:57 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id m21so3678276vkp.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 30 Jun 2020 15:26:57 -0700 (PDT)
X-Received: by 2002:a1f:974d:: with SMTP id z74mr15548435vkd.40.1593556016828; 
 Tue, 30 Jun 2020 15:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200629171529.558003-1-daniel.thompson@linaro.org>
 <CAD=FV=W9rdEsO1jP-kg6OetXmZO+kC9LenZM=CdxjUvv8BEU4g@mail.gmail.com>
 <20200630150527.odqvmzmsddzty4zx@holly.lan>
In-Reply-To: <20200630150527.odqvmzmsddzty4zx@holly.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 30 Jun 2020 15:26:45 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UvBEW_XhsbgdSRYqPLywFDQg=nh0bX=UMtERBoxW9hmg@mail.gmail.com>
Message-ID: <CAD=FV=UvBEW_XhsbgdSRYqPLywFDQg=nh0bX=UMtERBoxW9hmg@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.65 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jqPBe-006X4S-GY
Subject: Re: [Kgdb-bugreport] [PATCH] kgdb: Resolve races during
 kgdb_io_register/unregister_module
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
Cc: kgdb-bugreport@lists.sourceforge.net, Petr Mladek <pmladek@suse.com>,
 Patch Tracking <patches@linaro.org>, LKML <linux-kernel@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Tue, Jun 30, 2020 at 8:05 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Mon, Jun 29, 2020 at 02:03:52PM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Mon, Jun 29, 2020 at 10:15 AM Daniel Thompson
> > <daniel.thompson@linaro.org> wrote:
> > >
> > > Currently kgdb_register_callbacks() and kgdb_unregister_callbacks()
> > > are called outside the scope of the kgdb_registration_lock. This
> > > allows them to race with each other. This could do all sorts of crazy
> > > things up to and including dbg_io_ops becoming NULL partway through the
> > > execution of the kgdb trap handler (which isn't allowed and would be
> > > fatal).
> > >
> > > Fix this by bringing the trap handler setup and teardown into the scope
> > > of the registration lock.
> > >
> > > Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> > > ---
> > >  kernel/debug/debug_core.c | 8 +++++---
> > >  1 file changed, 5 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> > > index 9e5934780f41..9799f2c6dc94 100644
> > > --- a/kernel/debug/debug_core.c
> > > +++ b/kernel/debug/debug_core.c
> > > @@ -1117,9 +1117,8 @@ int kgdb_register_io_module(struct kgdb_io *new_dbg_io_ops)
> > >
> > >         dbg_io_ops = new_dbg_io_ops;
> > >
> > > -       spin_unlock(&kgdb_registration_lock);
> > > -
> > >         if (old_dbg_io_ops) {
> > > +               spin_unlock(&kgdb_registration_lock);
> > >                 old_dbg_io_ops->deinit();
> > >                 return 0;
> > >         }
> > > @@ -1129,6 +1128,8 @@ int kgdb_register_io_module(struct kgdb_io *new_dbg_io_ops)
> > >         /* Arm KGDB now. */
> > >         kgdb_register_callbacks();
> > >
> > > +       spin_unlock(&kgdb_registration_lock);
> >
> > From looking at code paths, I think this is illegal, isn't it?  You're
> > now calling kgdb_register_callbacks() while holding a spinlock, but:
> >
> > kgdb_register_callbacks()
> > -> register_console()
> > --> console_lock()
> > ---> might_sleep()
> > ----> <boom!>
>
> Thanks.
>
> I very nearly didn't press "Send" yesterday because I was worried I was
> rushing it too much (in order to avoid forgetting it ;-) ). Should have
> listened to myself!
>
>
> > I'm a little curious about the exact race we're trying to solve.
> > Calling unregister on an IO module before register even finished seems
> > like an error on the caller, so I guess it would be calling register
> > from a 2nd thread for a different IO module while the first thread was
> > partway through unregistering?  Even that seems awfully sketchy since
> > you're risking registering a 2nd IO ops while the first is still there
> > and that's illegal enough that we do a pr_err() for it (though we
> > don't crash), but let's say we're trying to solve that one.
>
> I didn't follow all the possible paths. Utlimately the
> (un)register_callbacks() functions use a flag variable without a lock
> and that can interact in lots of different ways.
>
> To be honest none are especially likely because the normal case is to
> register once during boot and never unregister. However we can trigger
> register/unregister from userspace so I think they can happen
> in parallel.

This is for kgdboc or one of the other IO modules?  I do know that, at
least for kgdboc, we have the "config_mutex".  I won't promise that
there are no bugs there but in the very least it should mostly prevent
a host of these types of issues.  ...so I guess you'd have to in
parallel be spamming a register of a non kgdboc IO module together
with an unregister of kgdboc?


> Double unregister can lead to some especially nasty schedules...
> although they still remain pretty unlikely since we need the double
> unregister to coincide with a breakpoint:
>
>
> kgdb_unregister_callbacks()     kgdb_unregister_callbacks()
>   .                             .
>   test flag                     .
>   set flag to 0                 .
>   .                             test flag
>   .                             spin_lock()
> *** kgdb trap ***                 .
>   . paranoid dbg_io_ops check     .
>   .                             dbg_io_ops = NULL
>   . stop other CPUs
>   . try to use NULL dbg_io_ops
>
>
> I have drawn the kgdb trap in the first column because otherwise things
> get too wide but the trap could trigger on any CPU in the system and
> provoke the problem.
>
>
> >
> > Looking at it closely, I _think_ the only race in this case is if the
> > one we're trying to unregister had a deinit() function and we going to
> > replace it?  If it didn't have a deinit function:
> >
> > cpu1 (unregister)                 cpu2 (register):
> > -----------------                 ----------------------
> > kgdb_unregister_callbacks()
> >                                   spin_lock() <got>
> > spin_lock() <blocked>
> >                                   if (old_dbg_io_ops) <true>
> >                                     if (has dinit) <false>
> >                                       print error
> >                                       spin_unlock()
> >                                       return -EBUSY
> > <finish unregister>
> >
> > The above is fine and is the same thing that would happen if the
> > whole register function ran before the unregister even started, right?
> >
> > Also: if the unregister won the race that should also be fine.
> >
> > So really the problem is this:
> >
> > cpu1 (unregister)                 cpu2 (register):
> > -----------------                 ----------------------
> > kgdb_unregister_callbacks()
> >                                   spin_lock() <got>
> > spin_lock() <blocked>
> >                                   if (old_dbg_io_ops) <true>
> >                                     if (has dinit) <true>
> >                                       print Replacing
> >                                   init new IO ops
> >                                   spin_unlock()
> >                                   if (old_dbg_io_ops) <true>
> >                                     finish deinit of old
> >                                     return true
> > WARN_ON() <hits and shouts!>
> > dbg_io_ops = NULL
> > spin_unlock()
> > if (deinit) <true>
> >   double-call to deinit of old
> >
> > So in this case we'll hit a WARN_ON(), incorrectly unregister the new
> > IO ops, and call deinit twice.
>
> To be honest I was simply working on "it is racy" and "there's not a
> good reason to allow that", especially as we start to develop tools to
> bring races to the surfaces someone will yell at us about it sooner or
> later ;-).
>
> Of course, implementing it correctly would have been better...

Yeah, still wouldn't hurt to try to figure out how to make it cleaner.  :-)

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
