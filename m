Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D21EE20CF45
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 29 Jun 2020 16:54:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jpvAY-0006uB-GQ
	for lists+kgdb-bugreport@lfdr.de; Mon, 29 Jun 2020 14:54:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pmladek@suse.com>) id 1jpvAW-0006tp-Aw
 for kgdb-bugreport@lists.sourceforge.net; Mon, 29 Jun 2020 14:54:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1MD+CHIuaFM4exKvf1k4Emhh9AT26TRsh0T+8UdO7TI=; b=GRz9Vh9VqMBBlQKtK93MLEiuxa
 oLU07zCSFTVM/qciMC8JYu/U2gkdRYR501YHQmtEHCqkSxnLPSW+2MPAvP86OJzCIfRy3XKGVpNhP
 wTXysiiPY1cXhGDWneg0GFD4rY1DKlX8HH1TxRsjzCBYUnCk3Mc8uRuRu7B+LWjkJRwI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1MD+CHIuaFM4exKvf1k4Emhh9AT26TRsh0T+8UdO7TI=; b=BQSxhjV2vCbOSqMO2hUnX6hy72
 HhcjcaJbcMGb2xjvLZcgj2eeQ4qXI8aci0H6MpqcKMnTzGUbz7VeOOaN+QYfU5eFMs4O0EAYnKEls
 UKDsIz6gAiW+bg+8wS7Bp8mJudAkUorm5pSI3Aj/TsrXShaUtVi/q7BdMmGfMGTb0ZaQ=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jpvAV-00299p-6O
 for kgdb-bugreport@lists.sourceforge.net; Mon, 29 Jun 2020 14:54:00 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CA548AD5C;
 Mon, 29 Jun 2020 14:53:52 +0000 (UTC)
Date: Mon, 29 Jun 2020 16:53:51 +0200
From: Petr Mladek <pmladek@suse.com>
To: Cengiz Can <cengiz@kernel.wtf>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20200629145350.GC6173@alley>
References: <20200629135923.14912-1-cengiz@kernel.wtf>
 <20200629145020.GL6156@alley>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200629145020.GL6156@alley>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jpvAV-00299p-6O
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: prevent possible null deref in
 kdb_msg_write
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
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon 2020-06-29 16:50:20, Petr Mladek wrote:
> On Mon 2020-06-29 16:59:24, Cengiz Can wrote:
> > `kdb_msg_write` operates on a global `struct kgdb_io *` called
> > `dbg_io_ops`.
> > 
> > Although it is initialized in `debug_core.c`, there's a null check in
> > `kdb_msg_write` which implies that it can be null whenever we dereference
> > it in this function call.
> > 
> > Coverity scanner caught this as CID 1465042.
> > 
> > I have modified the function to bail out if `dbg_io_ops` is not properly
> > initialized.
> > 
> > Signed-off-by: Cengiz Can <cengiz@kernel.wtf>
> > ---
> >  kernel/debug/kdb/kdb_io.c | 15 ++++++++-------
> >  1 file changed, 8 insertions(+), 7 deletions(-)
> > 
> > diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> > index 683a799618ad..85e579812458 100644
> > --- a/kernel/debug/kdb/kdb_io.c
> > +++ b/kernel/debug/kdb/kdb_io.c
> > @@ -549,14 +549,15 @@ static void kdb_msg_write(const char *msg, int msg_len)
> >  	if (msg_len == 0)
> >  		return;
> >  
> > -	if (dbg_io_ops) {
> > -		const char *cp = msg;
> > -		int len = msg_len;
> > +	if (!dbg_io_ops)
> > +		return;
> 
> This looks wrong. The message should be printed to the consoles
> even when dbg_io_ops is NULL. I mean that the for_each_console(c)
> cycle should always get called.

Please, forget this mail. Daniel explained that dbg_io_ops must have
been set when this function gets called.

I am sorry for the noise.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
