Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9242E1DD245
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 21 May 2020 17:47:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jbnQI-0006q6-Ck
	for lists+kgdb-bugreport@lfdr.de; Thu, 21 May 2020 15:47:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jbnQG-0006px-FZ
 for kgdb-bugreport@lists.sourceforge.net; Thu, 21 May 2020 15:47:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ygXdshwZ6sqhNV/RMFYuAUef1d1MehMWLgDXSG2EHPs=; b=RTNq1r1HTBsgsay4sXijYeUxen
 I3NEmAJQxH7GOKGigpQ6PEICcugFRgu6ttlhVYI5qEBmi+cTwmvGZOWMbQH+qCCwSYP0fmFpHaVB4
 29PRiHz6M0159g3uS91ja4jnCT/UNZkGBqZz0XDxiItYNRyDpSIhMaQqHkcdqkdF7QAs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ygXdshwZ6sqhNV/RMFYuAUef1d1MehMWLgDXSG2EHPs=; b=Hw49ytUbNotoJVaC11oEHoHrIa
 43r4UBGM2CS5QSIsEByT1CRX7mL2HUB0PQISMXgmLGcKBFXriy9YS0yVeTObc+Z6wetPEt1pDMYAU
 UFgtWzJ8+y78nArQYJMTQxPSu8TfN9h3TmvP5X9mahaUybkD588T06pv8Yvcim6hZCuc=;
Received: from mail-wm1-f67.google.com ([209.85.128.67])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jbnQC-00BJIZ-Di
 for kgdb-bugreport@lists.sourceforge.net; Thu, 21 May 2020 15:47:52 +0000
Received: by mail-wm1-f67.google.com with SMTP id n18so6847042wmj.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 21 May 2020 08:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ygXdshwZ6sqhNV/RMFYuAUef1d1MehMWLgDXSG2EHPs=;
 b=Le6cJcuobanbwKgpp8zSivcyXze9t07R/UHYuERqTibtsy7X/7SAiRx3kKbE9q+2t7
 a8LBUq/lE7CMVR3EFaUHcSr6o0pkzVkQudm8mbe8Brwi3sfop8yoJ0l/GyFhcrZqAQ89
 OOtxQ24xQK1ODH4tvY+VAqxgZEWS0RFpiQGMo1SvpLsrxxJNEyA/2/ly+qvNOrvJDcnb
 DJeOIaYP2xcpraV7aoTkNImBo83FCkvNbnqOlSTZk5cESrtBKP1XP9WZ/MsN9k+v2K4a
 Uyhm1gX5Cn6BH6d+FSF9oaRhFniCeNWam4cS6kt+Om7gD86vLeCEhg32UKpaUKqtbDPb
 zKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ygXdshwZ6sqhNV/RMFYuAUef1d1MehMWLgDXSG2EHPs=;
 b=US0AEa34XyKXtFlD0AZ3Y7dlEE2mQNIogcWiy0isnR6ZDHwTzXGeXedBrW9LDlXSUx
 KDPSHrtwUSc0LQ9zuyey5SczNkhogi1sEHp9Y+vw8crx0p3J0Dw3uktWz99Ktk9GAO8c
 DIqwvRhyS5NRQ+Kz1MePjL6KA7DzyZf6W7itVN7oKO4dtcZaE/v03qBBaS/uiMxmJe6D
 NpPHbjrnEyVVbc/HaKyx64urvEYLFls1JcLM+gf0LB+96Kio716Pq3bNRthPoDVRSaEO
 35Na4TMr9G8PmIHoolq8rQpYG1u9XyWIrHEhcy4QPCBfCWYVE28xdJl/70ivC+MBkeaB
 BurQ==
X-Gm-Message-State: AOAM532de2d4xGaY6UwMjTMoz75vGTUqvyahBME1Nimj6dJ2gxOCGwIn
 8UfiDpD9VEAJJuDTkjw/kBcwQA==
X-Google-Smtp-Source: ABdhPJw5aqhrGaCS0GkssHgUIq4kYKj48KGgn6bMqFfY0W6t9kiBEGtCB7dkNiSteJamudE6T3LTbA==
X-Received: by 2002:a7b:c205:: with SMTP id x5mr9933734wmi.135.1590076062001; 
 Thu, 21 May 2020 08:47:42 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id a10sm7076374wmf.46.2020.05.21.08.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 08:47:40 -0700 (PDT)
Date: Thu, 21 May 2020 16:47:39 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Wei Li <liwei391@huawei.com>
Message-ID: <20200521154739.ukfro4uuxpmnrpsx@holly.lan>
References: <20200521072125.21103-1-liwei391@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200521072125.21103-1-liwei391@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jbnQC-00BJIZ-Di
Subject: Re: [Kgdb-bugreport] [PATCH v3] kdb: Remove the misfeature
 'KDBFLAGS'
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
 Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, May 21, 2020 at 03:21:25PM +0800, Wei Li wrote:
> Currently, 'KDBFLAGS' is an internal variable of kdb, it is combined
> by 'KDBDEBUG' and state flags. It will be shown only when 'KDBDEBUG'
> is set, and the user can define an environment variable named 'KDBFLAGS'
> too. These are puzzling indeed.
> 
> After communication with Daniel, it seems that 'KDBFLAGS' is a misfeature.
> So let's replace 'KDBFLAGS' with 'KDBDEBUG' to just show the value we
> wrote into. After this modification, we can use `md4c1 kdb_flags` instead,
> to observe the state flags.
> 
> Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Wei Li <liwei391@huawei.com>
> ---
> v2 -> v3:
>  - Change to replace the internal env 'KDBFLAGS' with 'KDBDEBUG'.
> v1 -> v2:
>  - Fix lack of braces.
> 
>  kernel/debug/kdb/kdb_main.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index 4fc43fb17127..392029287083 100644
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -418,8 +418,7 @@ int kdb_set(int argc, const char **argv)
>  				    argv[2]);
>  			return 0;
>  		}
> -		kdb_flags = (kdb_flags &
> -			     ~(KDB_DEBUG_FLAG_MASK << KDB_DEBUG_FLAG_SHIFT))
> +		kdb_flags = (kdb_flags & ~KDB_DEBUG(MASK))
>  			| (debugflags << KDB_DEBUG_FLAG_SHIFT);
>  
>  		return 0;
> @@ -2081,7 +2080,8 @@ static int kdb_env(int argc, const char **argv)
>  	}
>  
>  	if (KDB_DEBUG(MASK))
> -		kdb_printf("KDBFLAGS=0x%x\n", kdb_flags);
> +		kdb_printf("KDBDEBUG=0x%x\n",
> +			(kdb_flags & KDB_DEBUG(MASK)) >> KDB_DEBUG_FLAG_SHIFT);

For this expression to work correctly, kdb_flags, need to be unsigned
(otherwise we get an arithmetic right shift and mis-report when
KDBDEBUG == 0xfff).

This is just FYI, I think I can fix this up when applying...


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
