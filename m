Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A5E3C45C4
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 12 Jul 2021 09:15:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1m2q9w-0004P8-9E
	for lists+kgdb-bugreport@lfdr.de; Mon, 12 Jul 2021 07:15:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <sumit.garg@linaro.org>) id 1m2q9u-0004P0-Id
 for kgdb-bugreport@lists.sourceforge.net; Mon, 12 Jul 2021 07:15:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UK1Y5g539CKatjuPdctwi+Y6V9Y3jMH6RRf3GAMgDhk=; b=N6x2+ecxd1MuBKvjRfwgBjY0+P
 x/J6mELDLTSbk0pbqpcpipAyspJEHZrBJFnCxDT9N3No/2URoR/JV/ZxOvrOMRWVAvSiPL8ACB+l8
 CeDJMiRolebPSkT5NzL4JxgOkvUc8sEQeGeADvJgfz7S55DKHlHR+7ZtRQ/RjRSamJDI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UK1Y5g539CKatjuPdctwi+Y6V9Y3jMH6RRf3GAMgDhk=; b=HEEN4NjRW8zeZowVldVXRTkBB7
 gu3XzX0wlGPPBGc09MFRdwbNHRSGMG1rFlVYXBvoNkRAZFEQ8q84bsmzs5+onLMFAjPPvfUtT5QUX
 43IO8y+kCA9fAP4tbcKTU0JQ9qF/EJ4KPigSif+g8BI3ryjT9GRH13XmyfsANxy8p4X8=;
Received: from mail-lf1-f49.google.com ([209.85.167.49])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m2q9i-005OmE-3F
 for kgdb-bugreport@lists.sourceforge.net; Mon, 12 Jul 2021 07:15:18 +0000
Received: by mail-lf1-f49.google.com with SMTP id 22so11153884lfy.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 12 Jul 2021 00:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UK1Y5g539CKatjuPdctwi+Y6V9Y3jMH6RRf3GAMgDhk=;
 b=XPq1yB4Q9KnbAlVdrXDOF1w4DOhSizTO991lcc5YQQslOq2iGDkb+ZgeHD0js2E0Nf
 rM7KGWhmHX8R5ARw7t+SvhYRN+6U+n+CdNk5gXJ0MnztVNp2+MH9gTYEZrY8s05cv+Uw
 hSalsRRU6VerZxVXHYzsbQjIEikaCcg1lgTrjbDJKuB0KqQjFnm/3N4iBvIM5iSdM3VA
 Wz8ZFi9GGiUPvstRbGcvbql7fEGVgpCrgZgj/vByfSt2V1Bz3IsEEsaT8KypEn5S5wge
 +W2Kt8pbA+G0m27mQ9GQGI+GO0FbbN9JLew/XbXyiMWbJ4NNzzRdGHmtw9GA4FcCAun6
 zzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UK1Y5g539CKatjuPdctwi+Y6V9Y3jMH6RRf3GAMgDhk=;
 b=ZqvXma5XtiOT75FAx8lLguuv6Cvid8NEOulQc7lcRQ9zkRWPkSBUn2Uu7+7unfeQF0
 iw2WlNLzsqxAf3+CQTtsZq7NzZ1vtTl6ri4rDAgXmnDvQNZgWh9SFCDg+/NFYuUUZbHq
 RXrU/mVrjXLNsTxlpIRfult4PtoAXmlQqkBsDz36mr3FDnm/LonOO2X2c24fr+lGn+i+
 cHvIziEVWcKUtUGaP9y18GdI/3k4kWTT3ppY9V027o8UjBQXXbxNDveckHyPmURTu0Kj
 8TCVQqcb3X5fpc+giBXLli9tgDvjLBEQjX3tOnKszFi0FgjxUgrFy4havXnXzWtdfE32
 /ndA==
X-Gm-Message-State: AOAM5311NdW5gxoMDnBerVutJQXyOc919sj2hp3p88DMvRig2SfTUYz6
 LA3URVtODNOtf0P50wiWYeaebGqbYnsZS/6wp+N8Tw==
X-Google-Smtp-Source: ABdhPJyqXXOatQtSyYe9abXgr7XsslWdGSg5A3DZ60wSdYdjmaDnDckEHEWo2vaEAj7LHF8asiGHgblloGQkAODkH1o=
X-Received: by 2002:a05:6512:2115:: with SMTP id
 q21mr9439856lfr.546.1626074099524; 
 Mon, 12 Jul 2021 00:14:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210709104320.101568-1-sumit.garg@linaro.org>
 <20210709104320.101568-3-sumit.garg@linaro.org>
 <CAD=FV=WrfJEH-VYcf9ULC0pA5x0ju422c8GM1G1y33mJOmv1Fw@mail.gmail.com>
In-Reply-To: <CAD=FV=WrfJEH-VYcf9ULC0pA5x0ju422c8GM1G1y33mJOmv1Fw@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 12 Jul 2021 12:44:48 +0530
Message-ID: <CAFA6WYOCbCwopi58iTdHOgxnSO0Sff78OKiOvfPLEzkLew9AVQ@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.49 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.49 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1m2q9i-005OmE-3F
Subject: Re: [Kgdb-bugreport] [PATCH v4 2/4] kdb: Get rid of redundant
 kdb_register_flags()
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
> > Commit e4f291b3f7bb ("kdb: Simplify kdb commands registration")
> > allowed registration of pre-allocated kdb commands with pointer to
> > struct kdbtab_t. Lets switch other users as well to register pre-
> > allocated kdb commands via:
> > - Changing prototype for kdb_register() to pass a pointer to struct
> >   kdbtab_t instead.
> > - Embed kdbtab_t structure in kdb_macro_t rather than individual params.
> >
> > With these changes kdb_register_flags() becomes redundant and hence
> > removed. Also, since we have switched all users to register
> > pre-allocated commands, "is_dynamic" flag in struct kdbtab_t becomes
> > redundant and hence removed as well.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
>
> Looking at v3 responses [1], seems like you forgot to add again:
>
> Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
>

Ah, it was mistakenly dropped, I will add it again.

> This also looks good to me now.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks,
-Sumit


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
