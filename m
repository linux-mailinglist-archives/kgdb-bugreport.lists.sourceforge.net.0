Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7799020B36B
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 26 Jun 2020 16:19:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jopCo-00068Q-AF
	for lists+kgdb-bugreport@lfdr.de; Fri, 26 Jun 2020 14:19:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gregkh@linuxfoundation.org>) id 1jopCm-00068H-OJ
 for kgdb-bugreport@lists.sourceforge.net; Fri, 26 Jun 2020 14:19:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yrbr55fLrbApLK4lX1mTA5GOEkUQTwdIFkxpr5pFvWY=; b=aijQZC7W4iRLzVAZQn3BtiR7ik
 WlGnvbv8xHxVTY1ZMXAiPB3e5CTxz7jT2YzlcUVSB7nbsExgQM3BzSzU8p7ur6MTF9ZBltI5gAd7R
 MFV5cEjnxFpGFHkxsjvQCiVofq30aOBMUhFClvID9qBRS4gU9c6HRY3h49JrS2Gw5Z4w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Yrbr55fLrbApLK4lX1mTA5GOEkUQTwdIFkxpr5pFvWY=; b=F5bCvBrKLJoCt2YBrsC6j1JX6e
 sRrQGUHaxSEYuYuow+1kHgokr87B1mOt4VVk8sVsqpzv/xp49j03XEjW1GTDcYQlbOoBsMPArEeyp
 M18E0zyPVYvnC+jLZbaEHjpQ4Hd0ZfhQcHWc1lVN0Uh8djuqxSX1aeBHgvsMeH/xHFCg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jopCg-00GRzg-PR
 for kgdb-bugreport@lists.sourceforge.net; Fri, 26 Jun 2020 14:19:48 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E848F208C9;
 Fri, 26 Jun 2020 14:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593181177;
 bh=xGvMhYdL0SsIxlp6493J5SH2f1tkLzZPbB6DcFRR/Co=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0C0kKj/2XZdz9AYwQRO/gF40TOgr9vGcgeorNTOKAxS0spCnbQ7L2AZDVz564hjjC
 FIa0OrEAe6k+xkWRUrtWHFDdXedZRQtqQrZyJNeWvAy6T4tsnom5I/yP/4v2vpuGC4
 GZQqIm8GJ6oiSCu4DrEt5SUH885r/3zoomHi9WS4=
Date: Fri, 26 Jun 2020 16:19:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <20200626141932.GC4141629@kroah.com>
References: <1591264879-25920-1-git-send-email-sumit.garg@linaro.org>
 <1591264879-25920-5-git-send-email-sumit.garg@linaro.org>
 <20200626121348.eeutt4py34f2yg3y@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200626121348.eeutt4py34f2yg3y@holly.lan>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jopCg-00GRzg-PR
Subject: Re: [Kgdb-bugreport] [PATCH v6 4/4] kdb: Switch to use safer
 dbg_io_ops over console APIs
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
Cc: pmladek@suse.com, kgdb-bugreport@lists.sourceforge.net, jslaby@suse.com,
 linux-kernel@vger.kernel.org, sergey.senozhatsky@gmail.com,
 jason.wessel@windriver.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, Jun 26, 2020 at 01:13:48PM +0100, Daniel Thompson wrote:
> Hi Greg
> 
> This patch touches some kgdb related code in both serial and usb trees.
> 
> Any objections to my queuing this via the kgdb tree?
> 
> After testing I've concluded that this, and its friends (which only
> touch kgdb), fix enough problems that I plan to queue it for v5.8.

No objections at all:

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
