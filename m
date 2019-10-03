Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8308CB0D4
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  3 Oct 2019 23:09:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iG8ME-0004LM-Jt
	for lists+kgdb-bugreport@lfdr.de; Thu, 03 Oct 2019 21:09:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <will@kernel.org>) id 1iG8MC-0004L5-N3
 for kgdb-bugreport@lists.sourceforge.net; Thu, 03 Oct 2019 21:09:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hzsRhAwi7rvC+ywX0qPy7ktz/B/4U4qXzErB5v5PB6Y=; b=iILVobvT9C8Vs0IuVHYDBNZdzV
 Cq2VmAMkOcxiH2Lu8tA3sGWkSP54qx8Liy42oH2WqPRt4bRSBi9+VZwBjD95fTL+Ed+2rLi+tvVC4
 MdimzLNpsUXLH5AWhlLPmHTRrwInSZu7SyBLF5K4ld7J6/tfrWRR4QVdRG5ga8XQ6Zjk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hzsRhAwi7rvC+ywX0qPy7ktz/B/4U4qXzErB5v5PB6Y=; b=YXLEj7OQsSPFWCr09OBykXtToN
 f3WOmVbmufUzXL9HwA1Wx5qKeRrCnAufM7OwDUk5s7v9iSeAhKjU/JIynISUaLe6XGNGzzwDXivJ6
 KqTfgNpsD79uI1wV4trZV5DfxwPa8FzUAWUyWuhQn5DdCurpFrWPfaYmFVjrwbgtbE7Y=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iG8MB-003gMD-MU
 for kgdb-bugreport@lists.sourceforge.net; Thu, 03 Oct 2019 21:09:52 +0000
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B331D20862;
 Thu,  3 Oct 2019 21:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570136986;
 bh=ebtTzy1JZkgeZmqVXSOzAKS+6uZXcSAohkg+1FReh1s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oabMIHhnfum50A1BjidbQuyquD+uFCBlGFB0Bab6JpNTL7F8MW0UTaES5FXOISuYm
 MjpdvPh2wknpvXwoPwDkI9Kvn7cBo6gvaE7SeXGmgATkUqgyZVfWSYbZWCTcLS4iY1
 VqX3mxaeafXyjgU6Pzo7IaMLRrP2ZyAcV25Qslxc=
Date: Thu, 3 Oct 2019 22:09:41 +0100
From: Will Deacon <will@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20191003210941.ulbnglhhx7nevsfm@willie-the-truck>
References: <20190925200220.157670-1-dianders@chromium.org>
 <20190925125811.v3.3.Id33c06cbd1516b49820faccd80da01c7c4bf15c7@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190925125811.v3.3.Id33c06cbd1516b49820faccd80da01c7c4bf15c7@changeid>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iG8MB-003gMD-MU
Subject: Re: [Kgdb-bugreport] [PATCH v3 3/4] kdb: Fix "btc <cpu>" crash if
 the CPU didn't round up
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, linux-kernel@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Sep 25, 2019 at 01:02:19PM -0700, Douglas Anderson wrote:
> I noticed that when I did "btc <cpu>" and the CPU I passed in hadn't
> rounded up that I'd crash.  I was going to copy the same fix from
> commit 162bc7f5afd7 ("kdb: Don't back trace on a cpu that didn't round
> up") into the "not all the CPUs" case, but decided it'd be better to
> clean things up a little bit.
> 
> This consolidates the two code paths.  It is _slightly_ wasteful in in

nit: in in

Will


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
