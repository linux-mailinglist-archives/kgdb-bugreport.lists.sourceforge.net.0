Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C50A2E22B6
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 23 Oct 2019 20:49:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iNLhA-0006yf-Ki
	for lists+kgdb-bugreport@lfdr.de; Wed, 23 Oct 2019 18:49:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <joe@perches.com>) id 1iNLh9-0006yS-LS
 for kgdb-bugreport@lists.sourceforge.net; Wed, 23 Oct 2019 18:49:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VqMY6V0LpKRtNoIwn6w1LuAa6hdxMLRA7Ah/IJYKU54=; b=jHGmOU832GvBDKU/qWsaWilGYv
 gPp27dGnPCyIq+ju2NgB/XejkBeswhhJJy/l7ee2fjQv5Tw6UGhXJH8JCAnwFNt4oZoMaXE8AeyVN
 n7W+MCCpuKiQo0QkLx4qvV/vX2yUG/IGum4yJ0JY+mAerhU9pYedGTGFJ3MbRGz/ICc0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VqMY6V0LpKRtNoIwn6w1LuAa6hdxMLRA7Ah/IJYKU54=; b=HQskKlisT0cLj0hJuJLmcKCVEY
 E3+UG0yWhEyy2VLioEm9wl+HgDZSGKJbstb8w7tne8vziVCNj5bMH8smGdmsb98Jz+A8BAvlaiCR6
 ntQNteQHFB1RAS8JbgNemWHlqjLubSovi5UQUWtFGLQYonQ6e2/EWjoHr3GJYEWkNuqE=;
Received: from smtprelay0072.hostedemail.com ([216.40.44.72]
 helo=smtprelay.hostedemail.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iNLh8-000g15-0g
 for kgdb-bugreport@lists.sourceforge.net; Wed, 23 Oct 2019 18:49:19 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id B81DA1822327E;
 Wed, 23 Oct 2019 18:49:11 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com,
 :::::::::::::::::::,
 RULES_HIT:41:355:379:599:800:960:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1539:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2689:2693:2828:3138:3139:3140:3141:3142:3352:3622:3865:3867:3868:3870:3871:3873:4321:5007:10004:10400:11232:11658:11914:12050:12297:12740:12760:12895:13069:13255:13311:13357:13439:14181:14659:14721:21080:21451:21627:30054:30090:30091,
 0,
 RBL:47.151.135.224:@perches.com:.lbl8.mailshell.net-62.8.0.100 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:25,
 LUA_SUMMARY:none
X-HE-Tag: seed76_500e99da2a55d
X-Filterd-Recvd-Size: 1829
Received: from XPS-9350.home (unknown [47.151.135.224])
 (Authenticated sender: joe@perches.com)
 by omf09.hostedemail.com (Postfix) with ESMTPA;
 Wed, 23 Oct 2019 18:49:10 +0000 (UTC)
Message-ID: <bff0a1c4fc69b83c763ffbce42a0152e1573499a.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Date: Wed, 23 Oct 2019 11:49:08 -0700
In-Reply-To: <20191021090909.yjyed4qodjjcioqc@holly.lan>
References: <f31b38b9ad515a138edaecf85701b1e3db064114.camel@perches.com>
 <20191021090909.yjyed4qodjjcioqc@holly.lan>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [216.40.44.72 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iNLh8-000g15-0g
Subject: Re: [Kgdb-bugreport] [PATCH] kernel: convert switch/case
 fallthrough comments to fallthrough; 
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
Cc: linux-pm@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-audit@redhat.com,
 netdev@vger.kernel.org, bpf@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, 2019-10-21 at 10:09 +0100, Daniel Thompson wrote:
> On Fri, Oct 18, 2019 at 09:35:08AM -0700, Joe Perches wrote:
> > Use the new pseudo keyword "fallthrough;" and not the
> > various /* fallthrough */ style comments.
> > 
> > Signed-off-by: Joe Perches <joe@perches.com>
> > ---
> > 
> > This is a single patch for the kernel/ source tree,
> > which would otherwise be sent through as separate
> > patches to 19 maintainer sections.
> 
> For the kernel/debug/ files:
> 
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> 
> Will you be putting this in an immutable branch once you've collected
> enough acks?

No, I expect Linus will either run the script
or apply this patch one day.




_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
