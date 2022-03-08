Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AB64D1CE1
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  8 Mar 2022 17:12:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nRcRn-0004Oi-Oq
	for lists+kgdb-bugreport@lfdr.de; Tue, 08 Mar 2022 16:12:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <dianders@chromium.org>) id 1nRcRl-0004Ob-Rm
 for kgdb-bugreport@lists.sourceforge.net; Tue, 08 Mar 2022 16:12:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wPdkQphM15Eo5SdM94J/CTEkuLTXrgrE/iujWZfOFDM=; b=daLha16BnEOcIYRdMNGtFK3R1t
 Y9C5B0BfhNoyJ1LtsIKHM9qO1TzU+beuBFj4l4zAK46mHnybykWNhYG2g7XaJJL8ldVAbeRg1la2J
 4/GzJWRob1Q83xD1ZlxdsQ/1aGYjLG0gzXUHyNFD7WEr7z7os7xkRTHMnrkbgPlLk/zg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wPdkQphM15Eo5SdM94J/CTEkuLTXrgrE/iujWZfOFDM=; b=Rq+ryid9+YO8CLvY1/1/K2B+/e
 tQQmzAT2OpSI35K1RTYhDYODrnQiVWwZ8SmWy7LgGFWW9604I8adYoZXG8ridDwwAGsXKWtuz3ho3
 fsIJmLv4mb50XPfY6REr9SC6dK3p2rrlgz4w2xaewOo8hRMpwETTsym692iKGwJwcPJI=;
Received: from mail-lf1-f44.google.com ([209.85.167.44])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nRcRj-008l6l-RP
 for kgdb-bugreport@lists.sourceforge.net; Tue, 08 Mar 2022 16:12:24 +0000
Received: by mail-lf1-f44.google.com with SMTP id w7so19429471lfd.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 08 Mar 2022 08:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wPdkQphM15Eo5SdM94J/CTEkuLTXrgrE/iujWZfOFDM=;
 b=aEkBiyYVtzRXNJrAwcqq5Cwk5JilhiTWgJi0SCpBkYO4Fiat+SModSUH3HKB3MwIVt
 M4do+kkcYvc+Hi/On7MZ173vl9tapETKN5+r8i8Q1TTXLM8AxNSBVbDLs1z4eeGhOmfB
 wWL4ES7pxhENQhDd4uNDCD8b/YcftTftn6DYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wPdkQphM15Eo5SdM94J/CTEkuLTXrgrE/iujWZfOFDM=;
 b=J0XKJglAlX7LIkq5Vuot6eFJGSIqLJ7kABxycgvgNB344PsVCBZOzQsYdq/3OruOYN
 9xqNCDqkpP+c6Vo3+mPCmDFighr60yAGSW4ZuKjk9f9vfsqfz986Df1CcIXlDu+OJ7NO
 xYVXO6xMPTykunbLQPt9bctmx6K5zH0WyGSpnol2K5bsNnTyF8zEgWLjrXeLTZz/72+K
 v6h2zdvddyjGOeyU8+3PKD314CojPNVbOZl4uQZV7ye6lJwY7lYDBv7nRv4kAmXcFpTn
 pGhbgDQc+hIHHPYnIZTnIQEDU4VwoRHACMhtKxEwfnpIFOC06KvcjGts9sI8ShEo8twn
 4maQ==
X-Gm-Message-State: AOAM532XPUE+ABGkHGz2EeK62sW9VZaWlfcZeIzKdZ7ObcrZwBId7MTV
 nF5zNKaY3uWecgODCPLO+R3Uz8iUAZ5YT5xY
X-Google-Smtp-Source: ABdhPJxrr5X0rbLRwcp2owQFW1RHr8P+y1WFcwsVh6SeervTVSodrtBZU/jzGAnw5Ww6VnkVe+SdEQ==
X-Received: by 2002:aa7:cac8:0:b0:410:cc6c:6512 with SMTP id
 l8-20020aa7cac8000000b00410cc6c6512mr16996798edt.408.1646755477855; 
 Tue, 08 Mar 2022 08:04:37 -0800 (PST)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com.
 [209.85.221.54]) by smtp.gmail.com with ESMTPSA id
 k19-20020a1709062a5300b006c75a94c587sm6131889eje.65.2022.03.08.08.04.36
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 08:04:36 -0800 (PST)
Received: by mail-wr1-f54.google.com with SMTP id q14so13743128wrc.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 08 Mar 2022 08:04:36 -0800 (PST)
X-Received: by 2002:a5d:490f:0:b0:1f0:6791:a215 with SMTP id
 x15-20020a5d490f000000b001f06791a215mr13078257wrq.422.1646755475774; Tue, 08
 Mar 2022 08:04:35 -0800 (PST)
MIME-Version: 1.0
References: <20220308033241.22099-1-rdunlap@infradead.org>
In-Reply-To: <20220308033241.22099-1-rdunlap@infradead.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 8 Mar 2022 08:04:23 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W90Hd-baPzurraEaDUGNOCxb8FLUysHKOQg2frMuZRAQ@mail.gmail.com>
Message-ID: <CAD=FV=W90Hd-baPzurraEaDUGNOCxb8FLUysHKOQg2frMuZRAQ@mail.gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Mon, Mar 7,
 2022 at 7:32 PM Randy Dunlap <rdunlap@infradead.org>
 wrote: > > __setup() handlers should return 1 to indicate that the boot option
 > has been handled. A return of 0 causes the boot opt [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.44 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.44 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nRcRj-008l6l-RP
Subject: Re: [Kgdb-bugreport] [PATCH] kgdboc: fix return value of __setup
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, LKML <linux-kernel@vger.kernel.org>,
 Igor Zhbanov <i.zhbanov@omprussia.ru>, linux-serial@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Laura Abbott <labbott@redhat.com>, Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Mon, Mar 7, 2022 at 7:32 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> __setup() handlers should return 1 to indicate that the boot option
> has been handled. A return of 0 causes the boot option/value to be
> listed as an Unknown kernel parameter and added to init's (limited)
> environment strings. So return 1 from kgdboc_option_setup().

This took me about 20 minutes to trace through the code to confirm,
but it appears you're correct. It's pretty twisted that early_param()
and __setup(), both of which add things to the same list, work exactly
opposite here. :( Any chance I could convince you to:

1. Add a comment before the definition of __setup_param() explaining
that 0 means error and 1 means no error. There's a comment next to
early_param() that _implies_ that setup is the opposite(), but it'd be
nice to see documentation of __setup(). I know __setup() is supposed
to be "only for core code", but still seems like we could document it.

2. Add something to your commit message helping someone find the place
where the return value is checked. Basically just mention
obsolete_checksetup() to give people a hint.


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
> Fixes: 1cd25cbb2fed ("kgdboc: Fix warning with module build")

Are you certain about this "Fixes" line? That commit was just code
motion to move the code inside the #ifdef. It sure looks like it was
broken even before this.


> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: Igor Zhbanov <i.zhbanov@omprussia.ru>
> Link: lore.kernel.org/r/64644a2f-4a20-bab3-1e15-3b2cdd0defe3@omprussia.ru
> Cc: Laura Abbott <labbott@redhat.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jiri Slaby <jirislaby@kernel.org>
> Cc: kgdb-bugreport@lists.sourceforge.net
> Cc: Jason Wessel <jason.wessel@windriver.com>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: linux-serial@vger.kernel.org
> ---
>  drivers/tty/serial/kgdboc.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> --- lnx-517-rc7.orig/drivers/tty/serial/kgdboc.c
> +++ lnx-517-rc7/drivers/tty/serial/kgdboc.c
> @@ -403,16 +403,16 @@ static int kgdboc_option_setup(char *opt
>  {
>         if (!opt) {
>                 pr_err("config string not provided\n");
> -               return -EINVAL;
> +               return 1;

Shouldn't it return 0 in the error cases? If __setup() functions are
supposed to return "1" no matter what then what was the purpose of
having a return value in the first place?


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
