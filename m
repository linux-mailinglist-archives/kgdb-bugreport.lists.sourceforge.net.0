Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A94843C7DC9
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 14 Jul 2021 07:04:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1m3X40-0004yk-G4
	for lists+kgdb-bugreport@lfdr.de; Wed, 14 Jul 2021 05:04:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <sumit.garg@linaro.org>) id 1m3X3y-0004yd-C0
 for kgdb-bugreport@lists.sourceforge.net; Wed, 14 Jul 2021 05:04:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pTuVEphYGt/YG2LcKDrOchB/Dk+EVAhqx0QyLXps/0g=; b=aL1TnhvYOayMnY9tOgtROEVOIb
 Jdj7uVqcoqLQHu+f3F+MdTAYTELc4cVXG9DKtPFqM22mZ1XvYQxtwzoZU7G3k05WNBCDTm1kRr5uw
 /C0P2jfp9HN6ySGKeIRntWEFB6IyOFGsfo31a0rr13TaALDTlxv5D8yXsAUn8wa1tjAc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pTuVEphYGt/YG2LcKDrOchB/Dk+EVAhqx0QyLXps/0g=; b=IzxAoj7Q961bxnKpZ1tVklBWBJ
 EkJOlm7uRXBxBlw250GoT9Oz88sjrXzy/xuUn+fQgVFeZgjUCeL1a3dBNlsmS0zvJFExMPJmbBvwB
 Eec7MG+Ra1SLNvDGoYoGhNFRK57M00GTD8Ne4hfdN0/JnWw/trsis1efBX72AOQ/Aydk=;
Received: from mail-lf1-f49.google.com ([209.85.167.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m3X3o-0006RK-Pg
 for kgdb-bugreport@lists.sourceforge.net; Wed, 14 Jul 2021 05:04:02 +0000
Received: by mail-lf1-f49.google.com with SMTP id t17so1479891lfq.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 13 Jul 2021 22:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pTuVEphYGt/YG2LcKDrOchB/Dk+EVAhqx0QyLXps/0g=;
 b=gvJh8+vey3w75pjEhgJKeIWuWzOSoTh+5BJZWDgDp5Pd84oWsx0F07RdlKxAhFI/aI
 /x7+weirB+7RD8fbD4TNzuQzewRdIxmaKK68aeo2udfgwtvh2UfBkfpWeVZitBi0z8UY
 Bd8KU/b4BDVfLMD0iaW8/bLUxb/NnIYGeW2B4zasZ83nYiQbwRfS3/GLd5NuQBLO9eio
 9VomgFr6R44kwxNFEKf0VgRPCKHPJVIucee5jox4avHxwczVBDZdvhIupOxSfYe7vtuh
 8AYnBSuufMajZzzjO1WZLwjtZ7xckNJwLMJNHnnR8yiLZuM3XxOGdTn/myAwoWVTNciK
 fTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pTuVEphYGt/YG2LcKDrOchB/Dk+EVAhqx0QyLXps/0g=;
 b=giNP/HSL+pxbIU+qtFwvhw86eGZRT33QcBJ0OJk0U4CYlJ0V55UoaVzGPVgY7lPlpg
 TpT5v7dDc8rgfuKIALuFQFjFubpysSzrT6jE8KFegkTsTmfdDmXJxm6zcG3Gb088M6c5
 XRI5tQH2QudlG1rMIqb2EGuHoE3mVzncfgrsB4tk9EZelPSKOhvrtb3kML4f2zVmBne3
 26vj0Xj6JOCSUs4XPqHdm31ukT4O3cKZSDjca5QigzNyLTQcuklK+G/LdCYI/XpBjOTz
 4ZlkdmY0zlG2+AfT+v/m6gMG6DQ56KuLyGmvyH6fNGbYgAPaKQ+NgYLjPJfe9fDv5ICX
 e8zg==
X-Gm-Message-State: AOAM533O6slFYnf6JtU0Od6gM+3Lx67ZkoozRavUy4pRvT02kCVQ/qNU
 5SxYBRGo3zt2IEOn/NNfsuudTT5E3xAtMp0KVOMWqg==
X-Google-Smtp-Source: ABdhPJydrOOQhPrApP8nB/aQKjBoFxdhbG4/w3eb3JR2bRClfRoBhBa3ir3YpPTLcBD9ocQsV9JDL6JWxlY7j2bW7As=
X-Received: by 2002:a05:6512:511:: with SMTP id
 o17mr6651295lfb.396.1626239026149; 
 Tue, 13 Jul 2021 22:03:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210708122447.3880803-1-sumit.garg@linaro.org>
 <CAD=FV=UhL32e7spQjr38Lwng0D7mUK+R7iGnmBah=tXzzXsO5g@mail.gmail.com>
 <CAFA6WYN4gMv9Hkuq=3v_UKg+Y1OvFfbOqgZxt7yGSd2RnVBdJw@mail.gmail.com>
 <CAD=FV=X9w_eY9cSkJLsF57bqL=FQFNcybG+P6tYT5mWTnG3TJA@mail.gmail.com>
 <20210713151032.hvsbufswijxt6uxk@maple.lan>
 <CAD=FV=Wb_utQLP+U9Nv4=PUTdY49acRG03_Pxk31f4dR3673SQ@mail.gmail.com>
In-Reply-To: <CAD=FV=Wb_utQLP+U9Nv4=PUTdY49acRG03_Pxk31f4dR3673SQ@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 14 Jul 2021 10:33:33 +0530
Message-ID: <CAFA6WYOMMGxoVg-WezjwAUhPjsu-dfKi=1DY-RDJjyiEA9P7QA@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
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
X-Headers-End: 1m3X3o-0006RK-Pg
Subject: Re: [Kgdb-bugreport] [PATCH v3] kdb: Get rid of custom debug heap
 allocator
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

On Tue, 13 Jul 2021 at 20:42, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Tue, Jul 13, 2021 at 8:10 AM Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> >
> > On Tue, Jul 13, 2021 at 06:45:52AM -0700, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Tue, Jul 13, 2021 at 4:24 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> > > >
> > > > > >  int kdbnearsym(unsigned long addr, kdb_symtab_t *symtab)
> > > > > >  {
> > > > > >         int ret = 0;
> > > > > >         unsigned long symbolsize = 0;
> > > > > >         unsigned long offset = 0;
> > > > > > -#define knt1_size 128          /* must be >= kallsyms table size */
> > > > > > -       char *knt1 = NULL;
> > > > > > +       static char namebuf[KSYM_NAME_LEN];
> > > > >
> > > > > I guess this also ends up fixing a bug too, right? My greps show that
> > > > > "KSYM_NAME_LEN" is 512
> > > >
> > > > I can see "KSYM_NAME_LEN" defined as 128 here [1]. Are you looking at
> > > > any other header file?
> > > >
> > > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/kallsyms.h#n18
> > >
> > > Ah ha, it's recent! See commit f2f6175186f4 ("kallsyms: increase
> > > maximum kernel symbol length to 512")
> >
> > Ineed. So recent that I think it hasn't been merged to mainline yet!
> >
> > This patch is part of the rust patch set. IIUC it is in linux-next for
> > wider testing but I'd be surprised if it gets merged to mainline anytime
> > soon (and even more amazed if it is merged without being rebased and
> > given a new hash value ;-) ).
>
> Ah, good point. Yeah, I should have mentioned that I was looking at
> linuxnext. I guess maybe the right compromise is just to mention that
> we'll be more robust in case that other #define changes. ;-)
>

Okay, I will update the commit description accordingly.

-Sumit

> -Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
