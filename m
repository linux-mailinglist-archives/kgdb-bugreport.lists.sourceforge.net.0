Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CABE51CDAC5
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 11 May 2020 15:08:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jY8Az-0004rk-K2
	for lists+kgdb-bugreport@lfdr.de; Mon, 11 May 2020 13:08:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jY8Ay-0004rQ-MT
 for kgdb-bugreport@lists.sourceforge.net; Mon, 11 May 2020 13:08:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PUu6hchFEIrJdI0oCeTrEFb53Hh5HVTGkYwEEVHF3Do=; b=aXvqz4gsHovye17htQ+laUXHFz
 1x3greE0/5Hp4Df8WMP3UrZsOZtg4j/bZrroyYp3QPIdcjR/xHJ+qTatfCPDgMnIZau3oxGIf0Jy5
 /4sS+Kzxnetam/KxDRKL/gPslzUcTS18to2ERlwWaLf7OxOeHHjyvU0xKRVvKqJMSVAM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PUu6hchFEIrJdI0oCeTrEFb53Hh5HVTGkYwEEVHF3Do=; b=HNt59eXdUGmI/OwTdBDVQTETEh
 pU0UD5hcFAUlqjLv83VLfDFJ+iz1H1FTHk0LLBuU/oXPfeV9eKVbYecSi8GmHS3UR0M06IcS75k18
 ji6hyphhOTyxu2xqOy/9KSq6KWjzp7lSABxIVtstfzj55aPB5xPFu1saQG6QSQPqOzaM=;
Received: from mail-wm1-f68.google.com ([209.85.128.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jY8As-008sPl-ER
 for kgdb-bugreport@lists.sourceforge.net; Mon, 11 May 2020 13:08:56 +0000
Received: by mail-wm1-f68.google.com with SMTP id y24so19203120wma.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 11 May 2020 06:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PUu6hchFEIrJdI0oCeTrEFb53Hh5HVTGkYwEEVHF3Do=;
 b=G5ZM0EN6fVpZzK/ENf3z+rsIGsnZK4hdGKUWHQ3rlX6yyq26RsyVi/Y9OYK9U65Pci
 letiQnItuDCJ9vjLTqMh+CIWkHjS6P3oYp8TqgKWMCLtiGF4wLUqe5DTnIcKgcJBa1zX
 l/c0qjvd4x8ogG5m5Ai+4Lu6fSBRUWH/vzaJk8CJoR+QPKRmnLG2T2BA4q0bdrrsOyLS
 vocHgnH8PvJtZrW9TWObrzyLJQSXCdTBLo49A65rBOYalLGhmoBgMZ9Z89nnQPyuu8GA
 3NE2ev/h9mzkIW3F/3Gg/vMdc+zYRiiyke/B4pu1K86ouZ1cH/xzgmSbQSQYkOe15Dsu
 RJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PUu6hchFEIrJdI0oCeTrEFb53Hh5HVTGkYwEEVHF3Do=;
 b=LzyrGVBXfkROhr7Gs7v1lRSu6BUF5prW2mLMFvtYsoAW82k5bzUcXkxcgJvJLMeRo+
 CBrH1e01xrrL6ZeG+FdJe5XTq05p08ZsDLr5gGW/zKRh7vKpDTmFDd6nZdUhFsvO1yOg
 PL+/pi+mpklUya+CJ1mdu10VjbtBLj3b3WzTppZBu4E6CphOR2gBauQbeXgcKqprevEj
 3BQn0e2WFU84U5r9sj0gtorS5NPcqn1NSPsrhDqZDHAKy8+RS6+kM1qoDocFw+XtUeB1
 4QdFrYPkg6kKngAsMUgHHzYppQ0FH0PUnYWx3wvd+8MThRTIZTl1AU+5ppJlchKSDbT/
 L3rw==
X-Gm-Message-State: AGi0PubaPDwVTh0a8rZ6HBjST/riOLecFGUiWyKMX2/d8a/0WeTlNJC5
 sC61Xywk8T3L8ldbaDSwFj0DQA==
X-Google-Smtp-Source: APiQypJef6P49lDCGmIOlgArrRP3xYi0mJjvs+ThVbrNRYeM2vyJ/5DgJGsC7qnECyCgZBi24erYlA==
X-Received: by 2002:a7b:cd10:: with SMTP id f16mr32836977wmj.21.1589202516663; 
 Mon, 11 May 2020 06:08:36 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id s17sm26036002wmc.48.2020.05.11.06.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 06:08:35 -0700 (PDT)
Date: Mon, 11 May 2020 14:08:33 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <20200511130833.2dxwsqosktlrmizb@holly.lan>
References: <20200506151727.2960-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200506151727.2960-1-andriy.shevchenko@linux.intel.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.68 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jY8As-008sPl-ER
Subject: Re: [Kgdb-bugreport] [PATCH v1] kgdb: Drop malformed kernel doc
 comment
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
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, May 06, 2020 at 06:17:27PM +0300, Andy Shevchenko wrote:
> Kernel doc does not understand POD variables to be referred to.
> 
> .../debug_core.c:73: warning: cannot understand function prototype:
> 'int                             kgdb_connected; '
> 
> Convert kernel doc to pure comment.
> 
> Fixes: dc7d55270521 ("kgdb: core")
> Cc: Jason Wessel <jason.wessel@windriver.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied, thanks!

> ---
>  kernel/debug/debug_core.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> index 01bc3eea3d4db..cd28a17b49a03 100644
> --- a/kernel/debug/debug_core.c
> +++ b/kernel/debug/debug_core.c
> @@ -67,9 +67,7 @@ static int kgdb_break_asap;
>  
>  struct debuggerinfo_struct kgdb_info[NR_CPUS];
>  
> -/**
> - * kgdb_connected - Is a host GDB connected to us?
> - */
> +/* kgdb_connected - Is a host GDB connected to us? */
>  int				kgdb_connected;
>  EXPORT_SYMBOL_GPL(kgdb_connected);
>  
> -- 
> 2.26.2
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
