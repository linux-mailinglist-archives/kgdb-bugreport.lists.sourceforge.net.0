Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D2314BDE
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  6 May 2019 16:33:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hNegJ-0003gQ-OU
	for lists+kgdb-bugreport@lfdr.de; Mon, 06 May 2019 14:33:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yamada.masahiro@socionext.com>) id 1hNegI-0003g1-FW
 for kgdb-bugreport@lists.sourceforge.net; Mon, 06 May 2019 14:33:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eqLFB0nVFnZiNimHn82KIGN7U2ZgzKcawlpMijhfc9w=; b=IZBbMSTxyu0JZ4YJ8t8wFnR6VY
 StewCvoRqmHn8FbUf1SaEbSjNdsIq8nZtOV8dcUj+b2lJCNWig9+q2ccExal5ytJ+PjgR2NPM/zcb
 uGdV7S15g+weL/rObGl23R12FwhSkQzePiKZb9/buBZiVfxPz0bo4c8iOW1Vx7dtDWDY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eqLFB0nVFnZiNimHn82KIGN7U2ZgzKcawlpMijhfc9w=; b=X26sYQkfZvGdYToi8WVbMibM66
 N9bo0NE/HRz8uKS6GJiYYBYhq9Fn2QbE07N2K1S0QrVIFo9SrR0efwUCtzejn7mFBgmTAgKgn9xmz
 6eE71e+pOmlwqIlW9uaifCcy1E3nb7BOO8dkzJvnvAosKFCV4Ql+ncD8M2Mlnf8+hoVk=;
Received: from condef-08.nifty.com ([202.248.20.73])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hNegF-007nfq-SQ
 for kgdb-bugreport@lists.sourceforge.net; Mon, 06 May 2019 14:33:26 +0000
Received: from conssluserg-01.nifty.com ([10.126.8.80])by condef-08.nifty.com
 with ESMTP id x46ETIrp016178
 for <kgdb-bugreport@lists.sourceforge.net>; Mon, 6 May 2019 23:29:18 +0900
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id x46ESsvY029568
 for <kgdb-bugreport@lists.sourceforge.net>; Mon, 6 May 2019 23:28:55 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x46ESsvY029568
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1557152935;
 bh=eqLFB0nVFnZiNimHn82KIGN7U2ZgzKcawlpMijhfc9w=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XhpGpVKTClir5AxkSP7NnwHlzCdghMB4dNiu1+xGvHpE07nPSmbwmD1d2ynaoeOuB
 FahHzJzl8/gkBMAQiJ9HlPTZjYwZ/r2pUzr9+aaAiL1ACzqOS3KkfF56H34Nr1BC4y
 322kyQ0SfRdiY+J31kxWHBYV/ybhHi/TSvsr73oieLL1Xlgj8/ip0fIln4yCqlcx+p
 VY6kPFU+PLyQ3w7QLHtVZ9jLKmbrL9Lqmli6uTbJeGowaqligirlscL9AZBW0cs084
 q7bX8b937+hT3AodRM+O5sBL6ZWg/G7Bpc+wHmC+YK3ZNPKlMLthIyGryGKMTC7a+c
 b8OIF2SoI285A==
X-Nifty-SrcIP: [209.85.217.45]
Received: by mail-vs1-f45.google.com with SMTP id g127so8250360vsd.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 06 May 2019 07:28:55 -0700 (PDT)
X-Gm-Message-State: APjAAAXm62k9RF38y2U1F0aTAnNbkBEneHsOr1kb9Gq0CN1KMaWZN2Ct
 GIerSTmxSuKzc+EWurKvIwxveEKUTbpuocFpmEc=
X-Google-Smtp-Source: APXvYqxdltPkQPlIf2njpz+a8BUdQSjsHQ5lVipXcpd+mrcRcFhyBsTBof90IRV3XT2pIlW7uxsmlC28VFTtzEvAAEo=
X-Received: by 2002:a67:fd89:: with SMTP id k9mr1073873vsq.54.1557152934032;
 Mon, 06 May 2019 07:28:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190323015227.245455-1-dianders@chromium.org>
 <CAK7LNARYMy2=viA1et9tZk409M=OSteD5D675oAKQEs6SG77HQ@mail.gmail.com>
 <20190416163034.3e642818ebf27ed6891c1981@linux-foundation.org>
 <CAK7LNAR4Ty8835sfo4HSvBsMCsV65mY2HOajFSY2TOYurmkFdw@mail.gmail.com>
 <20190418160651.40cb6a11186a6c6028e9d20d@linux-foundation.org>
 <CAK7LNAQe2uaVfKee1F6R4siVvUSCMgSaYAnUQfz8MS5PeFqpGA@mail.gmail.com>
 <e5f29ca9b6067fff9ea68cb25e15906659cd51ad.camel@perches.com>
In-Reply-To: <e5f29ca9b6067fff9ea68cb25e15906659cd51ad.camel@perches.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 6 May 2019 23:28:17 +0900
X-Gmail-Original-Message-ID: <CAK7LNATFrp=4JcqU2pFJ-+06HZ_6T+R75gwSF=ax-0yJZJ_rVg@mail.gmail.com>
Message-ID: <CAK7LNATFrp=4JcqU2pFJ-+06HZ_6T+R75gwSF=ax-0yJZJ_rVg@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [202.248.20.73 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [202.248.20.73 listed in wl.mailspike.net]
 1.0 SPF_SOFTFAIL           SPF: sender does not match SPF record (softfail)
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hNegF-007nfq-SQ
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

This patch is technically super easy,
but shows how difficult to apply a
single patch in a correct manner.


The following showed up in today's linux-next,
doubling
"Signed-off-by: Douglas Anderson <dianders@chromium.org>"

This is obviously caused by the committer.

Do we need some check script for maintainers
before "git push" ?





commit 51fee3389d71bfd281df02c55546a6103779e145
Author:     Douglas Anderson <dianders@chromium.org>
AuthorDate: Fri Mar 22 18:52:27 2019 -0700
Commit:     Daniel Thompson <daniel.thompson@linaro.org>
CommitDate: Thu May 2 14:55:07 2019 +0100

    kdb: Get rid of broken attempt to print CCVERSION in kdb summary

    If you drop into kdb and type "summary", it prints out a line that
    says this:

      ccversion  CCVERSION

    ...and I don't mean that it actually prints out the version of the C
    compiler.  It literally prints out the string "CCVERSION".

    The version of the C Compiler is already printed at boot up and it
    doesn't seem useful to replicate this in kdb.  Let's just delete it.
    We can also delete the bit of the Makefile that called the C compiler
    in an attempt to pass this into kdb.  This will remove one extra call
    to the C compiler at Makefile parse time and (very slightly) speed up
    builds.

    Signed-off-by: Douglas Anderson <dianders@chromium.org>
    Reviewed-by: Masahiro Yamada <yamada.masahiro@socionext.com>
    Signed-off-by: Douglas Anderson <dianders@chromium.org>
    Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>








On Sat, Apr 20, 2019 at 3:24 AM Joe Perches <joe@perches.com> wrote:
>
> On Fri, 2019-04-19 at 12:28 +0900, Masahiro Yamada wrote:
> > Hi Joe,
> >
> > Can you detect redundant Cc: by checkpatch?
> >
> > Please see below in details.
> > Thanks.
>
> Yes, but I'm not sure why it's useful or necessary.
> git send-email using some scripts elides duplicate email addresses
> ---
>  scripts/checkpatch.pl | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 1c421ac42b07..bedec83cb797 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2688,6 +2688,19 @@ sub process {
>                                 $signatures{$sig_nospace} = 1;
>                         }
>
> +# Check for a cc: line with another signature -by: by the same author
> +                       if ($sig_nospace =~ /^cc:/) {
> +                               my $sig_email = substr($sig_nospace, 3);
> +                               foreach my $sig (sort keys %signatures) {
> +                                       next if ($sig =~ /^cc:/);
> +                                       $sig =~ s/^[^:]+://;
> +                                       if ($sig eq $sig_email) {
> +                                               WARN("BAD_SIGN_OFF",
> +                                                    "Unnecessary CC: as there is another signature with the same name/email address\n" . $herecurr);
> +                                       }
> +                               }
> +                       }
> +
>  # Check Co-developed-by: immediately followed by Signed-off-by: with same name and email
>                         if ($sign_off =~ /^co-developed-by:$/i) {
>                                 if ($email eq $author) {
>
>


-- 
Best Regards
Masahiro Yamada


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
