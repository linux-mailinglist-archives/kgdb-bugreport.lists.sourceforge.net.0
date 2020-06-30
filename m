Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD19F210011
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  1 Jul 2020 00:32:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jqOno-0006JL-Fy
	for lists+kgdb-bugreport@lfdr.de; Tue, 30 Jun 2020 22:32:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jqOnn-0006JE-If
 for kgdb-bugreport@lists.sourceforge.net; Tue, 30 Jun 2020 22:32:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oX8IEcCQ042Y8Jh028safSbu4eOF6OaEoT6uY1IVW+w=; b=Vv7w3H0xcxHy61RNp1psRjx2NR
 gnfklcE5KEUzC4OaOyj7iEDlS1bWc07Ymcj9xrEOlpS+D1+IB/wdYEZLdHaiz2/cOJ1/tmK0qUgPy
 V9tZcaIeD3aZkKacjGnkXv+wE4reZdX0rtk/PpCH7aWwYz4Yl7ev29bQyLsJrLuxNSVw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oX8IEcCQ042Y8Jh028safSbu4eOF6OaEoT6uY1IVW+w=; b=U2XUoeQ0yZXTOTwW1DoGCgRbyL
 AKuDWVsNDvUtZCC1uEsf68oIQZdGZKb9/dcCCbG61YNqjx20iuE3bd+fojl+37zG/WdtpCA9+PPfT
 ZWJEHRvn5EITH/eVMtC7I6xFxoNesO2yQfaUT1dRb60+am5nwo3qUH8eSXtWPIQPu2zw=;
Received: from mail-ua1-f66.google.com ([209.85.222.66])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jqOnm-006W7w-8A
 for kgdb-bugreport@lists.sourceforge.net; Tue, 30 Jun 2020 22:32:31 +0000
Received: by mail-ua1-f66.google.com with SMTP id g14so7040042ual.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 30 Jun 2020 15:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oX8IEcCQ042Y8Jh028safSbu4eOF6OaEoT6uY1IVW+w=;
 b=EHpAeSv7pNUbvTVcX9DVF1wwyqwBTF9dIfFVsfzDuxUAJ4guzmbP2dnLrvSho6kywo
 N+YgkqHOlOEaM9Zg8LI1vN5A0tm+d8HB9Pa6TVCDMfvb561Rm1MLkCBYyd2Hkm9RuSly
 wFpg/m1xHweCeYTfTDUTpRuuRWWAB2GYlv0kw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oX8IEcCQ042Y8Jh028safSbu4eOF6OaEoT6uY1IVW+w=;
 b=EoV1qsHjQ2CE0Cpkt+Zb0Xzyq8fe/oOjeMcHM3hcslBVWwUm8M5CpK+9k7zUF0i1V4
 /wpZpulVDDCnMqt44hfN4sb/hN6TpFjDLl6rSwjyh4pqFlTvLKOxtyQ5dtkAiD6UxIEo
 aUWzW6N/CesqT0JxNO0oQFAoYg6lTEPbnX4X97kBBRU5cdDJNKFr0MfOkCCy9Ts3FZEV
 my9W2ikI+X++2hJsyPznWxBpSzG/1O2uuGoNAIEMkb1A8DFO0BpahpnKULdd2dIS/Dt4
 NSf0Zfh9PKpNGklMU/BX1+mdPtQSkLmWghXZ+SN3kF4F2tAVIxK16lZKEBu5CoiK/dix
 xzLA==
X-Gm-Message-State: AOAM530YHp6QkgjY7xWWIi5gRTEUhKDBWjHJD7G0poRwoVcymwjuUAYR
 G86drQJOoVVdnyB+hB7YRNjExC65nN0=
X-Google-Smtp-Source: ABdhPJzxYFMMf4B9bZAU0hzNZJxc71iPoikrvEUx5jXqDyg4nfG8HeijYoexvj2ZVkFa7ayoIdZ2lA==
X-Received: by 2002:ab0:5cd7:: with SMTP id z23mr16814272uaf.137.1593556343850; 
 Tue, 30 Jun 2020 15:32:23 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com.
 [209.85.222.50])
 by smtp.gmail.com with ESMTPSA id v5sm638180vkg.30.2020.06.30.15.32.23
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2020 15:32:23 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id c7so5581217uap.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 30 Jun 2020 15:32:23 -0700 (PDT)
X-Received: by 2002:ab0:2408:: with SMTP id f8mr8448016uan.91.1593556342676;
 Tue, 30 Jun 2020 15:32:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAFA6WYNpCG2xPERd=NeKf+EthbX+1R4iieOL52kWnBp8y_+Nbw@mail.gmail.com>
 <20200630082922.28672-1-cengiz@kernel.wtf>
In-Reply-To: <20200630082922.28672-1-cengiz@kernel.wtf>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 30 Jun 2020 15:32:11 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XbMfwAQ+M7oMksd0dv9xjkQrGhU8hVNahn7+vxTuhT6A@mail.gmail.com>
Message-ID: <CAD=FV=XbMfwAQ+M7oMksd0dv9xjkQrGhU8hVNahn7+vxTuhT6A@mail.gmail.com>
To: Cengiz Can <cengiz@kernel.wtf>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.66 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jqOnm-006W7w-8A
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Petr Mladek <pmladek@suse.com>, kgdb-bugreport@lists.sourceforge.net,
 LKML <linux-kernel@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Tue, Jun 30, 2020 at 1:30 AM Cengiz Can <cengiz@kernel.wtf> wrote:
>
> `kdb_msg_write` operates on a global `struct kgdb_io *` called
> `dbg_io_ops`.
>
> It's initialized in `debug_core.c` and checked throughout the debug
> flow.
>
> There's a null check in `kdb_msg_write` which triggers static analyzers
> and gives the (almost entirely wrong) impression that it can be null.
>
> Coverity scanner caught this as CID 1465042.
>
> I have removed the unnecessary null check and eliminated false-positive
> forward null dereference warning.
>
> Signed-off-by: Cengiz Can <cengiz@kernel.wtf>
> ---
>  kernel/debug/kdb/kdb_io.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
