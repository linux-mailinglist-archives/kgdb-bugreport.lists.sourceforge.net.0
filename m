Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F3907344FCE
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 22 Mar 2021 20:23:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lOQ8q-0005Gr-Ng
	for lists+kgdb-bugreport@lfdr.de; Mon, 22 Mar 2021 19:23:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1lOQ8Z-0005EV-6F
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Mar 2021 19:22:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cLy5RBMbVv+7pgZZbo/ExjQRPvzPQKaVh0hhl1CwHas=; b=lakO8omL+enXAJnnx79dZCu3UG
 8v4S4e7qrMxNYTBWUOQ4yKdU68mKHhejPnHwkfjtJ9zDFOweCQly6ZqGll73qiWDismLyg0G6CxIK
 dClnFjQ4Ig0Rz1u9oh1lwx+enMSZZQWtePrMnBcWjLenSfrSHO4ckb1Sj+LDBwiGu408=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cLy5RBMbVv+7pgZZbo/ExjQRPvzPQKaVh0hhl1CwHas=; b=RWYnXfRmxEFP/MJubnDgC7oghD
 ANUCVQbCy7brnb3mN2VHs1BPuu5XXJJxVpQVk+JR04H9r05lQLNI6GhWWyz7hC1NPRgfm+VyLDho6
 BC9/neEjPHD3w4RaafjTSGVru/hVBe2b2GPcd5SYEDRCsp3zl/zgvpUz0FUxiUk3QsUQ=;
Received: from mail-qv1-f54.google.com ([209.85.219.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lOQ8U-00081y-AV
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Mar 2021 19:22:51 +0000
Received: by mail-qv1-f54.google.com with SMTP id cx5so9226525qvb.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Mar 2021 12:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cLy5RBMbVv+7pgZZbo/ExjQRPvzPQKaVh0hhl1CwHas=;
 b=K2riKvcAmdu/6NO7DSJFQtQ2uYZUr7E5HDWpXE31+ZFW8NxoYeo8HJgbdTPWvJx2uk
 WY9Pi6gT4xhXUayqnk8iDMB8EC3rLJl0XcimZpWlq6TcZVvPcjyvQQkXJ7x+kuOoQtIp
 KcD5qL+JutHFOFev+kfSzRWannf7vB/GeqbPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cLy5RBMbVv+7pgZZbo/ExjQRPvzPQKaVh0hhl1CwHas=;
 b=dJhjCULJ1wcvv7TrPJ8zTUS93Xr4g07Msh/sZIdl8kfvEoMoyoZxonXmclTKrymkYN
 p4yZZ7ct/rS4D+x5p6t9q/aBQkWD/vjktf1lQ6gq5Bf4L17Zsc0ISEdFvn7zHzlsBIrr
 E3hSeq5s6mZB5vkCpbEw3QZ8EsIpjIObiza6KYRSiXrtA8Leemg84plfjLPQYA8CT457
 od6viYErV23F/FH4h53XMv6/ZFYPnlPLGnGRPeBU/UFpiumF9wYjQxR4IZes4WiK6Nad
 Syhzm/+fcL2ZA8RxL/++j6169G2AZHqDzYQ82GIv/Tf5K4JzT47Q3TVXw6/S/zTQO/3z
 nBJQ==
X-Gm-Message-State: AOAM530gxsJkF22GRnw3oX001oayaUZ3Lc1uIKtuphOsYrh8vZcjpBdx
 YhIOlkTw8v/htnQ2zAXHxn9oQTMzX/heZA==
X-Google-Smtp-Source: ABdhPJyQJHI2wz1/IpFGC0h196dTCMwgIDv6N7sh6TdKZ0qb+6OUz8/YR4jpe/MUsXOkozipa1DzbA==
X-Received: by 2002:a0c:a425:: with SMTP id w34mr1344614qvw.2.1616440960223;
 Mon, 22 Mar 2021 12:22:40 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com.
 [209.85.219.179])
 by smtp.gmail.com with ESMTPSA id y1sm11338873qki.9.2021.03.22.12.22.39
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 12:22:39 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id o66so7775878ybg.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Mar 2021 12:22:39 -0700 (PDT)
X-Received: by 2002:a25:ab54:: with SMTP id u78mr194252ybi.276.1616440959152; 
 Mon, 22 Mar 2021 12:22:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210322164308.827846-1-arnd@kernel.org>
 <CAD=FV=WY6yxx+vkH+UU4VYei29xBftdnyRBE1OpEELmJ-kLfFg@mail.gmail.com>
 <CAK8P3a33qv79GedMCwA=GFBWYCMB2fYrq2QmGpN3TWfqgg8j2A@mail.gmail.com>
In-Reply-To: <CAK8P3a33qv79GedMCwA=GFBWYCMB2fYrq2QmGpN3TWfqgg8j2A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 22 Mar 2021 12:22:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WaOFJEnZ=b+UTaTXDWMs8JOeBw1gRFYrtSJK-+CXGPyw@mail.gmail.com>
Message-ID: <CAD=FV=WaOFJEnZ=b+UTaTXDWMs8JOeBw1gRFYrtSJK-+CXGPyw@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.54 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.54 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lOQ8U-00081y-AV
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

Hi,

On Mon, Mar 22, 2021 at 11:19 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Mon, Mar 22, 2021 at 6:07 PM Doug Anderson <dianders@chromium.org> wrote:
> > On Mon, Mar 22, 2021 at 9:43 AM Arnd Bergmann <arnd@kernel.org> wrote:
> > >
> > > -#define v1printk(a...) do { \
> > > -       if (verbose) \
> > > -               printk(KERN_INFO a); \
> > > -       } while (0)
> > > -#define v2printk(a...) do { \
> > > -       if (verbose > 1) \
> > > -               printk(KERN_INFO a); \
> > > -               touch_nmi_watchdog();   \
> > > -       } while (0)
> > > -#define eprintk(a...) do { \
> > > -               printk(KERN_ERR a); \
> > > -               WARN_ON(1); \
> > > -       } while (0)
> > > +#define v1printk(a...) do {            \
> >
> > nit: In addition to the indentation change you're also lining up the
> > backslashes. Is that just personal preference, or is there some
> > official recommendation in the kernel? I don't really have a strong
> > opinion either way (IMO each style has its advantages).
>
> I don't think there is an official recommendation, I just think the
> style is more common, and it helped my figure out what the
> indentation should look like in this case.

OK, makes sense. I just wasn't sure if there was some standard that I
wasn't aware of. Given that you have to touch all these lines anyway
then making them all pretty like this seems fine to me.


> > > +       if (verbose)                    \
> > > +               printk(KERN_INFO a);    \
> > > +} while (0)
> > > +#define v2printk(a...) do {            \
> > > +       if (verbose > 1)                \
> > > +               printk(KERN_INFO a);    \
> > > +       touch_nmi_watchdog();           \
> >
> > This touch_nmi_watchdog() is pretty wonky. I guess maybe the
> > assumption is that the "verbose level 2" prints are so chatty that the
> > printing might prevent us from touching the NMI watchdog in the way
> > that we normally do and thus we need an extra one here?
> >
> > ...but, in that case, I think the old code was _wrong_ and that the
> > intention was that the touch_nmi_watchdog() should only be if "verose
> > > 1" as the indentation implied. There doesn't feel like a reason to
> > touch the watchdog if we're not doing anything slow.
>
> No idea. It was like this in Jason's original version from 2008.

Yeah, I noticed the same. I'd be curious what Daneil (or Jason if he's
reading) says. I suppose i could always wait until your patch lands
and then send a new patch that puts it inside the "if" statement and
we can debate it then.

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
