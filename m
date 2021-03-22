Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F236A344E4A
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 22 Mar 2021 19:19:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lOP9C-0005mf-NW
	for lists+kgdb-bugreport@lfdr.de; Mon, 22 Mar 2021 18:19:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <arnd@kernel.org>) id 1lOP9A-0005mX-Rf
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Mar 2021 18:19:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KTtefK1KX08s6sVcbMW7myLRdRVww4b3rd94QDjhj6I=; b=MPeVi090KmKNFiGjCoExUYt9aK
 UaKVsta4VqUp7ZkwHVOMXju/xOYI4FU1RX13sxlvZnzjoWfCRLNGfhDSF6j+VQQk0B8eRz6anBe67
 hNvIRgM7a1U7cI65SQCd25q+F4gwjZnyY5qAHCkbUm4Nh3kyPGQtl5gO0hjqKadFGZXg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KTtefK1KX08s6sVcbMW7myLRdRVww4b3rd94QDjhj6I=; b=CphYbJQkDXoPrV4zDlDtRe0Fnp
 W/dVF4uEog2UpuVo7bCWSk6EBqRqTB5sv7DjCYvEDNnEm2ACPwNjKirXCEjn/qMVRGkkDc7MeWyXM
 mLkrCq8kFElxDgQiRk679E+Rm0etNlye6exTsrPaEWuQoc+ftDqhoyVl7me2O7RDT6E8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lOP92-0005pm-1k
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Mar 2021 18:19:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 81C036191C
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Mar 2021 18:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616437150;
 bh=cdPpn3bt7dQ/SwR6Dy7EJSGEakSRnVumbWhThjLvpUc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Ig2dXZ7ya8sNkFozuTgi5W6y9J2EXekKgRlM1HiQaNB/3/YWllzoWA2uj9Dk6Gxot
 c8OYF13r5sAhuGUU2j8ZpwjyCp7bDl4NicFuDnUJxxP+c+htgTJv3IqaeEfprMd9Jz
 TW7rJ7yFUWB3eYR6w6rS6g9h90wNqi0tmi8PXcecWF/0Nf23MC0oYYRP0ZXlt7jerq
 1wv0bo98kRhYRaBn502GKr4F2Adul/durycOsGJlE8KAyWExidh2tjwzhVUyzI9w2L
 pAcGdtSxsIl/XrsBLiGD7/MkzrMfoS0+BMN6nvsAobPQIbcr7/cA8swpTPu+1/nMxN
 i6NLBjIBVRPzg==
Received: by mail-oi1-f179.google.com with SMTP id f9so14064633oiw.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Mar 2021 11:19:10 -0700 (PDT)
X-Gm-Message-State: AOAM532CciqERAfBJXhJrH9atjOQLGFos7gIB1F1quE85yDVxilENCg2
 WbFdwJJBA0dtIafZ2QQWfP8tdktRlrZjYuWnbAc=
X-Google-Smtp-Source: ABdhPJxSLNPBxXBFB8iEKPeuTux32ku2fkG7glt0LYjH9Mkhk2/DYQAu3FtNVJIcSki7YiLz4HABxLu8570f24xCyfE=
X-Received: by 2002:a05:6808:3d9:: with SMTP id o25mr305830oie.4.1616437149772; 
 Mon, 22 Mar 2021 11:19:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210322164308.827846-1-arnd@kernel.org>
 <CAD=FV=WY6yxx+vkH+UU4VYei29xBftdnyRBE1OpEELmJ-kLfFg@mail.gmail.com>
In-Reply-To: <CAD=FV=WY6yxx+vkH+UU4VYei29xBftdnyRBE1OpEELmJ-kLfFg@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 22 Mar 2021 19:18:53 +0100
X-Gmail-Original-Message-ID: <CAK8P3a33qv79GedMCwA=GFBWYCMB2fYrq2QmGpN3TWfqgg8j2A@mail.gmail.com>
Message-ID: <CAK8P3a33qv79GedMCwA=GFBWYCMB2fYrq2QmGpN3TWfqgg8j2A@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lOP92-0005pm-1k
Subject: Re: [Kgdb-bugreport] [PATCH] kgdb: fix gcc-11 warning on indentation
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, LKML <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@elte.hu>,
 Christian Brauner <christian.brauner@ubuntu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Mar 22, 2021 at 6:07 PM Doug Anderson <dianders@chromium.org> wrote:
> On Mon, Mar 22, 2021 at 9:43 AM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > -#define v1printk(a...) do { \
> > -       if (verbose) \
> > -               printk(KERN_INFO a); \
> > -       } while (0)
> > -#define v2printk(a...) do { \
> > -       if (verbose > 1) \
> > -               printk(KERN_INFO a); \
> > -               touch_nmi_watchdog();   \
> > -       } while (0)
> > -#define eprintk(a...) do { \
> > -               printk(KERN_ERR a); \
> > -               WARN_ON(1); \
> > -       } while (0)
> > +#define v1printk(a...) do {            \
>
> nit: In addition to the indentation change you're also lining up the
> backslashes. Is that just personal preference, or is there some
> official recommendation in the kernel? I don't really have a strong
> opinion either way (IMO each style has its advantages).

I don't think there is an official recommendation, I just think the
style is more common, and it helped my figure out what the
indentation should look like in this case.

>
> > +       if (verbose)                    \
> > +               printk(KERN_INFO a);    \
> > +} while (0)
> > +#define v2printk(a...) do {            \
> > +       if (verbose > 1)                \
> > +               printk(KERN_INFO a);    \
> > +       touch_nmi_watchdog();           \
>
> This touch_nmi_watchdog() is pretty wonky. I guess maybe the
> assumption is that the "verbose level 2" prints are so chatty that the
> printing might prevent us from touching the NMI watchdog in the way
> that we normally do and thus we need an extra one here?
>
> ...but, in that case, I think the old code was _wrong_ and that the
> intention was that the touch_nmi_watchdog() should only be if "verose
> > 1" as the indentation implied. There doesn't feel like a reason to
> touch the watchdog if we're not doing anything slow.

No idea. It was like this in Jason's original version from 2008.

        Arnd


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
