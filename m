Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B67BE3C45CB
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 12 Jul 2021 09:17:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1m2qCC-0004Ye-G4
	for lists+kgdb-bugreport@lfdr.de; Mon, 12 Jul 2021 07:17:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <sumit.garg@linaro.org>) id 1m2qCA-0004YW-9z
 for kgdb-bugreport@lists.sourceforge.net; Mon, 12 Jul 2021 07:17:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wo5VZqy0CSVsN0ojiM8kCxZj5ttq9uBKj4mVUnzOgPA=; b=jTUTvfO6ZvtMdaR9mlO+jvE0xF
 BQTQnswtlFHg+O8RQ6H07WNO4X1DX9K1LkghjxLvKvVVT1cYbWYl6zKpF/fn6tS3Rc3t7DhlU0NTh
 5cOOsw1C+4We4LzVcISiRA1Nk4dFjt6N++Xhqh1d8IcqtfinfIuGBCKFr+uFYT71mTHY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Wo5VZqy0CSVsN0ojiM8kCxZj5ttq9uBKj4mVUnzOgPA=; b=bXA6g5YncyLqPq7kKKm0Y0VSFM
 NTtKgpr5fIqFNeKkVGx1qtNkF+oVYVZOGG6ug5cxI9Ob21BhLTZNQ7UkjmhkeW6JGbJ362keu9OGL
 I6UB7+EisqqKuS5McMmbfLW0n5jFxJxB4r4VhqOOrNVGXpSmgyljJjgTl3565cDd25F4=;
Received: from mail-lf1-f45.google.com ([209.85.167.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m2qBz-0007bR-Dd
 for kgdb-bugreport@lists.sourceforge.net; Mon, 12 Jul 2021 07:17:38 +0000
Received: by mail-lf1-f45.google.com with SMTP id b26so9035880lfo.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 12 Jul 2021 00:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wo5VZqy0CSVsN0ojiM8kCxZj5ttq9uBKj4mVUnzOgPA=;
 b=lUDfFU6JfeZbcHW/3gTYpRjCy0+1PkpjeFblxe1x78E2RjyaWhx1SIWHYe7JajuG0u
 c2j3g54ap4OA0p1/cri9sjfleD6UTF2G6M+bv4TWLh8nMfjjL+Ays6zQYfQy8reeMXqt
 Ej0BpcKkyhWsmmEkHu+ePoSq5HGpnRZMIPIqiLfYrpPCobPCKUy6+E/uhlErhHPKY5ba
 WeTNfQk7whdtvOrb9k1BEEiPf589NRHNl15M2KAA8x7D2Hfz9AO7wyj6m3b7zF2U62Aq
 5ehaSF0iCpMKISaaZYaJSrGJTvdjyhud8r/nbBAgWAg8mo18ENxF54Ju0hKvUDnEXCJV
 5Jtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wo5VZqy0CSVsN0ojiM8kCxZj5ttq9uBKj4mVUnzOgPA=;
 b=WcEKAo/8Wn5YNpmV9f/QBIXaOW5q8ccM45QfppodR2IFaSoXbb/J8Vw16Q3kzKR4tA
 83gMC2swWlTS6216YaYZ1rTcPJGO8vmhy9fkgFBLqXj/AYk3S0eK9GSY4HCPTqoCr1m+
 CFX+vZFWGBgezZxvRimxoAqsYBi4O/vHl7OWMYRYmdBhnCchDrTBQtOHzLGGOMBVpdCv
 QaCzlbVduX2dl/17xKoq6Z+FaIKy9N4IkX4PUWKFRaz+XPBCK67y9kKx2PPNhxl36pdE
 pQscrs2+3vtlTKihOtp1eFh8CkoALLhghfjoBAHvKr+T2OxTkoshL7mjQLziLc/HKw2M
 +VkQ==
X-Gm-Message-State: AOAM530dHSU4tmPjo40wxj8n9FhLR/DoBMDqkXSBdKRTuP6SgmzbYMYb
 XgFj3eumgJ3NFkxbI7MUJtHkG4S0AWBO36Qp8wWIfg==
X-Google-Smtp-Source: ABdhPJyr04XMJJlCelSpPAQoTSbn/SKwim1bVmAfudxDtIhw6zrWy+z2hfB1j26kbCCDKChKdm8BSTEbVM/O6C3MwDo=
X-Received: by 2002:a19:e002:: with SMTP id x2mr39218295lfg.84.1626074237649; 
 Mon, 12 Jul 2021 00:17:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210709104320.101568-1-sumit.garg@linaro.org>
 <20210709104320.101568-5-sumit.garg@linaro.org>
 <CAD=FV=UqBPV_HQfu++j4yJ2nEN7tzFScnoYQFUhNuXE82OBDhg@mail.gmail.com>
In-Reply-To: <CAD=FV=UqBPV_HQfu++j4yJ2nEN7tzFScnoYQFUhNuXE82OBDhg@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 12 Jul 2021 12:47:06 +0530
Message-ID: <CAFA6WYNeKSi4792tUROxqyz4guinnkLzsO8K61T5UUwjTcxZ2g@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.45 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.45 listed in wl.mailspike.net]
X-Headers-End: 1m2qBz-0007bR-Dd
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

On Sat, 10 Jul 2021 at 03:07, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Fri, Jul 9, 2021 at 3:44 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > @@ -711,10 +711,10 @@ static int kdb_defcmd(int argc, const char **argv)
> >                 struct kdb_macro_statement_t *kmc;
> >
> >                 list_for_each_entry(kp, &kdb_cmds_head, list_node) {
> > -                       if (kp->cmd_func == kdb_exec_defcmd) {
> > +                       if (kp->func == kdb_exec_defcmd) {
> >                                 kdb_printf("defcmd %s \"%s\" \"%s\"\n",
> > -                                          kp->cmd_name, kp->cmd_usage,
> > -                                          kp->cmd_help);
> > +                                          kp->name, kp->usage,
> > +                                          kp->help);
>
> The call could probably be squashed down to 2 lines instead of 3 now.
>

Ack.

>
> > @@ -1031,8 +1031,8 @@ int kdb_parse(const char *cmdstr)
> >          */
> >         if (list_entry_is_head(tp, &kdb_cmds_head, list_node)) {
> >                 list_for_each_entry(tp, &kdb_cmds_head, list_node) {
> > -                       if (strncmp(argv[0], tp->cmd_name,
> > -                                   strlen(tp->cmd_name)) == 0)
> > +                       if (strncmp(argv[0], tp->name,
> > +                                   strlen(tp->name)) == 0)
>
> Squash down to one line now that it's shorter.
>

Ack.

>
> The word wrapping isn't really a huge deal to me, though, so:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks,
-Sumit


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
