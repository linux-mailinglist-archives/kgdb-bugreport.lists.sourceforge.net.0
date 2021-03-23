Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 068E1345E92
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 23 Mar 2021 13:54:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lOgYR-0003Ki-PZ
	for lists+kgdb-bugreport@lfdr.de; Tue, 23 Mar 2021 12:54:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <gregkh@linuxfoundation.org>) id 1lOgYQ-0003KV-EA
 for kgdb-bugreport@lists.sourceforge.net; Tue, 23 Mar 2021 12:54:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6cKz8n5QmC0OFzWmvXAyzEKo5cWkscW5AKTVs4gtGL8=; b=OfTwWV1B0c1ihDmI4TDLQu/xLV
 82kKn3CZzF8sAEU4JQ/PeowF6qrf7B26gZwmxyH7KdGpZ8xkFW5Jh83kS5hJPCIAsZPMwDSzjkW9R
 seapRVq71c3I6O23PLOW/s6cEg0eiucni34cJoyLKMR8MkBmfMRHCTfBnmezMVda1q48=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6cKz8n5QmC0OFzWmvXAyzEKo5cWkscW5AKTVs4gtGL8=; b=RLJ1fnOatN8bo3CDF/aavnPt7y
 gP+kjwN289IDypf1DDp/jGU9Dg14cthyc/axF7L24iCSMXSb+GA3qgVuyATFlPCFbf/QF8/ZBRgKW
 fAwH+cElAOSMv1X416KMic0YWSJhTIKT2m2LJZ3ub1lP+zdcgPwnDpb/HOATE0xlRVAU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lOgYK-0013hs-CB
 for kgdb-bugreport@lists.sourceforge.net; Tue, 23 Mar 2021 12:54:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2B50A619B9;
 Tue, 23 Mar 2021 12:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1616504066;
 bh=lKQSbBoD5VY1QPknyOuP3OHdtK0DDF5PhyZzYUxCGtA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gyvtQLKpngyWCBu75hqYmFlyIY7Hwdpf2MF+ofg2eaX032kHj3tZLNK05DI1c18iw
 nIFB3rkB+IcbjnjJ3tOyKexWpLQHvqkx2vOj8QTyo9z0YMlqlBy+s83r7j0rRGKkUN
 Y1gDH1iWgq5zE4tUKhFotH8YD2ZI3f5I7FQR5a3E=
Date: Tue, 23 Mar 2021 13:54:24 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Shubhankar Kuranagatti <shubhankarvk@gmail.com>
Message-ID: <YFnlADClpqE9Zkom@kroah.com>
References: <20210313215808.dt7uvt2suwq4z4x3@kewl-virtual-machine>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210313215808.dt7uvt2suwq4z4x3@kewl-virtual-machine>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lOgYK-0013hs-CB
Subject: Re: [Kgdb-bugreport] [PATCH 1/2] drivers: misc: kgdbts.c: Fix
 declaration warning.
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
Cc: arnd@arndb.de, kgdb-bugreport@lists.sourceforge.net, bkkarthik@pesu.pes.edu,
 linux-kernel@vger.kernel.org, jason.wessel@windriver.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Sun, Mar 14, 2021 at 03:28:08AM +0530, Shubhankar Kuranagatti wrote:
> A new line has been added after declaration. This is done to
> maintain code uniformity.
> 
> Signed-off-by: Shubhankar Kuranagatti <shubhankarvk@gmail.com>
> ---
>  drivers/misc/kgdbts.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/misc/kgdbts.c b/drivers/misc/kgdbts.c
> index 945701bce553..3ee5acc1c391 100644
> --- a/drivers/misc/kgdbts.c
> +++ b/drivers/misc/kgdbts.c
> @@ -474,6 +474,7 @@ static int emul_sstep_put(char *put_str, char *arg)
>  {
>  	if (!arch_needs_sstep_emulation) {
>  		char *ptr = &put_str[11];
> +
>  		if (put_str[1] != 'T' || put_str[2] != '0')
>  			return 1;
>  		kgdb_hex2long(&ptr, &sstep_thread_id);
> @@ -502,6 +503,7 @@ static int emul_sstep_put(char *put_str, char *arg)
>  			return 1;
>  		} else {
>  			char *ptr = &put_str[11];
> +
>  			kgdb_hex2long(&ptr, &sstep_thread_id);
>  		}
>  		break;
> @@ -740,6 +742,7 @@ static int validate_simple_test(char *put_str)
>  static int run_simple_test(int is_get_char, int chr)
>  {
>  	int ret = 0;
> +
>  	if (is_get_char) {
>  		/* Send an ACK on the get if a prior put completed and set the			* send ack variable
> --
> 2.17.1

This patch is corrupted :(

Please fix up and resend the whole series properly threaded so our tools
can pick them both up at the same time.

thanks,

greg k-h


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
