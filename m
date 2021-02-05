Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 24830310ED1
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  5 Feb 2021 18:36:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l852H-0002SC-FX
	for lists+kgdb-bugreport@lfdr.de; Fri, 05 Feb 2021 17:36:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1l852G-0002Ru-BJ
 for kgdb-bugreport@lists.sourceforge.net; Fri, 05 Feb 2021 17:36:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EzButGrSaMS3tpn14dm5oBUBI4ta0YCz3Bh4qddD9Gs=; b=DSeWpSK/Di0SY8uPBqGe0mtXl8
 GRl/6iE5eoknIo67/euCiUsYGc6N4QOfIqxq1cGWNgkysgtdZET8xuLuyUYPYBcp1hq4Xs7uEL5ok
 DisSiXipGbu3Vdwt0LgriSPdux5W0w6vWU5SyUKCro396u6p438nM9Axz9lzIEjjqOvM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EzButGrSaMS3tpn14dm5oBUBI4ta0YCz3Bh4qddD9Gs=; b=iXH2vdXQZrG9S4qeFRGFO6zPQg
 y4f7OKDoGopTphTPoe8tXxtrL9n3avNoYVmlRin6kAsOD3R6yZRkdTISsSsSqSU5bwf9Oqrd7Bgq9
 NvbJdpii5a7R63REmXDB0b8hCYHRTheACyZ+JWA7DmjywT2lGDlb7FQjgP1fpVvvmujI=;
Received: from mail-wr1-f54.google.com ([209.85.221.54])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l8527-008b9W-2Z
 for kgdb-bugreport@lists.sourceforge.net; Fri, 05 Feb 2021 17:36:48 +0000
Received: by mail-wr1-f54.google.com with SMTP id p15so8542806wrq.8
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 05 Feb 2021 09:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EzButGrSaMS3tpn14dm5oBUBI4ta0YCz3Bh4qddD9Gs=;
 b=UIK8+EM7LIY0MJuZ/VuN3u1aXuD+m68zxN0voPQhmWdmcQKRLSzO3rHZWCZiLj+ifr
 Jg+RyoW/1DpUwU5kx6JLYzyX3eliXyKZeYcDZ2pMZJ3N3OSje6Rajxnrash+2Xh1GoV8
 WxxgiOWtLAkRrb42yugwZtFKJ65MX2NLlqdQwWcXoi/yV6aL+AmRm9aNzfMftOTbG0ni
 ZklrDpDKg7tWySyLqyBmvEh8ZyD4P5UNK/hkicJFbPtmW3mwWlZTnqZM+xSPPcCNXwNb
 9Y2gRGB1o9P7XOuHECT7uyNXXDBpdx/sGpaBDoD55H4SKWwYj8oafTVLPF97J4qcP8jc
 tRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EzButGrSaMS3tpn14dm5oBUBI4ta0YCz3Bh4qddD9Gs=;
 b=nSHrXI6z77OQkXnp67rVm2ruXBHdO7/fariujJoqtyvV/HXjdbOJKzF3vIWN0D/rIH
 JP71tM05AM8WlM9GICXkgRLZxcxFomzFUwbadJwLjELmGpe4bFNsU7qLUoWi154ytt10
 3MqiwEnFV/YFWScBlSRotEPSzcu4y8pw1CwJcCXV5xh/mkycm8YsUmWwtN3WxQzlDVPN
 wX6mo49AbnEeU1CZyA+VtldBB+OgzAe4e/zpEmYqI85qQOITjIfJrq348KSal0SWVhwI
 6/vV6mVaWGUbuCNbgr9142FsicHCcwrM0j3KjZTgejcCDksUxnisevMcFexKw54FSGLH
 vvEw==
X-Gm-Message-State: AOAM530gpwAFJOWPT56gImzo2eewjiiTl9/Jw0jwZg6r/wFWM5ENrfkG
 hRSuo5SSso1TRm2Xij632cjClg==
X-Google-Smtp-Source: ABdhPJyG7XhS1wHSPAts0Ct8q6WV441NG908t3VfX5NGswdhqV7wB2Jyj1JI8Q6QB+egPd5MzO3eFg==
X-Received: by 2002:adf:b749:: with SMTP id n9mr6100347wre.267.1612546592701; 
 Fri, 05 Feb 2021 09:36:32 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id r17sm12875145wro.46.2021.02.05.09.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:36:29 -0800 (PST)
Date: Fri, 5 Feb 2021 17:36:27 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20210205173627.guzsj4lfczimvp6d@maple.lan>
References: <1612433660-32661-1-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1612433660-32661-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.54 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.54 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l8527-008b9W-2Z
Subject: Re: [Kgdb-bugreport] [PATCH v2] kdb: Refactor env variables get/set
 code
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

On Thu, Feb 04, 2021 at 03:44:20PM +0530, Sumit Garg wrote:
> @@ -318,6 +318,65 @@ int kdbgetintenv(const char *match, int *value)
>  }
>  
>  /*
> + * kdb_setenv() - Alter an existing environment variable or create a new one.
> + * @var: Name of the variable
> + * @val: Value of the variable
> + *
> + * Return: Zero on success, a kdb diagnostic on failure.
> + */
> +static int kdb_setenv(const char *var, const char *val)
> +{
> +	int i;
> +	char *ep;
> +	size_t varlen, vallen;
> +
> +	varlen = strlen(var);
> +	vallen = strlen(val);
> +	ep = kdballocenv(varlen + vallen + 2);
> +	if (ep == (char *)0)
> +		return KDB_ENVBUFFULL;
> +
> +	sprintf(ep, "%s=%s", var, val);
> +
> +	ep[varlen+vallen+1] = '\0';

What is this line for? It looks pointless to me.

I know it's copied from the original code but it doesn't look like the
sort of code you should want your name to appear next to in a git blame
;-) .


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
