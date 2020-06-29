Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 16ACD20CF40
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 29 Jun 2020 16:50:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jpv7I-0000yJ-SY
	for lists+kgdb-bugreport@lfdr.de; Mon, 29 Jun 2020 14:50:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pmladek@suse.com>) id 1jpv7H-0000y1-Ex
 for kgdb-bugreport@lists.sourceforge.net; Mon, 29 Jun 2020 14:50:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cx6MpL+arezCqElY9vexcse6LM5rAdU3E/qBC2dYoVc=; b=LLUD6SGtf8LxsO6VdyznZ8cBfK
 a1yR5+uvxVPKt5mLZn60nsaChRrxyttksB+CCYgZt5Tptq7si8puJ4NY1TlQCVDJICSZf6ibHtMI5
 yKhBj+T46pmrBUHfyDFD8RdxULC7/oCdN3735gJ7BmN2PAx0TD0d74US5tXLO/XmcrSs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Cx6MpL+arezCqElY9vexcse6LM5rAdU3E/qBC2dYoVc=; b=R9kWLrHHOgH0hCzh+eIIP2G1jZ
 cqg9ffS6VbTW0YlYYHrjyP3ipef20zug5erfnNO20aGG/CzEr5FUxp8G8dekR9lH0+WQVNAOptZDX
 dmZfykpgPwUldlk/fdepvqI71TjRPczYv2qZMRVqvixwzKUpc3n/ojC0I2PTRj2IyOfM=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jpv7G-00570u-5L
 for kgdb-bugreport@lists.sourceforge.net; Mon, 29 Jun 2020 14:50:39 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F1A96ACF1;
 Mon, 29 Jun 2020 14:50:20 +0000 (UTC)
Date: Mon, 29 Jun 2020 16:50:20 +0200
From: Petr Mladek <pmladek@suse.com>
To: Cengiz Can <cengiz@kernel.wtf>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20200629145020.GL6156@alley>
References: <20200629135923.14912-1-cengiz@kernel.wtf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200629135923.14912-1-cengiz@kernel.wtf>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jpv7G-00570u-5L
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

On Mon 2020-06-29 16:59:24, Cengiz Can wrote:
> `kdb_msg_write` operates on a global `struct kgdb_io *` called
> `dbg_io_ops`.
> 
> Although it is initialized in `debug_core.c`, there's a null check in
> `kdb_msg_write` which implies that it can be null whenever we dereference
> it in this function call.
> 
> Coverity scanner caught this as CID 1465042.
> 
> I have modified the function to bail out if `dbg_io_ops` is not properly
> initialized.
> 
> Signed-off-by: Cengiz Can <cengiz@kernel.wtf>
> ---
>  kernel/debug/kdb/kdb_io.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> index 683a799618ad..85e579812458 100644
> --- a/kernel/debug/kdb/kdb_io.c
> +++ b/kernel/debug/kdb/kdb_io.c
> @@ -549,14 +549,15 @@ static void kdb_msg_write(const char *msg, int msg_len)
>  	if (msg_len == 0)
>  		return;
>  
> -	if (dbg_io_ops) {
> -		const char *cp = msg;
> -		int len = msg_len;
> +	if (!dbg_io_ops)
> +		return;

This looks wrong. The message should be printed to the consoles
even when dbg_io_ops is NULL. I mean that the for_each_console(c)
cycle should always get called.

Well, the code really looks racy. dbg_io_ops is set under
kgdb_registration_lock. IMHO, it should also get accessed under this lock.

It seems that the race is possible. kdb_msg_write() is called from
vkdb_printf(). This function is serialized on more CPUs using
kdb_printf_cpu lock. But it is not serialized with
kgdb_register_io_module() and kgdb_unregister_io_module() calls.

But I might miss something. dbg_io_ops is dereferenced on many other
locations without any check.


>  
> -		while (len--) {
> -			dbg_io_ops->write_char(*cp);
> -			cp++;
> -		}
> +	const char *cp = msg;
> +	int len = msg_len;
> +
> +	while (len--) {
> +		dbg_io_ops->write_char(*cp);
> +		cp++;
>  	}
>  
>  	for_each_console(c) {

You probably got confused by this new code:

		if (c == dbg_io_ops->cons)
			continue;

It dereferences dbg_io_ops without NULL check. It should probably
get replaced by:

		if (dbg_io_ops && c == dbg_io_ops->cons)
			continue;

Daniel, Sumit, could you please put some light on this?

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
