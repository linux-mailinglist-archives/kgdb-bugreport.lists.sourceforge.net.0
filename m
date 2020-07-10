Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAB721B6B7
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 10 Jul 2020 15:41:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jttHq-0002Hl-0P
	for lists+kgdb-bugreport@lfdr.de; Fri, 10 Jul 2020 13:41:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jttHo-0002HC-Ph
 for kgdb-bugreport@lists.sourceforge.net; Fri, 10 Jul 2020 13:41:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e/ZA0Mv8NdkQdP738drSY8vNZ7QUvkBua0yy5iWDaA8=; b=Dn+Jd0qu4NMk+wYBBUySYdVdGF
 gZGR6paKo9SgQq5d1gFUn8EYs7gqhkooKx/HJO8tkv5DSGsAzm9ZDfLXbJV+XFeiJFfVB1D9seElh
 F6sTJeyEP9mo/7IWSJhIAJvoQ3S1ZmSaAcgEEKZ1d00nNnQJOJoQRbsPZemIu7nE74WU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e/ZA0Mv8NdkQdP738drSY8vNZ7QUvkBua0yy5iWDaA8=; b=QemRv6VVesLJjFppC3p+swDJ1o
 6fM9jRGH03OCSFNjBlo+bREGt0u25DulZCduxmk3XksedcvDj/ljG88/77VPVBQNCQHCOH/PBULX3
 3/rxMNEAfdWPlK0Xtt1kA7lrsORcKz8PaB9Mmz2vETBx6TCBf9ZKiT6qPwusLdkawogA=;
Received: from mail-wm1-f65.google.com ([209.85.128.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jttHn-00DCks-9C
 for kgdb-bugreport@lists.sourceforge.net; Fri, 10 Jul 2020 13:41:56 +0000
Received: by mail-wm1-f65.google.com with SMTP id w3so5958652wmi.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 10 Jul 2020 06:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=e/ZA0Mv8NdkQdP738drSY8vNZ7QUvkBua0yy5iWDaA8=;
 b=vuz2JZoJqFAW0+FjDz7LUDip+uu6EGgOtzTmR+2TUNwxSBMoB5XOpkxEnyrbPCj8qJ
 q8pj+Yv3r4zZhyrfWdfqUbeH/VzNh9/007rxkOntOqXFdlERnU2NFzV+5s8GgkDIglkv
 xVww0jfxdL3XLqjigWsKEuh+gRSVc6WTFo5zwgGhyDvRTLvNohS/cfmBku4m4Yx6C7Ot
 Kk169VbdkV8RpOt7kEixxTcduLOTXvVVz63q9Mi65X6gIYQl2x8jzQm9xG5+3getfZMh
 xt4saUboqABXxU1aUPw2ijTAfoolymk+/WW2dAlpFmEnU0ZswXWRwnDwOyJouXp18mqk
 HLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=e/ZA0Mv8NdkQdP738drSY8vNZ7QUvkBua0yy5iWDaA8=;
 b=LfK4F8LIRXTk8oB2XJv2SEn2UEKUjadqgUpeZZ2KpmjCWgZcIkQRfnyKkWuAq2XwBK
 aJ+eAo4Zx1QvKiiiBU4VlbtzeYaE7cTBbv6pGgW9JwjpT+BhPrBTb/LspKF+6MKY6yoD
 JyzZlxPIuGhMuHm0buXEh71MfdBMqAYTCqwEnDVLdCWC6WzyrCGWStJvFFdfq1ehfFx6
 rVjyt8RPLD/f4XA5/sM8N7x7OUtiEh31LPInEoX5ZXWxD1w4DYpWvnL6Bcivyrf7yMHC
 EFxMoBSfgeyZzIQL0vyYhFF9zsxaFE+YQ6hqM9F07E7VQ30zpJASBySvPmXBbh3ZhMto
 ht8w==
X-Gm-Message-State: AOAM5305NeeKsP3tQAR5Y2+eUbxTzps/cDas0DjUVCCX55SDcAZtJbFu
 3uE5lUqWeBBd2afOlm7xxU2j+vAly2Cxow==
X-Google-Smtp-Source: ABdhPJy7mN8DlGdbaVh/uhawD0B97hOHCbVHTpQzoL9nDsGzKMxgMryaSi16uOFHKGvedQnIuww9XA==
X-Received: by 2002:a7b:cc91:: with SMTP id p17mr5556402wma.90.1594388508960; 
 Fri, 10 Jul 2020 06:41:48 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id b62sm9386006wmh.38.2020.07.10.06.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 06:41:48 -0700 (PDT)
Date: Fri, 10 Jul 2020 14:41:46 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Cengiz Can <cengiz@kernel.wtf>
Message-ID: <20200710134146.xk6je7ttp7ksmhj3@holly.lan>
References: <CAFA6WYNpCG2xPERd=NeKf+EthbX+1R4iieOL52kWnBp8y_+Nbw@mail.gmail.com>
 <20200630082922.28672-1-cengiz@kernel.wtf>
 <CAD=FV=XbMfwAQ+M7oMksd0dv9xjkQrGhU8hVNahn7+vxTuhT6A@mail.gmail.com>
 <4b91d92eda95cf4f1e153544ff4c17e1@kernel.wtf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4b91d92eda95cf4f1e153544ff4c17e1@kernel.wtf>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jttHn-00DCks-9C
Subject: Re: [Kgdb-bugreport] [PATCH v3] kdb: remove unnecessary null check
 of dbg_io_ops
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
Cc: kgdb-bugreport@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, Jul 10, 2020 at 03:15:55PM +0300, Cengiz Can wrote:
> Hello Daniel,
> 
> On 2020-07-01 01:32, Doug Anderson wrote:
> > 
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > Tested-by: Douglas Anderson <dianders@chromium.org>
> 
> Wanted to ask about the status of this proposed patch.
> 
> I have checked your tree in git.kernel.org but you might be
> collecting them somewhere else perhaps.

It's applied... but then holiday happened. Should be pushed out soon.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
