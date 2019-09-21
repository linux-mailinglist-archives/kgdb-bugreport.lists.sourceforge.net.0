Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D19B4B9C66
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 21 Sep 2019 07:07:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iBXcR-0006nG-M4
	for lists+kgdb-bugreport@lfdr.de; Sat, 21 Sep 2019 05:07:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gregkh@linuxfoundation.org>) id 1iBXcP-0006n8-T2
 for kgdb-bugreport@lists.sourceforge.net; Sat, 21 Sep 2019 05:07:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sHodkhT8KvF2YhMBMiV1sQgH3L6juN1cho7LVRxIOwY=; b=CJc6FxmiJOaK7c4+o72AXswQ5r
 4PSbo3Hq6xBItwV+nyoO26yu/aNcrZvp2ZzEAqFxWrpirTvmWeciVD7Kwk6UIrt9BvMapxbZMaOwt
 oRR9DOvshnKJLobL26Z5pR3br65SSeNzY6HXtS33DXDAV49HzWm+3Z+E1lfnDFfW6X+4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sHodkhT8KvF2YhMBMiV1sQgH3L6juN1cho7LVRxIOwY=; b=bJRkr9uPNDYVq0PwliyzpjNZgD
 nwCM9o0Fd1SZ2MKt97dvx0nSEfXJdlQ3YJhb1ho84ihFXUSPzBUKB/HKHwWcxT5csIBp9E+T1USa1
 QuIZi24qCANjfPw6FCMDf5Id2LRJndf6usC3pj5iFW3s0xZnoboN9D7fUdbmycfN8czU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iBXcM-001hvg-9U
 for kgdb-bugreport@lists.sourceforge.net; Sat, 21 Sep 2019 05:07:37 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4FF242054F;
 Sat, 21 Sep 2019 05:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569042443;
 bh=Oi+G6QQSYRyQJ3cHgjKZHOmPHM0UIQ5lIi+trckwR/s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F6xUGkjUTlcGPHcAUGx4HQyZgWcwodqbL3YhXcx1Bdgdr6nlGfdMBDw1/lOQrZNnP
 jTAN/LrMp9EDDfea8lwy1eXfv7ErlpKWr1o7+gUsHy2T5jYrhkCBmqprBV/Si/V0yB
 EFNLTEcYL3+1aTZ6kubmnAMWvBcDs+UBVQ5f0DQY=
Date: Sat, 21 Sep 2019 07:07:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20190921050721.GA992668@kroah.com>
References: <20190920104404.1.I237e68e8825e2d6ac26f8e847f521fe2fcc3705a@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190920104404.1.I237e68e8825e2d6ac26f8e847f521fe2fcc3705a@changeid>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iBXcM-001hvg-9U
Subject: Re: [Kgdb-bugreport] [PATCH] MAINTAINERS: kgdb: Add myself as a
 reviewer for kgdb/kdb
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, Rob Herring <robh@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
 kgdb-bugreport@lists.sourceforge.net, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Will Deacon <will@kernel.org>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, Sep 20, 2019 at 10:44:47AM -0700, Douglas Anderson wrote:
> I'm interested in kdb / kgdb and have sent various fixes over the
> years.  I'd like to get CCed on patches so I can be aware of them and
> also help review.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Thanks for this.

There was discussion at Plumbers about just dropping kgdb as some people
didn't think it was being actively maintained or that it even still
worked.  Thanks for refuting that :)

greg k-h


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
