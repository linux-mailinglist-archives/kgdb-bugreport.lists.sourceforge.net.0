Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5EE3224FA
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 23 Feb 2021 05:47:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lEPbk-0000NP-CG
	for lists+kgdb-bugreport@lfdr.de; Tue, 23 Feb 2021 04:47:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1lEPbi-0000NH-3r
 for kgdb-bugreport@lists.sourceforge.net; Tue, 23 Feb 2021 04:47:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TR1Ebr28GfdgahufOQrB/drWR7HsROYX0I7LCagN07A=; b=m47M29xe0sdCTu56FkEM2JJRwa
 j3PYnGb5WsQKx1h6qXSDk5hdyFj/npO8yyrkJ+MLbzQgfLocaNHYrexQgvgQPkOJEEpK/3/r8YUs0
 xrRcCrhCnyMW9QNoAVQeUR9g2JYXLFiE4PpCkuB+FStXqsMRxPEEZwaxaDwMwZgPws08=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TR1Ebr28GfdgahufOQrB/drWR7HsROYX0I7LCagN07A=; b=HRCbEp1H7n/akRKNMbhtXnSba7
 +G5EPhXFoNELQArXqEB8odhIuk5RxM0Xdbld6CDkrZEBiyG5WiZohblqJcb/WbeRbaEQmOsFUHifN
 1cwuFKsYa+x6BmOWazq5HgSh789oU/7CI44LWs2UOk07c6GkSstosjRNAI6lLowVlcQw=;
Received: from mail-lj1-f176.google.com ([209.85.208.176])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lEPbX-0023Vm-CL
 for kgdb-bugreport@lists.sourceforge.net; Tue, 23 Feb 2021 04:47:33 +0000
Received: by mail-lj1-f176.google.com with SMTP id u4so61631316ljh.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Feb 2021 20:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TR1Ebr28GfdgahufOQrB/drWR7HsROYX0I7LCagN07A=;
 b=HvMaDXFPpr3Xx75I2KZJKnYltR2SiDXIuL/Fr0kaKq1wdehMELe48z3jWrXhcgDILq
 m0uotVbBuXtFGJ/rUIqvXFg99fzyb0va7FoUYYTbVory9X6wRlmzNqKwcTnfu2Y69AR+
 KAuYyqwEg7l8V95CNC6yyF4iUaSCDzH2euasfg9J//bfumJIENtaPLTiI6G6JeYL95HB
 v1gDIzuKn+bAYW5917kNpaqevoxHRVODTJqJSRl6mHTn7La7WQFINN9q2RKuPiQAZWPS
 Jka11pZoQFP2yqM4XG7c0mjofFQHtJcL4H1ubDMLXHbzilRJyJk9vbCRnocM7YPGEDUX
 5zOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TR1Ebr28GfdgahufOQrB/drWR7HsROYX0I7LCagN07A=;
 b=R9vJJzfzQRDpdkh059x9pArAywr1zk2yl6sIRHyQdpV/paa90vWejc2cAcGKEMqnE1
 c7Hifud3a4RWgZ6ePuH86MBXLd0i3yoDeH032VcCuQAbOuiVvSIqvaht3TO/QKB9XrEb
 uYVc/QY9jJDA9Pdz/YBXxELOzOAoi1SF095iV2pX3dAw/p08Bs12nnzRtoxqsrp5xuMe
 nbTJaTvu1v/dj1zvMV4R0c3MMeJjg+IBvLRsbruv+RfRbBIcxAH755yTZZ+bdloLXd0h
 hb6p8lZ0sawmWe7IwQ9cWa0WxpRtkoYoqCs5IK2I6EpZxldFst7747uX6j+QrlaLU7bT
 qeYQ==
X-Gm-Message-State: AOAM533O1KvqXcHdRiE19SFzSFNCzQYZf/cW2+9EigoihN7y8fdyplLK
 aOg297l5hLkobrZy3u8MRv7XxG3YUnPPnWuAzFmx9Q==
X-Google-Smtp-Source: ABdhPJx2ccmhLjrENwH72Hhc5VHcnpOc/ikOKl0+q+jP/9K0dgnJ7EP1SfhI7EKgdLIRF2SFwZAVBJQjq/yqpe4dJPQ=
X-Received: by 2002:a2e:99cb:: with SMTP id l11mr7060738ljj.343.1614055636766; 
 Mon, 22 Feb 2021 20:47:16 -0800 (PST)
MIME-Version: 1.0
References: <1613650198-27437-1-git-send-email-sumit.garg@linaro.org>
 <20210222120502.phazkmskgqvpe4yy@maple.lan>
 <CAFA6WYNiaeyFHrcTSp6x4ur5VjZAoJ=NfMPsa__dH2VK9ze7vQ@mail.gmail.com>
 <20210222134750.zc473zz42bz4teu3@maple.lan>
In-Reply-To: <20210222134750.zc473zz42bz4teu3@maple.lan>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 23 Feb 2021 10:17:04 +0530
Message-ID: <CAFA6WYPzds7qHMoeG-mLk0r9o3ba+dXCf_zjLNmoVQRdxedscQ@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.176 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.176 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lEPbX-0023Vm-CL
Subject: Re: [Kgdb-bugreport] [PATCH v4] kdb: Simplify kdb commands
 registration
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, 22 Feb 2021 at 19:17, Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Mon, Feb 22, 2021 at 06:33:18PM +0530, Sumit Garg wrote:
> > On Mon, 22 Feb 2021 at 17:35, Daniel Thompson
> > <daniel.thompson@linaro.org> wrote:
> > >
> > > On Thu, Feb 18, 2021 at 05:39:58PM +0530, Sumit Garg wrote:
> > > > Simplify kdb commands registration via using linked list instead of
> > > > static array for commands storage.
> > > >
> > > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > > > ---
> > > >
> > > > Changes in v4:
> > > > - Fix kdb commands memory allocation issue prior to slab being available
> > > >   with an array of statically allocated commands. Now it works fine with
> > > >   kgdbwait.
> > >
> > > I'm not sure this is the right approach. It's still faking dynamic usage
> > > when none of the callers at this stage of the boot actually are dynamic.
> > >
> >
> > Okay, as an alternative I came across dbg_kmalloc()/dbg_kfree() as well but ...
>
> Last time I traced these functions I concluded that this heap can be
> removed if the symbol handling code is refactored a little.

Yeah, I also observed symbol handing code being the only user. So, I
will try to rework that code and see if we can get rid of this custom
heap.

> I'd be
> *seriously* reluctant to add any new callers... which I assume from your
> later comments you can live with ;-) .
>

Yes that's fine with me.

-Sumit

>
> Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
