Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F89024635D
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 17 Aug 2020 11:28:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k7bRb-0004Dr-BF
	for lists+kgdb-bugreport@lfdr.de; Mon, 17 Aug 2020 09:28:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1k7bRa-0004Dl-DM
 for kgdb-bugreport@lists.sourceforge.net; Mon, 17 Aug 2020 09:28:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OZHrD7AsFMu/AjqlVhFN/H/E4vrlCUlBMfXDwCoSB1k=; b=DpHwGbWH0h0itfR4LINQbXHKij
 UCuNQf3T9po4EzER3XC6w3Pq8n3zYP1a4K4Rjjd5TvvA+W/nDp92BKw7aItWW9rf4y2OfqErX6gfO
 YdZz+OvzCpKLKGgr/jfcY5AXZqE5DbGufC6WrGcbKzxk6GupmOX3yJXjMiQR7EsBLo50=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OZHrD7AsFMu/AjqlVhFN/H/E4vrlCUlBMfXDwCoSB1k=; b=kYZVEedkvLUpt5KT3W5GgJg8jJ
 y/6EIXirMjD1DjhTnInaqM0Iq/AGRIHSS++2JPrYazes+/t4DFOr5XeYct55d6/Z5EewIbm+0KE+2
 qEUmOKRtZiVq/XPlCDUtpT3RfrijQolQJ5Iz+08F1WDVPMVZx8HLcFrzivJh/9XRME/8=;
Received: from mail-wr1-f65.google.com ([209.85.221.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k7bRW-00A8AM-Qr
 for kgdb-bugreport@lists.sourceforge.net; Mon, 17 Aug 2020 09:28:42 +0000
Received: by mail-wr1-f65.google.com with SMTP id y3so14254946wrl.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 17 Aug 2020 02:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OZHrD7AsFMu/AjqlVhFN/H/E4vrlCUlBMfXDwCoSB1k=;
 b=tJOL8qVLXsnrVmao1/kfme1r1s7BPYaV2Llpy3btp+lbz8qf5SWwLY5FodS6ODMtOW
 lVkHcC5DFKnzxul97uhq07cmV32gKgVgLGe5efRdIuzMfsKJCbiJ542ZhCntsrg21KzS
 t1ndiyxJS6jZJ/TV+ku/KAytl6EdLfNsxDQdXxDgElKPnmUAlJmocohxcNLU9TvPSEPP
 /Oq1JbCvmGQl18dGytAegkp0UtlnvowDlyvTIv9gE3y63MwVukK/vIuNbLVDJV3hgDzx
 lSKYXbahutZnfvYHKPeSzo98hwcrwtpOXcT79g7EdmVCSjjQwlTwwhnuJXkz9eItb9E3
 1XDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OZHrD7AsFMu/AjqlVhFN/H/E4vrlCUlBMfXDwCoSB1k=;
 b=AJSX2xA2qlERJVYLJxlQ873cXjUFGdi0MasJPN1j89atXGSG/53kQ9A4VDqdaCSvLa
 O78pWmKPfqfecKm+hG1F0zOmEltI8wOccdyMpJtTe3VLQKqS4RrRxKmADMn8Am4UyYuo
 g1nO58FEr91lhZz3jrKg657rtp38AdLP+NZTuRzql9sNus5BHc14y/Lm1IZssKL4+gbM
 73vWreiY6Gr1DG6Bb3j5bvhdnzPPeWTSHSkYlcI5Z+v2epSGkejzFurrXTWcfzNgzm7l
 xaIyCoeTl7PRL6AJBAnjYb17kOq3xfzktmM2+B6G2p0S4TGoRnp8C/JTn864rATe+mjb
 gTqw==
X-Gm-Message-State: AOAM531Yvut6lWNF5oMZwtK8urVW1uNcc/dRasyTZ52bQDtCpddBYDnL
 wBp2GWFmKFC8hEbO+oHH2EEifDTNz95hdwYW
X-Google-Smtp-Source: ABdhPJyXOFbcuO2y4SsfG64eFw4++PxepXSqaoKyOWHlAufgH8Jeb2VmgQakN+PqFUlSIBjcNZABxg==
X-Received: by 2002:a5d:414e:: with SMTP id c14mr15581729wrq.57.1597656512419; 
 Mon, 17 Aug 2020 02:28:32 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id a10sm29800393wro.35.2020.08.17.02.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 02:28:31 -0700 (PDT)
Date: Mon, 17 Aug 2020 10:28:30 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20200817092830.xcl2gkyxoe5grgnz@holly.lan>
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFA6WYO3YmgCftr-hFdiHGHATeox9en_HZvgnAL=zhoa=OEi_w@mail.gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k7bRW-00A8AM-Qr
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

On Mon, Aug 17, 2020 at 10:42:43AM +0530, Sumit Garg wrote:
> On Fri, 14 Aug 2020 at 19:48, Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> >
> > On Fri, Aug 14, 2020 at 05:36:36PM +0530, Sumit Garg wrote:
> > > On Thu, 13 Aug 2020 at 15:47, Daniel Thompson
> > > <daniel.thompson@linaro.org> wrote:
> > > >
> > > > On Thu, Aug 13, 2020 at 02:55:12PM +0530, Sumit Garg wrote:
> > > > > On Thu, 13 Aug 2020 at 05:38, Doug Anderson <dianders@chromium.org> wrote:
> > > > > > On Wed, Aug 12, 2020 at 8:27 AM Doug Anderson <dianders@chromium.org> wrote:
> > > > > > > One
> > > > > > > last worry is that I assume that most people testing (and even
> > > > > > > automated testing labs) will either always enable NMI or won't enable
> > > > > > > NMI.  That means that everyone will be only testing one codepath or
> > > > > > > the other and (given the complexity) the non-tested codepath will
> > > > > > > break.
> > > > > > >
> > > > >
> > > > > The current patch-set only makes this NMI to work when debugger (kgdb)
> > > > > is enabled which I think is mostly suitable for development
> > > > > environments. So most people testing will involve existing IRQ mode
> > > > > only.
> > > > >
> > > > > However, it's very much possible to make NMI mode as default for a
> > > > > particular serial driver if the underlying irqchip supports it but it
> > > > > depends if we really see any production level usage of NMI debug
> > > > > feature.
> > > >
> > > > The effect of this patch is not to make kgdb work from NMI it is to make
> > > > (some) SysRqs work from NMI. I think that only allowing it to deploy for
> > > > kgdb users is a mistake.
> > > >
> > > > Having it deploy automatically for kgdb users might be OK but it seems
> > > > sensible to make this feature available for other users too.
> > >
> > > I think I wasn't clear enough in my prior reply. Actually I meant to
> > > say that this patch-set enables NMI support for a particular serial
> > > driver via ".poll_init()" interface and the only current user of that
> > > interface is kgdb.
> > >
> > > So if there are other users interested in this feature, they can use
> > > ".poll_init()" interface as well to enable it.
> >
> > Huh?
> >
> > We appear to speaking interchangably about users (people who sit in
> > front of the machine and want a stack trace) and sub-systems ;-).
> >
> > I don't think other SysRq commands have quite such a direct relationship
> > between the sub-system and the sysrq command. For example who are you
> > expecting to call .poll_init() if a user wants to use the SysRq to
> > provoke a stack trace?
> >
> 
> Ah, I see. So you meant to provide a user-space interface to
> dynamically enable/disable NMI debug, correct? It will require IRQ <->
> NMI switching at runtime which should be doable safely.

I haven't given much thought to the exact mechanism, though I would
perhaps have started by thinking about a module parameter).

From an RFC point of view, I simple think this feature is potentially
useful on systems without kgdb (which, let's be honest, are firmly in
the majority) so making .poll_init() the only way to activate it is a
mistake.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
