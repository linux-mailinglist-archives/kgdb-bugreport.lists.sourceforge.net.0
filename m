Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B02314C47E
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 29 Jan 2020 03:01:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iwcfK-0000yZ-S3
	for lists+kgdb-bugreport@lfdr.de; Wed, 29 Jan 2020 02:01:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <akpm@linux-foundation.org>) id 1iwcfH-0000yJ-0Y
 for kgdb-bugreport@lists.sourceforge.net; Wed, 29 Jan 2020 02:01:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version
 :References:In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YIvXlEvD8zFA/mz8Xyybnl6RcGb54z2WpKlh1qVz5hk=; b=LRLyh4oE2Tskgv1RGrvEyGUrmj
 eH169/AnavHHT/XEtaBZSmnfiQeCXHFWbPD+jiT0xx3xoqbfYfU8L2e+dO9JZPm93mxHu0aTN67WC
 ak1eWhbrnS8O+AvtargcShATbQEChgefZWC2Dn96zNV8zgPkbFJdclNJ+KNQx9otv/wc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YIvXlEvD8zFA/mz8Xyybnl6RcGb54z2WpKlh1qVz5hk=; b=fNTosB0nbCXR9Y75xHDDs/YSdW
 B2rlBp46eCOc+kQ9YklXWee2jRfG0/q95IBy0wESfGBWP43d7pghOuNShR6FgYDuKm34Vq9J48/rB
 ibfLuf5MO2D6KwPRzTHOPPYQ20P5IoYYOEBlwKNUNg79amwt0OorqAYcnIBvaUmLKA14=;
Received: from [198.145.29.99] (helo=mail.kernel.org)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iwcf8-008oYJ-2E
 for kgdb-bugreport@lists.sourceforge.net; Wed, 29 Jan 2020 02:01:09 +0000
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1914B2051A;
 Wed, 29 Jan 2020 01:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580262171;
 bh=Dm5O1JcZZZn4Fmmh8ZEVuwwpAngNiF+PCJfRS/Xf9zw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IuNPIsR0oGrUykv480vwdj6CsOazTln5Bw1n/BEKw1a/AsxXikVYbWTsDoZHVn1NH
 t/EI5lRCJXpmAa1YAwlsAfg3SXA/vfAdzvcPXlErBoR7v2HI9/sbLaWbGUKdyFKt2C
 ZB09jVEnfNltBzwVSCZDK1MGtariwNUd7/U93c4E=
Date: Tue, 28 Jan 2020 17:42:48 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Doug Anderson <dianders@chromium.org>
Message-Id: <20200128174248.756f18d713e759be2b4273db@linux-foundation.org>
In-Reply-To: <CAD=FV=WcjHMzRE0yHm4uRFYj=Zoxz_v1FgiZETOwjzMtkjJcfQ@mail.gmail.com>
References: <20191109191644.191766-1-dianders@chromium.org>
 <CAD=FV=WcjHMzRE0yHm4uRFYj=Zoxz_v1FgiZETOwjzMtkjJcfQ@mail.gmail.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iwcf8-008oYJ-2E
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
 Daniel Thompson <daniel.thompson@linaro.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 kgdb-bugreport@lists.sourceforge.net,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Nicholas Mc Guire <hofrat@osadl.org>, Chuhong Yuan <hslester96@gmail.com>,
 linux-mips <linux-mips@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Paul Burton <paul.burton@mips.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Jason Wessel <jason.wessel@windriver.com>, James Hogan <jhogan@kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, Will Deacon <will@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, 28 Jan 2020 08:59:01 -0800 Doug Anderson <dianders@chromium.org> wrote:

> Hi
> 
> On Sat, Nov 9, 2019 at 11:17 AM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > This started out as just a follow-up to Daniel's post [1].  I wanted
> > to stop implicitly changing the current task in kdb.  ...but, of
> > course, everywhere you look in kdb there are things to cleanup, so
> > this gets a few misc cleanups I found along the way.  Enjoy.
> >
> > [1] https://lore.kernel.org/r/20191010150735.dhrj3pbjgmjrdpwr@holly.lan
> >
> >
> > Douglas Anderson (5):
> >   MIPS: kdb: Remove old workaround for backtracing on other CPUs
> >   kdb: kdb_current_regs should be private
> >   kdb: kdb_current_task shouldn't be exported
> >   kdb: Gid rid of implicit setting of the current task / regs
> >   kdb: Get rid of confusing diag msg from "rd" if current task has no
> >     regs
> >
> >  arch/mips/kernel/traps.c       |  5 -----
> >  include/linux/kdb.h            |  2 --
> >  kernel/debug/kdb/kdb_bt.c      |  8 +-------
> >  kernel/debug/kdb/kdb_main.c    | 31 ++++++++++++++-----------------
> >  kernel/debug/kdb/kdb_private.h |  2 +-
> >  5 files changed, 16 insertions(+), 32 deletions(-)
> 
> I noticed that this series doesn't seem to be in linux-next, but I
> think it was supposed to target v5.6?  Do you know if there is
> anything outstanding or if it'll be queued up sometime soon?
> 

I grabbed them.

Are there any updates on the testing status, particularly on MIPS?


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
