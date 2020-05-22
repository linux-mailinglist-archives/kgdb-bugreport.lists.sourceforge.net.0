Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A001DECBE
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 22 May 2020 18:03:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jcA8m-00050d-NG
	for lists+kgdb-bugreport@lfdr.de; Fri, 22 May 2020 16:03:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jcA8l-00050V-BQ
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 May 2020 16:03:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v7wWb7qz1S/4lL8SzUygns1tNzo6SO+dGchGg8zLr9M=; b=K+A4cZYp9SXMsDOAu0OJyUwTR4
 Ut8Ugtibau4fESkUXTJdUBjX7c+geFFnEdfn81oY9A28MDgXRAp1vIdGDPt5Gzi7sdp9VaxeEgyW2
 m3tGI9QY2ivj2s1y5o4dzYuzWqfBpznpB3Df+REgr66Cy0tYkbSXPAKbSlI1HZexKe4M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=v7wWb7qz1S/4lL8SzUygns1tNzo6SO+dGchGg8zLr9M=; b=J531X4wHGk8qtbyJjlffpb09CR
 7xUfonLfyvUnnTu+DSe7OpyH4/izczmIQGWEnQUEjZAzUatzcMWCW3zsfbw4NBNFZvlWa8kmZvpZh
 lzLn7ZF0oj+JS+RaYyvRBAD1M4sflO+tfIFOpC0sVc6Dburvci9fuJ7y6jLKeun/e61k=;
Received: from mail-wr1-f67.google.com ([209.85.221.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jcA8g-002Uec-On
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 May 2020 16:03:19 +0000
Received: by mail-wr1-f67.google.com with SMTP id x14so5293823wrp.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 22 May 2020 09:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=v7wWb7qz1S/4lL8SzUygns1tNzo6SO+dGchGg8zLr9M=;
 b=pdmt9jvSDpqc8VKxRM6ywNws6EyfZ67QtvF5KUqSkObbIgXcqhf0pYqSji8iOn8wQ8
 rU62omd9QZzYnv0h34TdkeRL09Mpgdg4IkTLQOBm1sLhwj+gbl2oKLfFvy7ce0oijm8V
 I/ZtkWI0RbSw8rfaiSKOEoGBDtZKM0JjjDJzisQ4JwxF1zM72dqqxb7/IUTFKUkYSaEY
 t12b5VowqgPLJelJ/1PHZNO9vzM/IwdBY7qU/qzOk5oHUzLNmzj5IErvaNGnQbq1hSi6
 obORDL0EH4eMh9H5EQuR2E1ESTS7zWZ09YuwTlPZRlgKrKSiM4IlXe3KhHTNpj5MfAfU
 lX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=v7wWb7qz1S/4lL8SzUygns1tNzo6SO+dGchGg8zLr9M=;
 b=rqfC8vyFLJqZPrZHQxrcVD+sAIt5R15DYIWWoISxYg62kPnahtW12wO0GBUs8rAEE4
 qD8E9YOB0p7wqIFxZnagylL3Y+WQH1M/B4/OxgdaBwnYvMP/0xSXQWnXT4gu2619CqO1
 +PL0q9VDexrFlnKl0epA6M4VE48orWUg0luQpydffb6RArmK7K0JkyX1CM7AfEMElPwN
 OYZ1cVZUenoVvcLpPZvCYFGeV/ESkQGMqIsrgHNiCj25YC4TK0v7OFuRhQLKDUAgUs4s
 WIc1gTf5C35jeoocaJItMPPqNGhOsPyT/d8MaZhjotNo0u4PEOAokxRiYaiuCSkDn8/y
 N/eA==
X-Gm-Message-State: AOAM5301MYFdY4G3jDekKe9hVWBv1C3uDLucKQXKj+1VEX6ZBQoe8lFq
 oWYREQbejpEE6UtVqTIpVThpHQ==
X-Google-Smtp-Source: ABdhPJwU51KpmkS467wd2YMDKD0z34ZlqcGlXENl9FRlqREBHGZ+7bsCCEAi8bTDtYZlmauzrcd5QQ==
X-Received: by 2002:adf:e84e:: with SMTP id d14mr3802982wrn.31.1590163381322; 
 Fri, 22 May 2020 09:03:01 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id v205sm9818955wmg.11.2020.05.22.09.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 09:03:00 -0700 (PDT)
Date: Fri, 22 May 2020 17:02:58 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20200522160258.yq63iigp74u3ngtn@holly.lan>
References: <1590158071-15325-1-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1590158071-15325-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jcA8g-002Uec-On
Subject: Re: [Kgdb-bugreport] [RFC] kdb: Switch kdb_printf to use safer
 console poll APIs
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
Cc: pmladek@suse.com, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, sergey.senozhatsky@gmail.com,
 jason.wessel@windriver.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, May 22, 2020 at 08:04:31PM +0530, Sumit Garg wrote:
> In kgdb NMI context, polling driver APIs are more safer to use instead
> of console APIs since the polling drivers know they will execute from
> all sorts of crazy places. And for the most common use cases this would
> also result in no console handler ever being called. So switch to use
> polling driver APIs in case a particular console supports polling mode.

This comment seems rather half hearted, not least because it doesn't
explain what the current problem is nor why using the polling API is
safer.

Compare the above against the advice in
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes
and I think it comes up short. Perhaps also consider Ingo Molnar's much
more concise suggestion on describing changes:

: Please use the customary changelog style we use in the kernel:
:   " Current code does (A), this has a problem when (B).
:   We can improve this doing (C), because (D)."
-- http://lkml.iu.edu/hypermail//linux/kernel/1311.1/01157.html


> Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  kernel/debug/kdb/kdb_io.c | 39 +++++++++++++++++++++++++++++++++------
>  1 file changed, 33 insertions(+), 6 deletions(-)
> 
> diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> index 3a5a068..8e0d581 100644
> --- a/kernel/debug/kdb/kdb_io.c
> +++ b/kernel/debug/kdb/kdb_io.c
> @@ -24,6 +24,7 @@
>  #include <linux/kgdb.h>
>  #include <linux/kdb.h>
>  #include <linux/kallsyms.h>
> +#include <linux/tty_driver.h>
>  #include "kdb_private.h"
>  
>  #define CMD_BUFLEN 256
> @@ -699,11 +700,24 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
>  			}
>  		}
>  		for_each_console(c) {
> +			int line;
> +			struct tty_driver *p;
> +
>  			if (!(c->flags & CON_ENABLED))
>  				continue;
> -			++oops_in_progress;
> -			c->write(c, cp, retlen - (cp - kdb_buffer));
> -			--oops_in_progress;
> +			p = c->device ? c->device(c, &line) : NULL;
> +			if (p && p->ops && p->ops->poll_put_char) {

What prevents this logic from matching an active console that hasn't
been selected as the polling driver?


> +				len = retlen - (cp - kdb_buffer);
> +				cp2 = cp;
> +				while (len--) {
> +					p->ops->poll_put_char(p, line, *cp2);
> +					cp2++;
> +				}

Assuming it is possible to identify the console that matches the
currently selected polling driver can't we just drop the
is_console test and get rid of this branch entirely.

The only reason for the is_console test is to avoid issuing messages
twice so if we are able to suppress the c->write() for the same UART
then is_console check becomes pointless and can go.


> +			} else {
> +				++oops_in_progress;
> +				c->write(c, cp, retlen - (cp - kdb_buffer));
> +				--oops_in_progress;
> +			}
>  			touch_nmi_watchdog();
>  		}
>  	}
> @@ -765,11 +779,24 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
>  			}
>  		}
>  		for_each_console(c) {
> +			int line;
> +			struct tty_driver *p;
> +
>  			if (!(c->flags & CON_ENABLED))
>  				continue;
> -			++oops_in_progress;
> -			c->write(c, moreprompt, strlen(moreprompt));
> -			--oops_in_progress;
> +			p = c->device ? c->device(c, &line) : NULL;
> +			if (p && p->ops && p->ops->poll_put_char) {
> +				len = strlen(moreprompt);
> +				cp = moreprompt;
> +				while (len--) {
> +					p->ops->poll_put_char(p, line, *cp);
> +					cp++;
> +				}
> +			} else {
> +				++oops_in_progress;
> +				c->write(c, moreprompt, strlen(moreprompt));
> +				--oops_in_progress;
> +			}

Maybe also consider pulling the string emit to a separate function.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
