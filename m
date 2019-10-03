Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEE2CB0DC
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  3 Oct 2019 23:11:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iG8NW-0000nG-Iw
	for lists+kgdb-bugreport@lfdr.de; Thu, 03 Oct 2019 21:11:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <will@kernel.org>) id 1iG8NV-0000n2-PP
 for kgdb-bugreport@lists.sourceforge.net; Thu, 03 Oct 2019 21:11:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dyUpOw7ZuvlIUKW2HHKhfviDy02NcuppHvAL5YI/Hhc=; b=eEX8hKF6+s0yQIL5EG2hrA6IIJ
 3eTujVOihMX4MAi7GwN//tjiOe/FWLdxU0NIcxXp4U3WIdumDExNXCcfuti7Nh/nV2ZQHtix4iLV/
 D02hlgrfbm76EvQ9Ml52M7lO8FwxbjUoi4rLCNCkulTgaZFYhHZNYEYeus/6zS+Ohi94=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dyUpOw7ZuvlIUKW2HHKhfviDy02NcuppHvAL5YI/Hhc=; b=E2Bzu6fYEJEaZOEwKfGGtvF0nU
 O1WA2XpDKwpZxCvYzTyqvxYFIGfBo6eZ/0J1SasRBuNCAVLtZWjWH0yoKum2NaWnmKyffv/6aGD14
 wSmLCIX8K97BxSyTHiS4YpIKVOgPGVZViXhgtAckOBc9YtaRJW6mjkAAgnInwjODeMxo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iG8NT-00G1ht-Tl
 for kgdb-bugreport@lists.sourceforge.net; Thu, 03 Oct 2019 21:11:13 +0000
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 09F3A20862;
 Thu,  3 Oct 2019 21:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570137066;
 bh=dyUpOw7ZuvlIUKW2HHKhfviDy02NcuppHvAL5YI/Hhc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MWhgD0fRvoTMHBbGXvnSE/knvwUi555lLD/S/3Jw/0jr3n1io7JN311kdJKIUmlET
 gigv7c4O/MJwSBXikSwOXCgt8hjQzB+WuUiU1MaaTYoBJa66ZciLfKk1/hlVmshkpn
 5pbL+DrWfgc81+Mo098EavSCmBZc5ECIfam1Aplg=
Date: Thu, 3 Oct 2019 22:11:02 +0100
From: Will Deacon <will@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20191003211101.blqe464hzxy6r7sk@willie-the-truck>
References: <20190925200220.157670-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190925200220.157670-1-dianders@chromium.org>
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
X-Headers-End: 1iG8NT-00G1ht-Tl
Subject: Re: [Kgdb-bugreport] [PATCH v3 0/4] kdb: Fixes for btc
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

On Wed, Sep 25, 2019 at 01:02:16PM -0700, Douglas Anderson wrote:
> Please enjoy.

This comment made me smile and then I ended up reading all the patches,
so FWIW:

Acked-by: Will Deacon <will@kernel.org>

Will


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
