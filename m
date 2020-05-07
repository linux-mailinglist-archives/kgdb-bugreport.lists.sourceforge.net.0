Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 284A61C9BFC
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  7 May 2020 22:16:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jWmwZ-00047y-VA
	for lists+kgdb-bugreport@lfdr.de; Thu, 07 May 2020 20:16:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jWmwY-00047q-F2
 for kgdb-bugreport@lists.sourceforge.net; Thu, 07 May 2020 20:16:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UQE2Pqn7s0Ks9OIhXkN/lBOad3DHjY4wcPRoAi0MgWs=; b=ZTutZXoxGZdGnkYdqwtpRpLWQO
 BEsi8OtirX6AiCFP07gDgF29VJlTCaysdEWfL/WGDvTvisapC5NrDSiH1LMHqUhJtA4/GYEjyOLVA
 A2P/bLSINSJb1BmfI4cB9/E9pvHTrrSqpAS5pYat7qRwSIIKBQ5ZdYwH5icWtIrfSs4I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UQE2Pqn7s0Ks9OIhXkN/lBOad3DHjY4wcPRoAi0MgWs=; b=iubjEIrpoYeCNqgoII7tL0w1xA
 k7oLgqun42kJp0MLe3+4XT1anWfGPJVWFHE5wE949nk7bu/1fx93KTATLpd62gY6ONli9DjZQ+gt+
 IcIO3IJVEeZ51WII2kTxPCceJ4+Za69yO3Vpzu+oCb3xhRz0ERHaozjn4KlkvJsb2PhQ=;
Received: from mail-vs1-f67.google.com ([209.85.217.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jWmwV-00Bbvr-5A
 for kgdb-bugreport@lists.sourceforge.net; Thu, 07 May 2020 20:16:29 +0000
Received: by mail-vs1-f67.google.com with SMTP id h30so4218194vsr.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 07 May 2020 13:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UQE2Pqn7s0Ks9OIhXkN/lBOad3DHjY4wcPRoAi0MgWs=;
 b=WacTyQsgLEEU7u0AtpRsYbxT75pb0I+6Dw5GqlzMzlyoGiEgKCaIIHSxj1lTkPvQAU
 O6b7zHfAh/vDRiIeL5bu2q6GRMeNCHryJ2/FsGV34iuplmWcYt9st/jc7aBEXeYucXcQ
 R1GrTAIJ/ptWsJcgVQeQZS3xbP4uAwlr7D1MM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UQE2Pqn7s0Ks9OIhXkN/lBOad3DHjY4wcPRoAi0MgWs=;
 b=fXerkUBqlUDEY4X6oq+3EkTBJYCshWE3RLF8v6EwidXdl8FjoL2sd0xlyDqTfNfFgt
 TJVOG/qKTW2I2nh40i6Z4AS8P9Tg1J20McyQ9e6ZU/ygvUT9iETJthowOlHSI1BmG+Tn
 3aVQlz/sBq5uzvhi5YoWj0C1LQNZCLZUCdhzrZDdCqE06JlG9PVK5RWTdg0XNRKm/FMh
 tQnp2uFYKwI3eww5v4veVcF+418Q5Kz4K+v1tXjtMZ9zO+SUYcH94Ef7U/KlfKod1iW5
 I3XXLvqX2Qt8jze4HdaSYUiWeIPSQjKIg0Yj8KGP9fMmEq5+RHzL0s7K1T+gMWesyorJ
 e61Q==
X-Gm-Message-State: AGi0PuYpZxcE2q2uPib4iw5YUeeTyNdPx8aUqxuDP8Nnvy0ww2oNUuay
 u/H6uZlqy1OvxFAN0n7El1/cWo5rIjQ=
X-Google-Smtp-Source: APiQypJ0ldSi/OGKnsJ3prJRo6H+8NDAPFusl6FoBhh7Uu04QYwfnv2ULk4p5UsUgc8krdS0UJUUrQ==
X-Received: by 2002:a67:d817:: with SMTP id e23mr14038509vsj.39.1588882573522; 
 Thu, 07 May 2020 13:16:13 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com.
 [209.85.217.43])
 by smtp.gmail.com with ESMTPSA id d1sm3605095vsc.30.2020.05.07.13.16.12
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2020 13:16:12 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id u12so4348825vsq.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 07 May 2020 13:16:12 -0700 (PDT)
X-Received: by 2002:a67:c40c:: with SMTP id c12mr14014022vsk.106.1588882572099; 
 Thu, 07 May 2020 13:16:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200430095819.1.Id37f71c69eb21747b9d9e2c7c242be130814b362@changeid>
 <20200501114943.ioetuxe24gi27bll@holly.lan>
 <20200501133202.GA2402281@wychelm.lan>
 <CAD=FV=WKKCkr1va9S+ygL7XuOvSm12-qw4dCSo=FBtyXx4JvhQ@mail.gmail.com>
 <20200504115339.ndi3n4evklzidvb5@holly.lan>
In-Reply-To: <20200504115339.ndi3n4evklzidvb5@holly.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 7 May 2020 13:16:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VHUWs9X548=gmpn60-ywrM7OUOKdt-ngBdyyFgTfa3yw@mail.gmail.com>
Message-ID: <CAD=FV=VHUWs9X548=gmpn60-ywrM7OUOKdt-ngBdyyFgTfa3yw@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWmwV-00Bbvr-5A
Subject: Re: [Kgdb-bugreport] [PATCH] kgdboc: Be a bit more robust about
 handling earlycon leaving
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
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Mon, May 4, 2020 at 4:53 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Fri, May 01, 2020 at 10:36:14AM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, May 1, 2020 at 6:32 AM Daniel Thompson
> > <daniel.thompson@linaro.org> wrote:
> > >
> > > On Fri, May 01, 2020 at 12:49:43PM +0100, Daniel Thompson wrote:
> > > > On Thu, Apr 30, 2020 at 09:59:09AM -0700, Douglas Anderson wrote:
> > > > > The original implementation of kgdboc_earlycon included a comment
> > > > > about how it was impossible to get notified about the boot console
> > > > > going away without making changes to the Linux core.  Since folks
> > > > > often don't want to change the Linux core for kgdb's purposes, the
> > > > > kgdboc_earlycon implementation did a bit of polling to figure out when
> > > > > the boot console went away.
> > > > >
> > > > > It turns out, though, that it is possible to get notified about the
> > > > > boot console going away.  The solution is either clever or a hack
> > > > > depending on your viewpoint.  ...or, perhaps, a clever hack.  All we
> > > > > need to do is head-patch the "exit" routine of the boot console.  We
> > > > > know that "struct console" must be writable because it has a "next"
> > > > > pointer in it, so we can just put our own exit routine in, do our
> > > > > stuff, and then call back to the original.
> > > >
> > > > I think I'm in the hack camp on this one!
> > > >
> > > >
> > > > > This works great to get notified about the boot console going away.
> > > > > The (slight) problem is that in the context of the boot console's exit
> > > > > routine we can't call tty_find_polling_driver().
> > > >
> > > > I presume this is something to do with the tty_mutex?
> > > > > We solve this by
> > > > > kicking off some work on the system_wq when we get notified and this
> > > > > works pretty well.
> > > >
> > > > There are some problems with the workqueue approach.
> > >
> > > ... so did a couple of experiments to avoid the workqueue.
> > >
> > > It occured to me that, since we have interfered with deinit() then the
> > > console hasn't actually been uninitialized meaning we could still use it.
> > > This does exposes us to risks similar to keep_bootcon but in exchange
> > > there is no window where kgdb is broken (and no need to panic).
> > >
> > > My prototype is minimal but I did wonder about ripping out all the
> > > code to defend against removal of the earlycon and simply keep the
> > > earlycon around until a new kgdbio handler is installed.
> >
> > It took me a little while, but I finally see what you're saying.
> > You're saying that we keep calling into the boot console even though
> > it's no longer in the list of consoles.  Then we temporarily disable
> > the boot console's exit routine until kgdb_earlycon() is done.  (side
> > note: the exit routine was recently added and probably most consoles
> > don't use it).
>
> Certainly none of the devices with a read() method have an exit().
>
>
> > OK, that doesn't seem totally insane.  It actually works OK for you?
>
> I tested on qemu/x86-64 (8250) and qemu/arm64 (pl011). In both cases it
> works well.
>
>
> > It's probably at least worth a warning in the log if we detect that
> > we're using the boot console and it's not in the console list anymore.
> > Then if kgdb starts misbehaving someone might have a clue.
>
> Yes, I'll add that.
>
>
> > If your solution is OK we might also want to remove the call to
> > cleanup_earlycon_if_invalid() in configure_kgdboc() too.
>
> That's what I thought, yes. Although it might be best to handle that
> by ripping it out of the original patch set.

I've incorporated ideas from my patch and yours into a v4 patchset of
the original series.  Note that I didn't include your earlycon
deferral patchset [1] in my series which means it'll need to be
rebased.  Hopefully this is OK since I think the rebase will be easy,
but yell if you want an extra pair of eyes on it.

[1] https://lore.kernel.org/r/20200430161741.1832050-1-daniel.thompson@linaro.org


-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
