Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A6430297B
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 25 Jan 2021 19:02:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l46CK-0001jy-V6
	for lists+kgdb-bugreport@lfdr.de; Mon, 25 Jan 2021 18:02:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1l46CJ-0001jq-Q6
 for kgdb-bugreport@lists.sourceforge.net; Mon, 25 Jan 2021 18:02:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CJVXJuyW7H14KUujbq0Aw5+4UYDRldtBQ9ARKdU7pfc=; b=MP5wUlfXgqM25Zwpqb+Xu9nwOo
 v6rtCLw+6V0JVGpQqjuxOnpOLnovVrwdkQ9meNoIz5S6CpyutfqCZ1b4CMZoE5YuCG0/rhRHScA9r
 nGPh6GCTkOmIQuDQ9GsfqOzIZoL6oWFW77tIRbg3xzHTCpspydeZjLo8GWDgqUxN9nQM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CJVXJuyW7H14KUujbq0Aw5+4UYDRldtBQ9ARKdU7pfc=; b=O1y6mdpVKxsWVmbyhvK1Qthy8K
 gP1PLd/RvxBDRmm5YwmKL09GftGEy3CA6jIpQRKLgjwlAhKMRE+c0jbfdLqqfTGamH1WFT+eo6Geh
 5sMDQ78EiBYTdPxKdpb4h4jPhDjPRkd/5Vt7PeIspnIQVyjJ33N9fcYeC+f6v6L3MvXk=;
Received: from mail-qv1-f43.google.com ([209.85.219.43])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l46CC-007AM3-Dh
 for kgdb-bugreport@lists.sourceforge.net; Mon, 25 Jan 2021 18:02:43 +0000
Received: by mail-qv1-f43.google.com with SMTP id es14so2793772qvb.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 25 Jan 2021 10:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CJVXJuyW7H14KUujbq0Aw5+4UYDRldtBQ9ARKdU7pfc=;
 b=V02/tqIeWN9k6baGIkOZa5qRb0dnmLGT08ooOqG0KGPbxRokSCaseg9pHwS+Pfa0AY
 FGCmFCk24znum2auG7MN1nt8ad1gYn12+jgu7v8sxQjlUKc1u3HTmkK7rbwhLfOGt1Rd
 UMV9Id09NsQOI4i2hKdHgyMVhMNuh/kRXrM9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CJVXJuyW7H14KUujbq0Aw5+4UYDRldtBQ9ARKdU7pfc=;
 b=FOJmgZLUXpe9EDeTycEMq6r+P98NAn8l8/zmdKGd/6sxMYEeNB3nrDnYnk9n5cWqS2
 cU1lkeIi2wmPDQ/RjtspKz0o2bHW8gg22k+fJe+2Q61LRffnEjE6WGP5htwXqm7JMxyB
 40m4jmW4uGGWa1bpDRb3glxlcIdAfv22GqZk4Q0zyJuion7zikI0MRN7I9N+UgrTuP21
 jfzUNKUBikcUh0MS8neDBNNdHmnutQ8ydhSDNLJyf+GssdbyGYFA70AdUciYBO0wTT3E
 oAZYAmUl8MlJeazzenMW3qvzpvGXmeMDxrqk/zpJXXANHS1qEjP0HdZsyeS8yHDPBQZH
 mi/A==
X-Gm-Message-State: AOAM533aQJA0dRQN2JosEzWwpy6yhfdwXsff0/4KLY9pxIbJuvPs6sfy
 gWmv1EcIFCctH7jCKgMK4SseamohmLu40g==
X-Google-Smtp-Source: ABdhPJxFY8JZCQ0j/37vfAB/74sgkj11yYhQEXsa1Lzhr9qwA4xGjFLWFPboge04czMX8w+fNaIUow==
X-Received: by 2002:a1f:ae89:: with SMTP id x131mr1671055vke.8.1611597372414; 
 Mon, 25 Jan 2021 09:56:12 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com.
 [209.85.222.48])
 by smtp.gmail.com with ESMTPSA id a22sm2642686vkm.0.2021.01.25.09.56.11
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 09:56:11 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a31so4707071uae.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 25 Jan 2021 09:56:11 -0800 (PST)
X-Received: by 2002:ab0:5a70:: with SMTP id m45mr1463516uad.121.1611597371160; 
 Mon, 25 Jan 2021 09:56:11 -0800 (PST)
MIME-Version: 1.0
References: <1611400441-7178-1-git-send-email-stephenzhangzsd@gmail.com>
In-Reply-To: <1611400441-7178-1-git-send-email-stephenzhangzsd@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 25 Jan 2021 09:55:58 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V6iEr5Xj53hvrQK+48xGm=s_GYQuyD_vgMM3Zknw5yOw@mail.gmail.com>
Message-ID: <CAD=FV=V6iEr5Xj53hvrQK+48xGm=s_GYQuyD_vgMM3Zknw5yOw@mail.gmail.com>
To: Stephen Zhang <stephenzhangzsd@gmail.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.43 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.43 listed in wl.mailspike.net]
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l46CC-007AM3-Dh
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
 Daniel Thompson <daniel.thompson@linaro.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Sat, Jan 23, 2021 at 3:14 AM Stephen Zhang <stephenzhangzsd@gmail.com> wrote:
>
> Better to replace function name by %s in case of changes.
>
> Signed-off-by: Stephen Zhang <stephenzhangzsd@gmail.com>
> ---
>  kernel/debug/kdb/kdb_support.c | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/kernel/debug/kdb/kdb_support.c b/kernel/debug/kdb/kdb_support.c
> index 6226502..7a536fc 100644
> --- a/kernel/debug/kdb/kdb_support.c
> +++ b/kernel/debug/kdb/kdb_support.c
> @@ -40,19 +40,19 @@
>  int kdbgetsymval(const char *symname, kdb_symtab_t *symtab)
>  {
>         if (KDB_DEBUG(AR))
> -               kdb_printf("kdbgetsymval: symname=%s, symtab=%px\n", symname,
> +               kdb_printf("%s: symname=%s, symtab=%px\n", __func__, symname,

Given the common pattern:

if (KDB_DEBUG(AR))
  kdb_printf(...)

I wonder if we could improve this to this (untested):

#define kdb_ardbg_printf(format, ...) \
  do { \
    if (KDB_DEBUG(AR)) \
      kdb_printf("%s: " format, __func__, __VA_ARGS__); \
  } while (0)

Then the above just becomes:

kdb_ardbg_printf("symname=%s, symtab=%px\n", symname,


> @@ -435,7 +435,7 @@ int kdb_getphysword(unsigned long *word, unsigned long addr, size_t size)
>                 fallthrough;
>         default:
>                 diag = KDB_BADWIDTH;
> -               kdb_printf("kdb_getphysword: bad width %ld\n", (long) size);
> +               kdb_printf("%s: bad width %ld\n", __func__, (long) size);

Unrelated to your patch, but if you want a 2nd patch you could fix it
to not cast "size" to a long and use the proper format code for a
size_t (%zu)


> @@ -484,7 +484,7 @@ int kdb_getword(unsigned long *word, unsigned long addr, size_t size)
>                 fallthrough;
>         default:
>                 diag = KDB_BADWIDTH;
> -               kdb_printf("kdb_getword: bad width %ld\n", (long) size);
> +               kdb_printf("%s: bad width %ld\n", __func__, (long) size);

This also could get the correct format code.


> @@ -528,7 +528,7 @@ int kdb_putword(unsigned long addr, unsigned long word, size_t size)
>                 fallthrough;
>         default:
>                 diag = KDB_BADWIDTH;
> -               kdb_printf("kdb_putword: bad width %ld\n", (long) size);
> +               kdb_printf("%s: bad width %ld\n", __func__, (long) size);

...and this.

In any case, all my comments are nits and/or things that should happen
in a 2nd and your patch improves things.  Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
