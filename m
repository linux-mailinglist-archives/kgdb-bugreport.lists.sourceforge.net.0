Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D15230D944
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  3 Feb 2021 12:56:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l7Glg-0002h5-0j
	for lists+kgdb-bugreport@lfdr.de; Wed, 03 Feb 2021 11:56:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1l7Gle-0002gx-1Q
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Feb 2021 11:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UwWGiG8OEmw7Jkn3+9/+1DRBsZZ6FOChrQTe2byMSDY=; b=ftg7yWqDos1bGLBV3bStm2PwqR
 ClaLtHUZ83dFXMJj34XapARdYVWApFrj5Mmmape2xYgG/0qtcGpH5pZ/V0JjiVrVKePW/t1gUcyDH
 dGvBnbcRjndoMPEWJ4m8KBT28UXlIaNoleXlbjpCfiutd7FgWhNuWYzvHNVjbhWEg7Vw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UwWGiG8OEmw7Jkn3+9/+1DRBsZZ6FOChrQTe2byMSDY=; b=EIbem2wH7JY/NcZQHuConTGr4n
 b2BEgX2E0hn2lItFHlc2oSXvOsBAEBueDLKLdsC4sDRdTIEGiOCxdyVQ8YO+1tI066ht2AaiLgLDW
 q9+nvSRws+BLTwc4uNdae/5sq29QNZL0SZgsh87SD/UACcgH0YB9xikqswRCx5x0D/sk=;
Received: from mail-wr1-f42.google.com ([209.85.221.42])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l7GlP-001NJG-L1
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Feb 2021 11:56:17 +0000
Received: by mail-wr1-f42.google.com with SMTP id 7so23928808wrz.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 03 Feb 2021 03:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UwWGiG8OEmw7Jkn3+9/+1DRBsZZ6FOChrQTe2byMSDY=;
 b=L9PdQMB0oAaOQeOXLQkRWY+ETxgFa5E3dd1NcQ+3WiB5uQ7Yqt21eXifjWe4rp0rey
 7qRRl97PWH9agZFScyUnyYPv9+73ZfxjtoISayWnuqXpz2mQfj+W9Mo7w1i0cT2t3uM2
 lOQ24QXRu6hs+sspcgcdceq4Vntme0oWXaJAk0kZyiAeS2oiE8sDSAiKTgd4EbULASz0
 M+4upoG+3x9bQQyrZVuaGwoV1IY0R2iIJCK2RvyNNbC/Ed6pXPAoYVdC5Co4vE+jFWU5
 ueYeugBhACqA/hLC1a6Uaz4YR/hXnImV91oVwVz1GfHdFkcPnAVNKKluZUw2cQzq9kcD
 MsBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UwWGiG8OEmw7Jkn3+9/+1DRBsZZ6FOChrQTe2byMSDY=;
 b=rMmr6Rw3pm+77dbRvJl2ndixeUh9XF1iCbQyquqgx6Oc3xM/E7KxLtCKnU9SeabSuE
 tDETQKuI4KaDoERNj3xLgHQhfrQvkO6bxpgAkxVZ5k+4NMCSwn2IBBDMvdjjbXZ4Zc3f
 JKJTGQW9o9ErRF38ecDi3GR5S5RRpvBx+J01+MXu7QCZYveF2r/qHjJX4e/2x8U1MfdT
 mqRFzKSyHnr0oZNu7rAkAuhcSv3lRb40PGZrr5hnjcTS5FzlJP8sPjNbe/L9E8FLtCfm
 rcImfr9MJPT+iCIyKgG5qMwHioe0tn0f47LZIbYmMET9CrLcA74x5SBJYFMTIfVoXvKX
 i+sA==
X-Gm-Message-State: AOAM531RcSOsvIfKABpWJhl6BvDGMxBrD7hMuMCQUsITCiMU8YY3Mf4C
 15ghwW945RBxflFfO1V1PdHvdfdn5+Tp3Q==
X-Google-Smtp-Source: ABdhPJzEwxhuazkz3NzzBzi/R6KRxmCnNVVrvZSWSi4VAWNQzji9Z9rqnJnQu4c+BFQya3r0llcA5Q==
X-Received: by 2002:adf:92a6:: with SMTP id 35mr3134158wrn.193.1612353357327; 
 Wed, 03 Feb 2021 03:55:57 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id w4sm3502992wrt.69.2021.02.03.03.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 03:55:56 -0800 (PST)
Date: Wed, 3 Feb 2021 11:55:55 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: wengjianfeng <samirweng1979@163.com>
Message-ID: <20210203115555.amlmxszvfidjic46@maple.lan>
References: <20210203081034.9004-1-samirweng1979@163.com>
 <20210203112359.cdy73gw4wip5cnyn@maple.lan>
 <20210203193609.00007678@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210203193609.00007678@163.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.42 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.42 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l7GlP-001NJG-L1
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

On Wed, Feb 03, 2021 at 07:36:09PM +0800, wengjianfeng wrote:
> On Wed, 3 Feb 2021 11:23:59 +0000
> Daniel Thompson <daniel.thompson@linaro.org> wrote:
> 
> > On Wed, Feb 03, 2021 at 04:10:34PM +0800, samirweng1979 wrote:
> > > From: wengjianfeng <wengjianfeng@yulong.com>
> > > 
> > > change 'regster' to 'register'.
> > > 
> > > Signed-off-by: wengjianfeng <wengjianfeng@yulong.com>
> > 
> > It looks like the Subject line might not be correct for this patch?
> > 
> > Is it really the first time this patch has been circulated or should
> > it have been tagged RESEND or v2?
>
>    The patch was first sent on January 25, but nobody relply me, so I
>    just resend the patch, and the patch is the same as last time,does I
>    need add RESEND tag? thanks.
 
Yes. When resending a patch adding a RESEND is a useful courtesy to let
the maintainer know why they have received two copies of the same patch
(and to make clear that the content is the same).


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
