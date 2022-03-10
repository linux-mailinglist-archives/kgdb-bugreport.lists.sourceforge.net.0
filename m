Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 954574D3DF1
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 10 Mar 2022 01:15:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nS6Sf-00062o-DP
	for lists+kgdb-bugreport@lfdr.de; Thu, 10 Mar 2022 00:15:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <dianders@chromium.org>) id 1nS6Sc-00062i-93
 for kgdb-bugreport@lists.sourceforge.net; Thu, 10 Mar 2022 00:15:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v8fee9v7BiSON1oc+MzdWwD0g3F0XotKEAPqrnbe0Ac=; b=ibIEJ0upuftiqiS8VOcPvY8Kyu
 cOxVhsirXP4tH8AjC/TqsKHTGdt+UJ6hnwh3cNfIScA7UjMahyTRQwFQs4WvH4aUZpaddmAR86g6K
 VwKinB09QH6XtGr+5e+aOw9Nn7H6ycefLz4cVfoemLGf6bx36V47HJhP9RdRCJoN9VeM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=v8fee9v7BiSON1oc+MzdWwD0g3F0XotKEAPqrnbe0Ac=; b=NjYpBuIZbU3hw4J3ywfQLKfisD
 SATAUOFrsgw6CCT8Fmt3mittxzrdrms2FsnwDcShKg2GxXtm3R7qeNga2lTpiqUb8ZrOLYpLbwCKQ
 TKOQOUfcQCNcMJ+4qTnelCqoXSIxU607xTzy/Xg3pPPbEi/xz+03VKoL1posZcdj2GrA=;
Received: from mail-ed1-f54.google.com ([209.85.208.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nS6SZ-0002PM-T5
 for kgdb-bugreport@lists.sourceforge.net; Thu, 10 Mar 2022 00:15:16 +0000
Received: by mail-ed1-f54.google.com with SMTP id c25so2786346edj.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 09 Mar 2022 16:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v8fee9v7BiSON1oc+MzdWwD0g3F0XotKEAPqrnbe0Ac=;
 b=e1M4QVr1W7YbVzbWzm0T3Wq6Klu5l4/VGifbMnJ0ccc/xIImegzdLT28nV2OCw8XKz
 AUQzn9/wrTvwgO7DYiFqQ5VBDg4+Wf60TnJSU+HJFjoK2nbcb5lhn9ilwIOe6HlP9c8O
 GqzBTS1gzJ9X3VY+qIv3lNljaPRKaNIJAGRmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v8fee9v7BiSON1oc+MzdWwD0g3F0XotKEAPqrnbe0Ac=;
 b=nAyqoiKxByVoXkOR6qobqPS6wGBqNswDvcWNTeYkmhdfIF9C+VubHIVZkG2yLtcIXh
 WTN74y09leD8Zi0xDJ4wjkDaCfODD+tNj7s/bQk3xvTSqOAiEJm70KVvBDQ48TPr3k9o
 zEyP+LAsaIkKqimHupSou21fJ+QKGACRlbYfjFy46yks4SjZ/4gvOQ9tBHHME8C3MIvO
 /ADebcyBCZ7KO+5o8OWkllFHKxBJCBwYtN62y3mboaHE7kBYUy90H2RMEMZUFcqpcvHe
 HvS8DzpOYTltwxnVdqqmNQh4KR7gjCwPMcRee1/WHQ+Yei3lnriF2cQe6QbJ9FJC+cL3
 I2XA==
X-Gm-Message-State: AOAM532YbB/XAQdApNC8tVb2gUfSQj74XVh2e/FBM+g3AHN56wNQGcMb
 ATqqrsX2nwVkx2NP+wa3m50iH/yGAP5HBkYi
X-Google-Smtp-Source: ABdhPJyjLqg7voAsqRm2FfkBCXLgL1J/rk0TfbkflnffnaSyH/RoxixhTl6+YSu1hfbEVssmMs8faA==
X-Received: by 2002:aa7:dd17:0:b0:416:320:5e56 with SMTP id
 i23-20020aa7dd17000000b0041603205e56mr1938204edv.240.1646871309160; 
 Wed, 09 Mar 2022 16:15:09 -0800 (PST)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com.
 [209.85.221.48]) by smtp.gmail.com with ESMTPSA id
 r29-20020a50c01d000000b00415fb0dc793sm1357367edb.47.2022.03.09.16.15.08
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 16:15:08 -0800 (PST)
Received: by mail-wr1-f48.google.com with SMTP id u10so5437565wra.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 09 Mar 2022 16:15:08 -0800 (PST)
X-Received: by 2002:adf:e983:0:b0:1f1:f52b:8328 with SMTP id
 h3-20020adfe983000000b001f1f52b8328mr1490215wrm.513.1646871307846; Wed, 09
 Mar 2022 16:15:07 -0800 (PST)
MIME-Version: 1.0
References: <20220308033255.22118-1-rdunlap@infradead.org>
In-Reply-To: <20220308033255.22118-1-rdunlap@infradead.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 9 Mar 2022 16:14:55 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VSAWNnM2-HgS4RxvXz3QgD72gx+Ti7Vpf9k=SLVHzocw@mail.gmail.com>
Message-ID: <CAD=FV=VSAWNnM2-HgS4RxvXz3QgD72gx+Ti7Vpf9k=SLVHzocw@mail.gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Mon, Mar 7,
 2022 at 7:33 PM Randy Dunlap <rdunlap@infradead.org>
 wrote: > > __setup() handlers should return 1 to indicate that the boot option
 > has been handled. A return of 0 causes the boot opt [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.54 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.54 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nS6SZ-0002PM-T5
Subject: Re: [Kgdb-bugreport] [PATCH] kgdbts: fix return value of __setup
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kgdb-bugreport@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>,
 Igor Zhbanov <i.zhbanov@omprussia.ru>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Mon, Mar 7, 2022 at 7:33 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> __setup() handlers should return 1 to indicate that the boot option
> has been handled. A return of 0 causes the boot option/value to be
> listed as an Unknown kernel parameter and added to init's (limited)
> environment strings. So return 1 from kgdbts_option_setup().
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
> Fixes: e8d31c204e36 ("kgdb: add kgdb internal test suite")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: Igor Zhbanov <i.zhbanov@omprussia.ru>
> Link: lore.kernel.org/r/64644a2f-4a20-bab3-1e15-3b2cdd0defe3@omprussia.ru
> Cc: kgdb-bugreport@lists.sourceforge.net
> Cc: Jason Wessel <jason.wessel@windriver.com>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/misc/kgdbts.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
