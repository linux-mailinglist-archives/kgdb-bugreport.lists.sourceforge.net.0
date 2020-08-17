Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B895C246829
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 17 Aug 2020 16:12:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k7fsL-00073f-RW
	for lists+kgdb-bugreport@lfdr.de; Mon, 17 Aug 2020 14:12:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1k7fsK-00073X-OO
 for kgdb-bugreport@lists.sourceforge.net; Mon, 17 Aug 2020 14:12:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q7d9pcUKbDGfUpE6Avug3GSgjxvOVpz7Xk0gMD0ttFI=; b=bxsAL2pM69/Ah1mDgBoNUOBNtG
 o99vLzkAIlaSdOjbBHalVb5xTp0Zpi5/fTItzMpLXeDAqgFTNsBcXY+OjLmI070f5VYpuT8koZE46
 9VEAt4klwk7kWWaOaoVaj3jUrJ/hIwhcaOa0Ju6HCvw9fBDFWX+9KrReUngHr7RqVJug=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q7d9pcUKbDGfUpE6Avug3GSgjxvOVpz7Xk0gMD0ttFI=; b=QIKj7oS1JjGDOQPhuhtYNx8Te4
 3N/WD8GJ03R3qxo/jIJyQO8ngybgJetuWqKUvvmZzmjk87+tss6L7UhkojCH6unSmFH4Aa5SvI/DD
 qekE5Ui9aLQqrPgbYMVirbCpQNi6SexfgnMy8n3qD7zRpAS6J/vM/HKxFG0Cg8mzvN70=;
Received: from mail-lj1-f195.google.com ([209.85.208.195])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k7fsG-00EHbn-6H
 for kgdb-bugreport@lists.sourceforge.net; Mon, 17 Aug 2020 14:12:36 +0000
Received: by mail-lj1-f195.google.com with SMTP id v4so17688747ljd.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 17 Aug 2020 07:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q7d9pcUKbDGfUpE6Avug3GSgjxvOVpz7Xk0gMD0ttFI=;
 b=gMYUOdqdelXi5UQrg9TpMibqw1w8S+D7awDT/BVjaXw0fti06gTMWCpDjBZe1W3JuF
 8kvgIhZgJvl2rmVX9sEqiCzZuIFkC8nAmnRa1P9BdBrDlVfna7dmE4p4LsGXFIi84F1z
 Xwp39IbROt/uopEH0yzVyvloQrlb7SUdwdrSX54JKhlP7hSlH2Jlkb1FF+QZX1AnhtA6
 DG2/CggHeahPAYMXlvXPAmxz01X9bZ5KKSFsCKsVlv2fzk9Nr/6zHNDKFnM8m56OSV52
 Aut9y7m932gKz0zRZaps3FnIUKfRrzulUVC09X1S6VMJvradsQl61jIhQLcIitHOgmWa
 xynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q7d9pcUKbDGfUpE6Avug3GSgjxvOVpz7Xk0gMD0ttFI=;
 b=CurXRROxFbgLlqjDVFUeCKzMqq4cl+pOCQN+q+dIkDttpcHMMkhDCuSIx+xMBo7/s7
 ZOGM+Li9DTRTus9hkQY45P01QbCAladrukM+gVqdiTvEYD5eWzwfBhrY/+3O6qkW3nmx
 nBNQPxbq6ph3LyLF33Cbrasmy/f8ei9gQzp1Q54KiBeK4vk0rhDPp1dNSdWqGE1jUztp
 jnpoJ4pupsgos/xitagStpl/W2OmYhVDH4/PZoD2jyb4NvIcgJz3+wb4IFYluQi6CkOG
 H38KwzDcj0FXw21Xw0mQzO2LUf2FGUj7X7WojsxHeJ5HvW+srUAlZGwQQtxtrU+MnOH+
 ddpQ==
X-Gm-Message-State: AOAM530DhkXols22ExqMGh22Go1/6wewaZmTXOIBz8FtxeLVYtdOQH1a
 34JwchhHMHNsJL81LxMf1RQ54Q6DZ8Se/+/XY6l1xw==
X-Google-Smtp-Source: ABdhPJzZvNTsjJlCZRY46qgZ5XPfaIqBt+6PYchX+KcW7o6RJ0edJpORQWsb2GY8kITxV/aTPnf5HGKblVtJ7XlEV8w=
X-Received: by 2002:a2e:b6cc:: with SMTP id m12mr6743907ljo.256.1597673545599; 
 Mon, 17 Aug 2020 07:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200811145816.GA424033@kroah.com>
 <CAD=FV=UD=cTn6jwpYS-C-=1ORd-4azZ8ZiBR6om++2sMS1nmMg@mail.gmail.com>
 <CAFA6WYPBdOiVsKR_hSLpigN_1b9jimXKaqyRZjvKSx3xpAmLjA@mail.gmail.com>
 <CAD=FV=WccmFRkV4UUTLSYR9+7210h00Si=nG4tRs3BBuweA6ng@mail.gmail.com>
 <CAD=FV=V8UhQVQvcAp6XCmT3=6FYM=_zPELy4FTj4kMKUswaR8Q@mail.gmail.com>
 <CAFA6WYPxieH6ZTa_BFdaLuiwbqAs6r7eKmxG7ci4XtyRONGN7g@mail.gmail.com>
 <20200813101703.566thqmnc2d7cb3n@holly.lan>
 <CAFA6WYPd-fcDkYNk1KrjYwD=FH3FBvjDGEoxCBBN9CRidoVXbw@mail.gmail.com>
 <20200814141822.opahh33nfc5yodkb@holly.lan>
 <CAFA6WYO3YmgCftr-hFdiHGHATeox9en_HZvgnAL=zhoa=OEi_w@mail.gmail.com>
 <20200817092830.xcl2gkyxoe5grgnz@holly.lan>
In-Reply-To: <20200817092830.xcl2gkyxoe5grgnz@holly.lan>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 17 Aug 2020 19:42:14 +0530
Message-ID: <CAFA6WYOX0VzSvCyNTPemNMBPmSY75Q8vKdyQLc9cuq2m5eBWLg@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.195 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1k7fsG-00EHbn-6H
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

On Mon, 17 Aug 2020 at 14:58, Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Mon, Aug 17, 2020 at 10:42:43AM +0530, Sumit Garg wrote:
> > On Fri, 14 Aug 2020 at 19:48, Daniel Thompson
> > <daniel.thompson@linaro.org> wrote:
> > >
> > > On Fri, Aug 14, 2020 at 05:36:36PM +0530, Sumit Garg wrote:
> > > > On Thu, 13 Aug 2020 at 15:47, Daniel Thompson
> > > > <daniel.thompson@linaro.org> wrote:
> > > > >
> > > > > On Thu, Aug 13, 2020 at 02:55:12PM +0530, Sumit Garg wrote:
> > > > > > On Thu, 13 Aug 2020 at 05:38, Doug Anderson <dianders@chromium.org> wrote:
> > > > > > > On Wed, Aug 12, 2020 at 8:27 AM Doug Anderson <dianders@chromium.org> wrote:
> > > > > > > > One
> > > > > > > > last worry is that I assume that most people testing (and even
> > > > > > > > automated testing labs) will either always enable NMI or won't enable
> > > > > > > > NMI.  That means that everyone will be only testing one codepath or
> > > > > > > > the other and (given the complexity) the non-tested codepath will
> > > > > > > > break.
> > > > > > > >
> > > > > >
> > > > > > The current patch-set only makes this NMI to work when debugger (kgdb)
> > > > > > is enabled which I think is mostly suitable for development
> > > > > > environments. So most people testing will involve existing IRQ mode
> > > > > > only.
> > > > > >
> > > > > > However, it's very much possible to make NMI mode as default for a
> > > > > > particular serial driver if the underlying irqchip supports it but it
> > > > > > depends if we really see any production level usage of NMI debug
> > > > > > feature.
> > > > >
> > > > > The effect of this patch is not to make kgdb work from NMI it is to make
> > > > > (some) SysRqs work from NMI. I think that only allowing it to deploy for
> > > > > kgdb users is a mistake.
> > > > >
> > > > > Having it deploy automatically for kgdb users might be OK but it seems
> > > > > sensible to make this feature available for other users too.
> > > >
> > > > I think I wasn't clear enough in my prior reply. Actually I meant to
> > > > say that this patch-set enables NMI support for a particular serial
> > > > driver via ".poll_init()" interface and the only current user of that
> > > > interface is kgdb.
> > > >
> > > > So if there are other users interested in this feature, they can use
> > > > ".poll_init()" interface as well to enable it.
> > >
> > > Huh?
> > >
> > > We appear to speaking interchangably about users (people who sit in
> > > front of the machine and want a stack trace) and sub-systems ;-).
> > >
> > > I don't think other SysRq commands have quite such a direct relationship
> > > between the sub-system and the sysrq command. For example who are you
> > > expecting to call .poll_init() if a user wants to use the SysRq to
> > > provoke a stack trace?
> > >
> >
> > Ah, I see. So you meant to provide a user-space interface to
> > dynamically enable/disable NMI debug, correct? It will require IRQ <->
> > NMI switching at runtime which should be doable safely.
>
> I haven't given much thought to the exact mechanism, though I would
> perhaps have started by thinking about a module parameter).
>
> From an RFC point of view, I simple think this feature is potentially
> useful on systems without kgdb (which, let's be honest, are firmly in
> the majority) so making .poll_init() the only way to activate it is a
> mistake.
>

Makes sense, will add a module parameter to enable this feature during
boot as well.

-Sumit

>
> Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
