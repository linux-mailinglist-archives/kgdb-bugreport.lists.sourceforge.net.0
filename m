Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 173F53457E0
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 23 Mar 2021 07:38:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lOagS-0005aT-R8
	for lists+kgdb-bugreport@lfdr.de; Tue, 23 Mar 2021 06:38:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1lOagR-0005aM-Ka
 for kgdb-bugreport@lists.sourceforge.net; Tue, 23 Mar 2021 06:38:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PSlBc3ZngBpiSOBHU+TuOOm2Zx3vcQzp5yg+cLCt4ag=; b=WdM1l89ZJTDtQ6dsaVZNnJRaOd
 6sNlHDQT8xtH6G2r9CjbhydrMiiSjrEqLb0gLRXDLycIK2MDr4jj730hBfc5Z4Tz2aIjCt16QJWrx
 /VVGsB1tkkVoM7WVwAmMG1/ogy6xK2C1UWybWpseaoIizXzkBnHD0b8IlYms7oAyrX0U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PSlBc3ZngBpiSOBHU+TuOOm2Zx3vcQzp5yg+cLCt4ag=; b=fuQ7Ex2g7L/xCo/OpLcmieK+/U
 6KgG+16aJvG+KhhlAYgAcnyPqqg+fppuQtQSgX5tFG7fba12ydHIcPIgaB6hVY+ZYuwotKVV7pyXv
 GwL6Sya+/eSIyTEvkaYx5ukHcN6VB3SG4Or3d2LxOJguWhONmoV9G8pV6Wmm+mCxHwEs=;
Received: from mail-lf1-f52.google.com ([209.85.167.52])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lOagM-00HXNl-TE
 for kgdb-bugreport@lists.sourceforge.net; Tue, 23 Mar 2021 06:38:31 +0000
Received: by mail-lf1-f52.google.com with SMTP id m12so24988408lfq.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Mar 2021 23:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PSlBc3ZngBpiSOBHU+TuOOm2Zx3vcQzp5yg+cLCt4ag=;
 b=sHrT681rY+0rIwjIqOBRu7J9IpoeGE2rE0Y3NSnZTcNAXypXgMrWVutpPgxtwOHyuX
 922KwstH6XNi1q/iWJyU46kRCF81jmAPK0yI8VqrpTwYJFE/c5tsrugr3S+JQFYm1+3L
 LSMIf6kAHbpWYnO5jLR6Q1Nkip5n/+4vuvu1sCm2rFdwHFL5xFjimtM23S/0iP8CqmWJ
 uKNMjv6jnTH+je4f6tcdfJ6/LHX3IbNOEKsA15IeemXsqClwC4qjsS9rM/8iCqmoYctC
 epAlQkU+LimfxQoRWfLE7ed7Vxay63aF0K4XI8ZLWmhDgHfa/0iOK6XVzCvbv/USN5EV
 2/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PSlBc3ZngBpiSOBHU+TuOOm2Zx3vcQzp5yg+cLCt4ag=;
 b=q+f216GCFOlwZQbtyySSXHfgkNgWF2u+BYOMyjwhmFmuhgWJo6FUGZHFTiMo/k41aT
 /jZIwK0KeG1kgnT0kMlEv9fqe0JSPkGIGizj3kmRmIkkrLruM8t0qj1c21iVOth9Fy4A
 8i6BBd+6wVgtKG5dFMu0lf5woYrrXCzx9zqRShXFmazBr7P147qpzzJ5EKktC12FFoDY
 k81xlZj+cGNXIIAVENBWIMrjnlFrndLos1cw8we01845AjJZ+QlJpog4WeTJHr5P1XgG
 8YSo+lbFfYnOTI2ALF9w5iKxaennZWwMA/AUiVJ3InLjNkE5JDZ0z8Gg1UBazOW5pAq3
 Wodg==
X-Gm-Message-State: AOAM533cXDD2oyUwsGx5z+7YrQKLRTk5ir58U7h1DcTftl7sMWde9Oh0
 lCBlaqV24YSWi5QSMo9f1ftbyCtNjYui8qnsVgz3Cw==
X-Google-Smtp-Source: ABdhPJzU/VYeEgd9/jJllXeRBEjovJjqw5mvv74HaXJ0ebymNLYQruEx7PoOrA7PNN8fYODvuLCV5mq2N26T0Kx017Q=
X-Received: by 2002:ac2:46db:: with SMTP id p27mr1747028lfo.396.1616481500301; 
 Mon, 22 Mar 2021 23:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <1612771342-16883-1-git-send-email-sumit.garg@linaro.org>
In-Reply-To: <1612771342-16883-1-git-send-email-sumit.garg@linaro.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 23 Mar 2021 12:08:09 +0530
Message-ID: <CAFA6WYPPTivcLW8D+_nRdc4M1FLr21cbNt81BXYgbb7T3odaWw@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.52 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.52 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lOagM-00HXNl-TE
Subject: Re: [Kgdb-bugreport] [PATCH v3] kdb: Refactor env variables get/set
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

Hi Daniel,

On Mon, 8 Feb 2021 at 13:32, Sumit Garg <sumit.garg@linaro.org> wrote:
>
> Add two new kdb environment access methods as kdb_setenv() and
> kdb_printenv() in order to abstract out environment access code
> from kdb command functions.
>
> Also, replace (char *)0 with NULL as an initializer for environment
> variables array.
>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v3:
> - Remove redundant '\0' char assignment.
> - Pick up Doug's review tag.
>
> Changes in v2:
> - Get rid of code motion to separate kdb_env.c file.
> - Replace (char *)0 with NULL.
> - Use kernel-doc style function comments.
> - s/kdb_prienv/kdb_printenv/
>
>  kernel/debug/kdb/kdb_main.c | 164 ++++++++++++++++++++++++--------------------
>  1 file changed, 91 insertions(+), 73 deletions(-)
>

Do you have any further comments on this? If no, can you pick this up as well?

-Sumit

> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index 588062a..69b8f55 100644
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -142,40 +142,40 @@ static const int __nkdb_err = ARRAY_SIZE(kdbmsgs);
>
>  static char *__env[] = {
>  #if defined(CONFIG_SMP)
> - "PROMPT=[%d]kdb> ",
> +       "PROMPT=[%d]kdb> ",
>  #else
> - "PROMPT=kdb> ",
> +       "PROMPT=kdb> ",
>  #endif
> - "MOREPROMPT=more> ",
> - "RADIX=16",
> - "MDCOUNT=8",                  /* lines of md output */
> - KDB_PLATFORM_ENV,
> - "DTABCOUNT=30",
> - "NOSECT=1",
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> +       "MOREPROMPT=more> ",
> +       "RADIX=16",
> +       "MDCOUNT=8",            /* lines of md output */
> +       KDB_PLATFORM_ENV,
> +       "DTABCOUNT=30",
> +       "NOSECT=1",
> +       NULL,
> +       NULL,
> +       NULL,
> +       NULL,
> +       NULL,
> +       NULL,
> +       NULL,
> +       NULL,
> +       NULL,
> +       NULL,
> +       NULL,
> +       NULL,
> +       NULL,
> +       NULL,
> +       NULL,
> +       NULL,
> +       NULL,
> +       NULL,
> +       NULL,
> +       NULL,
> +       NULL,
> +       NULL,
> +       NULL,
> +       NULL,
>  };
>
>  static const int __nenv = ARRAY_SIZE(__env);
> @@ -318,6 +318,63 @@ int kdbgetintenv(const char *match, int *value)
>  }
>
>  /*
> + * kdb_setenv() - Alter an existing environment variable or create a new one.
> + * @var: Name of the variable
> + * @val: Value of the variable
> + *
> + * Return: Zero on success, a kdb diagnostic on failure.
> + */
> +static int kdb_setenv(const char *var, const char *val)
> +{
> +       int i;
> +       char *ep;
> +       size_t varlen, vallen;
> +
> +       varlen = strlen(var);
> +       vallen = strlen(val);
> +       ep = kdballocenv(varlen + vallen + 2);
> +       if (ep == (char *)0)
> +               return KDB_ENVBUFFULL;
> +
> +       sprintf(ep, "%s=%s", var, val);
> +
> +       for (i = 0; i < __nenv; i++) {
> +               if (__env[i]
> +                && ((strncmp(__env[i], var, varlen) == 0)
> +                  && ((__env[i][varlen] == '\0')
> +                   || (__env[i][varlen] == '=')))) {
> +                       __env[i] = ep;
> +                       return 0;
> +               }
> +       }
> +
> +       /*
> +        * Wasn't existing variable.  Fit into slot.
> +        */
> +       for (i = 0; i < __nenv-1; i++) {
> +               if (__env[i] == (char *)0) {
> +                       __env[i] = ep;
> +                       return 0;
> +               }
> +       }
> +
> +       return KDB_ENVFULL;
> +}
> +
> +/*
> + * kdb_printenv() - Display the current environment variables.
> + */
> +static void kdb_printenv(void)
> +{
> +       int i;
> +
> +       for (i = 0; i < __nenv; i++) {
> +               if (__env[i])
> +                       kdb_printf("%s\n", __env[i]);
> +       }
> +}
> +
> +/*
>   * kdbgetularg - This function will convert a numeric string into an
>   *     unsigned long value.
>   * Parameters:
> @@ -374,10 +431,6 @@ int kdbgetu64arg(const char *arg, u64 *value)
>   */
>  int kdb_set(int argc, const char **argv)
>  {
> -       int i;
> -       char *ep;
> -       size_t varlen, vallen;
> -
>         /*
>          * we can be invoked two ways:
>          *   set var=value    argv[1]="var", argv[2]="value"
> @@ -422,37 +475,7 @@ int kdb_set(int argc, const char **argv)
>          * Tokenizer squashed the '=' sign.  argv[1] is variable
>          * name, argv[2] = value.
>          */
> -       varlen = strlen(argv[1]);
> -       vallen = strlen(argv[2]);
> -       ep = kdballocenv(varlen + vallen + 2);
> -       if (ep == (char *)0)
> -               return KDB_ENVBUFFULL;
> -
> -       sprintf(ep, "%s=%s", argv[1], argv[2]);
> -
> -       ep[varlen+vallen+1] = '\0';
> -
> -       for (i = 0; i < __nenv; i++) {
> -               if (__env[i]
> -                && ((strncmp(__env[i], argv[1], varlen) == 0)
> -                  && ((__env[i][varlen] == '\0')
> -                   || (__env[i][varlen] == '=')))) {
> -                       __env[i] = ep;
> -                       return 0;
> -               }
> -       }
> -
> -       /*
> -        * Wasn't existing variable.  Fit into slot.
> -        */
> -       for (i = 0; i < __nenv-1; i++) {
> -               if (__env[i] == (char *)0) {
> -                       __env[i] = ep;
> -                       return 0;
> -               }
> -       }
> -
> -       return KDB_ENVFULL;
> +       return kdb_setenv(argv[1], argv[2]);
>  }
>
>  static int kdb_check_regs(void)
> @@ -2055,12 +2078,7 @@ static int kdb_lsmod(int argc, const char **argv)
>
>  static int kdb_env(int argc, const char **argv)
>  {
> -       int i;
> -
> -       for (i = 0; i < __nenv; i++) {
> -               if (__env[i])
> -                       kdb_printf("%s\n", __env[i]);
> -       }
> +       kdb_printenv();
>
>         if (KDB_DEBUG(MASK))
>                 kdb_printf("KDBDEBUG=0x%x\n",
> --
> 2.7.4
>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
