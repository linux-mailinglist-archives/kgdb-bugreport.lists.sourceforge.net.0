Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F7C3068D7
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 28 Jan 2021 01:54:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l4vZl-00083j-Tg
	for lists+kgdb-bugreport@lfdr.de; Thu, 28 Jan 2021 00:54:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stephenzhangzsd@gmail.com>) id 1l4vZk-00083b-6X
 for kgdb-bugreport@lists.sourceforge.net; Thu, 28 Jan 2021 00:54:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BH+9yEbb8lZDoESwWW2DKEOB8O9nDMdG1CJNUK7Fk1o=; b=cK7owHZMalfaBjWivv9dmmVo4m
 95+YldW4+eb+70lrJw404fytckSbYu1qw8oyd/pwf95doiDjLuZKWr/EroIedtMuGNIi3RbPT2JN1
 hvaE0CxrobDkFlal793QTGpRtszAgOJeXMKDMfHns8gDcxds1Pwpp6w5QzmLgNKnNqQk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BH+9yEbb8lZDoESwWW2DKEOB8O9nDMdG1CJNUK7Fk1o=; b=lT5q1sssCBLezchdoLDW7czV0s
 Z+5kGbIloK4rx+90z/KNiqHxx7YfHus4kgPGlAl+WKUiqRECLg1YTqsPl9p6J6UVoYmRJtLKh8iMW
 e1GWOkLfQwJa/3T5ABE3oDPvASwkToG5ZbiHZCNM81YtI31JT65kIKFH5Ev7f5Swuzj4=;
Received: from mail-yb1-f179.google.com ([209.85.219.179])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l4vZb-00FUlG-1y
 for kgdb-bugreport@lists.sourceforge.net; Thu, 28 Jan 2021 00:54:20 +0000
Received: by mail-yb1-f179.google.com with SMTP id r32so3868710ybd.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 27 Jan 2021 16:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BH+9yEbb8lZDoESwWW2DKEOB8O9nDMdG1CJNUK7Fk1o=;
 b=pvBYWskRvFAH8sD6fckp+Jqw/bya6cXgI6gWJpxVbhZJBkbsxzy9F7r0VVSIWJaUi3
 iYs3W7C7bSgMHyOn8uzqFtUnO/sLnd7/FuHC+VPv6TemROFghby2ozgpIs2zCjd/rwvl
 Eg3m6zUYdqMA1URdt+TZqC6lAlLT5H4n7+Axi/1n7HwABO3lzJF1EAfWtwY/JXG0NIz8
 2Xpa3pVp5jg+g6UVgU9Jqp2n8LhehZAr9zsxKZhAzGMmI/hpOyVyU7Ckrb1XnCrzDQoq
 2MogK/guX8Y1tFatk+0UNioStkBn7Ewj57Ouiq/tcOCI5SNKyawBeDgaJ0FFhZvMx312
 aN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BH+9yEbb8lZDoESwWW2DKEOB8O9nDMdG1CJNUK7Fk1o=;
 b=aKR+noMxg+jEdTIZRdV55YqT/Q2aTD0v8ADI9ZMGBEDLXEsA6Yla/KFEYHzXWiC0SI
 Q7Ty0blzA5HiTgeRQZPy7l1nzQUod+uFa5qs0XrLv5UUaWXrWO1yRgyqgPm2qaKzJFbh
 fJ1SrdPMLjr3IsrAJb70502amMLBfMH8avZz1qCPHt9gZvUHylzwgveAipYepad3xiON
 fSzD+OZQNrbGwhw60fa9F+szPQG3/E1MRujXkOh7lMkACgkqXFyus+LgmiE62yMikek7
 3w/Ua13oxOmoMxoQrs39yAPB/q4eiFN27+Ks6qUIEt0V5l9c5ErYuV5hlURTbIc6NnDF
 Z1cw==
X-Gm-Message-State: AOAM530jZ124qdbYJTCq+8E6GEilc6sI+xRR/9nMrE/ClQRqFxP60JXV
 jXBqoac/8balbglKxCL3VzLMtEgfJON79NeeyBA=
X-Google-Smtp-Source: ABdhPJwdVu930P2P0+bwL5b09VOgXOy2rytmQMDfExDjb6vkBAgt4iiuwYAc4V9grppXifW6sB7ocTiMmATt13WGu7I=
X-Received: by 2002:a25:d605:: with SMTP id n5mr19675620ybg.81.1611795245476; 
 Wed, 27 Jan 2021 16:54:05 -0800 (PST)
MIME-Version: 1.0
References: <1611400441-7178-1-git-send-email-stephenzhangzsd@gmail.com>
 <CAD=FV=V6iEr5Xj53hvrQK+48xGm=s_GYQuyD_vgMM3Zknw5yOw@mail.gmail.com>
 <20210126100339.3izssu5kwjdusyfa@maple.lan>
In-Reply-To: <20210126100339.3izssu5kwjdusyfa@maple.lan>
From: Stephen Zhang <stephenzhangzsd@gmail.com>
Date: Thu, 28 Jan 2021 08:53:50 +0800
Message-ID: <CALuz2=emkd5eNxUu=Z=sgSdve7nLvM-eOkqOa6Zkfw-VP1f8Xg@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (stephenzhangzsd[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.179 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.179 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.0 HTML_MESSAGE           BODY: HTML included in message
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l4vZb-00FUlG-1y
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: kdb_support: replace function
 name by %s
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
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

RGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4g5LqOMjAyMeW5tDHm
nIgyNuaXpeWRqOS6jCDkuIvljYg2OjAz5YaZ6YGT77yaCgo+Cj4gSSdkIHByZWZlciB0aGlzIHRv
IGJlOgo+Cj4gICBrZGJfZGJnX3ByaW50ZihBUiwgInN5bW5hbWU9JXMsIHN5bXRhYj0lcHhcbiIs
IHN5bW5hbWUKPgo+IFRoYXQgd2F5IHRoZSBvdGhlciBleGFtcGxlcyBvZiB0aGUgaWYgKEtEQl9E
RUJVRyh4eHgpKSBrZGJfcHJpbnRmKC4uLikKPiBwYXR0ZXJuIGNvdWxkIGFkb3B0IHRoZSBzYW1l
IG1hY3JvLgo+Cj4KPiBEYW5pZWwuCj4KClRoYW5rcy5JJ3ZlIGJlZW4gdGhpbmtpbmcgYWJvdXQg
dGhhdC5UaGVyZSBhcmUgc2V2ZXJhbCBwYXR0ZXJucyB0byBkZWFsCndpdGguCgowOgoKa2RiX3By
aW50ZigiLi4uIiwuLi4pOwoKd2hpY2ggaXMgdGhlIG5vcm1hbCBvbmUuCgoxOgoKa2RiX3ByaW50
ZigiJXM6ICIuLi4sX19mdW5jX18sLi4uKQoKTWF5YmUgd2UgY291bGQgaW1wcm92ZSAnMScgdG8g
dGhpcyA6CgojZGVmaW5lIGtkYl9mdW5jX3ByaW50Zihmb3JtYXQsIGFyZ3MuLi4pIFwKICBrZGJf
cHJpbnRmKCIlczogIiBmb3JtYXQsIF9fZnVuY19fLCAjIyBhcmdzKQoKCjI6CmlmKEtEQl9ERUJV
RyhBUikpCmtkYl9wcmludGYoIiVzICIuLi4sX19mdW5jX18sLi4uKTsKCndlIGNvdWxkIGltcHJv
dmUgJzInIHRvIHRoaXMgOgojZGVmaW5lIGtkYl9hcmRiZ19wcmludGYoZm9ybWF0LCBtYXNrLCBh
cmdzLi4uKSBcCiAgZG8geyBcCiAgaWYgKEtEQl9ERUJVRyhtYXNrKSkgXAogIGtkYl9mdW5jX3By
aW50Zihmb3JtYXQsICMjIGFyZ3MpOyBcCiAgfSB3aGlsZSAoMCkKCi0tLQpTdGVwaGVuLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBv
cnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
