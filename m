Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D993022B9
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 25 Jan 2021 09:19:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l3x5o-0004GU-6w
	for lists+kgdb-bugreport@lfdr.de; Mon, 25 Jan 2021 08:19:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1l3x5l-0004GM-AC
 for kgdb-bugreport@lists.sourceforge.net; Mon, 25 Jan 2021 08:19:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q600Utn5CHHrIrEp71Q3qYBMngzPu277qVinvis4Thk=; b=E7sqpY2OOga+liZJXVCOUSmbvd
 mLIcMK/gqaLnXFIP/UMc6PJECLYkC1ZjhDac7YcnfXTSaqnJRRZA9Nlp4U0mlFjrpgSgAAV8rVocU
 Ir68y84V9bvcPngiAH1tAO2AdlB9Z2YlXwhcVkAvMjxD6Uqs8FKTMGHgcl0mp0lCg7uw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q600Utn5CHHrIrEp71Q3qYBMngzPu277qVinvis4Thk=; b=B5NylD/5FzM0+bOAvprX446IEl
 95WaJAKFo73PKIWPj7bq5o/ynp/Q1RFUiZnuOZ2QlnvatdUVnUSdBzIjsMbQOhNnLu4KcFsEAHbPn
 nftXVrlO7iajdMGhXCUilusO3/HacVHi5CrZBr41AV8DcX5GvNBcronnPVjvi+pCLbS4=;
Received: from mail-wr1-f54.google.com ([209.85.221.54])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l3x5a-002Cp7-Uz
 for kgdb-bugreport@lists.sourceforge.net; Mon, 25 Jan 2021 08:19:21 +0000
Received: by mail-wr1-f54.google.com with SMTP id h9so1027974wrr.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 25 Jan 2021 00:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Q600Utn5CHHrIrEp71Q3qYBMngzPu277qVinvis4Thk=;
 b=nREyOnY2CVXjIIEvrNx3+72LX7UrbmjuyB7BYUZksPx7CSNK4olcd1+AWp8FLrOoFN
 GHTtm1qdunFTCXQLgY4uq07alzAb3d8otuyYCQZfG2P02YizyyHu6wpMJwRzDI9qkZZP
 vUfWDUdsJZlXRoWGr1LSf51riWezqvxHIFMSOcCJkGeVm7NwcSFBSI7A5/Mv3zjQuVrJ
 9e6wYB9BOdcCFCRlVYB4jCn5vnpV3nWnmHQY3XBKL14gih3DAVuOgD6KGM9Un+pp2/0h
 qLgsQwz090HJYvcp+7bMxXvrdMFsngt/s/LaQRtdEou3kbqLE3RsU5Q0zRjHLc2mBIHy
 XTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q600Utn5CHHrIrEp71Q3qYBMngzPu277qVinvis4Thk=;
 b=CFLvVXY+1Cc81x522vn2nreGHwBzn6PR0oru9sEoonNfbFMKInmeewICUOQOiopSyX
 ZOu8lfLpPn8mB6hjD8uLUkuxVDJMSd9gv03vgao3x0QlzycbP2al+AKuYhf67G9lq0Ur
 Hp0PvjOPqswqKKQ1bt7H7I/dcL8TLRGXH9e8Fy/b3bdsNtY2Pi1McwUT7y9FHImKNRA6
 MvUQGHOuDifcGeVW1s43Rodon9KbkpGiMnA0vq3KsF8QkOdUazLkJ12Agpb0heUO3hjP
 QLmp+PGV18Fkzd4qoBoZwKKC5Mve6qGfj9mp+tXjRGe2pNFLX65cc4IuNPuwkVa/kb7p
 aHnw==
X-Gm-Message-State: AOAM530ayudVCvAnpoJWfH/pCYPCQW83eyUJreTYRsC3eD/WM7RvdNnA
 Eluxm1q6CCthniiwCd/WbDePjQ==
X-Google-Smtp-Source: ABdhPJyQkY+xO02tgsOdElGMDryx1Cc2ynhm51I/0me+mHeenSl+K7hJ5lNV0Ghq0ee1Cqj7JU0tQw==
X-Received: by 2002:a05:6000:1082:: with SMTP id
 y2mr1166660wrw.27.1611562737449; 
 Mon, 25 Jan 2021 00:18:57 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id r10sm19915008wmd.15.2021.01.25.00.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 00:18:56 -0800 (PST)
Date: Mon, 25 Jan 2021 08:18:55 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20210125081855.gfq3n6urcmght3ef@maple.lan>
References: <1611313556-4004-1-git-send-email-sumit.garg@linaro.org>
 <CAD=FV=V8HwhdhpCoiZx4XbTMWug0CAxhsnPR+5V9rB0W7QXFTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=V8HwhdhpCoiZx4XbTMWug0CAxhsnPR+5V9rB0W7QXFTQ@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.54 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.54 listed in list.dnswl.org]
X-Headers-End: 1l3x5a-002Cp7-Uz
Subject: Re: [Kgdb-bugreport] [PATCH v3] kdb: Make memory allocations more
 robust
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
Cc: Jason Wessel <jason.wessel@windriver.com>,
 LKML <linux-kernel@vger.kernel.org>, "# 4.0+" <stable@vger.kernel.org>,
 kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, Jan 22, 2021 at 09:25:44AM -0800, Doug Anderson wrote:
> Hi,
> 
> On Fri, Jan 22, 2021 at 3:06 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > Currently kdb uses in_interrupt() to determine whether its library
> > code has been called from the kgdb trap handler or from a saner calling
> > context such as driver init.  This approach is broken because
> > in_interrupt() alone isn't able to determine kgdb trap handler entry from
> > normal task context. This can happen during normal use of basic features
> > such as breakpoints and can also be trivially reproduced using:
> > echo g > /proc/sysrq-trigger
> 
> I guess an alternative to your patch is to fully eliminate GFP_KDB.
> It always strikes me as a sub-optimal design to choose between
> GFP_ATOMIC and GFP_KERNEL like this.  Presumably others must agree
> because otherwise I'd expect that the overall kernel would have
> something like "GFP_AUTOMATIC"?
> 
> It doesn't feel like it'd be that hard to do something more explicit.
> From a quick glance:
> 
> * I think kdb_defcmd() and kdb_defcmd2() are always called in response
> to a user typing something on the kdb command line.  Those should
> always be GFP_ATOMIC, right?

No. I'm afraid not. The kdb parser is also used to execute
kernel/debug/kdb/kdb_cmds as part of the kdb initialization. This
initialization happens from the init calls rather than from the kgdb
trap handler code.

When I first looked at Sumit's patch I had a similar reaction to you
but, whilst it is clearly it's not impossible to pass flags into the
kdb parser and all its subcommands, I concluded that GFP_KDB is a
better approach.

BTW the reason I insisted on getting rid of the in_atomic() was to make
it clear that GFP_KDB discriminates between exactly two calling contexts
(normal and kgdb trap handler). I was didn't want any hints that imply
GFP_KDB is a (broken) implementation of something like GFP_AUTOMATIC!


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
