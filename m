Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6651CDFD7
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 11 May 2020 18:02:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jYAt4-00013n-Ep
	for lists+kgdb-bugreport@lfdr.de; Mon, 11 May 2020 16:02:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jYAt3-00013Z-Id
 for kgdb-bugreport@lists.sourceforge.net; Mon, 11 May 2020 16:02:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YJxLpJX62Fekaa+AoIWZZCIoU3KlFpvhoNLivrRXfy0=; b=YNT1g8ZmbMwwINscAUs25BKwAe
 wKS/tM1T4vBhFn+rzWbnBb4S0epeV9gMDGOxLLu1RT/yxxXHox/3/6xXuufXCKjQ2xTLWwLShKVWz
 HmGxcY8Dv2fZN6+JZVhLmwX1G8iinrfPiB4LZ+81BCQNZPh8ksAvHZaow3CXNzYCOuE8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YJxLpJX62Fekaa+AoIWZZCIoU3KlFpvhoNLivrRXfy0=; b=RdGJEGB5hdjfjhq5uS/MwIjwkX
 Dopz8jLlc86y4cvdT9xPeWx7pvLpAQs6zHiHudBs5mNBECdDhATTSEvp6Iqqw54bjeBlrKc4z8w9Y
 L58C7c1aueKWuYmKBkQHXiUAzcF51spZJYHCqQG4bjRnQMKCLPfcYLVA+1vQubtSOj/A=;
Received: from mail-wm1-f67.google.com ([209.85.128.67])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jYAsz-009DpB-UN
 for kgdb-bugreport@lists.sourceforge.net; Mon, 11 May 2020 16:02:37 +0000
Received: by mail-wm1-f67.google.com with SMTP id z72so10345918wmc.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 11 May 2020 09:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YJxLpJX62Fekaa+AoIWZZCIoU3KlFpvhoNLivrRXfy0=;
 b=uv/YZnkNB3ieOwzEoD7DCWpFpAn+e/KKj67tegbx5RTEoNCuSd/EAzBjup0e9sx0K8
 /mY90Bfv1qB2WQ4Yvi98RQtvi7IHohDApmRWP6Dk5I61Qa6Bm/uSvVKg8/JhOyBeXlE8
 nTATGRzTclMXnN4nzeAazZGf3P4ZP0h2F049N6/eaGWwhE30RlY9o2sM7ZWmFitx9uX/
 zPAGOX2FnmhjfBGWIIjjiZPeThZM2hYn5g0cnMbFaM0UDtrj17O5kMJkGq/CLQU4dqS7
 VPrG8ITNOqjV0naX6BbyG5ftg+IT3O1MBbW9rbj4/Apb/9es0DgNxSzA2HAEujAMiv0H
 kZ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YJxLpJX62Fekaa+AoIWZZCIoU3KlFpvhoNLivrRXfy0=;
 b=DyDvP0QIvIsXNfkWq+QbjyeSgB7dRpucpii1P+kETHSG3JPCHem+aU2O6etEbui453
 P4wYuOpYlHFqj+0OqynnAXQsfniRP/3XtYrBWc7YwNe7BLUtc2MPRl3i2hJo+M5jJ4X2
 Be6ZQV7Oi1uApWYR6K4rZWeeV7vCnBtXm5/sY+OM3vCaxqzciMUaSptSrKRQIFA26E4R
 OTQUkSohqoJ9EdqK9sUr11AcbQU62f8ylNVqH+SOmcfey+LPVl78nqBtMQQD/ZHoUeN4
 4S3bnHRdeag68DHlYgDeV1t8xXT5pt5VURuBfyCJFyk08ibIqRyE9dbUpFoH+Bi97ePl
 waSQ==
X-Gm-Message-State: AGi0PubEMUGbqArRM15y3ZD0b5YB8tgJuJdD5XzCdqNlsXgGDdh9Gp5M
 oE1xVrkaiIm7WLOG8Mg/TBfqnw==
X-Google-Smtp-Source: APiQypJf2L0prcQVNRJ7wp9Af8wHYgkMBEEqatM3HbAZY3RC7lUVWyWWeVTHGg5jc/YsIzU0qNqOgg==
X-Received: by 2002:a7b:c931:: with SMTP id h17mr34342830wml.105.1589212947333; 
 Mon, 11 May 2020 09:02:27 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id v124sm27068657wme.45.2020.05.11.09.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 09:02:26 -0700 (PDT)
Date: Mon, 11 May 2020 17:02:24 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20200511160224.cvelsmnpxc2ykgzb@holly.lan>
References: <20200507200850.60646-1-dianders@chromium.org>
 <20200507130644.v4.7.Icb528f03d0026d957e60f537aa711ada6fd219dc@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200507130644.v4.7.Icb528f03d0026d957e60f537aa711ada6fd219dc@changeid>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
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
X-Headers-End: 1jYAsz-009DpB-UN
Subject: Re: [Kgdb-bugreport] [PATCH v4 07/12] kgdboc: Remove useless #ifdef
 CONFIG_KGDB_SERIAL_CONSOLE in kgdboc
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
Cc: catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
 gregkh@linuxfoundation.org, hpa@zytor.com, agross@kernel.org,
 bjorn.andersson@linaro.org, mingo@redhat.com, bp@alien8.de,
 linux-serial@vger.kernel.org, jason.wessel@windriver.com,
 kgdb-bugreport@lists.sourceforge.net, jslaby@suse.com, tglx@linutronix.de,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, May 07, 2020 at 01:08:45PM -0700, Douglas Anderson wrote:
> This file is only ever compiled if that config is on since the
> Makefile says:
> 
>   obj-$(CONFIG_KGDB_SERIAL_CONSOLE) += kgdboc.o
> 
> Let's get rid of the useless #ifdef.
> 
> Reported-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
> 
> Changes in v4:
> - ("kgdboc: Remove useless #ifdef...") new for v4.
> 
> Changes in v3: None
> Changes in v2: None
> 
>  drivers/tty/serial/kgdboc.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
> index 519d8cfbfbed..2e9158fff976 100644
> --- a/drivers/tty/serial/kgdboc.c
> +++ b/drivers/tty/serial/kgdboc.c
> @@ -380,7 +380,6 @@ static struct kgdb_io kgdboc_io_ops = {
>  	.post_exception		= kgdboc_post_exp_handler,
>  };
>  
> -#ifdef CONFIG_KGDB_SERIAL_CONSOLE
>  static int kgdboc_option_setup(char *opt)
>  {
>  	if (!opt) {
> @@ -409,7 +408,6 @@ static int __init kgdboc_early_init(char *opt)
>  }
>  
>  early_param("ekgdboc", kgdboc_early_init);
> -#endif /* CONFIG_KGDB_SERIAL_CONSOLE */
>  
>  module_init(init_kgdboc);
>  module_exit(exit_kgdboc);
> -- 
> 2.26.2.645.ge9eca65c58-goog
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
