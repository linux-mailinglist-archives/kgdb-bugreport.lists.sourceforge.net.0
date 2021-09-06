Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B458401F15
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  6 Sep 2021 19:15:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1mNICw-0000mG-Qf
	for lists+kgdb-bugreport@lfdr.de; Mon, 06 Sep 2021 17:14:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1mNICv-0000mA-Fh
 for kgdb-bugreport@lists.sourceforge.net; Mon, 06 Sep 2021 17:14:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nZNOqvCTllmH6p8FAtp7O1mUgKdNYQZBUnztmCg4OwE=; b=LXUZ7FPxV5in6kVswTkciPO/ca
 FKaCZYnyBDxkGvLxlRelvj8l+rf8NvgFZI+iyILWFZo/y4v956avjHOQJigIakcIkY40AEQQVqi84
 RvPEYNGY390RFkOgyRKkEFY6teMofMaRc5FKGBEtgbWlGmGbX5KzZfpYE645BcE5Tv2k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nZNOqvCTllmH6p8FAtp7O1mUgKdNYQZBUnztmCg4OwE=; b=aR+QiceIQmCRUpRYrvrnh9sLDc
 KvaUUie68KLzHmztL2o7vyLao0tovOQxC5F6dRiHH4tle/4GYpCkmNPWEj/x+r9b/rrNwZa2YPqG4
 nDUv76qoSjcjXBtbY+zWae3E5i3Knx0cKU3o/ARvkBCOFzVby3fgMe2tcm0wCCcI6vQU=;
Received: from mail-lj1-f176.google.com ([209.85.208.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mNICn-0002kz-V9
 for kgdb-bugreport@lists.sourceforge.net; Mon, 06 Sep 2021 17:14:57 +0000
Received: by mail-lj1-f176.google.com with SMTP id w4so12292874ljh.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 06 Sep 2021 10:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nZNOqvCTllmH6p8FAtp7O1mUgKdNYQZBUnztmCg4OwE=;
 b=v/6l0XFYJQC+iOp7T7uOf3fRXDoq//OlVQ9PirVbU43FMAvxGsJIneO6Oc9sErnrsu
 2gk+K3wGmzC/a7xD2OMmk0fxx2JfPhgJ4062tbdxUSm/xGkFP2w5FSrs4YulyeRvh5kk
 x945HLLLnOJgBdJbYVjisDsM/FmL/twybQhnBJ406Keqr1vk4JdeCWbGWSmTU0DF6TQv
 IrpoyXtlXHTBQgAB3P9fIguGVuA3YXSBYg2EzOi/vr1miN/O94qVQKQM9sI7bVuyiIh8
 mV6lcENy/4aKO2E87BVnUHzTRm4Ier9ca3usjSH95uP7NGEE3h/HVbZIG1iAGelEL/Fm
 VgEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nZNOqvCTllmH6p8FAtp7O1mUgKdNYQZBUnztmCg4OwE=;
 b=SntMLYstr3ZXS/+xtBoLnh0jpcwUAwN2qsGJaYekWz5Rov0omxH+hQPcl1jw/WDmwP
 8fxHthN6R73OF7+i2EWtL9I1n8w9tiekyBf1g4Lfd7T3oG4df4FDkBzuanw9a7E63IhT
 tq/EVKIUKvPWp/oRETlpqNxKK4gn0GN73le0rEGLq1alfo4KQ21GUi2/8P9Zu6kr3fmL
 HLtusSUeW8FxofwXj+p0XTFg69z1niTS/RPxlB3uMFsV+6sMViacDkcjiNSCrVm3dcKl
 q+TZLzo7xVEpfmUoYmNIjD9DK3Mnu3Guf+27hHJgf73Sjdl450J13gCYdxqKbtK1Kdps
 hKMg==
X-Gm-Message-State: AOAM533syrkNz7wBep1ntE4FXDYsrX8ffGZ7HsTFmnm/CE7IMWg15WJd
 5YKO7lys1rN0DBxyR8uJnfSsDjOLybv/bWbK
X-Google-Smtp-Source: ABdhPJw/qs9dqmozAk/iSNP5480wvgNQbMemh1yjemJvklEwIvZFR/RhSUAubyMYxpkP5FxVu3qKZg==
X-Received: by 2002:adf:f889:: with SMTP id u9mr14697038wrp.67.1630944079371; 
 Mon, 06 Sep 2021 09:01:19 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id u9sm8349588wrm.70.2021.09.06.09.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 09:01:18 -0700 (PDT)
Date: Mon, 6 Sep 2021 17:01:17 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Cai Huoqing <caihuoqing@baidu.com>
Message-ID: <20210906160117.dq2lpk63xs7pfnre@maple.lan>
References: <20210906112302.937-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210906112302.937-1-caihuoqing@baidu.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.176 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.176 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1mNICn-0002kz-V9
Subject: Re: [Kgdb-bugreport] [PATCH v2] kernel: debug: Convert to SPDX
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

On Mon, Sep 06, 2021 at 07:23:02PM +0800, Cai Huoqing wrote:
> use SPDX-License-Identifier instead of a verbose license text
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Applied. Thanks!


> ---
> v1->v2: change GPL-2.0 to GPL-2.0-only
> 
>  kernel/debug/debug_core.c | 5 +----
>  kernel/debug/gdbstub.c    | 5 +----
>  2 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> index b4aa6bb6b2bd..da06a5553835 100644
> --- a/kernel/debug/debug_core.c
> +++ b/kernel/debug/debug_core.c
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
> 
> 
> 
> _______________________________________________
> Kgdb-bugreport mailing list
> Kgdb-bugreport@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
