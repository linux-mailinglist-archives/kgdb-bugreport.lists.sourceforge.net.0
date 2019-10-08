Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A172D0357
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  9 Oct 2019 00:20:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iHxqg-0004Uw-2E
	for lists+kgdb-bugreport@lfdr.de; Tue, 08 Oct 2019 22:20:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1iHxqe-0004Uk-2v
 for kgdb-bugreport@lists.sourceforge.net; Tue, 08 Oct 2019 22:20:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dVXX+jePG0dCtUJvg0DDOB9y84J6FIyWcr2vDL3JBhU=; b=JYKyMT10uhDxwpTyKHS/hnPGGW
 sGKSs04EdwrX3RPgEA5hUCSczBc7osAGy36zPZk4AZsFb3qmLPWHnNsh2eDquWWuzJusTTIhUCgIV
 8cuOPcg3BaJznLpn63ow8FHRZKKMoKp0pWDdMHmN+8Lx8OrtTgd1iBROqNRlD29tCmgU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dVXX+jePG0dCtUJvg0DDOB9y84J6FIyWcr2vDL3JBhU=; b=kte0Qd+xmrSHuRuakH0DJDs7Jb
 2ZjOK1I55TqUTCqYJCg65m+tIhHHbqcxG9e4/V+TtOoEPhcJjcMOpj6G9LDqURTkBUr33WvGXzjKN
 jgI1kWt2TXCWG3eiEE3BYY/bpn3owHUcDKACvzo5JPdpp9Nc3rLobx4yiHLPYlIvQvNk=;
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iHxqc-003NEZ-J5
 for kgdb-bugreport@lists.sourceforge.net; Tue, 08 Oct 2019 22:20:52 +0000
Received: by mail-io1-f66.google.com with SMTP id b19so551679iob.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 08 Oct 2019 15:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dVXX+jePG0dCtUJvg0DDOB9y84J6FIyWcr2vDL3JBhU=;
 b=SJySUhGxbmn/z4rxv9EcvoyuY58UMbJjjlI5IXJep3N8nUl1az6BoWji8k9FAnv7zJ
 +OaYKJbhRu6oKs8uY3BrrxiBNL7ZdmsvdsbnsL1LdCYyjv+Dsxe9dQOFGjA7RXWsNFv9
 bKVRXreg1AVstVtJPPVC5ZYOuFp6Z7eQ6C6cA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dVXX+jePG0dCtUJvg0DDOB9y84J6FIyWcr2vDL3JBhU=;
 b=aScMhEMswL65rodi0EWpfP9W1UCpJr4+pHNvUumdHdS27q3SIM0FwDAUpG030KCwAq
 cTDFryt9MdrKo2xDuv/BFS7dZcFlUYmETSMOdRBB71JBeD/KH4cxVM/tixnhOdtFS32B
 JxvxmpOaOeRjAf7xkA/lYeIIZngjAq+7X+wQ8O1chjL5zYKbM26fbIk92WX3wU+UabWT
 WD2n0d4Z0kzHP8yizJOSgDU5qRT+aMry1vd89u1OMD0yiiJ2HBjsi5FoPRaImrV4wguF
 CUUv8bA415I00TCq2kxK+ynb3Hox4JzmbK5diuexrvqWcu8QMECwzdx2n1MsViffjrTk
 Ro8A==
X-Gm-Message-State: APjAAAWaOn8pv1w+fcwJUVviSc8h6RT08+LOgQOBMzjB5ILnhHYKdFRd
 Gs3fxRLbRvwrl7x8KvfdsrNCoajKVNA=
X-Google-Smtp-Source: APXvYqz57WmYjPsJDrZkWSFD2clhxGIPdX4XNBRPKOuGzPwdZGrOJzRCHzbARCKZrE45HxWQjwR9fw==
X-Received: by 2002:a02:90c7:: with SMTP id c7mr311314jag.12.1570573244384;
 Tue, 08 Oct 2019 15:20:44 -0700 (PDT)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com.
 [209.85.166.41])
 by smtp.gmail.com with ESMTPSA id q77sm194799ill.41.2019.10.08.15.20.43
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2019 15:20:44 -0700 (PDT)
Received: by mail-io1-f41.google.com with SMTP id q1so589901ion.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 08 Oct 2019 15:20:43 -0700 (PDT)
X-Received: by 2002:a92:dcc1:: with SMTP id b1mr733444ilr.168.1570573242957;
 Tue, 08 Oct 2019 15:20:42 -0700 (PDT)
MIME-Version: 1.0
References: <20191008132043.7966-1-daniel.thompson@linaro.org>
 <20191008132043.7966-2-daniel.thompson@linaro.org>
In-Reply-To: <20191008132043.7966-2-daniel.thompson@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 8 Oct 2019 15:20:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WE1Ys4t5Xxic2vSn0zrvJ38fvkQuU5Nws6WXHXo3bQNw@mail.gmail.com>
Message-ID: <CAD=FV=WE1Ys4t5Xxic2vSn0zrvJ38fvkQuU5Nws6WXHXo3bQNw@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iHxqc-003NEZ-J5
Subject: Re: [Kgdb-bugreport] [PATCH v2 1/5] kdb: Tidy up code to handle
 escape sequences
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
> kdb_read_get_key() has extremely complex break/continue control flow
> managed by state variables and is very hard to review or modify. In
> particular the way the escape sequence handling interacts with the
> general control flow is hard to follow. Separate out the escape key
> handling, without changing the control flow. This makes the main body of
> the code easier to review.
>
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  kernel/debug/kdb/kdb_io.c | 127 ++++++++++++++++++++------------------
>  1 file changed, 66 insertions(+), 61 deletions(-)
>
> diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> index 3a5184eb6977..68e2c29f14f5 100644
> --- a/kernel/debug/kdb/kdb_io.c
> +++ b/kernel/debug/kdb/kdb_io.c
> @@ -49,6 +49,63 @@ static int kgdb_transition_check(char *buffer)
>         return 0;
>  }
>
> +/*
> + * kdb_read_handle_escape
> + *
> + * Run a validity check on an accumulated escape sequence.
> + *
> + * Returns -1 if the escape sequence is unwanted, 0 if it is incomplete,
> + * otherwise it returns a mapped key value to pass to the upper layers.
> + */
> +static int kdb_read_handle_escape(char *buf, size_t sz)
> +{
> +       char *lastkey = buf + sz - 1;
> +
> +       switch (sz) {
> +       case 1:
> +               if (*lastkey == '\e')
> +                       return 0;

Technically the "if" here isn't needed, at least not until a later
patch in the series.  The only way we could get here is if *lastkey ==
'\e'...

...but I suppose it's fine to keep it here in preparation for the last patch.

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
