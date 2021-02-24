Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 669CC3241B0
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 24 Feb 2021 17:17:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lEwqc-0003Qp-IH
	for lists+kgdb-bugreport@lfdr.de; Wed, 24 Feb 2021 16:17:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1lEwqb-0003Qh-8i
 for kgdb-bugreport@lists.sourceforge.net; Wed, 24 Feb 2021 16:17:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rz5RhReura4CcmI0uFLwnF+N34P1WN0iecznbdW2HMo=; b=CWmUr1KzaZ0teNUQblFZuD/csU
 LgxJVeIKSNRSECQ7b0R/cqSYhzKh7iFHCH7BgtncwghwNTsOIlu+GJcWpg0T0Y2TPbL6y016EPIVC
 FtYUOCYJVkLZfBTcZ70dopUYes8gDUb30hGrN06tjaXDztIkLEvPBHmZcvTndYbi04VE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rz5RhReura4CcmI0uFLwnF+N34P1WN0iecznbdW2HMo=; b=RkB1yLJOMq528xrXLU2h2ezAYB
 kLFQxpiqu9DWQxqH+WLlJoVAsJ1dpgLqSZNjT/EsNB4H1h6yq7TBxOmQVVfPpYam23/JFI7aTGTpY
 4g7cF/fN6pWyz3mtWpU2sqQIoDPhFvicbVLMmYdwjRf8E7hHq4HS47of/9orMPXacdMY=;
Received: from mail-qt1-f173.google.com ([209.85.160.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lEwqX-0007h6-PT
 for kgdb-bugreport@lists.sourceforge.net; Wed, 24 Feb 2021 16:17:08 +0000
Received: by mail-qt1-f173.google.com with SMTP id l25so1815146qtr.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 24 Feb 2021 08:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rz5RhReura4CcmI0uFLwnF+N34P1WN0iecznbdW2HMo=;
 b=WGpCLLl1ryOZCXK7onehQGkJAtjJs4oZKyW1YuWcgRF2Q7W9IjAwCznxRg+15u34yd
 uvaIvvA0+SoA1hh6NYTBY8W1ne/UgkPZLFf3yoruB7CXPwRpzEQ9YQB9AoqKRMUFUSBs
 vkhZGtFlIqP2/DeUrRlB2BtzcyQwdIj5wRsd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rz5RhReura4CcmI0uFLwnF+N34P1WN0iecznbdW2HMo=;
 b=Rw70aDar6dhSgBI8ScrEuXFV5JUUgzRA0HyClsCjvFHyLphcmkt20kwcEVWPVGcaAg
 gq9rUaAHOdMmnLWlTzCig+c82UkNZxHA33u4A5iLO1zQ/1Wg2g4nb8D4HwDYcfwK7Gqd
 MgiAeytMC69PgSOfy7QUIdTJ+S0YqmMLUwUwGyGDcxV2ny1QuFmJyKSUn1F0cbl0oFaS
 g9WVYjpDS8Vd1DmudjrLzvpT4OPcVZB6cHUBvRjST8CR3rYCddDPqhdmNvpyTl6ZPy7y
 W/4d5mUU9dD4kgUkmkuIkaxqrBCgl0y4nSbJYlnTBhZkw8reiT/Qp3SaUZEi8sQl/24S
 kfjw==
X-Gm-Message-State: AOAM531tj7kwX2SnWqRRckTLFwuopfEnlxYW+BBNlJjVr5wKNBXNSFh9
 vjF2fI3NK9iuP+dBDW7cjuO4fcekObeOVg==
X-Google-Smtp-Source: ABdhPJyqV6mpxVFjhVYmwW0uTP/mxPzJsI5YhRRU0DFrDtj0ZS4QFlZ0/MtBmTcTRKbwjWKoxSNI4w==
X-Received: by 2002:ac8:6b9a:: with SMTP id z26mr16438158qts.312.1614183419833; 
 Wed, 24 Feb 2021 08:16:59 -0800 (PST)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174])
 by smtp.gmail.com with ESMTPSA id v12sm1567775qtw.73.2021.02.24.08.16.59
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 08:16:59 -0800 (PST)
Received: by mail-yb1-f174.google.com with SMTP id u75so2351540ybi.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 24 Feb 2021 08:16:59 -0800 (PST)
X-Received: by 2002:a25:4e83:: with SMTP id
 c125mr17357577ybb.343.1614183418740; 
 Wed, 24 Feb 2021 08:16:58 -0800 (PST)
MIME-Version: 1.0
References: <20210224071653.409150-1-sumit.garg@linaro.org>
In-Reply-To: <20210224071653.409150-1-sumit.garg@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 24 Feb 2021 08:16:46 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VZr=fEr9O6eKVs7T1DH_ptMM2=8rH9fVN+=uDQpwFtrA@mail.gmail.com>
Message-ID: <CAD=FV=VZr=fEr9O6eKVs7T1DH_ptMM2=8rH9fVN+=uDQpwFtrA@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.160.173 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.173 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lEwqX-0007h6-PT
Subject: Re: [Kgdb-bugreport] [PATCH v2] kdb: Remove redundant function
 definitions/prototypes
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
 LKML <linux-kernel@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Tue, Feb 23, 2021 at 11:17 PM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> Cleanup kdb code to get rid of unused function definitions/prototypes.
>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>
> Changes in v2:
> - Keep kdbgetu64arg() the way it was.
>
>  kernel/debug/kdb/kdb_private.h |  2 --
>  kernel/debug/kdb/kdb_support.c | 18 ------------------
>  2 files changed, 20 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
