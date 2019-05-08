Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6504717436
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  8 May 2019 10:48:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hOIFv-0002aM-3b
	for lists+kgdb-bugreport@lfdr.de; Wed, 08 May 2019 08:48:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1hOIFt-0002aA-6Q
 for kgdb-bugreport@lists.sourceforge.net; Wed, 08 May 2019 08:48:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pA4oZ7mGlzJnhNFULh/+qwzD5DlNWy+0yxQhURm3SoM=; b=S+K6C2qC0SVXJjm7CzXIvucAE5
 b5dpFAhHlDiBxYojC6jDV1vbO59MPEFm4NZVVJaqampjM4cM/5UJQFEw0qvk2+f4UoaFzeM/BBULr
 ClsJwcLeF4H9hwKLHenuH+AlJ6Q/pZsPNnrfHIuoZUWrWZQqj1t6faJn764x9w21sAHM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pA4oZ7mGlzJnhNFULh/+qwzD5DlNWy+0yxQhURm3SoM=; b=ZGc9EBSNhjJh2/xbRrOUD4xG3w
 P+Ep8yU7sGzcSgaThu022krlKFFuVMShociOehgCDfDZg0vXmZ+PLuxQJs4MfsJp0HJd/WOJU/gDq
 aJyLefVPq6yZwdaoOzwT5r8AQewU86PQ4ISyMqqH4pYe1w6E3k0yiKzZXUE66YuU4pBI=;
Received: from mail-wm1-f65.google.com ([209.85.128.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hOIFr-00Ct6i-Q2
 for kgdb-bugreport@lists.sourceforge.net; Wed, 08 May 2019 08:48:49 +0000
Received: by mail-wm1-f65.google.com with SMTP id p21so2170223wmc.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 08 May 2019 01:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=pA4oZ7mGlzJnhNFULh/+qwzD5DlNWy+0yxQhURm3SoM=;
 b=fR+KBI9BQi0aN7Z9LOL4SDuWNDpgoqcdWrAwDWTc00t+R/d42BzfQfa0VQ1xVGByt7
 r+Z8lTtSJUlo7AHe5z+rn30iVMXiKBwP609Y61g+NyHMJvEska5fV5DbCA8a3T7OXD/N
 u6azZipWyuP0dFnZTuqhz/AcZDiXw7mvKAjn6yv4jK6sSN5LS/gBKIF4TqBjAPuhGWtS
 TnMf7nNAtnaWKmy4R8zO5fbnwja89AjFxDtDaRLF6Wr1RpQMfl51KHHL8d7ZWxsx5u9L
 F2pM6Ek6ulTxTfdZFbHZRaLURGY+b2J+2LuqYzSyrSHgjKbYP1mQI/ogOH6TyGmTfdsN
 LH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pA4oZ7mGlzJnhNFULh/+qwzD5DlNWy+0yxQhURm3SoM=;
 b=Cym/AsU+L3Bj1dmCxkuFygi9gLxmdjCdey9U2h/Xk2dc8rO55BzNcqkX06tgJ1GTuM
 IocPkkqtV6aTRjEXZomT5HXuTIRdVGARGlYxvg2YUk7FtQSRyaRFjQHQxPkvpcwze5OQ
 vZdhpcvt+b6GHexBz3bczShf+CfbJ1oSQQRkZ/xzpv4v1fxzK6QgMoCMww/skwDOSw10
 emxKIiqt5un5ovuxb7KLB/mwGOayoPgy2vJThwuoz5m3ZqaRE6aF69XghBKDYiJ5UC1h
 mRrE3+fuzwhoNl/R+VkimncqXPnP0leyfeAmpG2fSsvbepBVcJzF9geEt4kyUInhwHZY
 A8LA==
X-Gm-Message-State: APjAAAUq7CqF78VlhHzFT5Xko7PadIpQXNKxrD02/KyD+JPb3sOPa908
 oaHZ3i9wi/0qO6HW/Y7N/UF6cQ==
X-Google-Smtp-Source: APXvYqwPf1J9m8LDiRXqWVFpptl/XV9DXySpKB/Kv+9l1UywcROKBlFQHCh3ZjHr8Ii4O6DbKui6uA==
X-Received: by 2002:a1c:cb48:: with SMTP id b69mr2196684wmg.109.1557305321231; 
 Wed, 08 May 2019 01:48:41 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id s3sm32448144wre.97.2019.05.08.01.48.40
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 May 2019 01:48:40 -0700 (PDT)
Date: Wed, 8 May 2019 09:48:38 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20190508084838.w7t3nwamobpmwgkv@holly.lan>
References: <20190506125018.GA13799@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190506125018.GA13799@mwanda>
User-Agent: NeoMutt/20180716
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.65 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hOIFr-00Ct6i-Q2
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: do a sanity check on the cpu in
 kdb_per_cpu()
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
 Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 kgdb-bugreport@lists.sourceforge.net, Nicholas Mc Guire <hofrat@osadl.org>,
 kernel-janitors@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, May 06, 2019 at 03:50:18PM +0300, Dan Carpenter wrote:
> The "whichcpu" comes from argv[3].  The cpu_online() macro looks up the
> cpu in a bitmap of online cpus, but if the value is too high then it
> could read beyond the end of the bitmap and possibly Oops.
> 
> Fixes: 5d5314d6795f ("kdb: core for kgdb back end (1 of 2)")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Just out of interest... why isn't this copied to LKML? Omiting LKML makes
the patch hard to find in a patchwork instance.


Daniel.

> ---
>  kernel/debug/kdb/kdb_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index fc96dbf8d9de..9ecfa37c7fbf 100644
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -2583,7 +2583,7 @@ static int kdb_per_cpu(int argc, const char **argv)
>  		diag = kdbgetularg(argv[3], &whichcpu);
>  		if (diag)
>  			return diag;
> -		if (!cpu_online(whichcpu)) {
> +		if (whichcpu >= nr_cpu_ids || !cpu_online(whichcpu)) {
>  			kdb_printf("cpu %ld is not online\n", whichcpu);
>  			return KDB_BADCPUNUM;
>  		}
> -- 
> 2.18.0
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
