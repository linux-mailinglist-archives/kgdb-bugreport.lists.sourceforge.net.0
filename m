Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CC830D872
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  3 Feb 2021 12:24:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l7GGh-0002O2-Qk
	for lists+kgdb-bugreport@lfdr.de; Wed, 03 Feb 2021 11:24:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1l7GGg-0002Ns-BU
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Feb 2021 11:24:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cw7UIydNqpTnPNbV9Dais44nPvIYJ47KoXAvHqGkryY=; b=S1UxnUre1uMuyINqRvse+dENXs
 95gHSoUeQFPC3uR4pMkPc9rwQYLNT70ZK+PQ2Lj4WVBCTOwf8ZIycCa9PDgvDuo5H3K73j+G84wRH
 PbslAtnfi+KzKIQdsNYamfN3EYKxIp9VUYjJrBtLM9hvaYcCjHiu91BmRlTVMgigIT4k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Cw7UIydNqpTnPNbV9Dais44nPvIYJ47KoXAvHqGkryY=; b=cwDB5II8HCT64V2BKcPqxHIWOh
 KKJH9kRLUZqic6Ne+sNu5gMIaO5bxbVIswQpN8+ThV20Tr4kLmwUudnIASioxpMicr4x54aE9w3vb
 x50PMAYiUUcLu+e3wXcWK9CnvQrwp5dajqh6nGsjDc/sCJYtHaPUSXEU15QUYoR7cwMg=;
Received: from mail-wr1-f41.google.com ([209.85.221.41])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l7GGW-001EMQ-9z
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Feb 2021 11:24:18 +0000
Received: by mail-wr1-f41.google.com with SMTP id 7so23803385wrz.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 03 Feb 2021 03:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Cw7UIydNqpTnPNbV9Dais44nPvIYJ47KoXAvHqGkryY=;
 b=HWw52il3iu9wL7OqkJttQDQGWCtAyonYBAhCxe/hnPMkHVk1zPWSifDqxe6gNJaSvf
 1TexbQktppsNld7d9+ONa4uBR1idm9hdcjtVxvBXQH73T2SneYH4x8jPUYkrYLF+jMrZ
 Opg3baywHqhO0PlmX3VuAZCOM98Mq8QrKOWtSQx3EJTZ0YaVxxxtwxzV+FEQtYmfa9ka
 aVMwvpTEbOENcY7ua4zPn5Ha4o205CWHZ6rEM00z/CqcBg1uuiE6f82oZKPCNj+JARg/
 Z6X6pGU0MaqNme+ljDbxac4buNc3XbD0P4ezZz9ILmgObsFqy8TRKYjrztAq1QFYHfp4
 z6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Cw7UIydNqpTnPNbV9Dais44nPvIYJ47KoXAvHqGkryY=;
 b=i25P/ZlKXsFlDwA1iEU+JdyyS3kZC/ONzNuLeryXelGvU0+slCIXDyJqBvNPd+v7NG
 GvHWNMt3BBjqWcjI1l5woNGYJp4cTGavv5i9SlqGJ5AH6DGk3tQjzsPrXUUUMcxdt2dK
 U1m5GWyPLekgZUEbsJTEdyLy5ej7s3dVsCMzqEU3wOgMNCphFTVcDNuzxgl64s/+7mK5
 aYmkYjnDBJoxXP4G90HwpYK8oy1WCl5CkBF3pD1RHn2ZgyyRZ3F6rnq5bOVy4QjFL2Ko
 Tz0rUCHyOMBPNKEnGeXpmPc2VBqgOjG+u1gS4Xon1zQP0nFprnP87iTqtL+vBIXyXOUs
 egUA==
X-Gm-Message-State: AOAM532KamEGqqqqNEPsyUsw5SIwW1t6CarTpdGRKV3YQsbSTBEeSJIq
 Z//Wi2vOu33Kw9sNfoNRrkHm/g==
X-Google-Smtp-Source: ABdhPJzwXjlrTH8kNM50GBnKNvDqQJSZbArmyTMX9cF4llfTBsQ6uE0Q3W/8dJzLNwFTFoBS40t2Ew==
X-Received: by 2002:adf:ecd2:: with SMTP id s18mr2952704wro.311.1612351441721; 
 Wed, 03 Feb 2021 03:24:01 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id j14sm3389443wrd.36.2021.02.03.03.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 03:24:00 -0800 (PST)
Date: Wed, 3 Feb 2021 11:23:59 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: samirweng1979 <samirweng1979@163.com>
Message-ID: <20210203112359.cdy73gw4wip5cnyn@maple.lan>
References: <20210203081034.9004-1-samirweng1979@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210203081034.9004-1-samirweng1979@163.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: yulong.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.41 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.41 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l7GGW-001EMQ-9z
Subject: Re: [Kgdb-bugreport] [PATCH] kernel: debug: fix typo issue
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
 wengjianfeng <wengjianfeng@yulong.com>, linux-kernel@vger.kernel.org,
 jason.wessel@windriver.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Feb 03, 2021 at 04:10:34PM +0800, samirweng1979 wrote:
> From: wengjianfeng <wengjianfeng@yulong.com>
> 
> change 'regster' to 'register'.
> 
> Signed-off-by: wengjianfeng <wengjianfeng@yulong.com>

It looks like the Subject line might not be correct for this patch?

Is it really the first time this patch has been circulated or should it
have been tagged RESEND or v2?


Daniel.


> ---
>  kernel/debug/gdbstub.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/debug/gdbstub.c b/kernel/debug/gdbstub.c
> index a77df59..e149a0a 100644
> --- a/kernel/debug/gdbstub.c
> +++ b/kernel/debug/gdbstub.c
> @@ -595,7 +595,7 @@ static char *gdb_hex_reg_helper(int regnum, char *out)
>  			    dbg_reg_def[i].size);
>  }
>  
> -/* Handle the 'p' individual regster get */
> +/* Handle the 'p' individual register get */
>  static void gdb_cmd_reg_get(struct kgdb_state *ks)
>  {
>  	unsigned long regnum;
> @@ -610,7 +610,7 @@ static void gdb_cmd_reg_get(struct kgdb_state *ks)
>  	gdb_hex_reg_helper(regnum, remcom_out_buffer);
>  }
>  
> -/* Handle the 'P' individual regster set */
> +/* Handle the 'P' individual register set */
>  static void gdb_cmd_reg_set(struct kgdb_state *ks)
>  {
>  	unsigned long regnum;
> -- 
> 1.9.1
> 
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
