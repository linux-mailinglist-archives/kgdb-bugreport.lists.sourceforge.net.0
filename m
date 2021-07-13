Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9954E3C72D6
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 13 Jul 2021 17:10:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1m3K3j-0008M3-Df
	for lists+kgdb-bugreport@lfdr.de; Tue, 13 Jul 2021 15:10:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1m3K3h-0008Lv-IZ
 for kgdb-bugreport@lists.sourceforge.net; Tue, 13 Jul 2021 15:10:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ccVY0wCgTs5TXR//31Go1dN/0eihaDgl7hSzcu1KrSo=; b=PLGRzecVuoY/iauBEnzexmaVSo
 J7n0jHBQnPuDr347se+kXBQfyE/RTl7VDTF/o6pRQ93eYn+KulJrYEZlqB6f6gRawdT7+rj2yDKKs
 BTYnk/n+2c2Et4K1+rQ/O1VQO+WncUhjr4DgAXFKvdb9vwrNieBacPmQ6fuoA/NYs1kk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ccVY0wCgTs5TXR//31Go1dN/0eihaDgl7hSzcu1KrSo=; b=kfdddB5pb0qG58H8BWT8eb9OYp
 X1GEySa312jgfCQ3AWmAbCdAOlRAcRvlFVBxsMaehcx1855Kw+j1R+uLfG3/yA28PrtTQdtGS4RJZ
 2NQC70sO9/rW6KeKbhbhq9nklDUkCPoBROPt4SIhjPiP5F3u45ec+WjJdUHXAF1bHBYQ=;
Received: from mail-wr1-f45.google.com ([209.85.221.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m3K3W-0074gW-TP
 for kgdb-bugreport@lists.sourceforge.net; Tue, 13 Jul 2021 15:10:53 +0000
Received: by mail-wr1-f45.google.com with SMTP id d12so30310140wre.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 13 Jul 2021 08:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ccVY0wCgTs5TXR//31Go1dN/0eihaDgl7hSzcu1KrSo=;
 b=UkdSHwacQ3plM3u3pH8mvBtHXjUG6BjKxsW9wykYRUo8TMgOcACEM4ZNrwYRh1grhL
 LH5NrJb4WpZK6FbVUpMb9kd4eyDdexx0S3bkho9dxBKA3qvnxwlrWAp7DafMqCWnStMJ
 6dEOgko/45tAofxskHm37lTPwdhXGyIvvPNGyGeb+17cyLkZJ43wYSx76Jq9BVY0YWz4
 6KQ3nvMPMAFFD+Kdl7IMk8G87asdaYDPHNm5B5B3D5KiOKbwUOgH/boEQWs59nfQH7fU
 PumH+jFL9BOoyfNfLDcFnEtjFQnc1jZbBZP+VgaUydk6YC7Zhh61ju0xI8h4QQ6QP2HE
 qdcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ccVY0wCgTs5TXR//31Go1dN/0eihaDgl7hSzcu1KrSo=;
 b=HQnV5d56ay5H+4bag4ZdsBjaUopwgRib2iW/7ZGq0xo/XBRKNwQWXS1S9Mu/8Q0bv7
 NNTd1z9mm5IAZaVfCs3sVQiuUZahYHd3oRCEk8fkST9gyLxvjdpf4DdDbO43UJqXb/hF
 Ep1ERZcCZreL+CtOR/tKIG1IAlG1CJTFtA8hLFNBWj97yUTZ8n4dSarN0qXPgmr2/1CY
 l2m51YYvKOeu/8M777YjOuk9aVGfF8jc/YyykMWJ8laFeH/nBThmuT6B2aKhgxJ1i0wE
 yCFEiQsldlxCfNZEuNkbqbB6NRqS0bnvTci5fMoT9w724opscjf4EGoLa9wW+/PmfK74
 6kcw==
X-Gm-Message-State: AOAM5322zJBWF9EsU1MX+3hc41QPK4jW8spGGFIm/Im9lfXbej9elH5A
 A1YBU9f5Hf1T5NzihsfpZSBgGA==
X-Google-Smtp-Source: ABdhPJzb/XWyYmuq03TFlvNVBnQieIXH3H7Kne0EI7KaadBgGq/cwOHSL4U4N5RweLFDSZ5/H1rGyw==
X-Received: by 2002:adf:e488:: with SMTP id i8mr6411373wrm.285.1626189036529; 
 Tue, 13 Jul 2021 08:10:36 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id t9sm17689573wrq.92.2021.07.13.08.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 08:10:34 -0700 (PDT)
Date: Tue, 13 Jul 2021 16:10:32 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20210713151032.hvsbufswijxt6uxk@maple.lan>
References: <20210708122447.3880803-1-sumit.garg@linaro.org>
 <CAD=FV=UhL32e7spQjr38Lwng0D7mUK+R7iGnmBah=tXzzXsO5g@mail.gmail.com>
 <CAFA6WYN4gMv9Hkuq=3v_UKg+Y1OvFfbOqgZxt7yGSd2RnVBdJw@mail.gmail.com>
 <CAD=FV=X9w_eY9cSkJLsF57bqL=FQFNcybG+P6tYT5mWTnG3TJA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=X9w_eY9cSkJLsF57bqL=FQFNcybG+P6tYT5mWTnG3TJA@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.45 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.45 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1m3K3W-0074gW-TP
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

On Tue, Jul 13, 2021 at 06:45:52AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Tue, Jul 13, 2021 at 4:24 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > > >  int kdbnearsym(unsigned long addr, kdb_symtab_t *symtab)
> > > >  {
> > > >         int ret = 0;
> > > >         unsigned long symbolsize = 0;
> > > >         unsigned long offset = 0;
> > > > -#define knt1_size 128          /* must be >= kallsyms table size */
> > > > -       char *knt1 = NULL;
> > > > +       static char namebuf[KSYM_NAME_LEN];
> > >
> > > I guess this also ends up fixing a bug too, right? My greps show that
> > > "KSYM_NAME_LEN" is 512
> >
> > I can see "KSYM_NAME_LEN" defined as 128 here [1]. Are you looking at
> > any other header file?
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/kallsyms.h#n18
> 
> Ah ha, it's recent! See commit f2f6175186f4 ("kallsyms: increase
> maximum kernel symbol length to 512")

Ineed. So recent that I think it hasn't been merged to mainline yet!

This patch is part of the rust patch set. IIUC it is in linux-next for
wider testing but I'd be surprised if it gets merged to mainline anytime
soon (and even more amazed if it is merged without being rebased and
given a new hash value ;-) ).


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
