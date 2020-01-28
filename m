Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A655A14BE8C
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 28 Jan 2020 18:28:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iwUfJ-00055r-GB
	for lists+kgdb-bugreport@lfdr.de; Tue, 28 Jan 2020 17:28:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1iwUfF-00055d-Il
 for kgdb-bugreport@lists.sourceforge.net; Tue, 28 Jan 2020 17:28:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1kp2/4gfvXmBxJbriEuhD88FxIhMu/4bGwo/Zmm5PKU=; b=T0QZgvhJtQOdGlZJRGmIQvx6TI
 uNGAij9yRBUQRkB+JzI3Bo0QQAfEz3O7BWUbcHfkTseQisfeMGIRmnBTHjjXJAYdWS1yV5agmU54L
 mH4gneedWFl7aosyVn2nmL4Un9JJyYmaH5t4VIJOX5qXDyaZ61p/IaAy1SMmXwvhKHXE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1kp2/4gfvXmBxJbriEuhD88FxIhMu/4bGwo/Zmm5PKU=; b=igTJGNOMI13gnC4XVr2zEPlHe2
 /+iHOHIdSRI9UxJkqGcuZg7hmn18TQXxGQm3rfWSZUiByWxhkW35UO0IgtrzCse45vhcKDRKMXaQ9
 0iqguZUWp+oiw9WXXTVORST5qInXWEWX1T4YE7jkeI6+3N+bZjpJvEN/wsabcVghG0CA=;
Received: from mail-pj1-f68.google.com ([209.85.216.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iwUfC-0037Lv-4w
 for kgdb-bugreport@lists.sourceforge.net; Tue, 28 Jan 2020 17:28:36 +0000
Received: by mail-pj1-f68.google.com with SMTP id j17so502513pjz.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 28 Jan 2020 09:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1kp2/4gfvXmBxJbriEuhD88FxIhMu/4bGwo/Zmm5PKU=;
 b=gMv4HGCWc9VWs5EKeYQSo1N5YZJjHcHm5rePnbNpI2VfXdzTRQeVopa5wPpcg0/et2
 vJKJjtefINOeaW+sEA+VDaUVkxgPh5nCZs7q/9YWl1jAc7yFKmoqpiqKOvvSK+kpCEU8
 GAkC4C5WPDb7EmZT5IUhnkUlSj7wT+Jv8ls90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1kp2/4gfvXmBxJbriEuhD88FxIhMu/4bGwo/Zmm5PKU=;
 b=XxJESmc9QOw8E+RzGPNe9j1fJLZIGAT3oGulq2KfPT6/0V8up0DPmGzlaIPfufTt4R
 p4L6mK2CXVQqVF5SzNvUWpX68oLAFCJZd8fJkzF/dsri+lUHIPPUMDiQgGVU9nSOeqAJ
 ZxDGnzBKQket2tsKjq6epfjjplSXEu+ZewRgN549NcEywEgLaB5i+R8Onuxyt1m0bUyR
 xqmvq2fDTUFLVsAHyedxzyljdvqkZCXsGgXhxR/E8p4gS/TF/e5y1wI5u3whYGfxOCDK
 6H7Ssj0SWN3EXaew1iFG2MLFt41GJq5DT1AWOl7qo5LqRncsHdTwcnlkGELV8RLAaBSp
 pNmA==
X-Gm-Message-State: APjAAAWF8dNxRYvv+/+cGnUaNcVKz/d639CVGCggPB5HCDosxkOVejud
 pbMV5v5IFcV4FNf637ePaZInTuDyxHwpPQ==
X-Google-Smtp-Source: APXvYqzyzozcc13RbEElBKMgC85xeZluUAq3Nj+ec6fyGB0mCKrW7AZFby5Fmvl0iqiVphK7Y3wOpg==
X-Received: by 2002:aa7:8e85:: with SMTP id a5mr4937164pfr.24.1580231068666;
 Tue, 28 Jan 2020 09:04:28 -0800 (PST)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com.
 [209.85.216.54])
 by smtp.gmail.com with ESMTPSA id z14sm19959712pgj.43.2020.01.28.09.04.28
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2020 09:04:28 -0800 (PST)
Received: by mail-pj1-f54.google.com with SMTP id q39so1317924pjc.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 28 Jan 2020 09:04:28 -0800 (PST)
X-Received: by 2002:a1f:c686:: with SMTP id w128mr13530554vkf.34.1580230755259; 
 Tue, 28 Jan 2020 08:59:15 -0800 (PST)
MIME-Version: 1.0
References: <20191109191644.191766-1-dianders@chromium.org>
In-Reply-To: <20191109191644.191766-1-dianders@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 28 Jan 2020 08:59:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WcjHMzRE0yHm4uRFYj=Zoxz_v1FgiZETOwjzMtkjJcfQ@mail.gmail.com>
Message-ID: <CAD=FV=WcjHMzRE0yHm4uRFYj=Zoxz_v1FgiZETOwjzMtkjJcfQ@mail.gmail.com>
To: Paul Burton <paul.burton@mips.com>,
 Jason Wessel <jason.wessel@windriver.com>, 
 Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.68 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.68 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iwUfC-0037Lv-4w
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
 "Eric W. Biederman" <ebiederm@xmission.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 kgdb-bugreport@lists.sourceforge.net,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Chuhong Yuan <hslester96@gmail.com>, linux-mips <linux-mips@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Nicholas Mc Guire <hofrat@osadl.org>, James Hogan <jhogan@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, Will Deacon <will@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi

On Sat, Nov 9, 2019 at 11:17 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> This started out as just a follow-up to Daniel's post [1].  I wanted
> to stop implicitly changing the current task in kdb.  ...but, of
> course, everywhere you look in kdb there are things to cleanup, so
> this gets a few misc cleanups I found along the way.  Enjoy.
>
> [1] https://lore.kernel.org/r/20191010150735.dhrj3pbjgmjrdpwr@holly.lan
>
>
> Douglas Anderson (5):
>   MIPS: kdb: Remove old workaround for backtracing on other CPUs
>   kdb: kdb_current_regs should be private
>   kdb: kdb_current_task shouldn't be exported
>   kdb: Gid rid of implicit setting of the current task / regs
>   kdb: Get rid of confusing diag msg from "rd" if current task has no
>     regs
>
>  arch/mips/kernel/traps.c       |  5 -----
>  include/linux/kdb.h            |  2 --
>  kernel/debug/kdb/kdb_bt.c      |  8 +-------
>  kernel/debug/kdb/kdb_main.c    | 31 ++++++++++++++-----------------
>  kernel/debug/kdb/kdb_private.h |  2 +-
>  5 files changed, 16 insertions(+), 32 deletions(-)

I noticed that this series doesn't seem to be in linux-next, but I
think it was supposed to target v5.6?  Do you know if there is
anything outstanding or if it'll be queued up sometime soon?

Thanks!


-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
