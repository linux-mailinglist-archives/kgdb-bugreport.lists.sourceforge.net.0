Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5243C2B2A
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 10 Jul 2021 00:07:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1m1yf6-0002sN-Bi
	for lists+kgdb-bugreport@lfdr.de; Fri, 09 Jul 2021 22:07:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1m1yf5-0002sA-3b
 for kgdb-bugreport@lists.sourceforge.net; Fri, 09 Jul 2021 22:07:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9SS6R9gYCanZZ2a5AF9Vn6YGG3Ugen51EagpNmwizlw=; b=ZJ6DnU7JIQ25F+g3lMrfC3PGsL
 iZn+9mPiRHdbP5yu5JTcr70m8qUNp6VfLDvN/ClZ+fPh8VKmkUk8i80soxHWyxDrWYcqZZwXjiPBG
 roERu13dyj47Glqiv4Yl6w6gbABGa8DoIVy/nKKGGVTAd+MOhpLgsQs1qd2/wEcg0Bgk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9SS6R9gYCanZZ2a5AF9Vn6YGG3Ugen51EagpNmwizlw=; b=Fm+TT547lPtMYIm6Y5zHpPZSz9
 CoEq7IaxBHYxEwD+UbxL+Zg7botBMJsnRL29SCJtkmJkiXtCH7hlMwb6YKH4N84IqXhXPnKMoW/WK
 eiJkwv6m0k/k4sKQD2s4FooPpvClJ5fChJAD764BH4I+1VnpQPpIxF22Kl7KPe38f9M0=;
Received: from mail-qt1-f170.google.com ([209.85.160.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m1yf0-0005dD-Ke
 for kgdb-bugreport@lists.sourceforge.net; Fri, 09 Jul 2021 22:07:55 +0000
Received: by mail-qt1-f170.google.com with SMTP id g12so8663748qtb.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 09 Jul 2021 15:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9SS6R9gYCanZZ2a5AF9Vn6YGG3Ugen51EagpNmwizlw=;
 b=htXTjgiymu14ekBEb8CWzMGrlJ9B2S1blxXfmo9C+AihKwhFyOTkmUrMDXhrCaQTuK
 RPNDVtqc7OvOaIw4+XeCXfhbbuFfF7TuNdRpCS7J8koCgiiEfrSLSisSmfPpSsvSjd1I
 bKDgNgGM2McaV8qVmzAkjkuPuFNPUcKf7Tg94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9SS6R9gYCanZZ2a5AF9Vn6YGG3Ugen51EagpNmwizlw=;
 b=tlhcFvAcCmc52DZvj+aPIwEtg2ZjHuKtK70UrFdeYhJd1ytJVbCveh2OmGVo27OHBY
 IwzrH8Kr31XKRjMMcz5zCnTSjVcN2jsknf/8H78MFeajFA1MtHz7uqHbPD9LcE9ZdUhY
 ClAFXx0HCzFOX6CNV7XtKhePPCp4SSHlO6neRiW3TeMu5Zl16nSbYdx9dBBXPaDZ4a0S
 vseo7ITgRyrcSzjl8R94KFEDbekTU95QgTXJBGsWvMr7d2CW11dMv5eqx54N9fGcuOWh
 TihUgpWVBmO/UI8iUadjS5nWb+JQh4ozf3/LPvgQXLlceznqZ1wbUfeL9eZ+Irw9ULaZ
 9jrQ==
X-Gm-Message-State: AOAM530gN5fMZG8rTV7ztqNNrrj6A9Lthu4DZ/6NgA/YnOoFw0PfOYef
 rt4JNcAhQXuZ7cJdCh70bU9ZlfnQVGmtqg==
X-Google-Smtp-Source: ABdhPJwyZrFEz0zA2LhjrksZ/qbyEEgneG5ICZIEzO9EDR5njeGo43Mkre2K9rh+fq1xmO3Mhqm7Bw==
X-Received: by 2002:a37:64c9:: with SMTP id
 y192mr32632291qkb.190.1625866665826; 
 Fri, 09 Jul 2021 14:37:45 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com.
 [209.85.219.172])
 by smtp.gmail.com with ESMTPSA id r2sm3017931qkf.94.2021.07.09.14.37.45
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 14:37:45 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id y38so16686651ybi.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 09 Jul 2021 14:37:45 -0700 (PDT)
X-Received: by 2002:a25:80d4:: with SMTP id c20mr48976818ybm.345.1625866664715; 
 Fri, 09 Jul 2021 14:37:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210709104320.101568-1-sumit.garg@linaro.org>
 <20210709104320.101568-5-sumit.garg@linaro.org>
In-Reply-To: <20210709104320.101568-5-sumit.garg@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 9 Jul 2021 14:37:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UqBPV_HQfu++j4yJ2nEN7tzFScnoYQFUhNuXE82OBDhg@mail.gmail.com>
Message-ID: <CAD=FV=UqBPV_HQfu++j4yJ2nEN7tzFScnoYQFUhNuXE82OBDhg@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.170 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.160.170 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m1yf0-0005dD-Ke
Subject: Re: [Kgdb-bugreport] [PATCH v4 4/4] kdb: Rename members of struct
 kdbtab_t
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
 kgdb-bugreport@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Fri, Jul 9, 2021 at 3:44 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> @@ -711,10 +711,10 @@ static int kdb_defcmd(int argc, const char **argv)
>                 struct kdb_macro_statement_t *kmc;
>
>                 list_for_each_entry(kp, &kdb_cmds_head, list_node) {
> -                       if (kp->cmd_func == kdb_exec_defcmd) {
> +                       if (kp->func == kdb_exec_defcmd) {
>                                 kdb_printf("defcmd %s \"%s\" \"%s\"\n",
> -                                          kp->cmd_name, kp->cmd_usage,
> -                                          kp->cmd_help);
> +                                          kp->name, kp->usage,
> +                                          kp->help);

The call could probably be squashed down to 2 lines instead of 3 now.


> @@ -1031,8 +1031,8 @@ int kdb_parse(const char *cmdstr)
>          */
>         if (list_entry_is_head(tp, &kdb_cmds_head, list_node)) {
>                 list_for_each_entry(tp, &kdb_cmds_head, list_node) {
> -                       if (strncmp(argv[0], tp->cmd_name,
> -                                   strlen(tp->cmd_name)) == 0)
> +                       if (strncmp(argv[0], tp->name,
> +                                   strlen(tp->name)) == 0)

Squash down to one line now that it's shorter.


The word wrapping isn't really a huge deal to me, though, so:

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
