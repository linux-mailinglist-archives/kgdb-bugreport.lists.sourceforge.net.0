Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CDF30F630
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  4 Feb 2021 16:26:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l7gWn-0007rW-DZ
	for lists+kgdb-bugreport@lfdr.de; Thu, 04 Feb 2021 15:26:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1l7gWk-0007qi-Ik
 for kgdb-bugreport@lists.sourceforge.net; Thu, 04 Feb 2021 15:26:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6rHTIXNhBUEIcxhLkeKp0zwA6qrd3f0bS7vW658gGlk=; b=GChHp9F72Q8G5G743ZE07J8fmI
 3FrKU41P1fdyrPdRg2wxmnLOxsaWcOnfLYM37D/DVp0U/CKf7dE7TBQvjPTghDV2WwYA5AJ1aAcec
 UScElMC9cBd18LG81po4AsSjzanJrQ03EHZ9QboFiRiWk9v37qkz0L79YL2RvdUyBTwE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6rHTIXNhBUEIcxhLkeKp0zwA6qrd3f0bS7vW658gGlk=; b=WUpB764eqJaCCaSdZIWXSxNnVs
 2+CpXRsnWUY9D+e8ZSv1JewCnbhY1Na5PsKku7V8mHCRSkbEeKTvCPe9TKv5brUC4sie+A2xxY2vH
 apltHiPX8vMb7WehAF0w4Lya7at16oVw8qDeZtBS04og4jXT+EMQlehRI912DWKiDsvo=;
Received: from mail-wm1-f43.google.com ([209.85.128.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1l7gWe-0000Zs-Ad
 for kgdb-bugreport@lists.sourceforge.net; Thu, 04 Feb 2021 15:26:38 +0000
Received: by mail-wm1-f43.google.com with SMTP id t142so1311438wmt.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 Feb 2021 07:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6rHTIXNhBUEIcxhLkeKp0zwA6qrd3f0bS7vW658gGlk=;
 b=mPI4dGRxfPDVhVPFx05uX/HD/WJydMFT3pfqXg3kLDpNccdg/QW6OJO1y5hJUoM9/c
 XMnXmjhVa52zZAon5WLaYoXBgqa4VpslK0RdjfxdnFdi4Ly6wm+zpI/zt4b+vK7zfu+V
 BiPz0qLmh7ZdpMHfELspVVYam6DtPYXdx2zsGtaOx6ywrhxQjgRqMPHqSr9xPKfspet/
 vpFCf/XQ+OTmr6M6ilboRKEu9gXnjqzBt6FcL0B5myB9pczkQv4zTMmAM/q048OXwucR
 SLN12sti4+nZ8oQSUk1g480oyhvfafCHgpq0vf+iS7anTOBQ2qpbmJszkaXbnBHNVdw/
 5YNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6rHTIXNhBUEIcxhLkeKp0zwA6qrd3f0bS7vW658gGlk=;
 b=foJ8aATwp5+lfCx5nkK1mBER4Bwh0+42UcNaMZmM+JkesX0FOzXhN8qrBUwCP8HIXr
 +Xt8eTvRoOv/p1hKoqD8qkiojUkg9KUjLwA8B5ToAvgRaCvR6ev7n0+iqdVUzQq1NSG6
 YUAXMGe24FEgC+SVUIDCQCyg18d0HfFInlwSfF7jz2rdzDr41nQAj6NfHlkjAx1F44j8
 b7ZSiTiQZu1UaBIhdZU8VVpS29vQlypKXQcIBNVaz7MZiWb8/DJ28X1/++tbDv9yykxE
 9NODNX2rnBW75oGrLBn/IxHaWBnQIWd8sOdvzag5sdXjbcGwI6DYtcDTsTfamgw9h3XN
 eXYg==
X-Gm-Message-State: AOAM531g9hxRtgXgAGrLOF77BaKVb3dqFk6cZ1le45YOuTiUAHqJ29AN
 jLigyEFNJq2FvDWhngiFDcbO3g==
X-Google-Smtp-Source: ABdhPJyRDvddIeS1/YpBHwwIUziToV1k45g4xx9NofiOb7Hsstu3xrVH4MqxU/Yj85dSMQr2JDK4tg==
X-Received: by 2002:a1c:9a81:: with SMTP id c123mr56642wme.132.1612452385915; 
 Thu, 04 Feb 2021 07:26:25 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id h23sm6700747wmb.41.2021.02.04.07.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 07:26:25 -0800 (PST)
Date: Thu, 4 Feb 2021 15:26:23 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: samirweng1979 <samirweng1979@163.com>
Message-ID: <20210204152623.6vmapcjpddlsnbuw@maple.lan>
References: <20210203081034.9004-1-samirweng1979@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210203081034.9004-1-samirweng1979@163.com>
X-Spam-Score: 1.9 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.43 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: yulong.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.43 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 2.0 PDS_TONAME_EQ_TOLOCAL_SHORT Short body with To: name matches
 everything in local email
X-Headers-End: 1l7gWe-0000Zs-Ad
Subject: Re: [Kgdb-bugreport] [PATCH] kernel: debug: fix typo issue
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
 wengjianfeng <wengjianfeng@yulong.com>, linux-kernel@vger.kernel.org,
 jason.wessel@windriver.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Feb 03, 2021 at 04:10:34PM +0800, samirweng1979 wrote:
> From: wengjianfeng <wengjianfeng@yulong.com>
> 
> change 'regster' to 'register'.
> 
> Signed-off-by: wengjianfeng <wengjianfeng@yulong.com>

Applied. Thanks.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
