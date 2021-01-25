Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F9B30288C
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 25 Jan 2021 18:14:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l45S2-0006Iz-3O
	for lists+kgdb-bugreport@lfdr.de; Mon, 25 Jan 2021 17:14:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1l45S1-0006Ii-1r
 for kgdb-bugreport@lists.sourceforge.net; Mon, 25 Jan 2021 17:14:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GQc6PKJl364Vrp1EanHNeZBMPwrfKXlGnOrqHxfWtgk=; b=mSQnJ5pwaCuirENjBz1R/kdzMM
 oSgL1HHwUSNRz+egB5V0IKVtRRWvHEIWy5joM2Na7VuF5a//XjvcShrdKWUiKJnCJUSx8Vdk4x52e
 9rTiHWvTU2qAocbddSKba1WQrppSrTgTOewQQqQCDx/RhDpxHtshjvY16NCEjXU2JN9c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GQc6PKJl364Vrp1EanHNeZBMPwrfKXlGnOrqHxfWtgk=; b=ccaEwMNxU6S95YCcJNda0LuEbz
 2k0/h6YJBQyK6+FLwoo66+u6XS10MeH/ioXnmLP84Od+LQPYyNKjtYJSuN3fdCVMmonws02xF40q7
 gaOGG8CMRCoQW4dLT/o/TD1Gwko4AJ0RD8v2I8elpvX1gmjMofytzjt9MT98aa/2P1As=;
Received: from mail-vs1-f45.google.com ([209.85.217.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l45Rw-0039eU-38
 for kgdb-bugreport@lists.sourceforge.net; Mon, 25 Jan 2021 17:14:52 +0000
Received: by mail-vs1-f45.google.com with SMTP id v19so7135742vsf.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 25 Jan 2021 09:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GQc6PKJl364Vrp1EanHNeZBMPwrfKXlGnOrqHxfWtgk=;
 b=knfSS5OTZvscjpM6xakbSLdApoN93eamZqe7F4G6G7cQMv7cyKw5tarTwrRJvpZk1H
 KNbIG3EdLmNMkSFR/AjfIBPDxxTw/3MWBxlIyeq/0EsjW5eex2WPfOo9i/wEK5AA/UCM
 poXFNGSOx9LubRJF3xeOPfNVvhhiRai5AF6GM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GQc6PKJl364Vrp1EanHNeZBMPwrfKXlGnOrqHxfWtgk=;
 b=S7soshldpcZWpfAxY4ulf+X42Ny+hEEZukclCsZwROY0QLZvzKhIQwlzLp5cLUe9c7
 MYuMC+rJ/qF/yNLKxX3E6pCaHjuzQV6l7zRVgA80GCFyvMnDfyNm7Ip7YH2H0HQEXoKx
 f0Z7DCejwOK+uPyfDmjalgFbz24/offlVQ/Zvi49dbhXE9BvJwekVoKI/aVxcaqWQ1ED
 2prVxSyd/LxPr9dRc7PminqrB9mklz+1JjBfZ9sxNItQK1WK1CLISEbMOe/0uPkrUcfV
 7ZiD78+1JIHDD26TdRU1nOYa1bMRe9+HKfE9KvAwXIU+o/d4WFtXFripH3bzGXQup1QY
 4e8A==
X-Gm-Message-State: AOAM532rOTJnIRft5K0GPz89uucYOUPAvWiLfskCfWiifffF2S+rqA2b
 a5irEq+YEOW5ruDfawJgHTrINzJ3bg8OyA==
X-Google-Smtp-Source: ABdhPJx4K6PVR4+af1WSg9MOYtvZsVml3270lKz3RESlMhMbWNz8RshjNlBxAlCGdfDgJunkK2BSfw==
X-Received: by 2002:a67:8949:: with SMTP id l70mr1648997vsd.21.1611594881896; 
 Mon, 25 Jan 2021 09:14:41 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com.
 [209.85.222.53])
 by smtp.gmail.com with ESMTPSA id g139sm2562934vke.18.2021.01.25.09.14.40
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 09:14:41 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id i3so1197933uai.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 25 Jan 2021 09:14:40 -0800 (PST)
X-Received: by 2002:ab0:5a70:: with SMTP id m45mr1315298uad.121.1611594880375; 
 Mon, 25 Jan 2021 09:14:40 -0800 (PST)
MIME-Version: 1.0
References: <1611584985-12479-1-git-send-email-sumit.garg@linaro.org>
In-Reply-To: <1611584985-12479-1-git-send-email-sumit.garg@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 25 Jan 2021 09:14:28 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VOGca=QVmGnUCgtTk5ednPnUXiLekqo77LQ3EknrVXjg@mail.gmail.com>
Message-ID: <CAD=FV=VOGca=QVmGnUCgtTk5ednPnUXiLekqo77LQ3EknrVXjg@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.45 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.45 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l45Rw-0039eU-38
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

Hi,

On Mon, Jan 25, 2021 at 6:30 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> diff --git a/kernel/debug/kdb/kdb_env.c b/kernel/debug/kdb/kdb_env.c
> new file mode 100644
> index 0000000..33ab5e6
> --- /dev/null
> +++ b/kernel/debug/kdb/kdb_env.c
> @@ -0,0 +1,229 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Kernel Debugger Architecture Independent Environment Functions
> + *
> + * Copyright (c) 1999-2004 Silicon Graphics, Inc.  All Rights Reserved.
> + * Copyright (c) 2009 Wind River Systems, Inc.  All Rights Reserved.
> + * 03/02/13    added new 2.5 kallsyms <xavier.bru@bull.net>

I'm not sure the policy for copying over copyright notices like this,
but I would have expected them to get copied over from the file you
got the code from?  These are slightly different.

> + */
> +
> +#include <linux/kdb.h>
> +#include <linux/string.h>
> +#include "kdb_private.h"
> +
> +/*
> + * Initial environment.   This is all kept static and local to
> + * this file.   We don't want to rely on the memory allocation
> + * mechanisms in the kernel, so we use a very limited allocate-only
> + * heap for new and altered environment variables.  The entire
> + * environment is limited to a fixed number of entries (add more
> + * to __env[] if required) and a fixed amount of heap (add more to
> + * KDB_ENVBUFSIZE if required).
> + */
> +static char *__env[] = {
> +#if defined(CONFIG_SMP)
> +       "PROMPT=[%d]kdb> ",
> +#else
> +       "PROMPT=kdb> ",
> +#endif
> +       "MOREPROMPT=more> ",
> +       "RADIX=16",
> +       "MDCOUNT=8",            /* lines of md output */
> +       KDB_PLATFORM_ENV,
> +       "DTABCOUNT=30",
> +       "NOSECT=1",
> +       (char *)0,

In a follow-up patch, I guess these could move from 0 to NULL and
remove the cast?


> +/*
> + * kdbgetenv - This function will return the character string value of
> + *     an environment variable.
> + * Parameters:
> + *     match   A character string representing an environment variable.
> + * Returns:
> + *     NULL    No environment variable matches 'match'
> + *     char*   Pointer to string value of environment variable.
> + */

In a follow-up patch, the above could be moved to kernel-doc format,
which we're trying to move to for kgdb when we touch code.

I will leave it up to you about whether the new functions introduced
in this patch are introduced with the proper kernel doc format or move
to the right format in the same follow-up patch.


> +/*
> + * kdb_prienv - Display the current environment variables.
> + */
> +void kdb_prienv(void)

IMO saving the two characters in the function name isn't worth it,
especially since this function is called in only one place.  Use
kdb_printenv()

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
