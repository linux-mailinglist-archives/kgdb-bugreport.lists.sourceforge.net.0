Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F922E9610
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  4 Jan 2021 14:31:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kwPxl-00037O-VP
	for lists+kgdb-bugreport@lfdr.de; Mon, 04 Jan 2021 13:31:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1kwPxk-00037H-MY
 for kgdb-bugreport@lists.sourceforge.net; Mon, 04 Jan 2021 13:31:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bN+XHseAxF1cN3KkjF6tONZBRdBxyfyc8MAluXKpr2A=; b=ZYLw2bo3NeTJid1kjs6hbf1cam
 3nYOQ3gfNrthyR44vZNRAm6TEAk+jumFlpjBnHvMUtgtJUEaiaOI+gGQwmbL/sYsDAzDTl1ilKaOt
 zmb7v9m4InX4nv/waL/HFuAp4jwugo4oaVUQRUaHo4XqxD/uc0rYHO9k5PxEBOY8LM8E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bN+XHseAxF1cN3KkjF6tONZBRdBxyfyc8MAluXKpr2A=; b=HDBRtUzn6Bn/KKolTzxmGW7VuF
 lzsX1H+y8RY2/VZjIsmXUbTpLEatUM0BZsk/KuU4xocoNM1rtTL0I/cKTiw+Sho8N1m7MKl17H8R1
 SnUH576hN1nuJib8mIofYDxk90WGuKHt+5XNPFfaBmHPVF8Yy914q90BMMFYzUO5GnAY=;
Received: from mail-wr1-f53.google.com ([209.85.221.53])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kwPxf-006PoE-TX
 for kgdb-bugreport@lists.sourceforge.net; Mon, 04 Jan 2021 13:31:56 +0000
Received: by mail-wr1-f53.google.com with SMTP id c5so32165823wrp.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 04 Jan 2021 05:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bN+XHseAxF1cN3KkjF6tONZBRdBxyfyc8MAluXKpr2A=;
 b=kMCYusRGiaVPPK5hhaPhsvq/1+5kV/nrKFKPh1CGMatXqvHvKbWGAyveSxWWvlaRzu
 UhxLQHpntZwdFHDNYu2GoJbAwSO4RiQjK2f57XCuJEo3PXhtz4Bv6rwQ4pzppJOCzbZh
 iOYLlyOcr7ust1RqvFdOHMyLm8apEJ06yPsJvChFUtk56qSj8f8L2gzHYZzum6Glp/sm
 74QpZSZ1wRtUMHYvW9wGZSWKRTda17Xameohp5Pm3V5x6VE+kZearQy/ELfWc77nLQm5
 +uhnIYyz2zJkZwaQHFNHaXrfgBDJUvI+2MBHyNPNSQ5PvARHZMti2DtCO25f7ViF/fZL
 laBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bN+XHseAxF1cN3KkjF6tONZBRdBxyfyc8MAluXKpr2A=;
 b=SU3WDE6Dqu5ELPLicD7pd8Gg8DbzaswEdoaQWNm0nVlbps2IpQoTadQV7n/zz2q/vJ
 /g9Yl8rdykfVA/M8kmDUs/VxF32WIGBZbY8bBnZWyob6gPwSBA2e9UK8l3SyZli2RLGc
 ua4wZ+Ch8wqXZW6XwiElhkIZ01/li9viDxKXptOtheMshAT3x6v0f4IQUDvyxlsuy7Hz
 DPeqhr/zcowDySmtRSCefYBhA2sXFwWnHYvJ77+nYFStJm5yO4XcR2MVsJNWsWyWXBDQ
 xM5paBwJkQSOujvVAhFkvrnMgGf2qnS84GxJmepspKrc0MKSwpaI2naQuMLviuBaKWlZ
 7xZg==
X-Gm-Message-State: AOAM531OVMF++TMRkBYa9zSXOK1O9FeJg5m0kTfE9pqFelj0z5tOgH+/
 y94TX1GlbAji+fHtzl/ACGXi1DGewL1tSrZD
X-Google-Smtp-Source: ABdhPJyQQ/nK41ENhRlImgd9bXEsfp2DjH5iBSAezHMDV+4M1ZWzHjJ2PziuEA4zMDlz/oq5rRAsXg==
X-Received: by 2002:adf:e511:: with SMTP id j17mr78529027wrm.416.1609759736982; 
 Mon, 04 Jan 2021 03:28:56 -0800 (PST)
Received: from holly.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id a13sm85538256wrt.96.2021.01.04.03.28.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 03:28:56 -0800 (PST)
Date: Mon, 4 Jan 2021 11:28:54 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Defang Bo <bodefang@126.com>
Message-ID: <20210104112854.fghr32y37mzw6fpb@holly.lan>
References: <1609120738-202321-1-git-send-email-bodefang@126.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1609120738-202321-1-git-send-email-bodefang@126.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.53 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.53 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kwPxf-006PoE-TX
Subject: Re: [Kgdb-bugreport] [PATCH] kgdbts: Passing ekgdbts to command
 line causes panic
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
Cc: arnd@arndb.de, kgdb-bugreport@lists.sourceforge.net,
 jason.wessel@windriver.com, linux-kernel@vger.kernel.org,
 gregkh@linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Dec 28, 2020 at 09:58:58AM +0800, Defang Bo wrote:
> Similar to commit<1bd54d851f50>("kgdboc: Passing ekgdboc to command line causes panic"),
> kgdbts_option_setup does not check input argument before passing it to strlen.
> The argument would be a NULL pointer.

Something seems to be missing here.

The ekgdbts parameter mentioned in the subject line doesn't exist so
how can including it on the kernel command line could provoke a panic.

Please can you share the kernel boot arguments you used when you tested
this patch?


Daniel.


> Signed-off-by: Defang Bo <bodefang@126.com>
> ---
>  drivers/misc/kgdbts.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/misc/kgdbts.c b/drivers/misc/kgdbts.c
> index 945701b..b077547 100644
> --- a/drivers/misc/kgdbts.c
> +++ b/drivers/misc/kgdbts.c
> @@ -1057,6 +1057,11 @@ static void kgdbts_run_tests(void)
>  
>  static int kgdbts_option_setup(char *opt)
>  {
> +	if (!opt) {
> +		pr_err("kgdbts: config string not provided\n");
> +		return -EINVAL;
> +	}
> +
>  	if (strlen(opt) >= MAX_CONFIG_LEN) {
>  		printk(KERN_ERR "kgdbts: config string too long\n");
>  		return -ENOSPC;
> -- 
> 2.7.4
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
