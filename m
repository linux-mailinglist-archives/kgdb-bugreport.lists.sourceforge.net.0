Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E319D0359
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  9 Oct 2019 00:21:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iHxqq-0004Vq-48
	for lists+kgdb-bugreport@lfdr.de; Tue, 08 Oct 2019 22:21:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1iHxqp-0004Vk-6n
 for kgdb-bugreport@lists.sourceforge.net; Tue, 08 Oct 2019 22:21:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3cGhRmXoX7em9EGDCBwQCuo/Mdk5iXwJzsobY+LVqP8=; b=CqkHVbKXTNfzxVHjJLHOnqnxU5
 BtVGhIPfeKJmzikhKEljLxg7VuXUIO1m/xVSUcqPzp64+9yzsab/rMikaAr9rKFqk9gwBUzW46gU5
 +1Nl5sYK+fzRt7tMU27xs4TOLsA5cpj1Q+5pH2/rFkt3lKqjGdkHuFpHHd/wqgAo0GKk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3cGhRmXoX7em9EGDCBwQCuo/Mdk5iXwJzsobY+LVqP8=; b=kfLKD2huO/WvpFpNnAdP/+XxEp
 IekXS0Oup887TZ0i+EoMjxDe8OH884Cr7qYc2MSH7056Qhh2ny9S1YrxkWNdKZJ61iw73ZOkJLSYT
 cUkzi6RTYC5iHuocn+bhLbcgAnADD2wkvkmMleBgJkFETUJCSBp9qjbYoqi1oK0KMhXc=;
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iHxqn-003Ke3-Jn
 for kgdb-bugreport@lists.sourceforge.net; Tue, 08 Oct 2019 22:21:03 +0000
Received: by mail-io1-f68.google.com with SMTP id q10so579792iop.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 08 Oct 2019 15:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3cGhRmXoX7em9EGDCBwQCuo/Mdk5iXwJzsobY+LVqP8=;
 b=U+XLcNgxdPpA0k77YJ8teB2psbrpM6F+e1/FlxKJlocg8hoBUlS7cM7Kb97GD2vnlo
 SSa2gc//2n8lrx+nRGUFCmg7YUSHVTQofxccijZJjuBQaGG9YsB9SjTxbyI2Y1baUwBz
 Ij82NUAvuLWtLt3GU0AlbOym7w4xx5ShwJhI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3cGhRmXoX7em9EGDCBwQCuo/Mdk5iXwJzsobY+LVqP8=;
 b=B84vqrwUNeT89tsUgCFyU2rjyos+sH1hUT2K47SlqW45HOgDRVREivl/X2uv8eE4Ik
 KYmQJ2A/zXLIlaFTUCv4e4Yal95403kh6HoHgtd5xg7fLZ8K9Ek9CJzU+oFgBtQ4L7hw
 8qLJ++x+d9B4qDyHTM/wAwUFSHGA0SEuCaOgrz+oFMzd1JI2Qh+BzbAt9TOFUnunjBxc
 mOC/lAdmm/08lW/HvQ33ivMQn3eGSvcwLczCyGMmonCw1THS50AYVFx6J0XHET7nW3Pv
 mg4GlzY73xFfPP4kxkwGhVrSO4BYC4um8XdgAY3gcFZSk8WxCMNNcN/XdmofIHVauG/S
 adfA==
X-Gm-Message-State: APjAAAUkg6uqiO6E6UZoJRyozFFj3bOKmbGUYVZT4X+bgvCdFX8z9PoU
 kIbL4epC9xVKRGq85xhBYK8lY8TPsiY=
X-Google-Smtp-Source: APXvYqxrXaoaPlHqGIIsczWHQwWFgqAdv204Wp6laIrqNnxsAO6CeVh6btwytoM13NGTf0tRGLxR5g==
X-Received: by 2002:a92:9cc9:: with SMTP id x70mr353814ill.184.1570573255585; 
 Tue, 08 Oct 2019 15:20:55 -0700 (PDT)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com.
 [209.85.166.46])
 by smtp.gmail.com with ESMTPSA id 6sm135037ion.66.2019.10.08.15.20.55
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2019 15:20:55 -0700 (PDT)
Received: by mail-io1-f46.google.com with SMTP id u8so536434iom.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 08 Oct 2019 15:20:55 -0700 (PDT)
X-Received: by 2002:a6b:8a:: with SMTP id 132mr515861ioa.168.1570573254743;
 Tue, 08 Oct 2019 15:20:54 -0700 (PDT)
MIME-Version: 1.0
References: <20191008132043.7966-1-daniel.thompson@linaro.org>
 <20191008132043.7966-3-daniel.thompson@linaro.org>
In-Reply-To: <20191008132043.7966-3-daniel.thompson@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 8 Oct 2019 15:20:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WmznUNO15Bk3hjN9k4irfVM1wAHpo4B8hG5jrnYA_D5g@mail.gmail.com>
Message-ID: <CAD=FV=WmznUNO15Bk3hjN9k4irfVM1wAHpo4B8hG5jrnYA_D5g@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iHxqn-003Ke3-Jn
Subject: Re: [Kgdb-bugreport] [PATCH v2 2/5] kdb: Simplify code to fetch
 characters from console
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
Cc: kgdb-bugreport@lists.sourceforge.net, Patch Tracking <patches@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Tue, Oct 8, 2019 at 6:21 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> Currently kdb_read_get_key() contains complex control flow that, on
> close inspection, turns out to be unnecessary. In particular:
>
> 1. It is impossible to enter the branch conditioned on (escape_delay == 1)
>    except when the loop enters with (escape_delay == 2) allowing us to
>    combine the branches.
>
> 2. Most of the code conditioned on (escape_delay == 2) simply modifies
>    local data and then breaks out of the loop causing the function to
>    return escape_data[0].
>
> 3. Based on #2 there is not actually any need to ever explicitly set
>    escape_delay to 2 because we it is much simpler to directly return
>    escape_data[0] instead.
>
> 4. escape_data[0] is, for all but one exit path, known to be '\e'.
>
> Simplify the code based on these observations.
>
> There is a subtle (and harmless) change of behaviour resulting from this
> simplification: instead of letting the escape timeout after ~1998
> milliseconds we now timeout after ~2000 milliseconds
>
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  kernel/debug/kdb/kdb_io.c | 38 ++++++++++++++------------------------
>  1 file changed, 14 insertions(+), 24 deletions(-)

Looks great.  My only comment is that since this was the 2nd patch in
the series I spent a whole bunch of time deducing all these same
things when reviewing the first patch.  :-P

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
