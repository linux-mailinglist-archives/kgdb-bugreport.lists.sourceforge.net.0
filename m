Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 426733458AB
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 23 Mar 2021 08:28:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lObSs-0000zp-Or
	for lists+kgdb-bugreport@lfdr.de; Tue, 23 Mar 2021 07:28:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gregkh@linuxfoundation.org>) id 1lObSh-0000yb-EB
 for kgdb-bugreport@lists.sourceforge.net; Tue, 23 Mar 2021 07:28:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZR6PUd8oZEgEpO2Cw/kImxiHySQLzaE+NlnC646U1Mc=; b=lyZvzxUiv8MJni4M+uw0vJE4Rv
 nTQcXW41D2dMeAgee1klF/lONnRlmDp8Tko2VL+Y5kAtojc7C36Jd41vUOB0U/1gX0GZzmplAmj7H
 QoRphG2y9pm5eN93QNCVCrW7A+gjQahoFsRx3iqjgHfyBA7Aqnd5TO4w+UQBgeMI62Ik=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZR6PUd8oZEgEpO2Cw/kImxiHySQLzaE+NlnC646U1Mc=; b=HlRks+qgysbV9FoGPfd7Uy+5cr
 NpNv7FOj1Uh8d6RXO1/T0eHu53Ktyjl6WkXCYz03wOviJ2dQLg9MxbdkrDGCNNhEdbwjaqyZ86n/O
 PpN0xe3jWgfJptMM8YVs/NiPQaKKQGtwTwwW3X/dct3c39nep7qW+sWM/OkH11lOISGM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lObSZ-0001zC-RY
 for kgdb-bugreport@lists.sourceforge.net; Tue, 23 Mar 2021 07:28:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4A87C619B2;
 Tue, 23 Mar 2021 07:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1616484484;
 bh=4DVYsL8aC5zK4lFEUymSCq9jscwZnKFMJYdueKLFPo4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LzlIuCd+0stZ4n4SJ8jvKbl6SUTPuC4SXLr+EbWrUPV9FvtmfNHfb3A7TMiPMfS79
 6ZuDpvry/GVHWOFYaTBZVJZmtyPpBAiWunPiIHRjrbLu7YYjjiGkFK8i2aQLUAt1A8
 jWzoKvRRNOHkgSO0kiIr245MZJq4r1rBakJqKknQ=
Date: Tue, 23 Mar 2021 08:28:02 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <YFmYgk2HDrIx1VNp@kroah.com>
References: <20210322164308.827846-1-arnd@kernel.org>
 <20210322170330.wil52d2geopfnfka@maple.lan>
 <CAK8P3a30_E5ouw2eGF0wAYd0CiKcekKkEe9xBay2K+OXkyx-gw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a30_E5ouw2eGF0wAYd0CiKcekKkEe9xBay2K+OXkyx-gw@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lObSZ-0001zC-RY
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, Ingo Molnar <mingo@elte.hu>,
 Christian Brauner <christian.brauner@ubuntu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Mar 22, 2021 at 07:03:45PM +0100, Arnd Bergmann wrote:
> On Mon, Mar 22, 2021 at 6:03 PM Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> >
> >
> > Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> >
> > Which tree do you want to merge this one though? I've got nothing else
> > pending for this file so I am very relaxed about the route...
> 
> I don't plan to merge any of the build fixes through my own tree.
> If you don't have anything else, maybe Greg can pick it up
> in the char-misc tree.

Yes, I can take it, thanks.

greg k-h


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
