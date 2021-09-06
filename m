Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA8F401A64
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  6 Sep 2021 13:09:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1mNCVT-0006t4-Ul
	for lists+kgdb-bugreport@lfdr.de; Mon, 06 Sep 2021 11:09:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <daniel.thompson@linaro.org>) id 1mNCVS-0006sx-Jo
 for kgdb-bugreport@lists.sourceforge.net; Mon, 06 Sep 2021 11:09:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Arq1up5bA53xLHQpnJvwo0x1Fb742WDNGFLacyi2NNw=; b=VANiJozhQQeFCQL48L1iS86mso
 WWCYqDtCMik2AZkLXhWlJO3iiY4zVK/JcoW84+IsW7ZMN6rZmqHeLzQoGCjeqcs+o59w+7H7U7e7f
 VyFQM+CR0VPGp8k5dVXqWGapNG0+mxzRx5C7rhryQcwR/HjxxGTBJyQSkciSr6Y4udXs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Arq1up5bA53xLHQpnJvwo0x1Fb742WDNGFLacyi2NNw=; b=HUxbudC7zf2ECovdTofvcoxjOb
 K5rJqqKZ//wt+cdq3ghgUPj8jFwtzj0clkguFA25QZQzgT4y6hQdEdgngaAbBzzaBg9ea7jhUsrB2
 DB9uFyr9kuCXo0eEdDKWGgbiqXFFi/EiR8cq96icU1yK51b+5+kcd8QCJXZobdVeXQBU=;
Received: from mail-wm1-f47.google.com ([209.85.128.47])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mNCVN-00HFQj-Py
 for kgdb-bugreport@lists.sourceforge.net; Mon, 06 Sep 2021 11:09:42 +0000
Received: by mail-wm1-f47.google.com with SMTP id
 k5-20020a05600c1c8500b002f76c42214bso4667887wms.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 06 Sep 2021 04:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Arq1up5bA53xLHQpnJvwo0x1Fb742WDNGFLacyi2NNw=;
 b=sqsd4dIPCJITuPasRtiJ+ze6aVIr8Vb4qU2eVNhGWf85MKDGYCstH46jQu1VuBpsKd
 6bQ5Dp42eh/rxpa2l4Bhx5rbQAGRd2NhhiZ+hzfGLTfQt60s7iddg5yaPHJNQxc4Ln3j
 +PIAo+WX0/WoSSj4F9yKZWGf1w8ZTSa2K8tDlyDWc+wSA72Kr93h0uhSx5dKNycvzCaX
 qPGbQuL3fbV5oIXtnPat3sJA6hBCr5xRlV++Vg+3iKiVFVla775hSwWCt5X/anlm8gu6
 5n7Qo8z70nKG/pA6/Rk0WqamwFMeeTikc8e/RSAUiTtMf8AuW5IEGscxPrjnVQJH16Ev
 0TWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Arq1up5bA53xLHQpnJvwo0x1Fb742WDNGFLacyi2NNw=;
 b=tHPI7HKbJi+UaY2D7zept29Q0maJcKZ04cYXlk9/COoAqKa5cWC3SBFcd4ZiVikdMR
 b+x5q/wRBMMMisYvPu1SKJoIf+xYN0s8T4xde6abFJdEevF1Yk2BldQWOsPJS46yLa3v
 sQMH2K9/3EJS1UTOH9M48kPxF0PyEiM+/EHDW/4Z6247pIzVbxo6eAzyJSwdmqznv2rS
 3jd6YGT7hr0uxSGu0h3+C6f+e+2XeW3SxOERuEEOYwkkqM03nYSNR226amsPoCUL4PqK
 TizAI3JLmSdwpajzm0Bi9SvCVrJuhNbtJRXpJn+0TKXHERIaFytBlpGS26mSvg+sM5RC
 9+Dg==
X-Gm-Message-State: AOAM533k7s+b0y0cEwerykK5uxuUZEtpUJKPlZVPe3LNA9Beg9jzb8ux
 SdYPapmZatPl/IgrjePmd0KSIQwU6r0JxMvi
X-Google-Smtp-Source: ABdhPJyyhlYuqxiyV6YBKidEilVhA2tJtdXsvYpAarjRG+v0ujsy6bKkyxEbZvFxQrjqUTMd77CJqg==
X-Received: by 2002:a1c:f606:: with SMTP id w6mr10789725wmc.42.1630926571381; 
 Mon, 06 Sep 2021 04:09:31 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id d7sm7568540wrs.39.2021.09.06.04.09.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 04:09:30 -0700 (PDT)
Date: Mon, 6 Sep 2021 12:09:29 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Cai Huoqing <caihuoqing@baidu.com>
Message-ID: <20210906110929.7jla5xjjlhpoe34m@maple.lan>
References: <20210822022206.221-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210822022206.221-1-caihuoqing@baidu.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Aug 22, 2021 at 10:22:06AM +0800, Cai Huoqing wrote:
 > use SPDX-License-Identifier instead of a verbose license text > >
 Signed-off-by:
 Cai Huoqing <caihuoqing@baidu.com> > --- > kernel/debug/ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.47 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.47 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1mNCVN-00HFQj-Py
Subject: Re: [Kgdb-bugreport] [PATCH] kernel: debug: Convert to SPDX
 identifier
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
Cc: kgdb-bugreport@lists.sourceforge.net, ason.wessel@windriver.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Sun, Aug 22, 2021 at 10:22:06AM +0800, Cai Huoqing wrote:
> use SPDX-License-Identifier instead of a verbose license text
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  kernel/debug/debug_core.c | 5 +----
>  kernel/debug/gdbstub.c    | 5 +----
>  2 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> index b4aa6bb6b2bd..da06a5553835 100644
> --- a/kernel/debug/debug_core.c
> +++ b/kernel/debug/debug_core.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0

Should this be: GPL-2.0-only ?


Daniel.


>  /*
>   * Kernel Debug Core
>   *
> @@ -22,10 +23,6 @@
>   *
>   * Original KGDB stub: David Grothe <dave@gcom.com>,
>   * Tigran Aivazian <tigran@sco.com>
> - *
> - * This file is licensed under the terms of the GNU General Public License
> - * version 2. This program is licensed "as is" without any warranty of any
> - * kind, whether express or implied.
>   */
>  
>  #define pr_fmt(fmt) "KGDB: " fmt
> diff --git a/kernel/debug/gdbstub.c b/kernel/debug/gdbstub.c
> index b6f28fad4307..9d34d2364b5a 100644
> --- a/kernel/debug/gdbstub.c
> +++ b/kernel/debug/gdbstub.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * Kernel Debug Core
>   *
> @@ -22,10 +23,6 @@
>   *
>   * Original KGDB stub: David Grothe <dave@gcom.com>,
>   * Tigran Aivazian <tigran@sco.com>
> - *
> - * This file is licensed under the terms of the GNU General Public License
> - * version 2. This program is licensed "as is" without any warranty of any
> - * kind, whether express or implied.
>   */
>  
>  #include <linux/kernel.h>
> -- 
> 2.25.1


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
