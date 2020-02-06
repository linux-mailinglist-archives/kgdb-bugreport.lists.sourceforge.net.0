Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B0216154964
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  6 Feb 2020 17:39:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1izkC2-0002kk-1r
	for lists+kgdb-bugreport@lfdr.de; Thu, 06 Feb 2020 16:39:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1izkBz-0002ka-Tz
 for kgdb-bugreport@lists.sourceforge.net; Thu, 06 Feb 2020 16:39:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=khdAdINHrbF0yvYt+hGIc2ksicOYuTBGDLSCy6ujc8Q=; b=PVgFkRAkZooviwpkh4YKCjRWJm
 lCwV6EKVWIr9tftgu5jhO9SlXKWOqDO89dabFgofYsWmXwimzfiupIHtLNrMhsHQgc+zP60xFyiyC
 2X/XmvlwZ4LarJBkFmgXa1qPcfIK9gk+DLHoGP8iUu9upMZOKftI76ouB7h4PCfyKXAE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=khdAdINHrbF0yvYt+hGIc2ksicOYuTBGDLSCy6ujc8Q=; b=hKeekzmYw15+I7Zr3wLxN5TnsX
 apTR3iFCsagpaJpDfm5QjGcFJInAmr3otEKpPOff1i1oiBlHR/GLf9VjcCx4lImZ8X6ZXZgfv7zr0
 SVQpfE9QkeDaXxVfwW7cwFd6whIfNBlch7NHtEIAFP34zalmShlL9RLZ/IUYOMtEioNk=;
Received: from mail-qv1-f68.google.com ([209.85.219.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1izkBv-001YEt-RE
 for kgdb-bugreport@lists.sourceforge.net; Thu, 06 Feb 2020 16:39:51 +0000
Received: by mail-qv1-f68.google.com with SMTP id o18so3153876qvf.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 06 Feb 2020 08:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=khdAdINHrbF0yvYt+hGIc2ksicOYuTBGDLSCy6ujc8Q=;
 b=EIzYnnnQa8E7suKKVeTQY2aMwT8WhXZwnuzb0SDixpYBjgkX1W7WuCrwO+41Hpmqpp
 OCd8RlKKrN4JpSsgPxwBO7Hy81KVa/X678GlNgbQuzTTnNtQL+2yD02IDtKvFt0lR1aJ
 Y5ORYF+7c15kuUTy+ooKE1uipKe0LMrLgaDds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=khdAdINHrbF0yvYt+hGIc2ksicOYuTBGDLSCy6ujc8Q=;
 b=RNuZ/AR/aREYOZnOxQ6IoyI2yz9ujmZ+yL/jzeq8e+X+dlAq2E9cuNNe9BV0Nbrgxq
 n6E8nBT5UMaihJLnFIxx2ie/urtbOft4Ro0LobPGdcVHR+VU6FKciJwkVEFG47G+YBgq
 bPa+PAo09cob5IiHca+DUeJlIG/3BvEZh/smtHL1zktFU15Y2cezz8/6wNzd1NQVpHc/
 n33/N/neC9VskpkZBVh1OTMpR+BLH21UgclsJvQ3KZ/SjpOivfpvpdiKsIJYMiEJaJDE
 p/NDWRiOHt1k+xoXFjZRH0yzqTHdw7dY6K9f44wQ6lcDiHeYj+fmntVzAnMZUHmHQGvm
 zqqw==
X-Gm-Message-State: APjAAAV0Arc9x+XncXt1v4KC+PKtVr3EgFAZch0kQBn63dC9kYK7CiTP
 23XHQ2M3etRA+/4OnpQkcpmrrBerNW0=
X-Google-Smtp-Source: APXvYqx/v6L/6iXZnstn95HdF2fWc9SZcRfj14TPQprFAFg9EpmKmh7gd7btucp509i5tos/i227cQ==
X-Received: by 2002:a1f:fe4e:: with SMTP id l75mr2251166vki.18.1581005772044; 
 Thu, 06 Feb 2020 08:16:12 -0800 (PST)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com.
 [209.85.221.177])
 by smtp.gmail.com with ESMTPSA id o36sm1165375uao.15.2020.02.06.08.16.10
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2020 08:16:11 -0800 (PST)
Received: by mail-vk1-f177.google.com with SMTP id i78so1776435vke.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 06 Feb 2020 08:16:10 -0800 (PST)
X-Received: by 2002:ac5:c807:: with SMTP id y7mr2201558vkl.92.1581005770288;
 Thu, 06 Feb 2020 08:16:10 -0800 (PST)
MIME-Version: 1.0
References: <20200204141219.1.Ief3f3a7edbbd76165901b14813e90381c290786d@changeid>
 <20200205173042.chqij5i53mncfzar@holly.lan>
 <CAD=FV=V6ovmi-zCUYyFdiyf0pG4g=i5N4hUC8JjvrWDRUzPnqQ@mail.gmail.com>
 <20200206115826.oeltu56pp6w5jwvs@holly.lan>
In-Reply-To: <20200206115826.oeltu56pp6w5jwvs@holly.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 6 Feb 2020 08:15:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XpUwWyxoEOdOGf=hDQSmQgU7VV0gOPHdvN1L4AqGok1A@mail.gmail.com>
Message-ID: <CAD=FV=XpUwWyxoEOdOGf=hDQSmQgU7VV0gOPHdvN1L4AqGok1A@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1izkBv-001YEt-RE
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Fix compiling on architectures
 w/out DBG_MAX_REG_NUM defined
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
Cc: Anatoly Pugachev <matorola@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>, Chuhong Yuan <hslester96@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 kgdb-bugreport@lists.sourceforge.net,
 Sparc kernel list <sparclinux@vger.kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Thu, Feb 6, 2020 at 3:58 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Wed, Feb 05, 2020 at 10:01:17AM -0800, Doug Anderson wrote:
> > Hi,
> >
> > On Wed, Feb 5, 2020 at 9:30 AM Daniel Thompson
> > <daniel.thompson@linaro.org> wrote:
> > >
> > > On Tue, Feb 04, 2020 at 02:12:25PM -0800, Douglas Anderson wrote:
> > > > In commit bbfceba15f8d ("kdb: Get rid of confusing diag msg from "rd"
> > > > if current task has no regs") I tried to clean things up by using "if"
> > > > instead of "#ifdef".  Turns out we really need "#ifdef" since not all
> > > > architectures define some of the structures that the code is referring
> > > > to.
> > > >
> > > > Let's switch to #ifdef again, but at least avoid using it inside of
> > > > the function.
> > > >
> > > > Fixes: bbfceba15f8d ("kdb: Get rid of confusing diag msg from "rd" if current task has no regs")
> > > > Reported-by: Anatoly Pugachev <matorola@gmail.com>
> > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > >
> > > Thanks for being so quick with this (especially when if I had been less
> > > delinquent with linux-next it might have been spotted sooner).
> > >
> > >
> > > > ---
> > > > I don't have a sparc64 compiler but I'm pretty sure this should work.
> > > > Testing appreciated.
> > >
> > > I've just add sparc64 into my pre-release testing (although I have had to
> > > turn off a bunch of additional compiler warnings in order to do so).
> > >
> > >
> > > >  kernel/debug/kdb/kdb_main.c | 17 +++++++++++------
> > > >  1 file changed, 11 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> > > > index b22292b649c4..c84e61747267 100644
> > > > --- a/kernel/debug/kdb/kdb_main.c
> > > > +++ b/kernel/debug/kdb/kdb_main.c
> > > > @@ -1833,6 +1833,16 @@ static int kdb_go(int argc, const char **argv)
> > > >  /*
> > > >   * kdb_rd - This function implements the 'rd' command.
> > > >   */
> > > > +
> > > > +/* Fallback to Linux showregs() if we don't have DBG_MAX_REG_NUM */
> > > > +#if DBG_MAX_REG_NUM <= 0
> > > > +static int kdb_rd(int argc, const char **argv)
> > > > +{
> > > > +     if (!kdb_check_regs())
> > > > +             kdb_dumpregs(kdb_current_regs);
> > > > +     return 0;
> > > > +}
> > > > +#else
> > >
> > > The original kdb_rd (and kdb_rm which still exists in this file) place
> > > the #if inside the function and users > 0 so the common case was
> > > covered at the top and the fallback at the bottom.
> > >
> > > Why change style when re-introducing this code?
> >
> > My opinion is that #if / #ifdef leads to hard-to-follow code, so I
> > have always taken the policy that #if / #ifdef don't belong anywhere
> > inside a function if it can be avoided.  This seems to be the policy
> > in Linux in general, though not as much in the existing kgdb code.
> > IMO kgdb should be working to reduce #if / #ifdef inside functions.
>
> I definitely agree that reducing #if and its shortcuts is a good thing.
>
> However I would characterize the dominant pattern as using #if[def]
> to replace disabled functionality with an inline nop version. Other
> cases are, I think, less clear cut.
>
>
> > In this case, the duplicated code is 1 line: the call to
> > kdb_check_regs().  It seemed better to duplicate.  Another option that
> > would avoid the #if / #ifdef in the function would be as follows.
> > Happy to change my patch like this if you prefer:
>
> I wasn't really the duplicated code that bothered me.
>
> More that this test of DBG_MAX_REG_NUM is following a different pattern
> to all other instances in the code case (for a start all others use a
> DBG_MAX_REG_NUM > 0 test and put the fallback code at the bottom).

Ah, got it.  I'll give a shot at a new version then.


> > ...or if you just want to get something quickly so we have time to
> > debate the finer points, I wouldn't object to a simple Revert and I
> > can put it on my plate to resubmit the patch later.
>
> There's a degree of bikeshedding in the above (and as we both know this
> are larger bits of tidying up that kdb, in particular, could benefit
> from) but nevertheless I think a revert is better at this point.
>
> I hope you don't mind but I shall interpret the above paragraph as an
> Acked-by: since I'd like the record to show your diligence in jumping
> on this!

Sounds perfect.  Thanks for the revert and adding exra tests for the
future to keep me from shooting myself in the foot.

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
