Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E332A1AB498
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 16 Apr 2020 02:09:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jOs5X-0001JC-IP
	for lists+kgdb-bugreport@lfdr.de; Thu, 16 Apr 2020 00:09:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <vincent.chen@sifive.com>) id 1jOs5W-0001J4-Ab
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Apr 2020 00:09:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bgJWByk7Pdxv+PTd3f8CTOYNxAe3wN9X/rwgujG77zs=; b=H6bsYUpnzEmYjz2fZbCv1EgWAv
 7gIy/JlNd4oAYUjRzb4ylF661wlz31jlzQTi0OCVSgOhBR8MkARhNiDXtBanOHoozuboVqnnbaFUu
 N96A+K5hFyk/MccCZuk1X0pYoXur99bgYdEaz5JObI3uh14karzfYdNoSE7q9qmyuNpc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bgJWByk7Pdxv+PTd3f8CTOYNxAe3wN9X/rwgujG77zs=; b=PkKRbkJcyzOSQD/BfDJ9Ngpm//
 7U6Eq7e9ThP4BJlxv8fMVXu5DQQTaJ6v2rB7cLd8Jin9KUL2gtAXo8alXHfDF6x52S2ynRlSsFr0j
 RDuJxTVUEquIkzOUCXmMy05goGoWSvy2zEKD8cWjgGWt0hjSykfQI+Tw04Z0Q72povoA=;
Received: from mail-qt1-f195.google.com ([209.85.160.195])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jOs5T-00HGOc-HW
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Apr 2020 00:09:02 +0000
Received: by mail-qt1-f195.google.com with SMTP id x2so15095771qtr.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 15 Apr 2020 17:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bgJWByk7Pdxv+PTd3f8CTOYNxAe3wN9X/rwgujG77zs=;
 b=azXEjTLBq8G7xp3HEi+sRXfm50e80tJfoo5aJF7a7aX4tgY5uwMSZN8pttWFaT/r4M
 UiYy1+JIClx7eZo+e4Y9HzKIxgnLOp0WdndagI6TsL61H3s4ChloEFL6Os/+d94ooy7u
 eaUhKMvzi6T0cT8Udwg8SYvEpEmtUkxGtPzVvZnH3Wh6tJ9yc2CVjGIJu47c1XYAdIwQ
 TKcPnG2gmF1TVtyjDy3VCwQ02xNzDgweVG0DinLUrAOfuqoUjsw2ZyG1+knmuRg2yJNW
 8hFpFQm0IYo8nxeLi1WZCthn7Iv0Q+Xxm8mFppXH02rtqxZIkAX5AK9aABFd/VhvINlq
 ylFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bgJWByk7Pdxv+PTd3f8CTOYNxAe3wN9X/rwgujG77zs=;
 b=Wzhar3cTfFl1aXctzqoDlaVx4jJhfGS2lPWklo6dYoet4hNU3piB1X2Vu3/xmwUqQg
 ssGoJ9tKZ2t7/Lic4nMvIKBUqUNvjkwl/HlFhIiyQdrmMevpPXnYgAYdmnchl20Vy1kc
 +tvGk/oPQxRWo11rZEeso4N5OPJbn62OrPwW8umgnfqnVsQi2Z+sh/dCXy9xBjkVUWUZ
 jvaou2hFTp3rHR4ztt8AJnQP9bk2XjmE3s5kLS5cNaKEC6otx683NMrunruNFHirNoVE
 FPdy5KzU21sXR7KWniePOUUsQties7D/N9dCHg4x9jPsWD6qMDyMMs5ZPbNHoCmzlbOH
 Bcmg==
X-Gm-Message-State: AGi0PuZLa+TDMVvDVfgKD9XWWIYX5MwULCQ8LeKUwOwWP9RBMjGGIY7b
 D/EpJeKUkdQiJqa5s0O6dwePeKAZ8J+zHRVLmC/hfQ==
X-Google-Smtp-Source: APiQypJDw/wK0jLup7xdVDshD2g65O+QJ8W7zCo/yCvhuB8ZFsDuPupZj5JvA4Kbh0in5u3PRqj3nc67t0GV5ifa6IQ=
X-Received: by 2002:ac8:7199:: with SMTP id w25mr23871146qto.86.1586995732415; 
 Wed, 15 Apr 2020 17:08:52 -0700 (PDT)
MIME-Version: 1.0
References: <1586655721-22567-1-git-send-email-vincent.chen@sifive.com>
 <1586655721-22567-3-git-send-email-vincent.chen@sifive.com>
 <CAFA6WYN36OVP3bXaNTU2h0Av8gT1zRz7oOcjApdtmiFNR+inzA@mail.gmail.com>
In-Reply-To: <CAFA6WYN36OVP3bXaNTU2h0Av8gT1zRz7oOcjApdtmiFNR+inzA@mail.gmail.com>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Thu, 16 Apr 2020 08:08:41 +0800
Message-ID: <CABvJ_xibZn8TeigS8Hd2mTt5tT_1qfmXMqCuzyPFGfHL1JEEwA@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.160.195 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jOs5T-00HGOc-HW
Subject: Re: [Kgdb-bugreport] [PATCH v3 2/5] riscv: Add KGDB support
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
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Apr 15, 2020 at 6:59 PM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> On Sun, 12 Apr 2020 at 08:19, Vincent Chen <vincent.chen@sifive.com> wrote:
> >
> > The skeleton of RISC-V KGDB port.
> >
> > Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> > Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> > ---
> >  arch/riscv/Kconfig              |   1 +
> >  arch/riscv/include/asm/kdebug.h |  12 +++
> >  arch/riscv/include/asm/kgdb.h   | 107 +++++++++++++++++++++
> >  arch/riscv/kernel/Makefile      |   1 +
> >  arch/riscv/kernel/kgdb.c        | 200 ++++++++++++++++++++++++++++++++++++++++
> >  arch/riscv/kernel/traps.c       |   5 +
> >  6 files changed, 326 insertions(+)
> >  create mode 100644 arch/riscv/include/asm/kdebug.h
> >  create mode 100644 arch/riscv/include/asm/kgdb.h
> >  create mode 100644 arch/riscv/kernel/kgdb.c
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index a197258595ef..7db9a81cda75 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -68,6 +68,7 @@ config RISCV
> >         select ARCH_HAS_GCOV_PROFILE_ALL
> >         select HAVE_COPY_THREAD_TLS
> >         select HAVE_ARCH_KASAN if MMU && 64BIT
> > +       select HAVE_ARCH_KGDB
> >
> >  config ARCH_MMAP_RND_BITS_MIN
> >         default 18 if 64BIT
> > diff --git a/arch/riscv/include/asm/kdebug.h b/arch/riscv/include/asm/kdebug.h
> > new file mode 100644
> > index 000000000000..85ac00411f6e
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/kdebug.h
> > @@ -0,0 +1,12 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +
> > +#ifndef _ASM_ARC_KDEBUG_H
> > +#define _ASM_ARC_KDEBUG_H
> > +
> > +enum die_val {
> > +       DIE_UNUSED,
> > +       DIE_TRAP,
> > +       DIE_OOPS
> > +};
> > +
> > +#endif
> > diff --git a/arch/riscv/include/asm/kgdb.h b/arch/riscv/include/asm/kgdb.h
> > new file mode 100644
> > index 000000000000..69bc6a03081d
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/kgdb.h
> > @@ -0,0 +1,107 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +
> > +#ifndef __ASM_KGDB_H_
> > +#define __ASM_KGDB_H_
> > +
> > +#ifdef __KERNEL__
> > +
> > +#define GDB_SIZEOF_REG sizeof(unsigned long)
> > +
> > +#define DBG_MAX_REG_NUM (33)
> > +#define NUMREGBYTES ((DBG_MAX_REG_NUM) * GDB_SIZEOF_REG)
> > +#define CACHE_FLUSH_IS_SAFE     1
>
> [...]
>
> > +#define BUFMAX                  2048
> > +#ifdef CONFIG_RISCV_ISA_C
> > +#define BREAK_INSTR_SIZE       2
> > +#else
> > +#define BREAK_INSTR_SIZE       4
> > +#endif
> > +#define CACHE_FLUSH_IS_SAFE 1
>
> double macro definition?
>
Sorry for my neglect.
I will remove the duplicated one in the next version patch.
Thanks for your reminder.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
