Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DD83450B6
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 22 Mar 2021 21:27:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lOR8n-0007rs-7B
	for lists+kgdb-bugreport@lfdr.de; Mon, 22 Mar 2021 20:27:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <arnd@kernel.org>) id 1lOR8S-0007o3-4v
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Mar 2021 20:26:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YhxB7qp5hsuByNnFWcEOyiSowkeslCusHUb5Rd6gY0Y=; b=eLknU4a94y6Ucxq8iUHzie+XLR
 B0KoVF7jurXrhYXHcdkufafrZR81w212bejI52+YKyifWOiMeDnBfla55LnJ1CfQHsu1XIWYqhEZc
 SoKvSTUBhj9+lrbqzRRJPEe8U74ojohP23zeyGVGCtyuwN37BZ1ZX4x6baRVxvubB8is=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YhxB7qp5hsuByNnFWcEOyiSowkeslCusHUb5Rd6gY0Y=; b=j/BQ6OHNomAwRozVq9QESqSnGg
 GyY/pLKig4+QPHfZHcYVjEUl/wjSiApZVZr2IIglUeh7K2np+U0KSzkQ7ef4DYnyfnqNtx3Bmvf48
 I0XoPGxOKpdzjxdZR99pSVig8kuguEf8RehcW65ZkTmqcT/awa6nkqI1YvnK+miYKCmk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lOR8O-00FiV2-IN
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Mar 2021 20:26:48 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1A3D6619A0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Mar 2021 20:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616444799;
 bh=TCgVn6BB3w6F4s/+//BYt84HxccYqGXxV6srV5MngiY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fJr+bvd1OLPpHacH3GgE974NurUFyyS4cAhx9PpZakHdWqO3ribpjJ+1j3A2XTiiE
 M0T++nbsbN98mKyTLcrDQgbPIHb7ICF6sArPQKHtfjEkyXeurFqUoAZAZBPfmURmTA
 Uy9QdfoPYUiFCAMq1gZWqxKZon1jyItL6bn3OKfRefI8vsI8teOLbUUR43O/6+xuw2
 n3fsnTxEiWl3PAtrGeXVKuI9IkLhA0ITfNQKh7xm+Pyw33J++UwokSC7i3qLhxkah5
 UqoMVVDDdJC+CBrNZRaYVUVEtVDeOohUW9qQM5M8jIpce3rJgWffX7EywvNgT1NWsu
 UYF4xCkGva6Ng==
Received: by mail-oo1-f49.google.com with SMTP id
 r17-20020a4acb110000b02901b657f28cdcso4414582ooq.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Mar 2021 13:26:39 -0700 (PDT)
X-Gm-Message-State: AOAM531o5WZqflpNbTlbTlfhuEn4TtFfe1KB2e2OKcGZN7nmGiEXChxJ
 7lKFE6ggMzEzCdWUteXR+3W22G8v1/PJCKQ2lOA=
X-Google-Smtp-Source: ABdhPJzLQ+qBxdCWCS2mJch1YEGt0KrEHYPlaw8sRsh2gak7YjJqhkOeJMaLBj9XQzdpKHIIP0oj6HLgGkjGyYtNyaQ=
X-Received: by 2002:a4a:244d:: with SMTP id v13mr998106oov.66.1616444798370;
 Mon, 22 Mar 2021 13:26:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210322164308.827846-1-arnd@kernel.org>
 <CAD=FV=WY6yxx+vkH+UU4VYei29xBftdnyRBE1OpEELmJ-kLfFg@mail.gmail.com>
 <CAK8P3a33qv79GedMCwA=GFBWYCMB2fYrq2QmGpN3TWfqgg8j2A@mail.gmail.com>
 <CAD=FV=WaOFJEnZ=b+UTaTXDWMs8JOeBw1gRFYrtSJK-+CXGPyw@mail.gmail.com>
 <1bdabbff-8e3f-60dd-145d-af2dc45c1da5@windriver.com>
In-Reply-To: <1bdabbff-8e3f-60dd-145d-af2dc45c1da5@windriver.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 22 Mar 2021 21:26:22 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0URcb4ZcaTo9cBuey28EqHu_3EHBpcDAZDAt8Rde5RJA@mail.gmail.com>
Message-ID: <CAK8P3a0URcb4ZcaTo9cBuey28EqHu_3EHBpcDAZDAt8Rde5RJA@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lOR8O-00FiV2-IN
Subject: Re: [Kgdb-bugreport] [PATCH] kgdb: fix gcc-11 warning on indentation
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, kgdb-bugreport@lists.sourceforge.net,
 Ingo Molnar <mingo@elte.hu>, Christian Brauner <christian.brauner@ubuntu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Mar 22, 2021 at 9:14 PM Jason Wessel <jason.wessel@windriver.com> wrote:
>
> The original board this was developed with was a 32bit eeepc.
>
> The intent was that when v2printk() was called for a verbose > 1
> condition the touch_nmi_watchdog() was called.   The test case
> where a whole lot of single steps are executed sequentially was not
> letting the watchdog get reset by the normal kernel routine.
> The serial port was so slow it was pretty easy to hit this problem
> and it would just power cycle itself.
>
> The original intent would have bee:
>
> #define v2printk(a...) do {             \
>         if (verbose > 1) {              \
>                 printk(KERN_INFO a);    \
>                 touch_nmi_watchdog();   \
>         }                               \
> } while (0)

Ok, thanks for sharing how the code was intended to work. I'll let
you all come up with a decision on what should be done about it
now, I'm happy to send one or two patches to address both the
compiler warning, and the original mistake.

My feeling is it would be best to address the warning first,
pretty much with the patch I sent here, and to change the
behavior as a second patch.

That way the gcc-11 warning can be silenced in stable kernels by
backporting the first patch, while the second patch can be tried
out in new kernels first and might not get backported because the
existing behavior is not harmful.

> I'd guess this probably not the first time gcc-11 is finding brace
> imbalances.

There were only a handful of new -Wmisleading-indentation warnings
for gcc-11, the older compilers already caught every instance in normal
functions, while gcc-11 improved on finding them in macros as well.

       Arnd


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
