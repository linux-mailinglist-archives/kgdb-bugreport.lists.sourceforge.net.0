Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E96DF204FC0
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 23 Jun 2020 12:59:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jngec-0001kx-Os
	for lists+kgdb-bugreport@lfdr.de; Tue, 23 Jun 2020 10:59:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jngea-0001kp-UA
 for kgdb-bugreport@lists.sourceforge.net; Tue, 23 Jun 2020 10:59:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lGrEtcs91+dxyWalZ+ucVAHOrATgVM2zxSzA1+acQg4=; b=DwN0vJX7reVIL4eG+9Hvwq9WI+
 +bPcDnduw7rvk8JbC5G8eokmHrW5sluO0bV9ZN9nHMASHmQTyAqMA1AlexuMklZW2ji1ibr/df7nw
 JcENKRFhMc27l1dZd47egmSSWl9N5RwiVIVJFPIwsHaBCz7jV5fsjGQ6bHXmwKaxgD94=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lGrEtcs91+dxyWalZ+ucVAHOrATgVM2zxSzA1+acQg4=; b=Ei/eQ44TANGVW2lv7rH3xSKDzk
 C3n2FeDci1dGSQQwGyGcb8RoM1Fcn49Cqqojs09OSZKRQNsoCXeCWXduNKMGDoEmi+FBJscO1zSO9
 EspSPQMyO5r667CsO1UegGdf7/9TKJz4/tFyxHKVURs/3gTEEAl6/CtotQqomosiIgcU=;
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jngeU-00CtVv-Tx
 for kgdb-bugreport@lists.sourceforge.net; Tue, 23 Jun 2020 10:59:48 +0000
Received: by mail-wr1-f68.google.com with SMTP id h5so20059814wrc.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 23 Jun 2020 03:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lGrEtcs91+dxyWalZ+ucVAHOrATgVM2zxSzA1+acQg4=;
 b=H9tF1WoMJP6k1NhpjSlDkwABW022ARCBuOHBY6yhnzmiwSYAqbykNym7cUXNasMT6u
 SYH/QYLJSJCrr7CUmwv3aXRdFcmgJW2Gwwoo/xASmrm9OFhDpLub4rC2K+bd74NpkQHq
 lWG+gh76ybsLiaR1BwWhYVJXsHOk/KBdAQs8UIbricQv/yRTIZiqpSFXfBkzvln0Ctsb
 vjT2M8VyzVD2irhFN8vj2aPW6c+IpWbO1W4GpbeTJFqmbP06pguKaskv3AIOztQz348D
 c9NoaAF07LRY9pUNskKiCKuBa9lFmPvxYUuAcis9DMEgOz9pkcw6Q3JdBRixAwi3DGOE
 Sgmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lGrEtcs91+dxyWalZ+ucVAHOrATgVM2zxSzA1+acQg4=;
 b=SWVlrvOROMeM8AKRqylfRqQJt91jdC+rh18muoxD9o6q2T6v1irsYZJpghFhwo828F
 tsdP77iN4oSH2rQqtV3i/EY0VtArsXFsrDkVxtS5cG66uYTgYzASl/i5eKdAItpT1Fkb
 wY7wknliLwOusG8710Jjzqc8afQA4DuX/s5lZUGfn6ibPYKuZk94ip9BATbPtOaNf5YK
 vbvZFWpmWMNwWZeLbMQdpz7j5Cs52mxHvlgGId6CVeGZFqpK55PuOpAgCFM4BmMHrN56
 HOd/bMnFtJDqcFLCislDkYrZfC3k+i1IIlGQhJmOyZgg+75FrPvDDtxEt5kDCB0QKIlx
 FRbg==
X-Gm-Message-State: AOAM5330DT+lq1eDPq2zjrXwLi3qFNWKIC2Ae6NKtdhwcri2p5I140te
 H9/tcVUIXFImmcGzKCxqBUTMjQ==
X-Google-Smtp-Source: ABdhPJw9T61gaiAi8WHXVsX1Hu7GiUkKfr66i1wj6/L+0fQWDmHApgO8RTikF4aEEn2dwEAj+42rEA==
X-Received: by 2002:adf:e2ce:: with SMTP id d14mr24896468wrj.415.1592909976531; 
 Tue, 23 Jun 2020 03:59:36 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id n19sm3176388wmi.33.2020.06.23.03.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 03:59:35 -0700 (PDT)
Date: Tue, 23 Jun 2020 11:59:34 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20200623105934.wvyidi3xgqgd35af@holly.lan>
References: <1592835984-28613-1-git-send-email-sumit.garg@linaro.org>
 <1592835984-28613-4-git-send-email-sumit.garg@linaro.org>
 <20200622160300.avgfhnfkpqzqqtsr@holly.lan>
 <CAFA6WYOmQT-OQvjpy1pVPq2mx5S264bJPd-XfwnDY2BjeoWekg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFA6WYOmQT-OQvjpy1pVPq2mx5S264bJPd-XfwnDY2BjeoWekg@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.68 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.68 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jngeU-00CtVv-Tx
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
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, Jun 23, 2020 at 02:07:47PM +0530, Sumit Garg wrote:
> On Mon, 22 Jun 2020 at 21:33, Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> > > +     irq_set_status_flags(irq, IRQ_NOAUTOEN);
> > > +     res = request_nmi(irq, fn, IRQF_PERCPU, "kgdboc", dev_id);
> >
> > Why do we need IRQF_PERCPU here. A UART interrupt is not normally
> > per-cpu?
> >
> 
> Have a look at this comment [1] and corresponding check in
> request_nmi(). So essentially yes UART interrupt is not normally
> per-cpu but in order to make it an NMI, we need to request it in
> per-cpu mode.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/kernel/irq/manage.c#n2112

Thanks! This is clear.

> > > +     if (res) {
> > > +             res = request_irq(irq, fn, IRQF_SHARED, "kgdboc", dev_id);
> >
> > IRQF_SHARED?
> >
> > Currrently there is nothing that prevents concurrent activation of
> > ttyNMI0 and the underlying serial driver. Using IRQF_SHARED means it
> > becomes possible for both drivers to try to service the same interrupt.
> > That risks some rather "interesting" problems.
> >
> 
> Could you elaborate more on "interesting" problems?

Er... one of the serial drivers we have allowed the userspace to open
will, at best, be stone dead and not passing any characters.


> BTW, I noticed one more problem with this patch that is IRQF_SHARED
> doesn't go well with IRQ_NOAUTOEN status flag. Earlier I tested it
> with auto enable set.
> 
> But if we agree that both shouldn't be active at the same time due to
> some real problems(?) then I can rid of IRQF_SHARED as well. Also, I
> think we should unregister underlying tty driver (eg. /dev/ttyAMA0) as
> well as otherwise it would provide a broken interface to user-space.

I don't have a particular strong opinion on whether IRQF_SHARED is
correct or not correct since I think that misses the point.

Firstly, using IRQF_SHARED shows us that there is no interlocking
between kgdb_nmi and the underlying serial driver. That probably tells
us about the importance of the interlock than about IRQF_SHARED.

To some extent I'm also unsure that kgdb_nmi could ever actually know
the correct flags to use in all cases (that was another reason for the
TODO comment about poll_get_irq() being a bogus API).


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
