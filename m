Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C231244B28
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 14 Aug 2020 16:19:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k6aXr-0002Lu-E6
	for lists+kgdb-bugreport@lfdr.de; Fri, 14 Aug 2020 14:18:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1k6aXq-0002La-EJ
 for kgdb-bugreport@lists.sourceforge.net; Fri, 14 Aug 2020 14:18:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bfiTvnSbLLzZZvj+Mn4ylpurNrOXymT6DZIfnlv7XiA=; b=ILmoDiBYbCQxFijOgFtQzDxtho
 0cGMJ9quW/L0/Eeiv4lbMtzE25WH1DJtfpibSVr8nPRoTOp62avo3/iQGpUhQYUo7aXebyfs4Lk4p
 vJUUh81ah5onx0IQMJULAvV3uWexR3UIhahRGr6ZKe+s7nWW/nWoHjbicE/kuZiYclvI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bfiTvnSbLLzZZvj+Mn4ylpurNrOXymT6DZIfnlv7XiA=; b=KLUyVFpwOz37ZkwasceiEmhcSD
 KaLzauphDmuAWeS4tJS6HWkaaum0L6+xQM2sneNEgvRRH6I2U8nW3jNuWihB0nLyCu37LsCfcdOgV
 hFy+d3jXP/HjjSJfi+KLwM3YOuZXw30KuuasfHPQvZ23NRtdtwcNf8jvtceVYtWNYfiY=;
Received: from mail-wm1-f66.google.com ([209.85.128.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k6aXW-00BXOP-TO
 for kgdb-bugreport@lists.sourceforge.net; Fri, 14 Aug 2020 14:18:58 +0000
Received: by mail-wm1-f66.google.com with SMTP id t14so8063166wmi.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 14 Aug 2020 07:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bfiTvnSbLLzZZvj+Mn4ylpurNrOXymT6DZIfnlv7XiA=;
 b=p42wFVUcVKu014Mhy9uhACdRHC5jy9uVKINioDebtvReEPqdZMzjXhnl3mEvKv0eT/
 XVRVTESOZtd9Vv3IuAinZiGvcAk/7PsKj9NR7dB+VYfB5GXIfaNiGa6F1OAzFUhNUcAQ
 Uz65kxFaHXRxP4eQ4XNuWvrTQIULuiRV0xT+PYSdKCukeKKgYmHjdMrUowjK9KhuZh7H
 mos4ncQ7btSiCiMPKCwTNnWj/rR0ekWaXObsDyojZiAtBD4R6r8TNw7PV2L5XEXi11+J
 1VoxwtOPDnMqCLyN1rt01thIRPQ8stN3RCgkc5N8DQVK+O9Msz6HCN//HPQ1EM14aODx
 gNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bfiTvnSbLLzZZvj+Mn4ylpurNrOXymT6DZIfnlv7XiA=;
 b=mCXZeo7RqZR20Nz4hApB+xcYNdjc04czSr1Z7j/UCB4ydsJ07CGFIGdUn2xLsYKJlb
 ZW7nzBf5r+4QeLqKPFVSqBLYATB/nYYgUaPJeBLsj9ZJDKq6BOrtS3HvCwj60OA/9EOA
 RfwoK9EL+5GPI/ubxGsHCcTGNLGUxXP65P0C9jIiaJ7pY8IOqdb0jSr09tswTvwNtAYx
 bOwMRbHho+fPwB/ax5mg8sfBd6IJOSI7Sq3gruVZxhJyt71WQOmV11/Dqj/lZMGp+TvE
 HsWFfYVzCw77ravnbXAkKoWiIkSpvuhzHNdTogW71TSHpHq/i6SOCK1arNsCCJCPtaxW
 Gg9g==
X-Gm-Message-State: AOAM532+NW8gQE5XPERP1H7tANG+dTSD7OWp0OB8/LwFT6waXZyrEW/O
 lCaqPYClzRp5j2H387yPC6rTbg==
X-Google-Smtp-Source: ABdhPJz1PenZIWlEwrjEEwQBMvLPskgCjlbD5qrmUvskmXCypEjlTaRErSq72jWhOVBWqTy9uvsW5g==
X-Received: by 2002:a05:600c:25cc:: with SMTP id
 12mr2720135wml.120.1597414705416; 
 Fri, 14 Aug 2020 07:18:25 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id o2sm15227863wrj.21.2020.08.14.07.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 07:18:24 -0700 (PDT)
Date: Fri, 14 Aug 2020 15:18:22 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20200814141822.opahh33nfc5yodkb@holly.lan>
References: <20200811135801.GA416071@kroah.com>
 <CAFA6WYMN8i96rEZuHLnskB+4k0o=K9vF1_we83P04h2BSoGjmQ@mail.gmail.com>
 <20200811145816.GA424033@kroah.com>
 <CAD=FV=UD=cTn6jwpYS-C-=1ORd-4azZ8ZiBR6om++2sMS1nmMg@mail.gmail.com>
 <CAFA6WYPBdOiVsKR_hSLpigN_1b9jimXKaqyRZjvKSx3xpAmLjA@mail.gmail.com>
 <CAD=FV=WccmFRkV4UUTLSYR9+7210h00Si=nG4tRs3BBuweA6ng@mail.gmail.com>
 <CAD=FV=V8UhQVQvcAp6XCmT3=6FYM=_zPELy4FTj4kMKUswaR8Q@mail.gmail.com>
 <CAFA6WYPxieH6ZTa_BFdaLuiwbqAs6r7eKmxG7ci4XtyRONGN7g@mail.gmail.com>
 <20200813101703.566thqmnc2d7cb3n@holly.lan>
 <CAFA6WYPd-fcDkYNk1KrjYwD=FH3FBvjDGEoxCBBN9CRidoVXbw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFA6WYPd-fcDkYNk1KrjYwD=FH3FBvjDGEoxCBBN9CRidoVXbw@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1k6aXW-00BXOP-TO
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

On Fri, Aug 14, 2020 at 05:36:36PM +0530, Sumit Garg wrote:
> On Thu, 13 Aug 2020 at 15:47, Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> >
> > On Thu, Aug 13, 2020 at 02:55:12PM +0530, Sumit Garg wrote:
> > > On Thu, 13 Aug 2020 at 05:38, Doug Anderson <dianders@chromium.org> wrote:
> > > > On Wed, Aug 12, 2020 at 8:27 AM Doug Anderson <dianders@chromium.org> wrote:
> > > > > One
> > > > > last worry is that I assume that most people testing (and even
> > > > > automated testing labs) will either always enable NMI or won't enable
> > > > > NMI.  That means that everyone will be only testing one codepath or
> > > > > the other and (given the complexity) the non-tested codepath will
> > > > > break.
> > > > >
> > >
> > > The current patch-set only makes this NMI to work when debugger (kgdb)
> > > is enabled which I think is mostly suitable for development
> > > environments. So most people testing will involve existing IRQ mode
> > > only.
> > >
> > > However, it's very much possible to make NMI mode as default for a
> > > particular serial driver if the underlying irqchip supports it but it
> > > depends if we really see any production level usage of NMI debug
> > > feature.
> >
> > The effect of this patch is not to make kgdb work from NMI it is to make
> > (some) SysRqs work from NMI. I think that only allowing it to deploy for
> > kgdb users is a mistake.
> >
> > Having it deploy automatically for kgdb users might be OK but it seems
> > sensible to make this feature available for other users too.
> 
> I think I wasn't clear enough in my prior reply. Actually I meant to
> say that this patch-set enables NMI support for a particular serial
> driver via ".poll_init()" interface and the only current user of that
> interface is kgdb.
> 
> So if there are other users interested in this feature, they can use
> ".poll_init()" interface as well to enable it.

Huh?

We appear to speaking interchangably about users (people who sit in
front of the machine and want a stack trace) and sub-systems ;-).

I don't think other SysRq commands have quite such a direct relationship
between the sub-system and the sysrq command. For example who are you
expecting to call .poll_init() if a user wants to use the SysRq to
provoke a stack trace?


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
