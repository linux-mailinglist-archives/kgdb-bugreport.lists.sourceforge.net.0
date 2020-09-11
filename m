Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B69DB2661A8
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 11 Sep 2020 16:58:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kGkVM-0001St-Hn
	for lists+kgdb-bugreport@lfdr.de; Fri, 11 Sep 2020 14:58:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1kGkVK-0001Sl-Qa
 for kgdb-bugreport@lists.sourceforge.net; Fri, 11 Sep 2020 14:58:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=47HWWMOcIrgjxWNrOxRLwACAIvLTkQGng5OfXu+L5SE=; b=B/+Dh1y1GtdSd1bo4vkxxf6eH0
 jwmX6CNmqJnW4YAIMVDBq21YPht6Z5x0eXFAo5SUtLcdPOl3wLTedenRxtwJpWHtSQgNZzvjjpWyQ
 KW5GcOAnzE03F84Jhb55/KRsrIwqB10Hc2aoYcm7tgqEzCIHeDQyLQmJvHWBcA/KWt8E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=47HWWMOcIrgjxWNrOxRLwACAIvLTkQGng5OfXu+L5SE=; b=Q7p+CZezSpBofTMtGVFVi6MXeb
 Zl+gK81Fw5PmmupGN/GfbtchzcJsjyUi6zoJPavhmH9stBZhBo3MIWEnW2mpHZE88dVrThni5JNj6
 QoIZWTE/HX+WksVOjDPpVS9aN/tgFbKWzPv/V7yy4eywYUi2qDd6SPjWSdx6h6WhWs68=;
Received: from mail-wm1-f67.google.com ([209.85.128.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kGkVC-004I8E-EB
 for kgdb-bugreport@lists.sourceforge.net; Fri, 11 Sep 2020 14:58:22 +0000
Received: by mail-wm1-f67.google.com with SMTP id w2so4741222wmi.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 11 Sep 2020 07:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=47HWWMOcIrgjxWNrOxRLwACAIvLTkQGng5OfXu+L5SE=;
 b=T2wtZsJtWqU30Uhs/GnSs80/peil8RrcGioN8mdgi8nf/GYDJoj4yhExfKBTMekU8h
 sKA+501GIXNHntziWnMZ6LN1+jpLBe4p7spZvGNI6Fp/+bZWVCzApIigP4rXTBzTx4K0
 pj5/bXAoQOvTRuet5WZnRmetFaJbUp2MQOLuGNrexoPTjy6icKeTYYMOVmWXDy1wq3Mc
 iA25n+GMFzeMMBv2i96riJ4DTCHCEQyrU0obGCSW/OhKvcftwjqrC4fctm0eeXK9dOZ3
 gJRpCBFpW/vhaQaATycjAj7IMz62srogrFvgzjo2J0UvM2vJpng6qizno47+ApCJ7P69
 0YZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=47HWWMOcIrgjxWNrOxRLwACAIvLTkQGng5OfXu+L5SE=;
 b=DtlE+2t+A2xwtsi6meBvXi/LCt4HPcIaE6miPKnBZdNGBqP0ZYsjFmOUtRYn36zV74
 gaj6v8caPMGiLUAwlDyNhhiaNZw25yX5ogXY+QuZY7Rn1sfYA6CxXyWCfMuY+iOQdA/9
 yv9s8ApX7cNcLKUiTzxdtHRt40U0C7JYIOSEHMfAmEtXjzLL/bRR7YlqU4+So08x4pP6
 nxCfF8GUnbzo/qDzP+I+KvSkWvFrJAvU4BHPb7I7f5DJF4kMKoVE4J88sVDy7kSeJiyC
 X2130utcf8V3yLEd2vPqbzV9TQY1n0tqkQxkUMNh5hCDBr6X3mG5HnWgsaRHIrL55LZy
 r+Aw==
X-Gm-Message-State: AOAM532YO1AKMAoAAs837jC/rwsVAYpOpTIIwg1UVmwyZdjfNq8WdSsL
 NEI5+3WrW6vtpKYP2ALMIsZwPzYnWPL8Xg==
X-Google-Smtp-Source: ABdhPJyo65hhUPqdC7qH/YNM45eSsLSFdmMydCBAF7qEoh5wI1GKL7WMPaWI3Pg2s/OuAflz8AHBcg==
X-Received: by 2002:a7b:c24b:: with SMTP id b11mr2761125wmj.134.1599836287971; 
 Fri, 11 Sep 2020 07:58:07 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id f23sm11551550wmc.3.2020.09.11.07.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 07:58:06 -0700 (PDT)
Date: Fri, 11 Sep 2020 15:58:05 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Youling Tang <tangyouling@loongson.cn>
Message-ID: <20200911145805.oh3pcre66rrp2she@holly.lan>
References: <1596793480-22559-1-git-send-email-tangyouling@loongson.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1596793480-22559-1-git-send-email-tangyouling@loongson.cn>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.67 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: loongson.cn]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kGkVC-004I8E-EB
Subject: Re: [Kgdb-bugreport] [PATCH] kernel/debug: Fix spelling mistake in
 debug_core.c
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, Aug 07, 2020 at 05:44:40PM +0800, Youling Tang wrote:
> Fix typo: "notifiter" --> "notifier"
> 	  "overriden" --> "overridden"
> 
> Signed-off-by: Youling Tang <tangyouling@loongson.cn>

Applied. Thanks.


> ---
>  kernel/debug/debug_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> index b16dbc1..3eeee0a 100644
> --- a/kernel/debug/debug_core.c
> +++ b/kernel/debug/debug_core.c
> @@ -80,7 +80,7 @@ static int			exception_level;
>  struct kgdb_io		*dbg_io_ops;
>  static DEFINE_SPINLOCK(kgdb_registration_lock);
>  
> -/* Action for the reboot notifiter, a global allow kdb to change it */
> +/* Action for the reboot notifier, a global allow kdb to change it */
>  static int kgdbreboot;
>  /* kgdb console driver is loaded */
>  static int kgdb_con_registered;
> @@ -163,7 +163,7 @@ early_param("nokgdbroundup", opt_nokgdbroundup);
>  
>  /*
>   * Weak aliases for breakpoint management,
> - * can be overriden by architectures when needed:
> + * can be overridden by architectures when needed:
>   */
>  int __weak kgdb_arch_set_breakpoint(struct kgdb_bkpt *bpt)
>  {
> -- 
> 2.1.0


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
