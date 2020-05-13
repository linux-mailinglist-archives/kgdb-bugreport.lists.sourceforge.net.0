Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B83D61D233A
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 14 May 2020 01:49:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jZ180-0006J0-Cm
	for lists+kgdb-bugreport@lfdr.de; Wed, 13 May 2020 23:49:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jZ17r-0006Ih-UN
 for kgdb-bugreport@lists.sourceforge.net; Wed, 13 May 2020 23:49:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hlGt6Oy3r+BmfkpKnoIDqe3ZUdwniAx9kteZIcI2SXs=; b=G1EPL5z/yLxU+GOa7xKw1fOCjs
 sOJBXW53w57OsTNYO+SCr/RjruHibBrnotjPVFokxge/RzL6pmhWCDyT13JW/ha4OyIkoqmOMDxO4
 Ycw3bX/HdYgvUNOlbS6vPHJGVhPu11WqWO7iYdcYg2j/knciQ04JRQ9yd/I3AmDLficQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hlGt6Oy3r+BmfkpKnoIDqe3ZUdwniAx9kteZIcI2SXs=; b=ACvWcZnRPdDDCougt7OEdRqjs1
 CL/RtqPllay+Ueh/3guCpck9p1atpd/QssYenBSXGq5R9mbkzLvgX+684ipaJBtXPis9rRectLr/9
 hPr3W7UYm57MlSfufb7pzQnLsnkA4FBCoqakBFpPYeAKFpSS0Oa+V0hvf89G+tprBxAA=;
Received: from mail-pl1-f195.google.com ([209.85.214.195])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jZ17q-009Btd-3X
 for kgdb-bugreport@lists.sourceforge.net; Wed, 13 May 2020 23:49:23 +0000
Received: by mail-pl1-f195.google.com with SMTP id b12so433041plz.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 13 May 2020 16:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hlGt6Oy3r+BmfkpKnoIDqe3ZUdwniAx9kteZIcI2SXs=;
 b=UHr3BmqVuaNOTVxKkDgUigv2I6cDB3yY+X1ORivDUjUdYlkwuvCUX/udO5encsZXMO
 WzjqaT6kOYLT7bjFIkAqPNXKGNzFSaf3+f3bf+rpCr6LlCaaNzLRV1k46VsU7j1lSLRt
 DDJupzdmugvcfBflTh7YorajO7wWp9umAxN8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hlGt6Oy3r+BmfkpKnoIDqe3ZUdwniAx9kteZIcI2SXs=;
 b=ikNx2aeJWD/DYHgSJ4hU3ALRo7Iz2+vUdeXZ1jui3v2+1mFKs7IOjmRJ9ImqYkptQe
 1CKuvWiZVbQrMfiEv1mnajIl9U1WkbstogvZYM43q/mn2IxzVoRXmDWSODzBEAY/yvi/
 rV4C6nNxaufhVoWKUf/Cz81tBzzUsj21gF+h0Oy0mzXJjx5JXX/P3Z6uaMCIjOHEmj7h
 0vzx9vlehE6vZcnMxKZtDRkp1LdMEiBcDKR0HNXf6M18FZI4M4hdp3rRv9xZEXcsoLZs
 6L/3j4QvfFThBfG6RfcdqydGLAsIlc9I0qM1rxp/TXcciN24fFk5LBVqbpgZ+8nJYEgP
 fX8A==
X-Gm-Message-State: AOAM532fihUhINNKfkZHfDTDcBh4lZ1zvBujTeLS5LyVqcN44XfM1XVv
 /nociMyt0hzyTiQIfs6Sg1GlwXLV2/M=
X-Google-Smtp-Source: ABdhPJyS+qG4xjRv8qc9Lg16EXqub9BBRexAQux1qtCFP+t7nF4tfrBB82k5VMmzb8N+oVCYn8WixQ==
X-Received: by 2002:a1f:c443:: with SMTP id u64mr1428256vkf.26.1589413280573; 
 Wed, 13 May 2020 16:41:20 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com.
 [209.85.221.177])
 by smtp.gmail.com with ESMTPSA id b198sm291009vkf.7.2020.05.13.16.41.19
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2020 16:41:19 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id j28so308225vkn.8
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 13 May 2020 16:41:19 -0700 (PDT)
X-Received: by 2002:a1f:2c41:: with SMTP id s62mr1494343vks.40.1589413279155; 
 Wed, 13 May 2020 16:41:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200511021637.37029-1-liwei391@huawei.com>
In-Reply-To: <20200511021637.37029-1-liwei391@huawei.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 13 May 2020 16:41:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VNTkRW9LbNjY_0Ljj57m19gFUEHAuYKd-i6jpu_QpMgg@mail.gmail.com>
Message-ID: <CAD=FV=VNTkRW9LbNjY_0Ljj57m19gFUEHAuYKd-i6jpu_QpMgg@mail.gmail.com>
To: Wei Li <liwei391@huawei.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.195 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.195 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jZ17q-009Btd-3X
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Make the internal env 'KDBFLAGS'
 undefinable
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
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Sun, May 10, 2020 at 7:18 PM Wei Li <liwei391@huawei.com> wrote:
>
> 'KDBFLAGS' is an internal variable of kdb, it is combined by 'KDBDEBUG'
> and state flags. But the user can define an environment variable named
> 'KDBFLAGS' too, so let's make it undefinable to avoid confusion.
>
> Signed-off-by: Wei Li <liwei391@huawei.com>
> ---
>  kernel/debug/kdb/kdb_main.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index 4fc43fb17127..d3d060136821 100644
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -423,7 +423,8 @@ int kdb_set(int argc, const char **argv)
>                         | (debugflags << KDB_DEBUG_FLAG_SHIFT);
>
>                 return 0;
> -       }
> +       } else if (strcmp(argv[1], "KDBFLAGS") == 0)
> +               return KDB_NOPERM;

One slight nit is that my personal preference is that if one half of
an "if/else" needs braces then both halves should have braces.  I
don't know what Daniel and Jason's policies are, though.  In any case,
not that I've ever used the KDBDEBUG functionality, but your change
seems sane.  Without it if I set "KDBDEBUG" and "KDBFLAGS" and then
type "env" I see the flags listed twice, but one is real and one is
fake.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
