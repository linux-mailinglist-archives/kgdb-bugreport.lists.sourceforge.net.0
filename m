Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A14321949
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 22 Feb 2021 14:48:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lEBZO-0001Cw-5n
	for lists+kgdb-bugreport@lfdr.de; Mon, 22 Feb 2021 13:48:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1lEBZM-0001CQ-6r
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Feb 2021 13:48:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DkB8TTAK1lLO99nzMEfxUHcuDNMKeOkqhURiMPq3j0Y=; b=kyhnYHnUel/+ogZoiqdeKBYBhZ
 cPSStlQ3uIWdbXauhYJphQTCBAoYJpwTy9HkB0toMG9Ej+EXh+VJMGET+ehWYZ8LwSjZD0eQJFD/j
 s2CNaR0gYNYlNNHvhVEPA+P/csuo4Uk33v4eTpn4xa86ORfHfgkGIBLCAZC12KjGjn40=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DkB8TTAK1lLO99nzMEfxUHcuDNMKeOkqhURiMPq3j0Y=; b=AxMmDAIo5CWdhbbQqpm96uH9CJ
 SFa3rRGAlQ7Ha5TiXEe0a+S/+T4hFbHsaVuoxOJUZspkZnX+1m6s9VmaGp097PG2YFUQW9l824KZ5
 DKUw0lxq430yZZmq2jiQnRmm4b9SN20lK8hKyVKY47gQTr1fQvVana6tk4aS5JCmpGWM=;
Received: from mail-wr1-f50.google.com ([209.85.221.50])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lEBZ8-001H7K-Vm
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Feb 2021 13:48:12 +0000
Received: by mail-wr1-f50.google.com with SMTP id u14so19165238wri.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Feb 2021 05:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DkB8TTAK1lLO99nzMEfxUHcuDNMKeOkqhURiMPq3j0Y=;
 b=jiV+jaD982bwgugJwuqis1dzzxy/lcL0mHW1tSFhHR/NblI9dVOTQ+vyCgVCt7S55Y
 EDH/FxPyJVspwE9ToCB837JBWllB4tilyoUgEE4oecMDNP0w2PMHClISgivmYP4dnLCu
 cTH0zXrQmNvHRxw1+UBftERDsSqFPFGWxm5AlmXEzXb648KpAE0xGBKV+Y1d5XaSy6fj
 sFdHsdUY6TWAEQJrHUvnsvugFUMx8Zhm2UZ/BtMrJ8ovLb6MRL+ufQfl5M27I9o2VL3r
 bh6f7tnSA8s8xjynn8vX+AChClDaOZqDxSapwhwFUb43V1pY2ZRmvjT3dQhvQauvlUed
 9Fmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DkB8TTAK1lLO99nzMEfxUHcuDNMKeOkqhURiMPq3j0Y=;
 b=dhXUxL/unLp+sCIBQApRsn65FcugWbNL1WPtwBcaN+AFNZ62EjMNB7nT/eYcEZPuy5
 qUbj5L/mseD1D5vSbsb8iP8SHdZKkj5toWAQluVQH9juksMoxECk2UHfSyVwY3eiWm4b
 AHR3xAdu9dS4nDy/xi8PA71ZBkMNwxDitAZlK9akFuWKi9O51n8wz1XbBswrW8d2N3S/
 pHGqB3UGKkJvuQy1Oi0q7g3Juchw85O9Lsj29lLr+8YSmUm5ekCAWAQXcGxx1SM5pMZ6
 lNpsv/1xnBWvE9jis2b9mEImMJ7GmCuRiGppp6Z+nGcNWkcu9ll0qVYOSjBFmQc36IhI
 yDuA==
X-Gm-Message-State: AOAM532+zwwoSZkseand9LbzlRuu160XUM8keKr42JSfq6OC7KHljOaB
 7UCYreeJ1n0QEgza2vP8t/sUyyxLu59fijqr
X-Google-Smtp-Source: ABdhPJxnK6s18FTgmgFvQ9jKE29v5BWKGW51c04mCg/ZeGVGqdURrJ+4m1p/0hsR+UVinxN5wx/5NQ==
X-Received: by 2002:a5d:67cd:: with SMTP id n13mr21405266wrw.96.1614001672655; 
 Mon, 22 Feb 2021 05:47:52 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id y4sm22550575wrs.66.2021.02.22.05.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 05:47:51 -0800 (PST)
Date: Mon, 22 Feb 2021 13:47:50 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20210222134750.zc473zz42bz4teu3@maple.lan>
References: <1613650198-27437-1-git-send-email-sumit.garg@linaro.org>
 <20210222120502.phazkmskgqvpe4yy@maple.lan>
 <CAFA6WYNiaeyFHrcTSp6x4ur5VjZAoJ=NfMPsa__dH2VK9ze7vQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFA6WYNiaeyFHrcTSp6x4ur5VjZAoJ=NfMPsa__dH2VK9ze7vQ@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.50 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.50 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lEBZ8-001H7K-Vm
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

On Mon, Feb 22, 2021 at 06:33:18PM +0530, Sumit Garg wrote:
> On Mon, 22 Feb 2021 at 17:35, Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> >
> > On Thu, Feb 18, 2021 at 05:39:58PM +0530, Sumit Garg wrote:
> > > Simplify kdb commands registration via using linked list instead of
> > > static array for commands storage.
> > >
> > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > > ---
> > >
> > > Changes in v4:
> > > - Fix kdb commands memory allocation issue prior to slab being available
> > >   with an array of statically allocated commands. Now it works fine with
> > >   kgdbwait.
> >
> > I'm not sure this is the right approach. It's still faking dynamic usage
> > when none of the callers at this stage of the boot actually are dynamic.
> >
> 
> Okay, as an alternative I came across dbg_kmalloc()/dbg_kfree() as well but ...

Last time I traced these functions I concluded that this heap can be
removed if the symbol handling code is refactored a little. I'd be
*seriously* reluctant to add any new callers... which I assume from your
later comments you can live with ;-) .


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
