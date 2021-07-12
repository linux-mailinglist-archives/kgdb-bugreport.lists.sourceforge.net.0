Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5103C45C8
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 12 Jul 2021 09:16:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1m2qBN-0004Ud-5k
	for lists+kgdb-bugreport@lfdr.de; Mon, 12 Jul 2021 07:16:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <sumit.garg@linaro.org>) id 1m2qBK-0004UR-S7
 for kgdb-bugreport@lists.sourceforge.net; Mon, 12 Jul 2021 07:16:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wpdtDeV/Foprmlj1iz2xO9n3C3FzsT5HDEkASA0zUqE=; b=QDaKi9agJLg3HFaK5YH4cTY5K9
 rdEb252yVack+HIAUUlP4xFxX293sSfqH6DsTlD85G240Tx1KN/ZVCnxLbWhFb0lxqnoaoXuDqBSw
 VLspvWauvynDMHFgDV2rGm3Hezn9SNq2kVYqYcBIl2/D15NJLFIkIjitJjJqspHf7qUY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wpdtDeV/Foprmlj1iz2xO9n3C3FzsT5HDEkASA0zUqE=; b=biTFkSL7JUIFcoxVZFXKQHcGhT
 6JiyTjNqG1XwWWhX2rRjTtRwgxzDopuPLhBzsn6jLkYS/VhbdpLMw2V+ibx3rfQcvHUJH1bo8Vleq
 obt0zqRBqByPVeKq7S9mv+YwOn7LouUfIUFmOhsC5Sdewq1CdYC1TLWqY9xQfw0ncNHs=;
Received: from mail-lf1-f53.google.com ([209.85.167.53])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m2qB7-005Oqg-IP
 for kgdb-bugreport@lists.sourceforge.net; Mon, 12 Jul 2021 07:16:46 +0000
Received: by mail-lf1-f53.google.com with SMTP id i5so11559780lfe.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 12 Jul 2021 00:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wpdtDeV/Foprmlj1iz2xO9n3C3FzsT5HDEkASA0zUqE=;
 b=XDlxXJHk3umluPMmNduTHmpcwN9WwaEHBlqavus9qtNQvZY/T0FXOA3aPMceBdJF6X
 iPt9fUSkkobEZJCfpSzzBOsv2rM9BzrpsV8jRNHw6EOdRoWrQfoa9nBtwTKPAn5p2fu6
 27s9tyvPOcqqdTfllLEN3Z23aFgErcZbMRIuMqVY9UCTsxGWvYoRYsaqQ9hAwtqW/9J8
 m1Zyy0TaJTI9ibsnjr5Ex3KWCd8Plh02o1aPc99mSXDnQAGH3Q2aCM45LLL3qZ7g+tH9
 ta9R1ynETPAqkCj30Skh9dyWekBw5vp5cKYNnYIFTxvbpkmxrBMYgBq1zK1VIQQ+hNr2
 0w6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wpdtDeV/Foprmlj1iz2xO9n3C3FzsT5HDEkASA0zUqE=;
 b=W/i7GwCA0c37sRHHDYwXC9oJpaaKiOmwZFyflp8S5CAx69p7DByHwLqmv0kIA0uiML
 IX3DDP22qfbYMKcjFczZD9J/8ZxtmL5W4tMgg4XH8urVuueqMgBA2j6soiGKBkH2JWfS
 6Vd1c2KYOzjPKHP1PLRvxTVXJ+yPqG8fMzCoLsp4yDyqzQ7Oqt94pj5pV2RBG9sGO+Xz
 W+FWuVK7/5WirvUqmIXgqZ7zljE3fUTPC61l+gLSgmq5zQZiyccTEx6FwbEHPPGnZpIg
 tdoElN3YvYWIuAEmvqGS3StRJt5B73ewL43NNq0g/6X48BhKd31+vg9gjT3dpZaDEPBy
 ZEDg==
X-Gm-Message-State: AOAM532HNnhjDLSfpgVpxvSqeu5CDyF8n3fLrpn8AsaoRQbGQunQY6sV
 gWj3lLURDGdLV7OfHbmhfcPR8qo+LTfGr5WkVJvKiQ==
X-Google-Smtp-Source: ABdhPJx2HNTOk0deYJbO7622lb9zhuNkEq686WV6CC2WId2tick8R27l/PuW75BrbhDy4W/NbZ2NppJmvBt4KR/HKKo=
X-Received: by 2002:a05:6512:3ca8:: with SMTP id
 h40mr39941670lfv.302.1626074187002; 
 Mon, 12 Jul 2021 00:16:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210709104320.101568-1-sumit.garg@linaro.org>
 <20210709104320.101568-4-sumit.garg@linaro.org>
 <CAD=FV=XHPCXSAmgf62K7+5LLbrz--BenQk5AyDozscr62qjbJg@mail.gmail.com>
In-Reply-To: <CAD=FV=XHPCXSAmgf62K7+5LLbrz--BenQk5AyDozscr62qjbJg@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 12 Jul 2021 12:46:15 +0530
Message-ID: <CAFA6WYORwft8kMt+7rJ=AKrVY0THDsLCzCtm7HS0vZjh9L-HPQ@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.53 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.53 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1m2qB7-005Oqg-IP
Subject: Re: [Kgdb-bugreport] [PATCH v4 3/4] kdb: Simplify kdb_defcmd macro
 logic
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
> On Fri, Jul 9, 2021 at 3:43 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > Switch to use a linked list instead of dynamic array which makes
> > allocation of kdb macro and traversing the kdb macro commands list
> > simpler.
> >
> > Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  kernel/debug/kdb/kdb_main.c | 107 +++++++++++++++++++-----------------
> >  1 file changed, 58 insertions(+), 49 deletions(-)
> >
> > diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> > index 6d9ff4048e7d..371983c03223 100644
> > --- a/kernel/debug/kdb/kdb_main.c
> > +++ b/kernel/debug/kdb/kdb_main.c
> > @@ -654,13 +654,16 @@ static void kdb_cmderror(int diag)
> >   *     zero for success, a kdb diagnostic if error
> >   */
> >  struct kdb_macro_t {
> > -       int count;
> > -       bool usable;
> > -       kdbtab_t cmd;
> > -       char **command;
> > +       kdbtab_t cmd;                   /* Macro command */
> > +       struct list_head statements;    /* Associated statement list */
> >  };
> > +
> > +struct kdb_macro_statement_t {
> > +       char *statement;                /* Statement name */
>
> This is still not really the name. This is the actual statement,
> right? Like it might contain "ftdump -1", right? It seems really weird
> to call that the "name". You could drop the word "name", or change
> this to "Statement text", or just totally drop the comment.
>

Let me use "Statement text" instead.

> Other than that this looks good to me.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks,
-Sumit


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
