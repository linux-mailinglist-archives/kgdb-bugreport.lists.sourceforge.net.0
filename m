Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F943C72D9
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 13 Jul 2021 17:13:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1m3K5m-0000WY-Ld
	for lists+kgdb-bugreport@lfdr.de; Tue, 13 Jul 2021 15:13:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1m3K5l-0000W8-BC
 for kgdb-bugreport@lists.sourceforge.net; Tue, 13 Jul 2021 15:13:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VtTNpHN7mGyhuaFK5jDPQ4RVI7P3MwfCQJyWmjN3XOY=; b=dGemoSWjxGVMjr18cPUfuiCgTh
 SEkQDg9S4GuFI907hAKqHW3qORdGh9Q5JbKwWi5MZewvjgV4LHH6DW7Lpd6Oq+UMhHBlVbb9c88cE
 1WIrTVZChSX9U4oVlwvD2odJtvILI77xOT6WsUnwiFlLIVpHwvZfu2UP8u8QUSHUmMSk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VtTNpHN7mGyhuaFK5jDPQ4RVI7P3MwfCQJyWmjN3XOY=; b=SRMsik59Z6AFOPlNUHbN2Vy1a3
 lVV6RwFzlYVS3+0IP9g/3cjsraQB2G8k8KqJbhbUQVnRuQ7lvWN2b3+sNcPcPzQPfWlKmVWMDkp5Y
 b2Xg1n/6Wf6VNDzgb304SQ0EKXhId70AUCpjaPLJZ+7jefPBDL9z4HHCdTTM7j1dhAmA=;
Received: from mail-qt1-f170.google.com ([209.85.160.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m3K5Z-00039w-Gy
 for kgdb-bugreport@lists.sourceforge.net; Tue, 13 Jul 2021 15:13:01 +0000
Received: by mail-qt1-f170.google.com with SMTP id w26so10032612qto.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 13 Jul 2021 08:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VtTNpHN7mGyhuaFK5jDPQ4RVI7P3MwfCQJyWmjN3XOY=;
 b=Dhldyh9lRcWr/Z9wVz5ZZvSNQ4Z1CNpNjGRmdJ17LFoiKWRtJqM+Upck/ou/cIs3Cb
 E/7x/Nx8fby+55gA19Dw/ni+wC01SZqeQgiQPgIpTNbP3NUIQVHiWkrnLkCJCrcJf0FC
 BpYUy/zU6NBvN29kB9eig0ucRMjCqvjHP49kA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VtTNpHN7mGyhuaFK5jDPQ4RVI7P3MwfCQJyWmjN3XOY=;
 b=Jt854wpn/nfyie6lCfShNCOjO/rIolAgKJyCGKWOA5NkpHsClEegNwWjg7iTWD6L+i
 CeFqRsmZmM4MWPS5T64El9nRb2LjdO3jfkzEGNCbMXz7ezVPUtkSarUpAmqbjni3lo3+
 F3K4XSnw79OOS8k3kXC8qcUrvz6Mv/p3I0Tj9Mat64xhb/qTuE+Y9JgLuo/DqSwmg+jV
 zD0LwxtrM/sEpC5r5dOpTl4afjdOcUuID+tlss/h6+/0cp72L+qyiWlM5RchYam5aPHG
 TG3y8O2NBiGzFF5o/eLpL77gt4V0N1cZXxc6MNw7nK8MtRor+WW8ZnqHz1oUx6ellQg0
 GXEw==
X-Gm-Message-State: AOAM530lrRndD/3sRez7nz0Sj/RicSPBNC8fHx12KHqvkIGKwGVAEx/O
 EkAXDUJbkGfpo4kSFpvwf+zNZMKuHmi3jg==
X-Google-Smtp-Source: ABdhPJy8E9SXtjPUmazogTwSYH+k81CukBiIcT4w7K8fR3mgD0/y6PmMydDLzhqk5CM7a59FeO7WYg==
X-Received: by 2002:ac8:479a:: with SMTP id k26mr4480197qtq.119.1626189163316; 
 Tue, 13 Jul 2021 08:12:43 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173])
 by smtp.gmail.com with ESMTPSA id s3sm4701620qke.85.2021.07.13.08.12.42
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 08:12:42 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id y38so35333327ybi.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 13 Jul 2021 08:12:42 -0700 (PDT)
X-Received: by 2002:a25:cc52:: with SMTP id l79mr6350967ybf.476.1626189162123; 
 Tue, 13 Jul 2021 08:12:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210708122447.3880803-1-sumit.garg@linaro.org>
 <CAD=FV=UhL32e7spQjr38Lwng0D7mUK+R7iGnmBah=tXzzXsO5g@mail.gmail.com>
 <CAFA6WYN4gMv9Hkuq=3v_UKg+Y1OvFfbOqgZxt7yGSd2RnVBdJw@mail.gmail.com>
 <CAD=FV=X9w_eY9cSkJLsF57bqL=FQFNcybG+P6tYT5mWTnG3TJA@mail.gmail.com>
 <20210713151032.hvsbufswijxt6uxk@maple.lan>
In-Reply-To: <20210713151032.hvsbufswijxt6uxk@maple.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Jul 2021 08:12:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wb_utQLP+U9Nv4=PUTdY49acRG03_Pxk31f4dR3673SQ@mail.gmail.com>
Message-ID: <CAD=FV=Wb_utQLP+U9Nv4=PUTdY49acRG03_Pxk31f4dR3673SQ@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
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
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m3K5Z-00039w-Gy
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
Cc: Jason Wessel <jason.wessel@windriver.com>,
 LKML <linux-kernel@vger.kernel.org>, kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Tue, Jul 13, 2021 at 8:10 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Tue, Jul 13, 2021 at 06:45:52AM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Jul 13, 2021 at 4:24 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> > >
> > > > >  int kdbnearsym(unsigned long addr, kdb_symtab_t *symtab)
> > > > >  {
> > > > >         int ret = 0;
> > > > >         unsigned long symbolsize = 0;
> > > > >         unsigned long offset = 0;
> > > > > -#define knt1_size 128          /* must be >= kallsyms table size */
> > > > > -       char *knt1 = NULL;
> > > > > +       static char namebuf[KSYM_NAME_LEN];
> > > >
> > > > I guess this also ends up fixing a bug too, right? My greps show that
> > > > "KSYM_NAME_LEN" is 512
> > >
> > > I can see "KSYM_NAME_LEN" defined as 128 here [1]. Are you looking at
> > > any other header file?
> > >
> > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/kallsyms.h#n18
> >
> > Ah ha, it's recent! See commit f2f6175186f4 ("kallsyms: increase
> > maximum kernel symbol length to 512")
>
> Ineed. So recent that I think it hasn't been merged to mainline yet!
>
> This patch is part of the rust patch set. IIUC it is in linux-next for
> wider testing but I'd be surprised if it gets merged to mainline anytime
> soon (and even more amazed if it is merged without being rebased and
> given a new hash value ;-) ).

Ah, good point. Yeah, I should have mentioned that I was looking at
linuxnext. I guess maybe the right compromise is just to mention that
we'll be more robust in case that other #define changes. ;-)

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
