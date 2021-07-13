Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC63C3C716A
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 13 Jul 2021 15:46:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1m3Ijn-0001cr-O6
	for lists+kgdb-bugreport@lfdr.de; Tue, 13 Jul 2021 13:46:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1m3Ijm-0001cd-UX
 for kgdb-bugreport@lists.sourceforge.net; Tue, 13 Jul 2021 13:46:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KS+iF4Pc2VBgRkck8w5172ucQsF7IAiFUaz7SAcYMXk=; b=CD+vTsPEOQclnYpJZLFz/pvUoq
 +ICKHluQkxUcGUZ5dhlFnE9YroeaXznDD3XMM9tCQdYdSOeYb2h7LDUxXz3R6WVKDsKYkPkjdN/Is
 FBh1/2qoc3bGMRu3PDyDL2rVfAUZ2jwb8tvbfbW+LfpLhG/xmyEVyPpuw+zib8fKuqzg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KS+iF4Pc2VBgRkck8w5172ucQsF7IAiFUaz7SAcYMXk=; b=hN4LSRtGweBxVKs5CHSNO0Xir+
 72y6dHvGAl4Xt9QDLuI1HCHLB/cfON84y+6AFUdbv9qy8MLqE698D5j6iMSAtaUuxIxVFGYHrHRC5
 K6KwJ+wahF0mcJwtpmqeUlo26/sANDWYxR2ebMJ10kzsLZ0gw6FLOXH7i81ohAgY0Fa0=;
Received: from mail-qk1-f169.google.com ([209.85.222.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m3Ijk-0006Em-VG
 for kgdb-bugreport@lists.sourceforge.net; Tue, 13 Jul 2021 13:46:14 +0000
Received: by mail-qk1-f169.google.com with SMTP id z9so7600842qkg.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 13 Jul 2021 06:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KS+iF4Pc2VBgRkck8w5172ucQsF7IAiFUaz7SAcYMXk=;
 b=h/E21b2bz9c5PjZDILRVd6rY5jYdenj0x1RbXdub99cORNrUc9F+LLuuxzKTDnknmj
 ZpN6lWiw1ahrFN9CFG81RfLKbUx7ipS+4StmjzCZQSyDoXGJ+HeiyZy5tZbi0bQ7BOp7
 tgPTsHnaXa1BLZIpr+537gJD5BWGKfj0wLI28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KS+iF4Pc2VBgRkck8w5172ucQsF7IAiFUaz7SAcYMXk=;
 b=HVjnwc+fjkKD+zy3lWJqd2CPeh8Q+TLgPSciPNMf0zgKAMKU9Khs2qIBkuN4vKR8OT
 MN9cvNB9XOPTK6RmerNzqlPFk9wCHl8BWNyMwnv2b+x8lVvcPBoto75rkhu3AjwpMCv0
 TQ2P/lJhvhQ+sFcGINX2nzxYR2Ed/nQ3J9HCAZK44laCnD6o3O9Qdq2ozN1smvIvlqEP
 jVOmSMWvPli7EXwDK1AJYYMAZCg9uuyIls6+2ynt8p5CyxI35DRNi1d95a1A06T40fEU
 Dso3kEEGeDEHWbqHZ6vehZ+KSNanfhz87DIcL9/RH14+a1vRKGlF+sNl0Mgyhp91GNUv
 zv+g==
X-Gm-Message-State: AOAM531nLJaJQlF6L0nqvTZav858ce3Yxfwa7Etj9lwzx2d7Tc1fWzzV
 lt9IMXOWUZOdVuPnM4decEE7AsK0oqiLpA==
X-Google-Smtp-Source: ABdhPJxIzipIp8H3hyNgfon/rW0xDDDogXyHLksqrxttYGsTluYDNt9N3VBw6uMLHnVSV3gKCERbjg==
X-Received: by 2002:a05:620a:1235:: with SMTP id
 v21mr4207493qkj.360.1626183967106; 
 Tue, 13 Jul 2021 06:46:07 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173])
 by smtp.gmail.com with ESMTPSA id z22sm4520132qki.54.2021.07.13.06.46.05
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 06:46:05 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id g19so34833998ybe.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 13 Jul 2021 06:46:05 -0700 (PDT)
X-Received: by 2002:a25:cc52:: with SMTP id l79mr5818725ybf.476.1626183965121; 
 Tue, 13 Jul 2021 06:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210708122447.3880803-1-sumit.garg@linaro.org>
 <CAD=FV=UhL32e7spQjr38Lwng0D7mUK+R7iGnmBah=tXzzXsO5g@mail.gmail.com>
 <CAFA6WYN4gMv9Hkuq=3v_UKg+Y1OvFfbOqgZxt7yGSd2RnVBdJw@mail.gmail.com>
In-Reply-To: <CAFA6WYN4gMv9Hkuq=3v_UKg+Y1OvFfbOqgZxt7yGSd2RnVBdJw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Jul 2021 06:45:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X9w_eY9cSkJLsF57bqL=FQFNcybG+P6tYT5mWTnG3TJA@mail.gmail.com>
Message-ID: <CAD=FV=X9w_eY9cSkJLsF57bqL=FQFNcybG+P6tYT5mWTnG3TJA@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.169 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.169 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m3Ijk-0006Em-VG
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

Hi,

On Tue, Jul 13, 2021 at 4:24 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> > >  int kdbnearsym(unsigned long addr, kdb_symtab_t *symtab)
> > >  {
> > >         int ret = 0;
> > >         unsigned long symbolsize = 0;
> > >         unsigned long offset = 0;
> > > -#define knt1_size 128          /* must be >= kallsyms table size */
> > > -       char *knt1 = NULL;
> > > +       static char namebuf[KSYM_NAME_LEN];
> >
> > I guess this also ends up fixing a bug too, right? My greps show that
> > "KSYM_NAME_LEN" is 512
>
> I can see "KSYM_NAME_LEN" defined as 128 here [1]. Are you looking at
> any other header file?
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/kallsyms.h#n18

Ah ha, it's recent! See commit f2f6175186f4 ("kallsyms: increase
maximum kernel symbol length to 512")

...I guess this officially "Fixes" that commit then?

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
