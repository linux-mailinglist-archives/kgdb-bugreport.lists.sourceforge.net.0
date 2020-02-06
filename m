Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5349E15439E
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  6 Feb 2020 12:58:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1izfnv-00077o-4X
	for lists+kgdb-bugreport@lfdr.de; Thu, 06 Feb 2020 11:58:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1izfnt-00077e-8p
 for kgdb-bugreport@lists.sourceforge.net; Thu, 06 Feb 2020 11:58:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/ctO8Y0tUsZtI6bHpDj7/djb98AaT4cQRUxUXkkzZb4=; b=YHvZd64pYRpTgbCnfGv8EHiumz
 5RmbBRUGTDVFOuux+ntIpybiAUQMCrNSv9MYSY7GBfHHyIk0Lh65wOtcG0oh5zUDad+ri5haIxRb2
 f34ifvwhO6IUL6LoiOAEFxfm7Bq6+Lrwzkv5sOCKyk2SHaDvL1x3uBPZvmdsB39y5Bsg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/ctO8Y0tUsZtI6bHpDj7/djb98AaT4cQRUxUXkkzZb4=; b=hz19hvsJtVA2Go7hVLbqF83r1o
 NLOSiCvig9z+BhgzLZx3kbkKAPFwiFApLIt47xtyc4QPmn6NJv+jYvtecS85Np0siDeJXTkoIBJvI
 e3gyI+R5KFzKs1a1fj33r7sOuheyJh5+5nd+JxTyXsPfMfHNy8WYh3KYdbhfFyEUbGSM=;
Received: from mail-wr1-f67.google.com ([209.85.221.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1izfnn-00BsIP-Mm
 for kgdb-bugreport@lists.sourceforge.net; Thu, 06 Feb 2020 11:58:41 +0000
Received: by mail-wr1-f67.google.com with SMTP id t3so6816246wru.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 06 Feb 2020 03:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/ctO8Y0tUsZtI6bHpDj7/djb98AaT4cQRUxUXkkzZb4=;
 b=E/f4IdKI2P6/z9QxBfePTmHFhbcIGjNr9wAl8FiNopZPvnZ5W9Q6N0z+yvxGMzhpGK
 HjTUEg4PKPrDWXn8lY6DOnEGppJ9G+2GsadFqlN2gmOnebrGTzH4xNStmxTxgADwNymE
 iKPOuu4mgnwecFQDT3YXV5Tp5AFvFI2PcgKuKu3oLGXPTg1DB4bmqIKQdfo5jsOguHC6
 G6AcVdRBtXFvGdss51W9zNIiOHhHFMJD5RGdNWy8TiG6BmtN3lz/8EBqRS3bUeaqFAVG
 cIeM/XLtprYYYuW0/6hv8GFNKF4WG6TTGoLpdSXntZ0Ti2byiuer4JAqAkdBr5joQu2K
 BfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/ctO8Y0tUsZtI6bHpDj7/djb98AaT4cQRUxUXkkzZb4=;
 b=RxKjD8zJ+Y9UZZ5uVAC5vL1+QEPLmuDyALC+QN7zE9l2G/GrcEYzxpaW0fkqBdXKM/
 ZYNgI9VfHtXXhjVRbG868Wea5i1/+qw/rn9/S9Uy/pVy3ZLnUAiWJfIY/0mP5Aq5bR+G
 kdJfSTqavjpAe6MVE8vl0G0YXLMLozlBJSM643QFyV9eL3P8sc1Qk7JbkWMz8LqnrKXt
 tz8ANJki5RCN11p/cm5NpAmXZCpopbPSY0Uqo3Sa6AscoyzYEzuUQjxK95HxcNtHrqN2
 nB+t03K0IiAZhlugn2w0dFSG7doEcYWIjkU+LKNEFoRwK35GL0IhYAG9nrBtCRCF+4UU
 UGow==
X-Gm-Message-State: APjAAAUYxNnjSVZNkxlT4wntq9ObR8b7jt/TzGDAX2I/+T+mudPC9JkV
 X6HaPvHQh7Y602P2Bf5NijywfQ==
X-Google-Smtp-Source: APXvYqzh/u6fdU7NmBJmTsFyRggktpYhdZCXFoNO5/+L83VgI/fQBwsTCcdLJao5aIM6PhXjscV7XA==
X-Received: by 2002:a5d:6191:: with SMTP id j17mr3281226wru.427.1580990309089; 
 Thu, 06 Feb 2020 03:58:29 -0800 (PST)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id e22sm4064362wrc.13.2020.02.06.03.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 03:58:28 -0800 (PST)
Date: Thu, 6 Feb 2020 11:58:26 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20200206115826.oeltu56pp6w5jwvs@holly.lan>
References: <20200204141219.1.Ief3f3a7edbbd76165901b14813e90381c290786d@changeid>
 <20200205173042.chqij5i53mncfzar@holly.lan>
 <CAD=FV=V6ovmi-zCUYyFdiyf0pG4g=i5N4hUC8JjvrWDRUzPnqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=V6ovmi-zCUYyFdiyf0pG4g=i5N4hUC8JjvrWDRUzPnqQ@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1izfnn-00BsIP-Mm
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

On Wed, Feb 05, 2020 at 10:01:17AM -0800, Doug Anderson wrote:
> Hi,
> 
> On Wed, Feb 5, 2020 at 9:30 AM Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> >
> > On Tue, Feb 04, 2020 at 02:12:25PM -0800, Douglas Anderson wrote:
> > > In commit bbfceba15f8d ("kdb: Get rid of confusing diag msg from "rd"
> > > if current task has no regs") I tried to clean things up by using "if"
> > > instead of "#ifdef".  Turns out we really need "#ifdef" since not all
> > > architectures define some of the structures that the code is referring
> > > to.
> > >
> > > Let's switch to #ifdef again, but at least avoid using it inside of
> > > the function.
> > >
> > > Fixes: bbfceba15f8d ("kdb: Get rid of confusing diag msg from "rd" if current task has no regs")
> > > Reported-by: Anatoly Pugachev <matorola@gmail.com>
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >
> > Thanks for being so quick with this (especially when if I had been less
> > delinquent with linux-next it might have been spotted sooner).
> >
> >
> > > ---
> > > I don't have a sparc64 compiler but I'm pretty sure this should work.
> > > Testing appreciated.
> >
> > I've just add sparc64 into my pre-release testing (although I have had to
> > turn off a bunch of additional compiler warnings in order to do so).
> >
> >
> > >  kernel/debug/kdb/kdb_main.c | 17 +++++++++++------
> > >  1 file changed, 11 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> > > index b22292b649c4..c84e61747267 100644
> > > --- a/kernel/debug/kdb/kdb_main.c
> > > +++ b/kernel/debug/kdb/kdb_main.c
> > > @@ -1833,6 +1833,16 @@ static int kdb_go(int argc, const char **argv)
> > >  /*
> > >   * kdb_rd - This function implements the 'rd' command.
> > >   */
> > > +
> > > +/* Fallback to Linux showregs() if we don't have DBG_MAX_REG_NUM */
> > > +#if DBG_MAX_REG_NUM <= 0
> > > +static int kdb_rd(int argc, const char **argv)
> > > +{
> > > +     if (!kdb_check_regs())
> > > +             kdb_dumpregs(kdb_current_regs);
> > > +     return 0;
> > > +}
> > > +#else
> >
> > The original kdb_rd (and kdb_rm which still exists in this file) place
> > the #if inside the function and users > 0 so the common case was
> > covered at the top and the fallback at the bottom.
> >
> > Why change style when re-introducing this code?
> 
> My opinion is that #if / #ifdef leads to hard-to-follow code, so I
> have always taken the policy that #if / #ifdef don't belong anywhere
> inside a function if it can be avoided.  This seems to be the policy
> in Linux in general, though not as much in the existing kgdb code.
> IMO kgdb should be working to reduce #if / #ifdef inside functions.

I definitely agree that reducing #if and its shortcuts is a good thing.

However I would characterize the dominant pattern as using #if[def]
to replace disabled functionality with an inline nop version. Other
cases are, I think, less clear cut.


> In this case, the duplicated code is 1 line: the call to
> kdb_check_regs().  It seemed better to duplicate.  Another option that
> would avoid the #if / #ifdef in the function would be as follows.
> Happy to change my patch like this if you prefer:

I wasn't really the duplicated code that bothered me.

More that this test of DBG_MAX_REG_NUM is following a different pattern
to all other instances in the code case (for a start all others use a
DBG_MAX_REG_NUM > 0 test and put the fallback code at the bottom).


> ...or if you just want to get something quickly so we have time to
> debate the finer points, I wouldn't object to a simple Revert and I
> can put it on my plate to resubmit the patch later.

There's a degree of bikeshedding in the above (and as we both know this
are larger bits of tidying up that kdb, in particular, could benefit
from) but nevertheless I think a revert is better at this point.

I hope you don't mind but I shall interpret the above paragraph as an
Acked-by: since I'd like the record to show your diligence in jumping
on this!


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
