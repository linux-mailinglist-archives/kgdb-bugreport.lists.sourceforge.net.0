Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 849E416586
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  7 May 2019 16:18:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hO0vi-0008Vq-9c
	for lists+kgdb-bugreport@lfdr.de; Tue, 07 May 2019 14:18:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1hO0vg-0008Ve-Mv
 for kgdb-bugreport@lists.sourceforge.net; Tue, 07 May 2019 14:18:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ftaHeLN6LcCSd/vTpOtKevk2/0Z7rhTtE8080NO1IyY=; b=Ov+YEuhcavYnnz5TZR30CyRPx8
 CqgzXbRWK0WpD+B2GMkRy219pqqMbK1enQpsd+j73qHaJNBZpgG88AN79pX1gb168C1mqqyxIEMs1
 K0aaOyh11e37DH5a1E1zS53JcP7Y6MdiUPFWt4hd9Elo3Ru7LGC7m6aby5KLUld+o+lU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ftaHeLN6LcCSd/vTpOtKevk2/0Z7rhTtE8080NO1IyY=; b=nJ2kS6gPbZ7agnfeGaWk8KVq6C
 wq72uvIS/yNDfD4kaUhdmorzpLQIQucN4LTUXIqdlZPM5IRq6wQ6EGbp6IA6qF5SwH5g6VsJv2NWO
 WpM77vb734JMDfwZsrT58/Y7Gwmlz1BvaEM8oKEYM88cAk88EWPUmZqjlYENe4+bSbeo=;
Received: from mail-wm1-f65.google.com ([209.85.128.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hO0ve-008KEm-N9
 for kgdb-bugreport@lists.sourceforge.net; Tue, 07 May 2019 14:18:48 +0000
Received: by mail-wm1-f65.google.com with SMTP id n25so20255212wmk.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 07 May 2019 07:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ftaHeLN6LcCSd/vTpOtKevk2/0Z7rhTtE8080NO1IyY=;
 b=CCwcJmAiQKULARVAkP5inOfEjWKng+/5qwejU5zut+xMgxu9Lz7szjMOX5Xye5c1oJ
 cznwYpljGq+BC3K3fwYe2OCHd3JKh+sj63tnCIW+RGgG3ZIIseDiPfkjvM99TqCbVV61
 P6jXTr6/iwdE6OllImhcj0qRaffSt4WZQBbx1EQTbXo3x5dnsOa6JZtvr5+xRh9OT8tQ
 GOEV+VC4l5vhCJlxTGY37rJ1yDUvKjoy8Kx3/dZoc9f2eTvBo6XdvF2p7aQEBMRynLAn
 nLNHfPLXYOq/H8snFIZWzds05JeICe1XCFTTGJMBZHhjpW3lT+6Ir7OEDneubUy43MGd
 MY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ftaHeLN6LcCSd/vTpOtKevk2/0Z7rhTtE8080NO1IyY=;
 b=N5d7CInTpa4vJbEpk1pfk/3Xvrhp6knnttckm0y4m85u2b7lNvLf8qnN8YjAqd66RY
 TJQ7unjj1UpdN1H71Rv5pAgW5h9kTuM2chKkyJwTv/bV3mp650Rg0Qri5TMbPLYxdd/4
 zIqJ6kHVf4gxTKYNUnY4e+T2+p6vYR6j13JJDC34+FSnfBv8tluq7bw03XiqvvK20KSB
 bQkLJ/0tmYRgaBk1RWayU3dmNnUykPgPKHEUlPP9uGntE7pF/7fYMYAYKEUykpIjSOKp
 X0/qd88WO3WZOuTK9oxAOShA8Lwsk0666b63bp/Tq8NK7EozHp1m/CTfmeW+oSV5ylUn
 Nn3g==
X-Gm-Message-State: APjAAAX9ozs+7Kna/W7uFxtx0Kf01Zc30D5i8e8VTtfi3M14pF8NA+XK
 fCaMv7XlmDt8BUQEZnXGBuyUhyeZwYkRsw==
X-Google-Smtp-Source: APXvYqzL08M0l8/b/QjHbLH9zM/aRoR1h6JRay21JayfU1JzJMO2JVVBenIDL7uUa3ccVpd9cExWAg==
X-Received: by 2002:a7b:c411:: with SMTP id k17mr21162882wmi.68.1557237315102; 
 Tue, 07 May 2019 06:55:15 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id f138sm6267700wmf.23.2019.05.07.06.55.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 May 2019 06:55:14 -0700 (PDT)
Date: Tue, 7 May 2019 14:55:12 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Message-ID: <20190507135512.5fyy3zu7ljjaeg3u@holly.lan>
References: <20190323015227.245455-1-dianders@chromium.org>
 <CAK7LNARYMy2=viA1et9tZk409M=OSteD5D675oAKQEs6SG77HQ@mail.gmail.com>
 <20190416163034.3e642818ebf27ed6891c1981@linux-foundation.org>
 <CAK7LNAR4Ty8835sfo4HSvBsMCsV65mY2HOajFSY2TOYurmkFdw@mail.gmail.com>
 <20190418160651.40cb6a11186a6c6028e9d20d@linux-foundation.org>
 <CAK7LNAQe2uaVfKee1F6R4siVvUSCMgSaYAnUQfz8MS5PeFqpGA@mail.gmail.com>
 <e5f29ca9b6067fff9ea68cb25e15906659cd51ad.camel@perches.com>
 <CAK7LNATFrp=4JcqU2pFJ-+06HZ_6T+R75gwSF=ax-0yJZJ_rVg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK7LNATFrp=4JcqU2pFJ-+06HZ_6T+R75gwSF=ax-0yJZJ_rVg@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: socionext.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.65 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hO0ve-008KEm-N9
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Get rid of broken attempt to
 print CCVERSION in kdb summary
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net, Johannes Weiner <hannes@cmpxchg.org>,
 Nicholas Mc Guire <hofrat@osadl.org>, Douglas Anderson <dianders@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, Joe Perches <joe@perches.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, May 06, 2019 at 11:28:17PM +0900, Masahiro Yamada wrote:
> This patch is technically super easy,
> but shows how difficult to apply a
> single patch in a correct manner.
> 
> 
> The following showed up in today's linux-next,
> doubling
> "Signed-off-by: Douglas Anderson <dianders@chromium.org>"
> 
> This is obviously caused by the committer.

Quite so. Thanks for pointing it out.


> Do we need some check script for maintainers
> before "git push" ?

I have to admit that I think this was just a checkpatch mistake on
my part.

This thread is a bit unusual in that patchwork has collected up
all the example Tested-by: Fred stuff that arose during the earlier
tools conversation. It looks like I was sufficiently distracted by
those to overlook the duplicated sign off...


Daniel.

 
> commit 51fee3389d71bfd281df02c55546a6103779e145
> Author:     Douglas Anderson <dianders@chromium.org>
> AuthorDate: Fri Mar 22 18:52:27 2019 -0700
> Commit:     Daniel Thompson <daniel.thompson@linaro.org>
> CommitDate: Thu May 2 14:55:07 2019 +0100
> 
>     kdb: Get rid of broken attempt to print CCVERSION in kdb summary
> 
>     If you drop into kdb and type "summary", it prints out a line that
>     says this:
> 
>       ccversion  CCVERSION
> 
>     ...and I don't mean that it actually prints out the version of the C
>     compiler.  It literally prints out the string "CCVERSION".
> 
>     The version of the C Compiler is already printed at boot up and it
>     doesn't seem useful to replicate this in kdb.  Let's just delete it.
>     We can also delete the bit of the Makefile that called the C compiler
>     in an attempt to pass this into kdb.  This will remove one extra call
>     to the C compiler at Makefile parse time and (very slightly) speed up
>     builds.
> 
>     Signed-off-by: Douglas Anderson <dianders@chromium.org>
>     Reviewed-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>     Signed-off-by: Douglas Anderson <dianders@chromium.org>
>     Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> 
> 
> 
> 
> 
> 
> 
> 
> On Sat, Apr 20, 2019 at 3:24 AM Joe Perches <joe@perches.com> wrote:
> >
> > On Fri, 2019-04-19 at 12:28 +0900, Masahiro Yamada wrote:
> > > Hi Joe,
> > >
> > > Can you detect redundant Cc: by checkpatch?
> > >
> > > Please see below in details.
> > > Thanks.
> >
> > Yes, but I'm not sure why it's useful or necessary.
> > git send-email using some scripts elides duplicate email addresses
> > ---
> >  scripts/checkpatch.pl | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index 1c421ac42b07..bedec83cb797 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -2688,6 +2688,19 @@ sub process {
> >                                 $signatures{$sig_nospace} = 1;
> >                         }
> >
> > +# Check for a cc: line with another signature -by: by the same author
> > +                       if ($sig_nospace =~ /^cc:/) {
> > +                               my $sig_email = substr($sig_nospace, 3);
> > +                               foreach my $sig (sort keys %signatures) {
> > +                                       next if ($sig =~ /^cc:/);
> > +                                       $sig =~ s/^[^:]+://;
> > +                                       if ($sig eq $sig_email) {
> > +                                               WARN("BAD_SIGN_OFF",
> > +                                                    "Unnecessary CC: as there is another signature with the same name/email address\n" . $herecurr);
> > +                                       }
> > +                               }
> > +                       }
> > +
> >  # Check Co-developed-by: immediately followed by Signed-off-by: with same name and email
> >                         if ($sign_off =~ /^co-developed-by:$/i) {
> >                                 if ($email eq $author) {
> >
> >
> 
> 
> -- 
> Best Regards
> Masahiro Yamada


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
