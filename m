Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A7D306D12
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 28 Jan 2021 06:43:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l5059-0003YA-R9
	for lists+kgdb-bugreport@lfdr.de; Thu, 28 Jan 2021 05:43:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1l5056-0003Xo-TA
 for kgdb-bugreport@lists.sourceforge.net; Thu, 28 Jan 2021 05:43:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QhPnjfxjWKosRLcoMYR5Wm2UmILCjhnOtStMVrHIlZo=; b=WUMeDXl+Cya4yLFbs3J2oWvf6s
 mEc9zEAQZQXYGBhWTwWEhtTaz7Qk/fOUcN54YuQZoHe4Sw97kwGhdBgQcwe2Ye0gkmy/jQcFyRRQR
 gw3YjAn081AtfkuPUeeI9aSFwm4TcvhAD6fzLOgOG3YM9STcOxy9TiEUMXI5mJ4XIzmE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QhPnjfxjWKosRLcoMYR5Wm2UmILCjhnOtStMVrHIlZo=; b=FZMrTHqL/Wj2tPVzGt+I8pL4oH
 EI3uwnKzLJ1IRxRsveCw6AqQgC/TBC8AIpz0XDjJLNI0Wv28vnqUQi2lo3fL57zKdmKFCMcxlTmn3
 eyMO7M0S3kmHu0YxtIepo41pBUTT363IOefB89xO0noGmT7TEVlP4k86TwwrOG1ABn+s=;
Received: from mail-lf1-f41.google.com ([209.85.167.41])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l504s-00G0uo-1r
 for kgdb-bugreport@lists.sourceforge.net; Thu, 28 Jan 2021 05:43:00 +0000
Received: by mail-lf1-f41.google.com with SMTP id u25so6032402lfc.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 27 Jan 2021 21:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QhPnjfxjWKosRLcoMYR5Wm2UmILCjhnOtStMVrHIlZo=;
 b=cOImc74CqHePwjtAxEuaLrpuwFBajqtxZPIHG1KEWSotICaG0xyVEKWsD9AwBsjnmE
 xrjhSzsAcLK3A5FgHbJ5JlPtvFR3WI1yg6o7rlwYd/RmsIxTIztBYZwQlKmr6NE0+0Vq
 4wcXJAf2Go+VJ/PpIXNq2hi0GAgV8PiMZKmRlYMwDMIWOE61qDFb+eL/MTCXECkuiBvv
 4dnQtChyl4H7GFhY0IO7ZBE5dP9uKZQ99EaKW2PtaZBkzOAhoH0pzme9d3v5UO3k/y9M
 9Jr5BJOrLAljApHI7rme1p9cP4F6H3J0W9do/37462V3e0NwWsc4Rrh4/JpNjrDzxisU
 M1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QhPnjfxjWKosRLcoMYR5Wm2UmILCjhnOtStMVrHIlZo=;
 b=Ft12wV7ekKGUvRHqOQX1lRydCQn2koNWAVOl5Q+yHX0IJORobY9OkqawZc8dKtDpfy
 EUoBqV9Ot7KWi7owG+kTnc8+baYaTtXxSBVjcxED60fW2/RwgxHz7qX4ZFtjTkhaFzoG
 C61+XZhIm0ghatBw9Ai1KScHJ+b/tTTflEsKUxzLxeOFhsUIQd0SnWJy+4yxSibW0IfB
 2hNDWZxvzVo2WQ+1sSnuEbgJGEt4gMjTvKzKil1T7jLY3Mej/XTzudDp9tVIPyEu2GLD
 j4Lq37cMFMCq/giGPG/2memrzXVHLkRnrvdAUvCdICzeaLZaNfbu6JI652PgaZd3T03u
 +/+A==
X-Gm-Message-State: AOAM531LO4gIGPnRSYZEsocHg55W+bkeodIUWRNH2IDUSVOG4gHYfkOR
 AQZzlWeWHrY0Vt2ITbdyFtHQJ7ZUTzFvMgvu5wrYFrZnJM/gUg==
X-Google-Smtp-Source: ABdhPJwasdvNPGsQKJf7SHDsVnj4Fk1Js6mJqifm7gRZYPMCbftGz/zNUXuHZB1a8Fctpp13j/ivahehvbMs2qG83eE=
X-Received: by 2002:a19:456:: with SMTP id 83mr6914736lfe.113.1611812559452;
 Wed, 27 Jan 2021 21:42:39 -0800 (PST)
MIME-Version: 1.0
References: <1611584985-12479-1-git-send-email-sumit.garg@linaro.org>
 <CAD=FV=VOGca=QVmGnUCgtTk5ednPnUXiLekqo77LQ3EknrVXjg@mail.gmail.com>
In-Reply-To: <CAD=FV=VOGca=QVmGnUCgtTk5ednPnUXiLekqo77LQ3EknrVXjg@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 28 Jan 2021 11:12:28 +0530
Message-ID: <CAFA6WYOObMyR3gj3P+VGqpuTM0WQB=+Wh7BchmsXAfEpso4onQ@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.41 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l504s-00G0uo-1r
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Refactor env variables get/set
 code
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
 Daniel Thompson <daniel.thompson@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, 25 Jan 2021 at 22:44, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Jan 25, 2021 at 6:30 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > diff --git a/kernel/debug/kdb/kdb_env.c b/kernel/debug/kdb/kdb_env.c
> > new file mode 100644
> > index 0000000..33ab5e6
> > --- /dev/null
> > +++ b/kernel/debug/kdb/kdb_env.c
> > @@ -0,0 +1,229 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Kernel Debugger Architecture Independent Environment Functions
> > + *
> > + * Copyright (c) 1999-2004 Silicon Graphics, Inc.  All Rights Reserved.
> > + * Copyright (c) 2009 Wind River Systems, Inc.  All Rights Reserved.
> > + * 03/02/13    added new 2.5 kallsyms <xavier.bru@bull.net>
>
> I'm not sure the policy for copying over copyright notices like this,
> but I would have expected them to get copied over from the file you
> got the code from?  These are slightly different.
>

Okay, I will match them exactly.

> > + */
> > +
> > +#include <linux/kdb.h>
> > +#include <linux/string.h>
> > +#include "kdb_private.h"
> > +
> > +/*
> > + * Initial environment.   This is all kept static and local to
> > + * this file.   We don't want to rely on the memory allocation
> > + * mechanisms in the kernel, so we use a very limited allocate-only
> > + * heap for new and altered environment variables.  The entire
> > + * environment is limited to a fixed number of entries (add more
> > + * to __env[] if required) and a fixed amount of heap (add more to
> > + * KDB_ENVBUFSIZE if required).
> > + */
> > +static char *__env[] = {
> > +#if defined(CONFIG_SMP)
> > +       "PROMPT=[%d]kdb> ",
> > +#else
> > +       "PROMPT=kdb> ",
> > +#endif
> > +       "MOREPROMPT=more> ",
> > +       "RADIX=16",
> > +       "MDCOUNT=8",            /* lines of md output */
> > +       KDB_PLATFORM_ENV,
> > +       "DTABCOUNT=30",
> > +       "NOSECT=1",
> > +       (char *)0,
>
> In a follow-up patch, I guess these could move from 0 to NULL and
> remove the cast?
>

Sure, I will remove the cast.

>
> > +/*
> > + * kdbgetenv - This function will return the character string value of
> > + *     an environment variable.
> > + * Parameters:
> > + *     match   A character string representing an environment variable.
> > + * Returns:
> > + *     NULL    No environment variable matches 'match'
> > + *     char*   Pointer to string value of environment variable.
> > + */
>
> In a follow-up patch, the above could be moved to kernel-doc format,
> which we're trying to move to for kgdb when we touch code.
>
> I will leave it up to you about whether the new functions introduced
> in this patch are introduced with the proper kernel doc format or move
> to the right format in the same follow-up patch.
>

Okay, I will move these to kernel-doc format.

>
> > +/*
> > + * kdb_prienv - Display the current environment variables.
> > + */
> > +void kdb_prienv(void)
>
> IMO saving the two characters in the function name isn't worth it,
> especially since this function is called in only one place.  Use
> kdb_printenv()

Sure, I will rename it as kdb_printenv().

-Sumit

>
> -Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
