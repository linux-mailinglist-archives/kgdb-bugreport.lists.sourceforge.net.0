Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD311ECEB5
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  3 Jun 2020 13:42:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jgRnM-0003J6-UQ
	for lists+kgdb-bugreport@lfdr.de; Wed, 03 Jun 2020 11:42:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jgRnL-0003Id-2n
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Jun 2020 11:42:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L3uwm8GKhOaqpoZ0YGgbFzd1wKVWSSHIAlOR+KHduXk=; b=VruDcbZkXnPhJTb37QIXPquAEE
 4Tm117z+7/2qhUdwVzQZLka5P7ikMrqwmtcLuUxmXWb3IOLl7FdK3v0Dl25YSZyyH0/TbUguwjYjE
 sQa3rOqdhkZcy6mm8bDIcsg438HM+qlIH/fnEBFiKbUHp39HfdrjBTysMraSdtPCywTA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L3uwm8GKhOaqpoZ0YGgbFzd1wKVWSSHIAlOR+KHduXk=; b=ftZ53sjkWJFlzVOm6ycxPumlqx
 mFdeAb4hAPR1L6GH15REdCDXEvlbtmF4X8CKa1sKaRuTTIqdfQ0ug7vUTvVOfdkC2BTLAT+y8yXC0
 E12aXXjSjdBQDqFjcP5ducbr12gMwTwgGBWst10hj00i/lRt9TqfAaVd1JeqV7kjap20=;
Received: from mail-wr1-f66.google.com ([209.85.221.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jgRnH-007P0Q-Kw
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Jun 2020 11:42:55 +0000
Received: by mail-wr1-f66.google.com with SMTP id r7so2027347wro.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 03 Jun 2020 04:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=L3uwm8GKhOaqpoZ0YGgbFzd1wKVWSSHIAlOR+KHduXk=;
 b=qHwY0sL6MjgOfAS8/Jg15PLIDIl+0xDJXebfzbSeGl77uFAAkGwTrhJGvtoEV8yCFQ
 uQqYKe/hGqiHMVUhvdCS3WbLDa0ruXpuTd5G1VDg2QXRE4RbDOPBSAP/znisL0NU4zVa
 BpCMGAzPFeBcOdesoja9rolr5FvYCsuXbks6gt7Vif890nJvHG8zyqo78y4/Ohp6c5ye
 d8uM42cunpL2/No9RMeiKejypbM/ZnJh1svSxrMypFsb+9OrscztyeEl5mDS1o0BOnL7
 9XZz3UDbVkN1FJBYJuTs0JweChbdtwClFLsWZbOrQlE92+n3nnT5ZCsYTALnBez9RcUl
 oJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=L3uwm8GKhOaqpoZ0YGgbFzd1wKVWSSHIAlOR+KHduXk=;
 b=a2Yjs/2PokVx6uKMkhQmB3JC269vgy7XCU7hZxOgU7RmglqXgHwMDyCxBCSH9uWjrt
 LDIvZopi6swTwmze+fbnhCwzL2GkZ7YrGZkYNg+XTdp5rK2N4fsfAKl0GTwb1T8c0WUd
 x38j/YBmbE1xXwINtGwemEb7CAedCnU99Y2xslJYZBtvPcsadHBXItPDpSg5KY/WoN9d
 gmSJC90Yybi4LeSXDYZ/SbiKlLVMHADwhBGJm9FAax8BtGPJjKSIF9HyTbkNltQzpj8j
 FYonVQo3OIQKwqZAY78YzkLx82C+OvbjiEVPkuAJ9lVGQZgWH09pgHldigIuKstW24W0
 dDFQ==
X-Gm-Message-State: AOAM530q1s080KhE5ne3yGhvhDJCXSzQ1u5av5YIjhewEoXSDWvhLK4K
 uKMGLM5MKWHOVQFvwKlHer80iA==
X-Google-Smtp-Source: ABdhPJx2JYmj3kQlas2NeFsHxLhERdjRzWJtW534D05ClC6owgvaZ0fayMzFXCD3mkbt6TOctSu4bw==
X-Received: by 2002:a05:6000:1192:: with SMTP id
 g18mr32264160wrx.326.1591184565225; 
 Wed, 03 Jun 2020 04:42:45 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id c206sm2137559wmf.36.2020.06.03.04.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2020 04:42:44 -0700 (PDT)
Date: Wed, 3 Jun 2020 12:42:42 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20200603114242.khv5yi5yweq3e2jz@holly.lan>
References: <1591168935-6382-1-git-send-email-sumit.garg@linaro.org>
 <1591168935-6382-5-git-send-email-sumit.garg@linaro.org>
 <20200603082503.GD14855@linux-b0ei>
 <CAFA6WYMHtXzW-VLJYhC_-7w5+1NgM8PYrNXv=-2g_GKdOO+sNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFA6WYMHtXzW-VLJYhC_-7w5+1NgM8PYrNXv=-2g_GKdOO+sNQ@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jgRnH-007P0Q-Kw
Subject: Re: [Kgdb-bugreport] [PATCH v5 4/4] kdb: Switch to use safer
 dbg_io_ops over console APIs
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
Cc: Petr Mladek <pmladek@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Jun 03, 2020 at 03:02:02PM +0530, Sumit Garg wrote:
> On Wed, 3 Jun 2020 at 13:55, Petr Mladek <pmladek@suse.com> wrote:
> >
> > On Wed 2020-06-03 12:52:15, Sumit Garg wrote:
> > > In kgdb context, calling console handlers aren't safe due to locks used
> > > in those handlers which could in turn lead to a deadlock. Although, using
> > > oops_in_progress increases the chance to bypass locks in most console
> > > handlers but it might not be sufficient enough in case a console uses
> > > more locks (VT/TTY is good example).
> > >
> > > Currently when a driver provides both polling I/O and a console then kdb
> > > will output using the console. We can increase robustness by using the
> > > currently active polling I/O driver (which should be lockless) instead
> > > of the corresponding console. For several common cases (e.g. an
> > > embedded system with a single serial port that is used both for console
> > > output and debugger I/O) this will result in no console handler being
> > > used.
> > >
> > > In order to achieve this we need to reverse the order of preference to
> > > use dbg_io_ops (uses polling I/O mode) over console APIs. So we just
> > > store "struct console" that represents debugger I/O in dbg_io_ops and
> > > while emitting kdb messages, skip console that matches dbg_io_ops
> > > console in order to avoid duplicate messages. After this change,
> > > "is_console" param becomes redundant and hence removed.
> > >
> > > diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
> > > index 4139698..6e182aa 100644
> > > --- a/drivers/tty/serial/kgdboc.c
> > > +++ b/drivers/tty/serial/kgdboc.c
> > > @@ -558,6 +557,7 @@ static int __init kgdboc_earlycon_init(char *opt)
> > >       }
> > >
> > >       earlycon = con;
> > > +     kgdboc_earlycon_io_ops.cons = con;
> > >       pr_info("Going to register kgdb with earlycon '%s'\n", con->name);
> > >       if (kgdb_register_io_module(&kgdboc_earlycon_io_ops) != 0) {
> > >               earlycon = NULL;
> >
> > Should we clear kgdboc_earlycon_io_ops.cons here when
> > kgdb_register_io_module() failed?
> >
> 
> AFAIK, kgdboc_earlycon_io_ops won't be used at any later stage in case
> registration fails. So IMO, it would be a redundant assignment unless
> I missed something.

Or, putting it another way, earlycon is a redundant (albeit better
maintained) copy of kgdboc_earlycon_io_ops.cons. So I think the best
thing to do is entirely replace earlycon with
kgdboc_earlycon_io_ops.cons and then properly set it to NULL!


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
