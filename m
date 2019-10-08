Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 09602D0360
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  9 Oct 2019 00:21:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iHxra-00059f-Qz
	for lists+kgdb-bugreport@lfdr.de; Tue, 08 Oct 2019 22:21:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1iHxrZ-00059M-7H
 for kgdb-bugreport@lists.sourceforge.net; Tue, 08 Oct 2019 22:21:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u4tftPbCrv3Ywdv/Yr7lGlylwby5ziOgn4R8Izjj4JY=; b=fp+q7gWMvn7L1vuJ4eKYUaTOgU
 cj24wZmRFhgZnFYxuehvXmL9MrOJRfuAr/0mwLRl9XXCYvJcNclty9Y21kjlUUDcL5Sg7iVkoeBm/
 XxnAp7ZMmhIQBcGsi8vVMzKw7wPpHmZcJE+Z0d5ak+IKXnrbiKxe/We9PzwUEQMrQabI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u4tftPbCrv3Ywdv/Yr7lGlylwby5ziOgn4R8Izjj4JY=; b=D9LAyfiTbCVbqUh2Jsv6HGtT4m
 hgclf7UguQGkZUbqaFFpRcPYoJCWccciylWlQHZkD+YD4s7ofkjGy0YH7m1Vhouy3ypjVeoQpYRjw
 H8g3pYTKxu3oQbGHAwRLbdYZ98AcQMQoQ4BI/IFjE7si5r0TYx/lVf9EphY6r1rxO2v4=;
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iHxrX-00ATV6-8F
 for kgdb-bugreport@lists.sourceforge.net; Tue, 08 Oct 2019 22:21:48 +0000
Received: by mail-io1-f67.google.com with SMTP id c6so425821ioo.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 08 Oct 2019 15:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u4tftPbCrv3Ywdv/Yr7lGlylwby5ziOgn4R8Izjj4JY=;
 b=ZLi8SVXF0W7jPNHHCEk2AUCffy+7zMrgf0XWhZS7LbFvNSuPfTRfCpgfafY+GDGc1S
 gvMSvpsBQ00YM+ZXcT24vvny2NYdRTh9ZM+Nb11hw2fYcf2WKkl3yANCI2NUvjeXX+rM
 eQijQ+fVF6zxiHRtsHL1nGLB4Iy3EXAkasznY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u4tftPbCrv3Ywdv/Yr7lGlylwby5ziOgn4R8Izjj4JY=;
 b=lkTbuZqIv2WnqZmycesFARPuOWlfUbBCRVz6Oodh8Gv5VQZpqiChCpcsoa3e4PIeL/
 52yXUgMpOuYYVgej6EKnqRyI+IRjXqrBLW5xXh8xw1JxS1NGKs+GTjaQvj9zT4YT8bPL
 ECDJZbMQQJdTSj5rWD5fMcyX3ZtokNHsHpsXwuzFisFT51kIKAIg1nEFwbyeFcacwdy9
 9JDh2QPYZv/6bt9rrU5uS3qL0blp6qF2/TPxhXp15P2LqR0D+Hdttw0qPaKIUlqejUH0
 QpHhrmB/XsClAXrT4Weltm0jphHEZptZ+vfbvCClp8hePXNj2rlWL3L0wUK2k0RRrIl2
 IRuQ==
X-Gm-Message-State: APjAAAVy5kPs3ZElRBQTNnWnDlZWuQJjvggMByq42aMW7qNRsERglUXR
 PlOfQEIZ2WKGrES/BICHaPP2iH/yGbE=
X-Google-Smtp-Source: APXvYqzY6WJ4Q7bKxYC+HjnCAojT4N4aWxloCMtp/4OG/vv0KWf6r4z93yPP+OPEEJ/tVx/sNRBN9g==
X-Received: by 2002:a02:cceb:: with SMTP id l11mr316825jaq.80.1570573301204;
 Tue, 08 Oct 2019 15:21:41 -0700 (PDT)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com.
 [209.85.166.52])
 by smtp.gmail.com with ESMTPSA id 6sm135801ion.66.2019.10.08.15.21.40
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2019 15:21:40 -0700 (PDT)
Received: by mail-io1-f52.google.com with SMTP id u8so540028iom.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 08 Oct 2019 15:21:40 -0700 (PDT)
X-Received: by 2002:a02:b691:: with SMTP id i17mr300479jam.132.1570573300103; 
 Tue, 08 Oct 2019 15:21:40 -0700 (PDT)
MIME-Version: 1.0
References: <20191008132043.7966-1-daniel.thompson@linaro.org>
 <20191008132043.7966-6-daniel.thompson@linaro.org>
In-Reply-To: <20191008132043.7966-6-daniel.thompson@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 8 Oct 2019 15:21:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=US8y=JrcQy3mB9MqFCaMd-N8FS2=JDe2zGWZhyHtTZtw@mail.gmail.com>
Message-ID: <CAD=FV=US8y=JrcQy3mB9MqFCaMd-N8FS2=JDe2zGWZhyHtTZtw@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iHxrX-00ATV6-8F
Subject: Re: [Kgdb-bugreport] [PATCH v2 5/5] kdb: Tweak escape handling for
 vi users
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
> Currently if sequences such as "\ehelp\r" are delivered to the console then
> the h gets eaten by the escape handling code. Since pressing escape
> becomes something of a nervous twitch for vi users (and that escape doesn't
> have much effect at a shell prompt) it is more helpful to emit the 'h' than
> the '\e'.

I have no objection to this change.


> We don't simply choose to emit the final character for all escape sequences
> since that will do odd things for unsupported escape sequences (in
> other words we retain the existing behaviour once we see '\e[').

It's not like it handles unsupported escape sequences terribly well
anyway, of course.  As soon as if finds something it doesn't recognize
then it stops processing the escape sequence and will just interpret
the rest of it verbatim.  Like if I press Ctrl-Home on my keyboard I
see "5H" spit out, for instance.


> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  kernel/debug/kdb/kdb_io.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> index 288dd1babf90..b3fb88b1ee34 100644
> --- a/kernel/debug/kdb/kdb_io.c
> +++ b/kernel/debug/kdb/kdb_io.c
> @@ -158,8 +158,8 @@ static int kdb_getchar(void)
>
>                 *pbuf++ = key;
>                 key = kdb_read_handle_escape(buf, pbuf - buf);
> -               if (key < 0) /* no escape sequence; return first character */
> -                       return buf[0];
> +               if (key < 0) /* no escape sequence; return best character */
> +                       return buf[pbuf - buf != 2 ? 0 : 1];

optional nit: for me the inverse is easier to conceptualize, AKA:

buf[pbuf - buf == 2 ? 1 : 0];

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
