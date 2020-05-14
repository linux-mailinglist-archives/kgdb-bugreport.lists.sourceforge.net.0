Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 695951D36E8
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 14 May 2020 18:46:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jZH0O-0006Qd-6G
	for lists+kgdb-bugreport@lfdr.de; Thu, 14 May 2020 16:46:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jZH0M-0006Q9-A1
 for kgdb-bugreport@lists.sourceforge.net; Thu, 14 May 2020 16:46:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HUlduk20pJ/YFrIISsBIBK2of0+byvpGgbvvctRJeGk=; b=cmozcsqlcq8xA1wBa3fzvY/szD
 7929DanjyhiCmTanFD67NLJDZExZPpBqNYlwrW0zmXtxfxh9qzNucLeOeLba9SUrIt0NXhN6gC4OK
 0iBIWNc7AUun87b6pjvOTNFVf+m9bAVxtIiTHQ54JIsHterQ34H3ZLuV2BAj9uJagTRs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HUlduk20pJ/YFrIISsBIBK2of0+byvpGgbvvctRJeGk=; b=kyvd3jSDpRz2HNNiPXC0N98Bsc
 elraX3BKGEAaz6+AVvZSRuYaPD3UkFkRckqhWrl3a/6kQLl5CBnZGZuXMpIecIhKnloMsoadY7oaq
 rMYNgF/jU/sRn0tCrkFURx4bqYHdkPvxoxWhEakpE8pK2EZvAw20/mis6LNrgNxOVzP4=;
Received: from mail-wm1-f68.google.com ([209.85.128.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jZH0I-00799W-0I
 for kgdb-bugreport@lists.sourceforge.net; Thu, 14 May 2020 16:46:42 +0000
Received: by mail-wm1-f68.google.com with SMTP id w64so1354618wmg.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 14 May 2020 09:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=HUlduk20pJ/YFrIISsBIBK2of0+byvpGgbvvctRJeGk=;
 b=PQceKUU/1haqRj40OIFIjnM5sSf2/ZevJjBcPrhqlKpdnvlCVRHUZjFasyT6s2gbKt
 ei8hSv7nDTicLFZGy8b+nafcNk5H915KBYgpIELwoFjcHL4SXtx98ObxXqa3BRUQS27y
 L7JUB2Y/YBrd0IfJMGk8GxTcRYHAyeffTBE2F4JxJdg6Pqguhkwoc98KjVAEz9cK+mws
 llyOP59Yr1UXKB3Njg75VgkXgzU5m6ocojxK1kosFG8+XOCcrUeHXEUgqMTjnMwA+lxz
 uBoWWFsGOHRX/9IJnJRds+JkyP7MVmqGmxDDS9UKZbeBfl6GOtqq1PQvHkZG1no0nHbB
 KFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HUlduk20pJ/YFrIISsBIBK2of0+byvpGgbvvctRJeGk=;
 b=Gwz4vyRqTg3oXzqfYZ40rmGUeGAmsUGwjvKT0TxBYw489t9ofCorR0ST5tiCQiEu2P
 LqK7LoZJgoxvHtqxoburEIcy9I28PsYXh4wlWn5OMRg6gzOF+vy1WhrGOVhfD0ZlJaew
 HKNdfBBWxCQFmIF6qnJ0WQcL80DHwZDYYPoirpM35fv5c5FqsqtnUOvidW+n9d/r6Dfc
 NN7H3/hlp4v94We1LycNe5Sx91o+JKGoqqyp5BOnEftNKyDTwsb6RzqueZlxByLO9DyJ
 37bpejwUsuG6gZ3ruFCbAOxDFzvjSQxGzJnPzGsC0zLYDeaG3FtGfr5wDIqmwJXD/HP2
 CfyA==
X-Gm-Message-State: AGi0PuZs3PJnaDENr2jr7+13+5eFauNXFixL9rgYuEccjmwG6xFMuLrA
 rW2jCMBGL1xzPE1h6qRwhlMlAA==
X-Google-Smtp-Source: APiQypI/LDHjZUzeL5oJx26MJ3l61l+D6DdDQwwkICEHNhEVW9aLlvjJ2lBXTRu3pzLbj36mXJzdSQ==
X-Received: by 2002:a1c:6884:: with SMTP id
 d126mr30492018wmc.179.1589474791525; 
 Thu, 14 May 2020 09:46:31 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id n128sm14603108wmb.47.2020.05.14.09.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 09:46:30 -0700 (PDT)
Date: Thu, 14 May 2020 17:46:29 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Message-ID: <20200514164629.6jxixnmi3tal5yfx@holly.lan>
References: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
 <20200513214351.2138580-9-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513214351.2138580-9-emil.l.velikov@gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jZH0I-00799W-0I
Subject: Re: [Kgdb-bugreport] [PATCH 09/11] kdb: constify sysrq_key_op
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
 Jason Wessel <jason.wessel@windriver.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, May 13, 2020 at 10:43:49PM +0100, Emil Velikov wrote:
> With earlier commits, the API no longer discards the const-ness of the
> sysrq_key_op. As such we can add the notation.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jiri Slaby <jslaby@suse.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: Jason Wessel <jason.wessel@windriver.com>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: kgdb-bugreport@lists.sourceforge.net
> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>

Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
> Please keep me in the CC list, as I'm not subscribed to the list.
> 
> IMHO it would be better if this gets merged this via the tty tree.
> ---
>  kernel/debug/debug_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> index 2b7c9b67931d..355bea54ca0e 100644
> --- a/kernel/debug/debug_core.c
> +++ b/kernel/debug/debug_core.c
> @@ -920,7 +920,7 @@ static void sysrq_handle_dbg(int key)
>  	kgdb_breakpoint();
>  }
>  
> -static struct sysrq_key_op sysrq_dbg_op = {
> +static const struct sysrq_key_op sysrq_dbg_op = {
>  	.handler	= sysrq_handle_dbg,
>  	.help_msg	= "debug(g)",
>  	.action_msg	= "DEBUG",
> -- 
> 2.25.1
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
