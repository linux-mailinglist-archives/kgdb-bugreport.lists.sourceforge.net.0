Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF3C3061AA
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 27 Jan 2021 18:16:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l4oQt-0000W1-8i
	for lists+kgdb-bugreport@lfdr.de; Wed, 27 Jan 2021 17:16:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1l4oQs-0000Vo-BU
 for kgdb-bugreport@lists.sourceforge.net; Wed, 27 Jan 2021 17:16:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s877/bxFj8MqTFrQhojcUYU58U9r9UDE+dPVHIzG6W0=; b=YU/llsnwsDlF91WO0cH88c9grU
 kVE6bgC3HxeiRMcf0kiNqdeF/Yywy2vd8Se5hvRU9Z2nWSUcUvMxoNd6xAvBhoCPtUReVzx4tDuPT
 Y0mAh4w+iWLzFTqbNQ8DBjzW5lVkviqbTCRF1QFAuJcAJjDfBex0YTxDFAUvAeZI2C7o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s877/bxFj8MqTFrQhojcUYU58U9r9UDE+dPVHIzG6W0=; b=mQwmetbaAjhaUc55Jt0Xt19Q0P
 KHoacHw51GBpNslrat6E0R3UrMKXDGz4QRHXSAN27D3kRUmIE+dhGT5o4XAL9Mw8GYjwkvBeh+4+Q
 RYcQJt6FWZHLaBMfILPiLx0vFEqDniFHDbGzEgcHrbSkPoYcHX0UjouQDvvOGJY0BLGY=;
Received: from mail-vs1-f47.google.com ([209.85.217.47])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l4oQp-00ELje-Fy
 for kgdb-bugreport@lists.sourceforge.net; Wed, 27 Jan 2021 17:16:42 +0000
Received: by mail-vs1-f47.google.com with SMTP id o125so1520589vsc.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 27 Jan 2021 09:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s877/bxFj8MqTFrQhojcUYU58U9r9UDE+dPVHIzG6W0=;
 b=UyoVZmfbfzakH3+OFqN5GffAeHFEWIzXj8unj0tHQa/seDKbd9PAkgsEUtBOw8sTyF
 azN0xUChO2PochnRaVby7uRkCp+VHazQE7LCyxsshlsYQuycTi/CHgVjOFxti9bMJ8rw
 UZdjwaKhwJCoxPYxvCLxo/gUvE4zuKr2nd1nU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s877/bxFj8MqTFrQhojcUYU58U9r9UDE+dPVHIzG6W0=;
 b=dYii0ORk2qJ33rIQ1m/Exr5vb+V7I4F2XM7cNlJY/xe3y7hmte2XW4UZt5I4qt9h/F
 PtT+dN/X83bsPywKyiJ3hQ4rQlChFm/ucKaC0F1sJ2+5cvfgA/7245K7WtDTgJsH+gs7
 bSaEolX7eKS90SIm4TbvkITlTND0BXzZaSeAqqbxYJ2E2fYNJjgc/nQJSVX5aeaEIumH
 5phz088Js5WBaY+yZG92Eeh6hQrS03EmS/6NKyAgW0fKDUu+/8i9pl3Tnh5b6PvTD087
 U0mSA+1xV1RpyHmu3kVDevnZMBD1a7bFUeeSrFep21hDRFnb1CwdXDnIPQjckgagalDX
 v7xw==
X-Gm-Message-State: AOAM532HeEsV3tn4oqF+Kh9YRGlU+thoS6oDzGVQaXzQyWmFQxaVuEN+
 7d1svwHYSEL17B2sYK6X3pBPqq8PsnX0wg==
X-Google-Smtp-Source: ABdhPJyVnSpp6PN0VdP7o9YbbRdjavylNqhgkqb9BmwOv3xAFQBho8cwP3g+Z4qW4gIIrdOJAC5wCg==
X-Received: by 2002:a67:ecd5:: with SMTP id i21mr8991907vsp.18.1611767783530; 
 Wed, 27 Jan 2021 09:16:23 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com.
 [209.85.221.181])
 by smtp.gmail.com with ESMTPSA id c7sm309716vsq.30.2021.01.27.09.16.22
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 09:16:22 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id a6so668293vkb.8
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 27 Jan 2021 09:16:22 -0800 (PST)
X-Received: by 2002:a1f:4901:: with SMTP id w1mr8700925vka.17.1611767782261;
 Wed, 27 Jan 2021 09:16:22 -0800 (PST)
MIME-Version: 1.0
References: <1611647709-35583-1-git-send-email-stephenzhangzsd@gmail.com>
In-Reply-To: <1611647709-35583-1-git-send-email-stephenzhangzsd@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 27 Jan 2021 09:16:10 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XV-+OrMYynkj6OjYe-xGVKM-EX69=+o6Uy=toVa4+4-Q@mail.gmail.com>
Message-ID: <CAD=FV=XV-+OrMYynkj6OjYe-xGVKM-EX69=+o6Uy=toVa4+4-Q@mail.gmail.com>
To: Stephen Zhang <stephenzhangzsd@gmail.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.47 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.47 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l4oQp-00ELje-Fy
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: kdb_support: Fix debugging
 information problem
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
 Daniel Thompson <daniel.thompson@linaro.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Mon, Jan 25, 2021 at 11:55 PM Stephen Zhang
<stephenzhangzsd@gmail.com> wrote:
>
> Since there are many debugging information with a
> function name,it's better to replace them with %s.
>
> Notice that there are many similar code patterns, so I
> defined two macros. One is kdb_func_printf, which is used
> for debugging information that requires function names.
> As below:
>
> -               kdb_printf("func_name: ...",args);
>
> The other is kdb_ardbg_printf, which adds a conditional
> statement to the former.This is used for:
>
> -               if (KDB_DEBUG(AR))
> -                       kdb_printf("func_name: ...",args);
>
> In addition, I changed the format code of size_t to %zu.
>
> Signed-off-by: Stephen Zhang <stephenzhangzsd@gmail.com>
> ---
>  kernel/debug/kdb/kdb_support.c | 64 ++++++++++++++++++++++--------------------
>  1 file changed, 33 insertions(+), 31 deletions(-)

BTW: can I convince you to CC LKML on your patches?  The
"kgdb-bugreport@lists.sourceforge.net" doesn't get archived in many
places (lore.kernel.org or patchwork) so it makes it hard to find your
emails or refer to previous emails.


> diff --git a/kernel/debug/kdb/kdb_support.c b/kernel/debug/kdb/kdb_support.c
> index 6226502..d255003 100644
> --- a/kernel/debug/kdb/kdb_support.c
> +++ b/kernel/debug/kdb/kdb_support.c
> @@ -27,6 +27,15 @@
>  #include <linux/slab.h>
>  #include "kdb_private.h"
>
> +#define kdb_func_printf(format, args...) \
> +       kdb_printf("%s: " format, __func__, ##args)
> +
> +#define kdb_ardbg_printf(format, args...) \
> +       do { \
> +               if (KDB_DEBUG(AR)) \
> +                       kdb_func_printf(format, ##args); \
> +       } while (0)

In response to your v1 Daniel said he preferred:

  kdb_dbg_printf(AR, "symname=%s, symtab=%px\n", symname

So I think you'd want this (untested):

#define kdb_dbg_printf(format, mask, args...) \
       do { \
               if (KDB_DEBUG(mask)) \
                       kdb_func_printf(format, ##args); \
       } while (0)

Presumably then we'd want this promoted to "kernel/debug/kdb/kdb_private.h" ?


-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
