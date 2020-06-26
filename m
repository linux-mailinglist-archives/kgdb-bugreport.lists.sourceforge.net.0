Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2E220B974
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 26 Jun 2020 21:44:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jouHF-0004Xr-4S
	for lists+kgdb-bugreport@lfdr.de; Fri, 26 Jun 2020 19:44:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jouHD-0004Xg-7c
 for kgdb-bugreport@lists.sourceforge.net; Fri, 26 Jun 2020 19:44:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZxCu8SUtTTq6IWvcU9y1tae9qoEzl+cmaMnWtYkj1ug=; b=Jjd18DxawolgW8Pmo3u2vRFYlB
 VUSTxGqFC9OlDi1LtyFqVklN+KwRpJIpw3z8IaImhequkfoMVewOFF/7hSGfwCFG7mdyGoNBv1G9W
 v3uq/l6AMyt7D1m85ip806aoqbLAT1Z+g0PwKh2KXC35h8dLs3EjuQCHNxNfflZIgLT8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZxCu8SUtTTq6IWvcU9y1tae9qoEzl+cmaMnWtYkj1ug=; b=JM2LW85IST5l3AZxWVI7O8rGR5
 uD/xn2PWh4/KujYqDPFTKac9QXYL21M8zzfjaklZ/D9TQEn43MAicgFsxXzcgHZyjzo+R2YCIq4zB
 aHgtBzYWULnMUax6coiZpTdh84st/nypDsxzUF1T4bmniEvFqCFn6dUNdO2GG1KClMp8=;
Received: from mail-vs1-f68.google.com ([209.85.217.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jouH6-0023VJ-6w
 for kgdb-bugreport@lists.sourceforge.net; Fri, 26 Jun 2020 19:44:43 +0000
Received: by mail-vs1-f68.google.com with SMTP id s18so6116468vsi.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 26 Jun 2020 12:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZxCu8SUtTTq6IWvcU9y1tae9qoEzl+cmaMnWtYkj1ug=;
 b=FyVtaRhfzIsKg7jZ07AzYnwr5VUuxLTVfnVYe5LnXFub33erDF0CZaKVMd1unmElsE
 5fmQA14BWPbB08mSY8qFuh7EY2+J884coTp9Nnkkvvscpm/Gcp3RxCgsNh1yePGm4cWo
 TFBW9Ne3rGrNGMCFT0jn+41OvQCAvZQ7WnH+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZxCu8SUtTTq6IWvcU9y1tae9qoEzl+cmaMnWtYkj1ug=;
 b=tUB0jmjbm6yrVfQt5gtlcldHTqsk+mQlZ7/l2JvYaNY6IcD1b6mCsE1XG0MWz3UpOe
 +o4/gEc+F9aj/XCkOlntWIQBJd5mJpcZ3D7mbmi/mqXNtjqWe3fFD1m3xWf7KNcNK9J8
 5c88gZYlpsrhaFc46ky7PZc7s7Qq8us+yFEYfUlvzfJ+ld5aka+P68HauZFLeoVcG13I
 0V1/w1o8Bi8hw6Xg27G9xXpopep5K/vo9rYaBNkw7sfUQgoO/ou4u3VhaYQQsyiQK6vs
 MNTyMYp7E3FdtwiEQBPFOhASYJt7AxQqFzmNcmKO8WF8iLS99AiqbTCtDbx3zLRgs7XG
 XbNQ==
X-Gm-Message-State: AOAM533HhJPvTwOTedjmmV5sOBqfn/Y9jPemIrHjADzdTnA67aiR+c1u
 H9D30p6lZtoNiu10HYISb5uu6RqGyes=
X-Google-Smtp-Source: ABdhPJzqXOYNsaDFuT6ut6NF8LmLvoNHk1YRPHkjfn6rjexNXRPFujZdXOS9G6qEt50ZElDlGZ9YdQ==
X-Received: by 2002:a67:ed41:: with SMTP id m1mr3788178vsp.189.1593200670117; 
 Fri, 26 Jun 2020 12:44:30 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com.
 [209.85.221.172])
 by smtp.gmail.com with ESMTPSA id o73sm4298111vke.5.2020.06.26.12.44.27
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jun 2020 12:44:28 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id y7so2457632vkf.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 26 Jun 2020 12:44:27 -0700 (PDT)
X-Received: by 2002:a1f:280c:: with SMTP id o12mr3115075vko.92.1593200666737; 
 Fri, 26 Jun 2020 12:44:26 -0700 (PDT)
MIME-Version: 1.0
References: <1592835984-28613-1-git-send-email-sumit.garg@linaro.org>
 <1592835984-28613-4-git-send-email-sumit.garg@linaro.org>
 <20200622160300.avgfhnfkpqzqqtsr@holly.lan>
 <CAFA6WYOmQT-OQvjpy1pVPq2mx5S264bJPd-XfwnDY2BjeoWekg@mail.gmail.com>
 <20200623105934.wvyidi3xgqgd35af@holly.lan>
In-Reply-To: <20200623105934.wvyidi3xgqgd35af@holly.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 26 Jun 2020 12:44:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XHZT9ud0Ze1pDvz-kQy7FMFzd9T6+jM5URt1k5BwQ15g@mail.gmail.com>
Message-ID: <CAD=FV=XHZT9ud0Ze1pDvz-kQy7FMFzd9T6+jM5URt1k5BwQ15g@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jouH6-0023VJ-6w
Subject: Re: [Kgdb-bugreport] [PATCH 3/7] kgdb: Add request_nmi() to the io
 ops table for kgdboc
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Tue, Jun 23, 2020 at 3:59 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Tue, Jun 23, 2020 at 02:07:47PM +0530, Sumit Garg wrote:
> > On Mon, 22 Jun 2020 at 21:33, Daniel Thompson
> > <daniel.thompson@linaro.org> wrote:
> > > > +     irq_set_status_flags(irq, IRQ_NOAUTOEN);
> > > > +     res = request_nmi(irq, fn, IRQF_PERCPU, "kgdboc", dev_id);
> > >
> > > Why do we need IRQF_PERCPU here. A UART interrupt is not normally
> > > per-cpu?
> > >
> >
> > Have a look at this comment [1] and corresponding check in
> > request_nmi(). So essentially yes UART interrupt is not normally
> > per-cpu but in order to make it an NMI, we need to request it in
> > per-cpu mode.
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/kernel/irq/manage.c#n2112
>
> Thanks! This is clear.
>
> > > > +     if (res) {
> > > > +             res = request_irq(irq, fn, IRQF_SHARED, "kgdboc", dev_id);
> > >
> > > IRQF_SHARED?
> > >
> > > Currrently there is nothing that prevents concurrent activation of
> > > ttyNMI0 and the underlying serial driver. Using IRQF_SHARED means it
> > > becomes possible for both drivers to try to service the same interrupt.
> > > That risks some rather "interesting" problems.
> > >
> >
> > Could you elaborate more on "interesting" problems?
>
> Er... one of the serial drivers we have allowed the userspace to open
> will, at best, be stone dead and not passing any characters.
>
>
> > BTW, I noticed one more problem with this patch that is IRQF_SHARED
> > doesn't go well with IRQ_NOAUTOEN status flag. Earlier I tested it
> > with auto enable set.
> >
> > But if we agree that both shouldn't be active at the same time due to
> > some real problems(?) then I can rid of IRQF_SHARED as well. Also, I
> > think we should unregister underlying tty driver (eg. /dev/ttyAMA0) as
> > well as otherwise it would provide a broken interface to user-space.
>
> I don't have a particular strong opinion on whether IRQF_SHARED is
> correct or not correct since I think that misses the point.
>
> Firstly, using IRQF_SHARED shows us that there is no interlocking
> between kgdb_nmi and the underlying serial driver. That probably tells
> us about the importance of the interlock than about IRQF_SHARED.
>
> To some extent I'm also unsure that kgdb_nmi could ever actually know
> the correct flags to use in all cases (that was another reason for the
> TODO comment about poll_get_irq() being a bogus API).

I do wonder a little bit if the architecture of the "kgdb_nmi_console"
should change.  I remember looking at it in the past and thinking it a
little weird that if I wanted to get it to work I'd need to change my
"console=" command line to go through this new driver and (I guess)
change the agetty I have running on my serial port to point to
ttyNMI0.  Is that how it's supposed to work?  Then if I want to do a
build without kgdb then I need to go in and change my agetty to point
back at my normal serial port?

It kinda feels like a better way to much of what the driver does would be to:

1. Allow kgdb to sniff incoming serial bytes on a port and look for
its characters.  We already have this feature in the kernel to a small
extent for sniffing a break / sysrq character.

2. If userspace doesn't happen to have the serial port open then
ideally we could open the port (using all the standard APIs that
already exist) from in the kernel and just throw away all the bytes
(since we already sniffed them).  As soon as userspace tried to open
the port when it would get ownership and if userspace ever closed the
port then we'd start reading / throwing away bytes again.

If we had a solution like that:

a) No serial drivers would need to change.

b) No kernel command line parameters would need to change.

Obviously that solution wouldn't magically get you an NMI, though.
For that I'd presume the right answer would be to add a parameter for
each serial driver that can support it to run its rx interrupt in NMI
mode.

Of course, perhaps I'm just confused and crazy and the above is a
really bad idea.


Speaking of confused: is there actually any way to use the existing
kgdb NMI driver (CONFIG_SERIAL_KGDB_NMI) in mainline without out of
tree patches?  When I looked before I assumed it was just me that was
outta luck because I didn't have NMI at the time, but I just did some
grepping and I can't find anyplace in mainline where
"arch_kgdb_ops.enable_nmi" would not be NULL.  Did I miss it, or do we
need out-of-tree patches to enable this?


-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
