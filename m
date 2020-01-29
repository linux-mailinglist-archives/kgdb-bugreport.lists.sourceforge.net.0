Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5561714CDCC
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 29 Jan 2020 16:48:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iwpZr-00009J-Vc
	for lists+kgdb-bugreport@lfdr.de; Wed, 29 Jan 2020 15:48:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1iwpZr-000094-6F
 for kgdb-bugreport@lists.sourceforge.net; Wed, 29 Jan 2020 15:48:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sZj2aV1Zym3OI36biFrNjPhnaRNJMu4/fzIHJbLnLhg=; b=Cqz5XpxGD6iO1/1M4STFd/UKCW
 9XxWUC/BcTLsKNkDKbjFZmHGrAfSJXS7x7T3dzgpB0PGScv6YO2gh61N9MdI73JC/qtbYm+NNSNKx
 BOhCzltIniO9UYuaSmGMC2u/MLoRHQTin8mtOLuKMjCtY007M9IPCjhUVS+ej1APWWhI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sZj2aV1Zym3OI36biFrNjPhnaRNJMu4/fzIHJbLnLhg=; b=LDD0MQAXbviyDSx8EBspCgWhT7
 udGD70C43HraFQnkjTVuatVvaJC0rX86eVrKPoHwt5Ly9e+YvsZ7oq7EwKW3mfHSx/ZzK/3ARt6Ri
 6IURa0aooccwTwhUx3RgNMfPCzQ4CAEXa7WOmrhGvh9TbB5XP/W33K4kPBG0UnSZ2EwU=;
Received: from mail-wm1-f67.google.com ([209.85.128.67])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iwpZn-009UMw-9D
 for kgdb-bugreport@lists.sourceforge.net; Wed, 29 Jan 2020 15:48:27 +0000
Received: by mail-wm1-f67.google.com with SMTP id c84so262699wme.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 29 Jan 2020 07:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=sZj2aV1Zym3OI36biFrNjPhnaRNJMu4/fzIHJbLnLhg=;
 b=TebBue+xtT69xTDWnWr31tmvLHIKGPqyKH/r/Dv8WrJ9nHq1AyqodKOuDDdrwCUniR
 m1RJXo0lVyl7IkG3efpHkPKWeTZbeMaHgqksOCL+YqDoJ5jTKeNpRWBbaJjVrTN6Nm/o
 TE7FfhaNrVqORpZur/WsiMNkUYHVZS9jvsOFXP0HLcC4JW5XOFzhBFbQlnkimC6dKoI6
 6vzSxNCg7j0ynYdVhQdUnBDLzAWF/T0+JYZmPqsp229oa+v9bqrz/FtzJ4Julr4cTvC2
 Bsr8RmQF1064TLBR6rWq+Of/PhnPtybVh0HJn/Q850h6atO7Rh26p99KTqOG3a9lTMu9
 9m1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sZj2aV1Zym3OI36biFrNjPhnaRNJMu4/fzIHJbLnLhg=;
 b=Qyxr2qYZXv63kFKsC4kaszGA/OSUrQxQUgYcvPIY6LZ2hli+KwDLmK2MFwm44lVmsh
 wR09HdueMAiCU2va4f9N24KI8zpp23e0Keqg4v/abIep5aZWM1mgV6v2UmjxlzDBp3bt
 R+B937hiYAaBqGVTpxFV1u4+Zhpf/U3ZYzihl36/6yedtkb8X5IwPo4Kxc17K/xqaXjO
 NDstD/FvHyuPpqI0xrPXp8n/MZ6ZlSYqGXMRFy6s17otEpiypKObciqd7Tg9c6Yi7WMI
 O0j2yI0p9pJ0hdZcXb01ZuAKfBRvdh+xonwfSjJSMM9KdBTGWmLTXf7ZIYxVanA1B4jV
 GCJg==
X-Gm-Message-State: APjAAAUcDQfSeW0xFr7DIikZpWF5CUx7UBMBwHAXH6v4POSJC/q5LlkY
 FUZSfK4sgjh8ICzyRwDtLxPiictLi9ZreQ==
X-Google-Smtp-Source: APXvYqzjUFydW18jKI5YKyGpW9xJOmGMD/fMvHBCORG/gPtkny+4dmFPvKujyysx5+C8ANyv4uG7jQ==
X-Received: by 2002:a7b:c4cc:: with SMTP id g12mr12976834wmk.68.1580311423907; 
 Wed, 29 Jan 2020 07:23:43 -0800 (PST)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id n12sm2772420wmi.18.2020.01.29.07.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 07:23:42 -0800 (PST)
Date: Wed, 29 Jan 2020 15:23:40 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Andrew Morton <akpm@linux-foundation.org>
Message-ID: <20200129152340.bjlzlrybkujfdf5l@holly.lan>
References: <20191109191644.191766-1-dianders@chromium.org>
 <CAD=FV=WcjHMzRE0yHm4uRFYj=Zoxz_v1FgiZETOwjzMtkjJcfQ@mail.gmail.com>
 <20200128174248.756f18d713e759be2b4273db@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200128174248.756f18d713e759be2b4273db@linux-foundation.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.67 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1iwpZn-009UMw-9D
Subject: Re: [Kgdb-bugreport] [PATCH 0/5] kdb: Don't implicitly change tasks;
 plus misc fixups
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
Cc: qiaochong <qiaochong@loongson.cn>, Prarit Bhargava <prarit@redhat.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 kgdb-bugreport@lists.sourceforge.net,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Nicholas Mc Guire <hofrat@osadl.org>, Chuhong Yuan <hslester96@gmail.com>,
 Ralf Baechle <ralf@linux-mips.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Paul Burton <paul.burton@mips.com>, Serge Semin <fancer.lancer@gmail.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Jason Wessel <jason.wessel@windriver.com>, James Hogan <jhogan@kernel.org>,
 linux-mips <linux-mips@vger.kernel.org>, Will Deacon <will@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, Jan 28, 2020 at 05:42:48PM -0800, Andrew Morton wrote:
> On Tue, 28 Jan 2020 08:59:01 -0800 Doug Anderson <dianders@chromium.org> wrote:
> 
> > Hi
> > 
> > On Sat, Nov 9, 2019 at 11:17 AM Douglas Anderson <dianders@chromium.org> wrote:
> > >
> > > This started out as just a follow-up to Daniel's post [1].  I wanted
> > > to stop implicitly changing the current task in kdb.  ...but, of
> > > course, everywhere you look in kdb there are things to cleanup, so
> > > this gets a few misc cleanups I found along the way.  Enjoy.
> > >
> > > [1] https://lore.kernel.org/r/20191010150735.dhrj3pbjgmjrdpwr@holly.lan
> > >
> > >
> > > Douglas Anderson (5):
> > >   MIPS: kdb: Remove old workaround for backtracing on other CPUs
> > >   kdb: kdb_current_regs should be private
> > >   kdb: kdb_current_task shouldn't be exported
> > >   kdb: Gid rid of implicit setting of the current task / regs
> > >   kdb: Get rid of confusing diag msg from "rd" if current task has no
> > >     regs
> > >
> > >  arch/mips/kernel/traps.c       |  5 -----
> > >  include/linux/kdb.h            |  2 --
> > >  kernel/debug/kdb/kdb_bt.c      |  8 +-------
> > >  kernel/debug/kdb/kdb_main.c    | 31 ++++++++++++++-----------------
> > >  kernel/debug/kdb/kdb_private.h |  2 +-
> > >  5 files changed, 16 insertions(+), 32 deletions(-)
> > 
> > I noticed that this series doesn't seem to be in linux-next, but I
> > think it was supposed to target v5.6?  Do you know if there is
> > anything outstanding or if it'll be queued up sometime soon?
> > 
> 
> I grabbed them.
> 
> Are there any updates on the testing status, particularly on MIPS?

I put in a fair bit of work earlier this dev cycle to add MIPS to the
kgdb test suite. Unfortunately that left me catching up on a few other
things... or putting it another way I am late putting together the kgdb
tree for v5.6. It will be done by the weekend.

The first patch never got a formal Acked-by from the MIPS folks but they
commented positively so we can probably go ahead.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
