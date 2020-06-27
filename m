Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D798220C1F4
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 27 Jun 2020 16:00:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jpBNK-0007x6-SJ
	for lists+kgdb-bugreport@lfdr.de; Sat, 27 Jun 2020 14:00:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gregkh@linuxfoundation.org>) id 1jpBNJ-0007wy-K5
 for kgdb-bugreport@lists.sourceforge.net; Sat, 27 Jun 2020 14:00:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NAdxUkiPgpuxJtwVCfEq274KZRWLhDS3D/eynTdZSKo=; b=Fn3qUPsJdJcJ37jO44rdYpR75C
 nIcV7FQHf7S+5EqlhV29le+s92z3Ee6e8tHqEv1aitrSwT1f+v+9gacjfJuzykogFm45M1FJblibc
 oEyaZ8+8jxzD5VRnAn16uN6YKSExLKtmv70zpIcteoWz/D2bvf4ISBOxdpA7DdTHAqkI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NAdxUkiPgpuxJtwVCfEq274KZRWLhDS3D/eynTdZSKo=; b=hWgwkQS8EHYg80H5fUjWgELbv7
 RKwqU1V4JQYTB+Kjcb7f+iYlcX7t6U8ERNMnO6kb1umljyTXfToGxuNuvaVUIYxWrMwIW5MMhYTH6
 ceThEprCzaxI4NPJoTPnl4Ccn+ikbQHc0aeUB4H8k8tHhoaIM9jsDawdDWJueE4/Lruo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jpBNE-003DeC-4A
 for kgdb-bugreport@lists.sourceforge.net; Sat, 27 Jun 2020 14:00:09 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3AB0E21852;
 Sat, 27 Jun 2020 13:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593266398;
 bh=8p6ith1ME+sCnv+twqE6KzbdUe2pNu4IyonGeBoDCKY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W2q0O0MhOlak7stnGPXyc73KOyI3qFPvhTbZSJplNQ90P5hUwIPNVLCfVESAPOuJ6
 4/6bRKvEWijMkPkYikI7Wr5DB7D3Jul0kCcvBU4Sl0+A7jYslXkibZYrAtVjpd9O5g
 tkuz6kNxCTlxHH7ze9xVZ7nQkm6Q3YiEuTsmwKso=
Date: Sat, 27 Jun 2020 15:59:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20200627135951.GA1901451@kroah.com>
References: <20200626200033.1528052-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200626200033.1528052-1-dianders@chromium.org>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jpBNE-003DeC-4A
Subject: Re: [Kgdb-bugreport] [PATCH 0/2] serial: qcom_geni_serial: Use the
 FIFOs properly for console
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
Cc: daniel.thompson@linaro.org, linux-serial@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, Jiri Slaby <jslaby@suse.com>,
 linux-kernel@vger.kernel.org, evgreen@chromium.org, swboyd@chromium.org,
 akashast@codeaurora.org, Andy Gross <agross@kernel.org>,
 vivek.gautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, Jun 26, 2020 at 01:00:31PM -0700, Douglas Anderson wrote:
> This series of two patches gets rid of some ugly hacks that were in
> the qcom_geni_serial driver around dealing with a port that was used
> for console output and dealing with a port that was being used for
> kgdb.
> 
> While the character reading/writing code is now slightly more complex,
> it's better to be consistently configuring the serial port the same
> way and doing so avoids some corner cases where the old hacks weren't
> always catching properly.
> 
> This change is slightly larger than it needs to be because I was
> trying not to use global variables in the read/write functions.
> Unfortunately the functions were sometimes called earlycon which
> didn't have any "private_data" pointer set.  I've tried to do the
> minimal change here to have some shared "private_data" that's always
> present, but longer term it wouldn't hurt to see if we could unify
> more.
> 
> Greg / Andy / Bjorn:
> 
> This series of patches is atop the current Qualcomm tree to avoid
> conflicts.  Assuming it looks OK, presumably the best way for it to
> land would be to get an Ack from Greg and then Bjorn or Andy could
> land it.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
