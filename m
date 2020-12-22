Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4112A2E0DDF
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 22 Dec 2020 18:38:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1krlcY-0000xD-Rs
	for lists+kgdb-bugreport@lfdr.de; Tue, 22 Dec 2020 17:38:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1krlcX-0000x6-6N
 for kgdb-bugreport@lists.sourceforge.net; Tue, 22 Dec 2020 17:38:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p90FBl2j96whg7rD4rhdiutq3kxVhonDmop9yW526g8=; b=iN0EGU7mwnbelMks1qc1QZzcms
 DW1NLWRTbdoEbsKBsvFq37n04j2g8p3qpQxGEvpaSbk2F9ZNP4jsDAokfRjnsu2A3x5v1hHQK2Prk
 9vXqcSihw+E1cjaqVvLWo49UjLyFypEV0ZnBNnE7Rbd715M+h9NdGbfz1pVeodh2sTzo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=p90FBl2j96whg7rD4rhdiutq3kxVhonDmop9yW526g8=; b=HXvHVwzOuA8/7bh1PFeXhp2r+k
 QNCizmsu6Ox/UvzgV/7r9RuLS1/1sxv/4VOFt9QBRquxrZc+oK6CObs7+BQ9bP7ungx10At2UVIlG
 4oyTpgyFMcOPfwD2a9AZoJRoLHpJ9FeBsT6LH0eRNL/QHos2QS8PDY7sYBhPB8yMJEeE=;
Received: from mail-wm1-f52.google.com ([209.85.128.52])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1krlcK-006OYW-D6
 for kgdb-bugreport@lists.sourceforge.net; Tue, 22 Dec 2020 17:38:49 +0000
Received: by mail-wm1-f52.google.com with SMTP id a6so2509154wmc.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 22 Dec 2020 09:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=p90FBl2j96whg7rD4rhdiutq3kxVhonDmop9yW526g8=;
 b=byK36WMeGyjauDHsfV5Qlnjf4POVyhYTKciOoMt72lxaB1vALTCw0V5yFzHS7bnB/j
 f64MilKlbMrOhQPejoJ/9AmIwAiaBZAs9Xl+l/HS1VRVWJXowqkR0+oFIwEulfwhkAdl
 3xsY9laqxbKtZPzBjavTXEVSFBE1fLmn6jvSQOxct8n49vrZuFjCZdSCjjCcyIXo6pio
 C+YVa6KSvYC8TbkI0Sv2eaNiNWK6TzSXjWWAcJhwPeaRVFicXlQqGO55HZJSg2oBsOEK
 nGreGIfHE2Xt3NOrptppIV4M/T0s50hgpfxpHM5I2DQnXRFBjy5xPW1MAm4ryUx6erTb
 2m0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=p90FBl2j96whg7rD4rhdiutq3kxVhonDmop9yW526g8=;
 b=sV8/lZyyjzhHoohogljuLExU/amctrPK8bBaX6s/+W5WIKGuwVYjyu9Ja8FEZ97Qqs
 /3oU8M/4Fbjn90/ibYe7Fmz86UNL1YEQKv7R2e0Lv4/R0hHUZFtxYOG8xaThzp807GhP
 +GFmP1mqcEbJdg+YHAV6yEGkMnUiRjsBLolfYwtM69om4TOTCRxKwmRv3Vf5fZYCHpRE
 Aq/11cKv/AbKahnJhRArCqVnMV044LB2eRuDQ1FlSemrojWXwJ21MNB/bnegxvv/jye7
 ggsRtSQ+tIXCovWBVg1RfDbMqIK+bI85NSyZF+9f+utmXApHbubM+vp7geaosdk1kEzT
 V5Gw==
X-Gm-Message-State: AOAM531lG9FHwDRdwA3fGkZ0PuoYNjtWTjKVfqnWuFFNpw6cPotMhUWi
 RRXVhViDVekBXpso1f+2QDbAQZYKL/ba4rBj
X-Google-Smtp-Source: ABdhPJy5kQXFxdxKzoIJA+rjPAwNAIMQJ3pOLL2RpwHSSkfhfWHWrPiPRcLFqD7itQQ1C0RIT+IkFA==
X-Received: by 2002:a1c:2d8b:: with SMTP id
 t133mr22262083wmt.127.1608657101273; 
 Tue, 22 Dec 2020 09:11:41 -0800 (PST)
Received: from holly.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id p9sm27641418wmm.17.2020.12.22.09.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 09:11:40 -0800 (PST)
Date: Tue, 22 Dec 2020 17:11:39 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Zheng Yongjun <zhengyongjun3@huawei.com>
Message-ID: <20201222171139.hosgkr22lqczzdit@holly.lan>
References: <20201222133344.19753-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201222133344.19753-1-zhengyongjun3@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.52 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.52 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1krlcK-006OYW-D6
Subject: Re: [Kgdb-bugreport] [PATCH -next] misc: use DIV_ROUND_UP macro to
 do calculation
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
 jason.wessel@windriver.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, Dec 22, 2020 at 09:33:44PM +0800, Zheng Yongjun wrote:
> Don't open-code DIV_ROUND_UP() kernel macro.
> 
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---
>  drivers/misc/kgdbts.c | 5 ++---

Arguably this patch should have kgdbts in the Subject line.


>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/misc/kgdbts.c b/drivers/misc/kgdbts.c
> index 945701bce553..cd086921a792 100644
> --- a/drivers/misc/kgdbts.c
> +++ b/drivers/misc/kgdbts.c
> @@ -139,9 +139,8 @@ static int restart_from_top_after_write;
>  static int sstep_state;
>  
>  /* Storage for the registers, in GDB format. */
> -static unsigned long kgdbts_gdb_regs[(NUMREGBYTES +
> -					sizeof(unsigned long) - 1) /
> -					sizeof(unsigned long)];
> +static unsigned long kgdbts_gdb_regs[DIV_ROUND_UP(NUMREGBYTES,
> +				     sizeof(unsigned long)i)];

How was this patch tested? This code does not look like it is
compilable.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
