Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AC5D2EE7
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 10 Oct 2019 18:51:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iIbfS-0004BP-NK
	for lists+kgdb-bugreport@lfdr.de; Thu, 10 Oct 2019 16:51:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1iIbfR-0004BH-2z
 for kgdb-bugreport@lists.sourceforge.net; Thu, 10 Oct 2019 16:51:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7bu/p1V/jPBVukNh0HzQltOIjl5iBAhuyWFtm99yZ2M=; b=DzTAIuglO6FfZxAonv8vvAqYve
 2wAY7Hn1NupmtKRrVWVkcWeqZb+KKHfLtgaVgoCljdIJ+m2QhySbzVC/3YtmBHwXFdD8qRHUKNl+7
 PSA5JQzUWeajpAdKK3BCrvKF9X36+fAU+LsfXjbiDiQC5K9Cx1tTG2Q8fHGxIImBh40s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7bu/p1V/jPBVukNh0HzQltOIjl5iBAhuyWFtm99yZ2M=; b=aAdsIFGw8ihcya2yFnEyWXYqfi
 kZt8ZxMeWaFLS4OHKPsKiJiOls/YrPZ2upcf7b42rIxUQwSJqcxbrqqTKCpUMJjkm1BNZleTybIcE
 /zoMO8xsKKr/5RqetQWRPtUrNCLQ+22UzQBQLkN9zy2QdOf8au6/uRQOAd+4VY0QnmyY=;
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iIbfL-005F8f-Vn
 for kgdb-bugreport@lists.sourceforge.net; Thu, 10 Oct 2019 16:51:57 +0000
Received: by mail-wr1-f68.google.com with SMTP id v8so8767462wrt.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 10 Oct 2019 09:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7bu/p1V/jPBVukNh0HzQltOIjl5iBAhuyWFtm99yZ2M=;
 b=PTeYKlvjW/Mo8h5FYVG1JpGMdBacSGeS1LH4pBUSwmp5OwJXPe6UwEDxq1ax1LPek8
 9pjVrtmUrmuz1OpOOP4TR7Kb9Qssjw6lwq8y5GorqmLXqAKH4Y2qVaIY2mfTL31YiGn7
 DczwZWj0zyKBsnc/vLKGCSC6UVeXsNO03NDfzW+MlKnpuq3x9PgEsP6+P9NtikqhObqd
 vTH/0umRJUAKt5yh5JsXN8LLFXeOb1xo0Xvf+mxkBuPnddm74mc21EyStWmLcLpFIE7b
 rsE2UJd30z31HZuNXKM6TFecvUF3zkYiNv8XdHwELQRw+flhyLeOI8diV462eevYPqvI
 Vyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7bu/p1V/jPBVukNh0HzQltOIjl5iBAhuyWFtm99yZ2M=;
 b=nqTrX4WaObvh7GkAskGvd5UQX087gjXIaUnThPPmtFQJgqQfBld/BXiQwRYHnUpIRo
 QtDag4Wu1FBP52K1QqwheB+uSA/7lLE0+WknVxnVW/UGQMAq49A1EgBeBSqYhkKNBTaX
 G0dxQfAtzW0iMosxEQuqCY2ZeNHw8jqqFe703cAx2J9/6ccio4OIuEM63IsmpEf27TgO
 ODTAv5xJX9TKmlpUR5G9r+JRrjONxyHPk+lU5grcSe8CYUQa/EndocM8KGEpKK5t3cPw
 dHAe19q7woxtRlh61mh+SNZcpp1/07+ZdnHmKCwcThxOKTgFesBvCjIeK+ff9c1NL8vX
 nL1w==
X-Gm-Message-State: APjAAAUSjjyvgvyr84SIIs8MKHzF6y2DeGgLj+xxpyW/c/Qydqke8CRl
 L+U0+uOaX9/F8//35uMPbm68Jg==
X-Google-Smtp-Source: APXvYqx+JMkN3tC8wFFueYa7ICq4JDkKxjd8DhWTdlw1o8w+B0UKdW2izWlRVtwxrOVVrS4Puqf1tA==
X-Received: by 2002:a05:6000:44:: with SMTP id
 k4mr9905117wrx.121.1570726290338; 
 Thu, 10 Oct 2019 09:51:30 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id a10sm6846042wrm.52.2019.10.10.09.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 09:51:29 -0700 (PDT)
Date: Thu, 10 Oct 2019 17:51:27 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20191010165127.sms6kanpkivda5rp@holly.lan>
References: <20190925200220.157670-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190925200220.157670-1-dianders@chromium.org>
User-Agent: NeoMutt/20180716
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iIbfL-005F8f-Vn
Subject: Re: [Kgdb-bugreport] [PATCH v3 0/4] kdb: Fixes for btc
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, linux-kernel@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Sep 25, 2019 at 01:02:16PM -0700, Douglas Anderson wrote:
> 
> This series has a few kdb fixes for back tracing on CPUs.  The
> previous version[1] had only one patch, but while making v3 I found a
> few cleanups that made sense to break into other pieces.
> 
> As with all things kdb / kgdb, this patch set tries to inch us towards
> a better state of the world but doesn't attempt to solve all known
> problems.
> 
> Please enjoy.
 
Applied.

Note: Given this series alters a very long standing behaviour I've queued
      it for v5.5 rather than add it to a fixes branch. It should land
      in linux-next shortly.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
