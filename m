Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDAC306D01
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 28 Jan 2021 06:36:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l4zyw-0003IW-5D
	for lists+kgdb-bugreport@lfdr.de; Thu, 28 Jan 2021 05:36:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1l4zyu-0003IN-Nv
 for kgdb-bugreport@lists.sourceforge.net; Thu, 28 Jan 2021 05:36:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H0+SPb1sGIQ7OykhjNh+84iIy2kpzbYQSbjIAaYgVj8=; b=HU3PVKZshP25EhFtq+5qr38sQD
 1nJ23tZu3xJZ+J99fv9U4UOHk9mPxEgdi2niQrPWrvp8cIcLLYpi5rqCH29NsmuXyhtyKy+0YkiAm
 EpXlY+jAVD7pMoD10/w4vMTtwTA1TI82WtROCXoRmyiLzdhnSf35ohPapuQkGNdVWElc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H0+SPb1sGIQ7OykhjNh+84iIy2kpzbYQSbjIAaYgVj8=; b=Ny5CsHXBxvOq2Efy8VOWFFB+59
 z5gOO5Rcpjbf0yYtviyZ0ItTD0SQestjQCTokm3bjG8cesm1W8YOyUsjFprGSopqmddu1YZoGaA1k
 Dsj3uTp8zjZ9cIBcZy5M20SV64bj8YFAEZbEMch24ciiWFFCGFonre3OSiLyhpPhFLrQ=;
Received: from mail-lf1-f51.google.com ([209.85.167.51])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l4zyn-00DAT2-Qu
 for kgdb-bugreport@lists.sourceforge.net; Thu, 28 Jan 2021 05:36:36 +0000
Received: by mail-lf1-f51.google.com with SMTP id q8so5990781lfm.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 27 Jan 2021 21:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H0+SPb1sGIQ7OykhjNh+84iIy2kpzbYQSbjIAaYgVj8=;
 b=TkVUz1NsQfWLA1R32Ao5MUji8JRLJ+lMBTeWYm5MHE05qxHDOU0drY/PaKBdJSzmZy
 Uaaikv5N1TuyXlecwH9rh/z1kj7YSa+TVdh/O1HJk5kxJK9sJ1MpdugMjbvvwJwIvk81
 TUF5YLXbqP3Vkumup8u5+LqUFWI/zrUpdEEfywArYkZ5ZAcrkKHo0jmJ0ncui3OzZDuv
 y42/+2Tgk60O5wX7gpvYGY56jE+Gbh7IvOj1osQWiA8CIn8dwT1SES38AdRcZ8GqwA0j
 jkUxK28De28b1HxQGgkdXt80qFu96bdMto+JYdEhl95H6GLGuAKNmIzlWm0gL+Rs9YOW
 M6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H0+SPb1sGIQ7OykhjNh+84iIy2kpzbYQSbjIAaYgVj8=;
 b=l0xgNruMlxxBJ2mopC3sjNBDRKwNaUxOHObGvRxVCoRoSTVV0WI5RMbSv5xkhdqzeZ
 0Z6EaV3O3+y8cSrijqUX8DmsTghMDv7766KsJZxlIiXMGY1Z6dzwv7bjzNWaBqNy77H9
 i6YCWtY55Xxlmzeh1HA/8YhAeKbkgLp7FdYIsfp0aeQbTen0zXRzz5a6APncN8FAA7qd
 BsLwdHLqQ9R6Mn1AIa7BiQqQXZWbyjCY6apLUPIqmi/svvDHL+ofhOnS2uiURyY2fIbQ
 HZNsaey/OxSGaHHm5otHezBlFaYE34VYimrdJroGFrYCX426r8ba/WKQ9c9Q9PTOw8Mo
 ZCug==
X-Gm-Message-State: AOAM532XDwGforFej33Viw5ujatnAYRaCgBCkvr2PuG7CRTVBcm4C2t5
 VByu8j++D0dK+ZYoiNI9CWTasR1a/UqphXv/zFpUQw==
X-Google-Smtp-Source: ABdhPJwv1kiHbydD6QOO6nDMuRgJRt+l/XxHFBf6N1PlJh4qH8DcUACV6FIZk3Zz6o2L44bvvp3YZgsAzm31R+uO6GU=
X-Received: by 2002:a19:4006:: with SMTP id n6mr6563925lfa.194.1611812182985; 
 Wed, 27 Jan 2021 21:36:22 -0800 (PST)
MIME-Version: 1.0
References: <1611584985-12479-1-git-send-email-sumit.garg@linaro.org>
 <20210125204316.cwhr2nxrg77f35ud@maple.lan>
In-Reply-To: <20210125204316.cwhr2nxrg77f35ud@maple.lan>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 28 Jan 2021 11:06:11 +0530
Message-ID: <CAFA6WYPDXA252kTWZ2py+kGMVBfGL=7LUDvBJzaBbAVRpqpCJw@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.51 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.51 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l4zyn-00DAT2-Qu
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, 26 Jan 2021 at 02:13, Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Mon, Jan 25, 2021 at 07:59:45PM +0530, Sumit Garg wrote:
> > Move kdb environment related get/set APIs to a separate file in order
> > to provide an abstraction for environment variables access and hence
> > enhances code readability.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  kernel/debug/kdb/Makefile      |   2 +-
> >  kernel/debug/kdb/kdb_env.c     | 229 +++++++++++++++++++++++++++++++++++++++++
> >  kernel/debug/kdb/kdb_main.c    | 201 +-----------------------------------
>
> So... a couple of things bother me about this.
>
> 1. This patch mixes together real changes (new functions for example) and
>    code motion. That makes is needlessly difficult to review. Code
>    motion and changes should always be different patches.
>

Agree.

> 2. I'm rather unconvinced by the premise that removing a continuous
>    block of functions from one file to another has a particularly big
>    impact on readabiity. The existing environment functions are not
>    scattered in many difference places so I think any gain from
>    moving them is lost (and then some) by the potential for painful
>    merge conflicts, especially if anything needs backporting.
>

There is another aspect here as well regarding users of environment
access functions which are spread across multiple files:
- kdb_main.c
- kdb_io.c
- kdb_support.c

So having a separate file for common functions enhances modularity as
well. But if you still think pains from code motion are more than the
gains then I will drop it.

> I *think* I like the new functions (though I agree with Doug about the
> naming) although it is hard to be entirely sure since they are tangled
> in with the code motion.
>
> Basically I'd rather see the patch without the code motion...
> something that just extracts some of the ad-hoc environmental scans
> into functions and puts the functions near the existing env
> manipulation functions.

Okay.

-Sumit

>
>
> Daniel.
>
> >  kernel/debug/kdb/kdb_private.h |   3 +
> >  4 files changed, 235 insertions(+), 200 deletions(-)
> >  create mode 100644 kernel/debug/kdb/kdb_env.c
> >
> > diff --git a/kernel/debug/kdb/Makefile b/kernel/debug/kdb/Makefile
> > index efac857..b76aebe 100644
> > --- a/kernel/debug/kdb/Makefile
> > +++ b/kernel/debug/kdb/Makefile
> > @@ -6,7 +6,7 @@
> >  # Copyright (c) 2009 Wind River Systems, Inc. All Rights Reserved.
> >  #
> >
> > -obj-y := kdb_io.o kdb_main.o kdb_support.o kdb_bt.o gen-kdb_cmds.o kdb_bp.o kdb_debugger.o
> > +obj-y := kdb_io.o kdb_main.o kdb_support.o kdb_bt.o gen-kdb_cmds.o kdb_bp.o kdb_debugger.o kdb_env.o
> >  obj-$(CONFIG_KDB_KEYBOARD)    += kdb_keyboard.o
> >
> >  clean-files := gen-kdb_cmds.c
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
> > +     "PROMPT=[%d]kdb> ",
> > +#else
> > +     "PROMPT=kdb> ",
> > +#endif
> > +     "MOREPROMPT=more> ",
> > +     "RADIX=16",
> > +     "MDCOUNT=8",            /* lines of md output */
> > +     KDB_PLATFORM_ENV,
> > +     "DTABCOUNT=30",
> > +     "NOSECT=1",
> > +     (char *)0,
> > +     (char *)0,
> > +     (char *)0,
> > +     (char *)0,
> > +     (char *)0,
> > +     (char *)0,
> > +     (char *)0,
> > +     (char *)0,
> > +     (char *)0,
> > +     (char *)0,
> > +     (char *)0,
> > +     (char *)0,
> > +     (char *)0,
> > +     (char *)0,
> > +     (char *)0,
> > +     (char *)0,
> > +     (char *)0,
> > +     (char *)0,
> > +     (char *)0,
> > +     (char *)0,
> > +     (char *)0,
> > +     (char *)0,
> > +     (char *)0,
> > +     (char *)0,
> > +};
> > +
> > +static const int __nenv = ARRAY_SIZE(__env);
> > +
> > +/*
> > + * kdbgetenv - This function will return the character string value of
> > + *   an environment variable.
> > + * Parameters:
> > + *   match   A character string representing an environment variable.
> > + * Returns:
> > + *   NULL    No environment variable matches 'match'
> > + *   char*   Pointer to string value of environment variable.
> > + */
> > +char *kdbgetenv(const char *match)
> > +{
> > +     char **ep = __env;
> > +     int matchlen = strlen(match);
> > +     int i;
> > +
> > +     for (i = 0; i < __nenv; i++) {
> > +             char *e = *ep++;
> > +
> > +             if (!e)
> > +                     continue;
> > +
> > +             if ((strncmp(match, e, matchlen) == 0)
> > +              && ((e[matchlen] == '\0')
> > +                || (e[matchlen] == '='))) {
> > +                     char *cp = strchr(e, '=');
> > +
> > +                     return cp ? ++cp : "";
> > +             }
> > +     }
> > +     return NULL;
> > +}
> > +
> > +/*
> > + * kdballocenv - This function is used to allocate bytes for
> > + *   environment entries.
> > + * Parameters:
> > + *   match   A character string representing a numeric value
> > + * Outputs:
> > + *   *value  the unsigned long representation of the env variable 'match'
> > + * Returns:
> > + *   Zero on success, a kdb diagnostic on failure.
> > + * Remarks:
> > + *   We use a static environment buffer (envbuffer) to hold the values
> > + *   of dynamically generated environment variables (see kdb_set).  Buffer
> > + *   space once allocated is never free'd, so over time, the amount of space
> > + *   (currently 512 bytes) will be exhausted if env variables are changed
> > + *   frequently.
> > + */
> > +static char *kdballocenv(size_t bytes)
> > +{
> > +#define      KDB_ENVBUFSIZE  512
> > +     static char envbuffer[KDB_ENVBUFSIZE];
> > +     static int envbufsize;
> > +     char *ep = NULL;
> > +
> > +     if ((KDB_ENVBUFSIZE - envbufsize) >= bytes) {
> > +             ep = &envbuffer[envbufsize];
> > +             envbufsize += bytes;
> > +     }
> > +     return ep;
> > +}
> > +
> > +/*
> > + * kdbgetulenv - This function will return the value of an unsigned
> > + *   long-valued environment variable.
> > + * Parameters:
> > + *   match   A character string representing a numeric value
> > + * Outputs:
> > + *   *value  the unsigned long represntation of the env variable 'match'
> > + * Returns:
> > + *   Zero on success, a kdb diagnostic on failure.
> > + */
> > +int kdbgetulenv(const char *match, unsigned long *value)
> > +{
> > +     char *ep;
> > +
> > +     ep = kdbgetenv(match);
> > +     if (!ep)
> > +             return KDB_NOTENV;
> > +     if (strlen(ep) == 0)
> > +             return KDB_NOENVVALUE;
> > +
> > +     *value = simple_strtoul(ep, NULL, 0);
> > +
> > +     return 0;
> > +}
> > +
> > +/*
> > + * kdbgetintenv - This function will return the value of an
> > + *   integer-valued environment variable.
> > + * Parameters:
> > + *   match   A character string representing an integer-valued env variable
> > + * Outputs:
> > + *   *value  the integer representation of the environment variable 'match'
> > + * Returns:
> > + *   Zero on success, a kdb diagnostic on failure.
> > + */
> > +int kdbgetintenv(const char *match, int *value)
> > +{
> > +     unsigned long val;
> > +     int diag;
> > +
> > +     diag = kdbgetulenv(match, &val);
> > +     if (!diag)
> > +             *value = (int) val;
> > +     return diag;
> > +}
> > +
> > +/*
> > + * kdb_setenv - Alter an existing environment variable or create a new one.
> > + * Parameters:
> > + *   var     name of the variable
> > + *   val     value of the variable
> > + * Returns:
> > + *   Zero on success, a kdb diagnostic on failure.
> > + */
> > +int kdb_setenv(const char *var, const char *val)
> > +{
> > +     int i;
> > +     char *ep;
> > +     size_t varlen, vallen;
> > +
> > +     varlen = strlen(var);
> > +     vallen = strlen(val);
> > +     ep = kdballocenv(varlen + vallen + 2);
> > +     if (ep == (char *)0)
> > +             return KDB_ENVBUFFULL;
> > +
> > +     sprintf(ep, "%s=%s", var, val);
> > +
> > +     ep[varlen+vallen+1] = '\0';
> > +
> > +     for (i = 0; i < __nenv; i++) {
> > +             if (__env[i]
> > +              && ((strncmp(__env[i], var, varlen) == 0)
> > +                && ((__env[i][varlen] == '\0')
> > +                 || (__env[i][varlen] == '=')))) {
> > +                     __env[i] = ep;
> > +                     return 0;
> > +             }
> > +     }
> > +
> > +     /*
> > +      * Wasn't existing variable.  Fit into slot.
> > +      */
> > +     for (i = 0; i < __nenv-1; i++) {
> > +             if (__env[i] == (char *)0) {
> > +                     __env[i] = ep;
> > +                     return 0;
> > +             }
> > +     }
> > +
> > +     return KDB_ENVFULL;
> > +}
> > +
> > +/*
> > + * kdb_prienv - Display the current environment variables.
> > + */
> > +void kdb_prienv(void)
> > +{
> > +     int i;
> > +
> > +     for (i = 0; i < __nenv; i++) {
> > +             if (__env[i])
> > +                     kdb_printf("%s\n", __env[i]);
> > +     }
> > +}
> > diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> > index a0989a0..03ba161 100644
> > --- a/kernel/debug/kdb/kdb_main.c
> > +++ b/kernel/debug/kdb/kdb_main.c
> > @@ -129,57 +129,6 @@ static kdbmsg_t kdbmsgs[] = {
> >
> >  static const int __nkdb_err = ARRAY_SIZE(kdbmsgs);
> >
> > -
> > -/*
> > - * Initial environment.   This is all kept static and local to
> > - * this file.   We don't want to rely on the memory allocation
> > - * mechanisms in the kernel, so we use a very limited allocate-only
> > - * heap for new and altered environment variables.  The entire
> > - * environment is limited to a fixed number of entries (add more
> > - * to __env[] if required) and a fixed amount of heap (add more to
> > - * KDB_ENVBUFSIZE if required).
> > - */
> > -
> > -static char *__env[] = {
> > -#if defined(CONFIG_SMP)
> > - "PROMPT=[%d]kdb> ",
> > -#else
> > - "PROMPT=kdb> ",
> > -#endif
> > - "MOREPROMPT=more> ",
> > - "RADIX=16",
> > - "MDCOUNT=8",                        /* lines of md output */
> > - KDB_PLATFORM_ENV,
> > - "DTABCOUNT=30",
> > - "NOSECT=1",
> > - (char *)0,
> > - (char *)0,
> > - (char *)0,
> > - (char *)0,
> > - (char *)0,
> > - (char *)0,
> > - (char *)0,
> > - (char *)0,
> > - (char *)0,
> > - (char *)0,
> > - (char *)0,
> > - (char *)0,
> > - (char *)0,
> > - (char *)0,
> > - (char *)0,
> > - (char *)0,
> > - (char *)0,
> > - (char *)0,
> > - (char *)0,
> > - (char *)0,
> > - (char *)0,
> > - (char *)0,
> > - (char *)0,
> > - (char *)0,
> > -};
> > -
> > -static const int __nenv = ARRAY_SIZE(__env);
> > -
> >  struct task_struct *kdb_curr_task(int cpu)
> >  {
> >       struct task_struct *p = curr_task(cpu);
> > @@ -211,113 +160,6 @@ static inline bool kdb_check_flags(kdb_cmdflags_t flags, int permissions,
> >  }
> >
> >  /*
> > - * kdbgetenv - This function will return the character string value of
> > - *   an environment variable.
> > - * Parameters:
> > - *   match   A character string representing an environment variable.
> > - * Returns:
> > - *   NULL    No environment variable matches 'match'
> > - *   char*   Pointer to string value of environment variable.
> > - */
> > -char *kdbgetenv(const char *match)
> > -{
> > -     char **ep = __env;
> > -     int matchlen = strlen(match);
> > -     int i;
> > -
> > -     for (i = 0; i < __nenv; i++) {
> > -             char *e = *ep++;
> > -
> > -             if (!e)
> > -                     continue;
> > -
> > -             if ((strncmp(match, e, matchlen) == 0)
> > -              && ((e[matchlen] == '\0')
> > -                || (e[matchlen] == '='))) {
> > -                     char *cp = strchr(e, '=');
> > -                     return cp ? ++cp : "";
> > -             }
> > -     }
> > -     return NULL;
> > -}
> > -
> > -/*
> > - * kdballocenv - This function is used to allocate bytes for
> > - *   environment entries.
> > - * Parameters:
> > - *   match   A character string representing a numeric value
> > - * Outputs:
> > - *   *value  the unsigned long representation of the env variable 'match'
> > - * Returns:
> > - *   Zero on success, a kdb diagnostic on failure.
> > - * Remarks:
> > - *   We use a static environment buffer (envbuffer) to hold the values
> > - *   of dynamically generated environment variables (see kdb_set).  Buffer
> > - *   space once allocated is never free'd, so over time, the amount of space
> > - *   (currently 512 bytes) will be exhausted if env variables are changed
> > - *   frequently.
> > - */
> > -static char *kdballocenv(size_t bytes)
> > -{
> > -#define      KDB_ENVBUFSIZE  512
> > -     static char envbuffer[KDB_ENVBUFSIZE];
> > -     static int envbufsize;
> > -     char *ep = NULL;
> > -
> > -     if ((KDB_ENVBUFSIZE - envbufsize) >= bytes) {
> > -             ep = &envbuffer[envbufsize];
> > -             envbufsize += bytes;
> > -     }
> > -     return ep;
> > -}
> > -
> > -/*
> > - * kdbgetulenv - This function will return the value of an unsigned
> > - *   long-valued environment variable.
> > - * Parameters:
> > - *   match   A character string representing a numeric value
> > - * Outputs:
> > - *   *value  the unsigned long represntation of the env variable 'match'
> > - * Returns:
> > - *   Zero on success, a kdb diagnostic on failure.
> > - */
> > -static int kdbgetulenv(const char *match, unsigned long *value)
> > -{
> > -     char *ep;
> > -
> > -     ep = kdbgetenv(match);
> > -     if (!ep)
> > -             return KDB_NOTENV;
> > -     if (strlen(ep) == 0)
> > -             return KDB_NOENVVALUE;
> > -
> > -     *value = simple_strtoul(ep, NULL, 0);
> > -
> > -     return 0;
> > -}
> > -
> > -/*
> > - * kdbgetintenv - This function will return the value of an
> > - *   integer-valued environment variable.
> > - * Parameters:
> > - *   match   A character string representing an integer-valued env variable
> > - * Outputs:
> > - *   *value  the integer representation of the environment variable 'match'
> > - * Returns:
> > - *   Zero on success, a kdb diagnostic on failure.
> > - */
> > -int kdbgetintenv(const char *match, int *value)
> > -{
> > -     unsigned long val;
> > -     int diag;
> > -
> > -     diag = kdbgetulenv(match, &val);
> > -     if (!diag)
> > -             *value = (int) val;
> > -     return diag;
> > -}
> > -
> > -/*
> >   * kdbgetularg - This function will convert a numeric string into an
> >   *   unsigned long value.
> >   * Parameters:
> > @@ -374,10 +216,6 @@ int kdbgetu64arg(const char *arg, u64 *value)
> >   */
> >  int kdb_set(int argc, const char **argv)
> >  {
> > -     int i;
> > -     char *ep;
> > -     size_t varlen, vallen;
> > -
> >       /*
> >        * we can be invoked two ways:
> >        *   set var=value    argv[1]="var", argv[2]="value"
> > @@ -422,37 +260,7 @@ int kdb_set(int argc, const char **argv)
> >        * Tokenizer squashed the '=' sign.  argv[1] is variable
> >        * name, argv[2] = value.
> >        */
> > -     varlen = strlen(argv[1]);
> > -     vallen = strlen(argv[2]);
> > -     ep = kdballocenv(varlen + vallen + 2);
> > -     if (ep == (char *)0)
> > -             return KDB_ENVBUFFULL;
> > -
> > -     sprintf(ep, "%s=%s", argv[1], argv[2]);
> > -
> > -     ep[varlen+vallen+1] = '\0';
> > -
> > -     for (i = 0; i < __nenv; i++) {
> > -             if (__env[i]
> > -              && ((strncmp(__env[i], argv[1], varlen) == 0)
> > -                && ((__env[i][varlen] == '\0')
> > -                 || (__env[i][varlen] == '=')))) {
> > -                     __env[i] = ep;
> > -                     return 0;
> > -             }
> > -     }
> > -
> > -     /*
> > -      * Wasn't existing variable.  Fit into slot.
> > -      */
> > -     for (i = 0; i < __nenv-1; i++) {
> > -             if (__env[i] == (char *)0) {
> > -                     __env[i] = ep;
> > -                     return 0;
> > -             }
> > -     }
> > -
> > -     return KDB_ENVFULL;
> > +     return kdb_setenv(argv[1], argv[2]);
> >  }
> >
> >  static int kdb_check_regs(void)
> > @@ -2056,12 +1864,7 @@ static int kdb_lsmod(int argc, const char **argv)
> >
> >  static int kdb_env(int argc, const char **argv)
> >  {
> > -     int i;
> > -
> > -     for (i = 0; i < __nenv; i++) {
> > -             if (__env[i])
> > -                     kdb_printf("%s\n", __env[i]);
> > -     }
> > +     kdb_prienv();
> >
> >       if (KDB_DEBUG(MASK))
> >               kdb_printf("KDBDEBUG=0x%x\n",
> > diff --git a/kernel/debug/kdb/kdb_private.h b/kernel/debug/kdb/kdb_private.h
> > index 4b2f79e..ae43a13 100644
> > --- a/kernel/debug/kdb/kdb_private.h
> > +++ b/kernel/debug/kdb/kdb_private.h
> > @@ -105,6 +105,9 @@ extern int kdb_putword(unsigned long, unsigned long, size_t);
> >  extern int kdbgetularg(const char *, unsigned long *);
> >  extern int kdbgetu64arg(const char *, u64 *);
> >  extern char *kdbgetenv(const char *);
> > +extern int kdbgetulenv(const char *match, unsigned long *value);
> > +extern int kdb_setenv(const char *var, const char *val);
> > +extern void kdb_prienv(void);
> >  extern int kdbgetaddrarg(int, const char **, int*, unsigned long *,
> >                        long *, char **);
> >  extern int kdbgetsymval(const char *, kdb_symtab_t *);
> > --
> > 2.7.4
> >


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
