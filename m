Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 236044D3DEF
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 10 Mar 2022 01:14:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nS6S3-0000Ee-5g
	for lists+kgdb-bugreport@lfdr.de; Thu, 10 Mar 2022 00:14:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <dianders@chromium.org>) id 1nS6S1-0000EX-TH
 for kgdb-bugreport@lists.sourceforge.net; Thu, 10 Mar 2022 00:14:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6YOi63Y4UP1PxQIOJspMhCwWLw9KtU08nAJtSydjZYc=; b=T7/AspNyuxxeHIfvadiEy/tnYR
 tuPVhaX2O6gMvf2Bkgbqk64pxmUUvMIPX2/aOmnb288aMUkdhUaBW9nigbLomf1o+TjZzss0YgPoP
 qaAtBeZ/loVLEKUH7pTzfHBTaDINUyYyDGk1oqru7aAIsngksTtOzx9xYRBIu0pD/mUQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6YOi63Y4UP1PxQIOJspMhCwWLw9KtU08nAJtSydjZYc=; b=ZuLC6/AHG6xPG7mreduZQW2Zny
 5fudvdFFfen/oRkCiv/ZqcIg08YRcf6nCi+rQ3CiNBKDKYjum/ECWvYk/WpkksIwS9y1JMZlq1uwB
 AohgpLte12rjA+1etnPo18Zbub7e6yX562Sca9T3gepMIeRf0dPjD1qXUk+WxCiYd5L0=;
Received: from mail-ej1-f54.google.com ([209.85.218.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nS6Rz-0002NR-5x
 for kgdb-bugreport@lists.sourceforge.net; Thu, 10 Mar 2022 00:14:39 +0000
Received: by mail-ej1-f54.google.com with SMTP id a8so8597767ejc.8
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 09 Mar 2022 16:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6YOi63Y4UP1PxQIOJspMhCwWLw9KtU08nAJtSydjZYc=;
 b=ndLnV1n/Cj/VOOqVdnS1BUd+irOj0yq6+IhyDGRmeUD7EdPsTQEL0tSrZjhbJDKx5v
 HKwiDEpH4dZd1KSzFoOc1+usH/ySFbHje/5+3KfuIxLocRKXPGtD287yO40DXZCx/hJh
 TtDAT0zyBfLi10li350C7mskcVtQIQ6KYd1Is=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6YOi63Y4UP1PxQIOJspMhCwWLw9KtU08nAJtSydjZYc=;
 b=m6/6q4m4brqIdrja5/colNyD4CtEl2RUhzafDj6GEfzVVv58Lv/S2VCzRU8EgBFnka
 21KV2eyBJtGEbss2s1NV0pNCHx4aNV9wvadXtMNTpfSuEsmKytBV/aSMVxhJ+0RVNp4E
 g5xVfnwzmNSSrky9+ujzEcDqwqEx050yf/Xr8IBZ0BF/Aon5b10GxJTbyuJ3k5wN6xcd
 VP9bz/0UklNRM9THaN7jQNj/u22Z78dtIllt/cETBMW5iO8T/0k03rlU+Lxo9R5Holmo
 EY1kNizd+Job3CuizqdXPMCNZuL5KGw3COwtJQP6p9WAscQoFtBfkukaVJ3mv6hROry/
 B2tQ==
X-Gm-Message-State: AOAM532ESv9HlJ7XvfD8vS1ERmadEmfhK38tSkR0DJvOr0TwoxuUVAbp
 t92XPjHYIomSdZ5z+vhYwxrSDJFcBXVBdHnP
X-Google-Smtp-Source: ABdhPJw1CWoIJbXa/Db9M38qMd2vtSvjrv3UzOP0054g0y64J+B9UuEMk5juXcoyxtt94bIQ2f1xgA==
X-Received: by 2002:a17:907:a079:b0:6da:a632:ea89 with SMTP id
 ia25-20020a170907a07900b006daa632ea89mr2036768ejc.404.1646871272065; 
 Wed, 09 Mar 2022 16:14:32 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com.
 [209.85.128.44]) by smtp.gmail.com with ESMTPSA id
 20-20020a17090601d400b006caff964e30sm1270403ejj.19.2022.03.09.16.14.31
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 16:14:31 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id
 p184-20020a1c29c1000000b0037f76d8b484so2413893wmp.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 09 Mar 2022 16:14:31 -0800 (PST)
X-Received: by 2002:a1c:7518:0:b0:37c:7eb:f255 with SMTP id
 o24-20020a1c7518000000b0037c07ebf255mr9408784wmc.29.1646871270537; Wed, 09
 Mar 2022 16:14:30 -0800 (PST)
MIME-Version: 1.0
References: <20220309033018.17936-1-rdunlap@infradead.org>
In-Reply-To: <20220309033018.17936-1-rdunlap@infradead.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 9 Mar 2022 16:14:18 -0800
X-Gmail-Original-Message-ID: <CAD=FV=ViPnSnoSYHSJFvyzkJ+Q+w7JuZFWS7u5BQxN6KHquGyw@mail.gmail.com>
Message-ID: <CAD=FV=ViPnSnoSYHSJFvyzkJ+Q+w7JuZFWS7u5BQxN6KHquGyw@mail.gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Tue, Mar 8,
 2022 at 7:30 PM Randy Dunlap <rdunlap@infradead.org>
 wrote: > > __setup() handlers should return 1 to obsolete_checksetup() in
 > init/main.c to indicate that the boot option has been ha [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.54 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.54 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nS6Rz-0002NR-5x
Subject: Re: [Kgdb-bugreport] [PATCH v2] kgdboc: fix return value of __setup
 handler
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, He Zhe <zhe.he@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, LKML <linux-kernel@vger.kernel.org>,
 Igor Zhbanov <i.zhbanov@omprussia.ru>, linux-serial@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Tue, Mar 8, 2022 at 7:30 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> __setup() handlers should return 1 to obsolete_checksetup() in
> init/main.c to indicate that the boot option has been handled.
> A return of 0 causes the boot option/value to be listed as an Unknown
> kernel parameter and added to init's (limited) environment strings.
> So return 1 from kgdboc_option_setup().
>
> Unknown kernel command line parameters "BOOT_IMAGE=/boot/bzImage-517rc7
>   kgdboc=kbd kgdbts=", will be passed to user space.
>
>  Run /sbin/init as init process
>    with arguments:
>      /sbin/init
>    with environment:
>      HOME=/
>      TERM=linux
>      BOOT_IMAGE=/boot/bzImage-517rc7
>      kgdboc=kbd
>      kgdbts=
>
> Fixes: 1bd54d851f50 ("kgdboc: Passing ekgdboc to command line causes panic")
> Fixes: f2d937f3bf00 ("consoles: polling support, kgdboc")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: Igor Zhbanov <i.zhbanov@omprussia.ru>
> Link: lore.kernel.org/r/64644a2f-4a20-bab3-1e15-3b2cdd0defe3@omprussia.ru
> Cc: He Zhe <zhe.he@windriver.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jiri Slaby <jirislaby@kernel.org>
> Cc: kgdb-bugreport@lists.sourceforge.net
> Cc: Jason Wessel <jason.wessel@windriver.com>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: linux-serial@vger.kernel.org
> ---
> v2- correct Fixes: tag(s) (thanks Doug)
>   - drop Cc: Laura Abbott <labbott@redhat.com> (bouncing)
>   - add a reference to init/main.c::obsolete_checksetup()
>
>  drivers/tty/serial/kgdboc.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
