Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 330853AB105
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 17 Jun 2021 12:10:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ltoyp-0000C6-67
	for lists+kgdb-bugreport@lfdr.de; Thu, 17 Jun 2021 10:10:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <daniel.thompson@linaro.org>) id 1ltoyn-0000Bx-V9
 for kgdb-bugreport@lists.sourceforge.net; Thu, 17 Jun 2021 10:10:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E56FkjuuXNFtVViqYy8TeoNuBVG48wVdRyq4qMxFT7Q=; b=j2soDz2QnxaZ5q0U5xFw6OqLXN
 +UtSz3DG98pvS5KJiX6MfzXA/GY9yWbghcYWRCf9gNjMynA+bOZTnnXFUQyElCzgqzfBj4EK/4l6p
 9BNdalO3LzyPCOPVs6t0Oyvs0v/ynYDlb4b/3Uo8AK6DBK3VkRATPP7X0Fg2eGJ4I9xs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E56FkjuuXNFtVViqYy8TeoNuBVG48wVdRyq4qMxFT7Q=; b=O6N3whfarN+dvu3zLSKmNfK4J9
 6w0NQipvZ2sMImIz/aJofPczKoic/ERNa/1qUON3w4wgxcluyJICuw9fznFaGbTJojTeFjd0bWS+g
 abJwHy6kQhi+bb4VGGkkrvUIkLxL1jnH7jIESfrpdK2ifcIIyVYu5vA0d2KC3Uy50aj0=;
Received: from mail-wr1-f46.google.com ([209.85.221.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1ltoyf-0004gl-6G
 for kgdb-bugreport@lists.sourceforge.net; Thu, 17 Jun 2021 10:10:34 +0000
Received: by mail-wr1-f46.google.com with SMTP id m18so6101254wrv.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 17 Jun 2021 03:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=E56FkjuuXNFtVViqYy8TeoNuBVG48wVdRyq4qMxFT7Q=;
 b=cc92lm3cqq/4WRpp0rUpFPx8Z+kvoT4Tx9ZXfF2YT8NU5TfFQc7Wu7KIUgsllEZhTt
 tTVl8t/ihrCA/UUKO+40t+HDheJxpctblabfjHtnjOgN7mokTL4QSRrLIED9HWgr+ueK
 FgcOs3X7/WZliyyHXF1GjikreFMAMfG1X+/aq7MmYZ6TPdltTIB6jEP2sE8gUjjWouio
 kQX19Iw+5lWapWejeVYiQv3dVdEg3ir2b2fu7OGHYwN/QcGXsGUOtquXcjpdVQCBNJNE
 ofJggyrxvf+OhJYLkkQIzDrdKReoFVgooZWf6d7BShiHhauhTvXx+AKuZFDAh1Wf83XD
 +LDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=E56FkjuuXNFtVViqYy8TeoNuBVG48wVdRyq4qMxFT7Q=;
 b=nu4zgHfF//WiqG3tnTQUYqoaUD61LhN1/t5iDlKEIHG8o73CkpD3pLQF36WdOZJth/
 MU2F3NHnr35tGnxspNdz15U65YmEMlZJ8sN9cL0ChBolv/0WcDqAhT1GdQIk1/Hob1X3
 LpPHsOYfHYXh3L9N3Zjh0EL1NJ779OR1uMYwqWHDLtImZT/eWauGgV3n4ElHLcVBcgRL
 cVhQYEaLD7Y8rnwI/f42COFIGphGt6mA3WTXbPNK3UtBLZSUWv14z3Ay+BuL1gEuNv77
 sBEMzjF0fy/FfuD8pb1iEHjEbOlQeD493u164ckLnxEoltYNqvQFiKviveFpQyS0sDNT
 VfPw==
X-Gm-Message-State: AOAM532KNKnPc7fz0NsiLA+DfgTLPPnCfip1PNvW9DrueGaM1pdp9gjM
 O1OYz/bmXlm32FIG1XO4JBu7BA==
X-Google-Smtp-Source: ABdhPJzZueI2euycUe9mgA6BJPJridBC6QGjBnvNomu7DIPEiFbFNp6XB+4L70zQGY3jU7Qc4Ta1kA==
X-Received: by 2002:a5d:6e0d:: with SMTP id h13mr4833617wrz.118.1623924620141; 
 Thu, 17 Jun 2021 03:10:20 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id o18sm7707395wmq.23.2021.06.17.03.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 03:10:19 -0700 (PDT)
Date: Thu, 17 Jun 2021 11:10:18 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Message-ID: <20210617101018.6st3dshblabvdok2@maple.lan>
References: <20210528200222.GA39201@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210528200222.GA39201@embeddedor>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.46 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.46 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1ltoyf-0004gl-6G
Subject: Re: [Kgdb-bugreport] [PATCH][next] kgdb: Fix fall-through warning
 for Clang
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, May 28, 2021 at 03:02:22PM -0500, Gustavo A. R. Silva wrote:
> In preparation to enable -Wimplicit-fallthrough for Clang, fix a
> fall-through warning by explicitly adding a goto statement instead
> of letting the code fall through to the next case.
> 
> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Applied, thanks.


> ---
> JFYI: We had thousands of these sorts of warnings and now we are down
>       to just 25 in linux-next. This is one of those last remaining
>       warnings.
> 
>  kernel/debug/debug_core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> index 4708aec492df..431749dd9ab6 100644
> --- a/kernel/debug/debug_core.c
> +++ b/kernel/debug/debug_core.c
> @@ -1038,6 +1038,7 @@ dbg_notify_reboot(struct notifier_block *this, unsigned long code, void *x)
>  	switch (kgdbreboot) {
>  	case 1:
>  		kgdb_breakpoint();
> +		goto done;
>  	case -1:
>  		goto done;
>  	}
> -- 
> 2.27.0


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
