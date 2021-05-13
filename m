Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2E937F4E7
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 13 May 2021 11:39:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lh7ob-0004R3-5z
	for lists+kgdb-bugreport@lfdr.de; Thu, 13 May 2021 09:39:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1lh7oa-0004Qo-1r
 for kgdb-bugreport@lists.sourceforge.net; Thu, 13 May 2021 09:39:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K2KX3N3qEtXhLRhml3Iacue6w4dhQzMo6cc0mTtnvQM=; b=doUxp8OWIdj8DOJFhJhWZHWaOz
 yFBApwIeo6HiXNK7Zmd66jDXvoiUu8sG4AGSW8ZxOPuJ2XmjQ8eoR49sbwf0WlSS9i9TDFKhjNuKK
 tsL7rV48u/RG3VhPrHlIyQpoo839sIZ9pvKKCfMDNsjMG138/K+LEpyOD9oyiHzUNmFY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K2KX3N3qEtXhLRhml3Iacue6w4dhQzMo6cc0mTtnvQM=; b=Tq/xwb7Wat3v371eZw62wbhJz4
 0Nbx+gr8DpkcV/Fc6uAuXEzfEdMpsjNtz9huYCgQtGz3Rbz4EZ2tQlXZFn4l9rAOvb4cUR5WiFxMe
 9kOEYvk+lo89hEheg1/VqRC6Gca83dhnYaLCOTSak+0+dS3VNxLpC/WRK3dFe2TtXgHo=;
Received: from mail-ed1-f42.google.com ([209.85.208.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lh7oQ-0003At-DA
 for kgdb-bugreport@lists.sourceforge.net; Thu, 13 May 2021 09:39:31 +0000
Received: by mail-ed1-f42.google.com with SMTP id f1so8055282edt.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 13 May 2021 02:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=K2KX3N3qEtXhLRhml3Iacue6w4dhQzMo6cc0mTtnvQM=;
 b=r0pHg9wLk+EkYR5JCrgzCwvxfLOJCEKZ7rlImrKtZJl/RFxusIlb/dHrHqumPtHekw
 TuV6M6W+5C+88MZcMWoYC03FLTQRmP+HZMlOaDrQZ05FPxs039l9uS8pmlV0dKcHMLz5
 CUqwLbiwuftKZoH8oiGOepbGAFDSG4Xu5+/lPafGcdhEnhzFZdCxQq3GbaAARfd4JsuT
 kHeqskEgSV555dWibYEfk/fmA7mMm6ZrQ1QRkSy9E8MD6r3u6nR2yInb8/OXA+SqhpjS
 pZLrEoh296DZ+mareJMyQNItfC2RAfn4QvCt91FAO4gpzmeg8UIwAnQk+eaJMz+vsqlG
 BA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=K2KX3N3qEtXhLRhml3Iacue6w4dhQzMo6cc0mTtnvQM=;
 b=gB5PX5k7qF8++IJVcZ3YDNbCb+LMhS4FfWk7WtijPEVKMbw+hz4onuNoPpKTrk3qdc
 1bDpImJpvbiooikenbvmCvgTkaU74V/odphREyVHTfF9quxw/Ze0VKcQZ+6prB4GB6pd
 8/DG48JQbxO6fauGFbM3SMqE79Bg+3BFnzmnIBnbkD4GaDKRiK/XvDq6klBxZEDJ1Jc7
 He71Dg8Wpn6ziP9KC9GsKXt8ILU3VKRkpBBTrEXLy+Fj+aicGrd7Dj2e55gYB2Kn4Zow
 raMfhEpcQgRR49RClM7XeltoiDMliut0O1/lh1Dks7QjseXuokHIj7kuZH6exonbWSyi
 jUhg==
X-Gm-Message-State: AOAM53098p+WzMevGQ1inB/Giciayj/qdylEzAqn6M4qct4nhnjHYS1Y
 6jjolFaLtop4N8XleVg93m+VP9PA5+NhcS+7
X-Google-Smtp-Source: ABdhPJwmID9w2Hp1ruXNrBudSly/39AHF+tVW4EuRSQip8bKri1BbA6tswXSbk2m1ujO+jkvowzwUw==
X-Received: by 2002:a05:6000:2cf:: with SMTP id
 o15mr15604521wry.243.1620898293114; 
 Thu, 13 May 2021 02:31:33 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id f3sm2252580wrp.7.2021.05.13.02.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 02:31:32 -0700 (PDT)
Date: Thu, 13 May 2021 10:31:30 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <20210513093130.qzbh6tm7lbclgayh@maple.lan>
References: <20210511153958.34527-1-andriy.shevchenko@linux.intel.com>
 <20210511153958.34527-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210511153958.34527-2-andriy.shevchenko@linux.intel.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.42 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.42 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lh7oQ-0003At-DA
Subject: Re: [Kgdb-bugreport] [PATCH v2 2/4] kdb: Switch to use %ptTs
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
Cc: Petr Mladek <pmladek@suse.com>, linux-nilfs@vger.kernel.org,
 Mathias Nyman <mathias.nyman@intel.com>, linux-doc@vger.kernel.org,
 JC Kuo <jckuo@nvidia.com>, kgdb-bugreport@lists.sourceforge.net,
 linux-usb@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Jason Wessel <jason.wessel@windriver.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, May 11, 2021 at 06:39:56PM +0300, Andy Shevchenko wrote:
> Use %ptTs instead of open-coded variant to print contents
> of time64_t type in human readable form.
> 
> Cc: Jason Wessel <jason.wessel@windriver.com>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: kgdb-bugreport@lists.sourceforge.net
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

Any clue what route this will take into the kernel? I'm certainly happy
for someone else to take the kdb bits alongside the vsprintf stuff
(so here's an acked-by too in case they are fussy about that sort of
thing ;-) ):
Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

> ---
> v2: collected tags
>  kernel/debug/kdb/kdb_main.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index 1baa96a2ecb8..622410c45da1 100644
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -2488,7 +2488,6 @@ static void kdb_sysinfo(struct sysinfo *val)
>  static int kdb_summary(int argc, const char **argv)
>  {
>  	time64_t now;
> -	struct tm tm;
>  	struct sysinfo val;
>  
>  	if (argc)
> @@ -2502,13 +2501,7 @@ static int kdb_summary(int argc, const char **argv)
>  	kdb_printf("domainname %s\n", init_uts_ns.name.domainname);
>  
>  	now = __ktime_get_real_seconds();
> -	time64_to_tm(now, 0, &tm);
> -	kdb_printf("date       %04ld-%02d-%02d %02d:%02d:%02d "
> -		   "tz_minuteswest %d\n",
> -		1900+tm.tm_year, tm.tm_mon+1, tm.tm_mday,
> -		tm.tm_hour, tm.tm_min, tm.tm_sec,
> -		sys_tz.tz_minuteswest);
> -
> +	kdb_printf("date       %ptTs tz_minuteswest %d\n", &now, sys_tz.tz_minuteswest);
>  	kdb_sysinfo(&val);
>  	kdb_printf("uptime     ");
>  	if (val.uptime > (24*60*60)) {
> -- 
> 2.30.2
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
