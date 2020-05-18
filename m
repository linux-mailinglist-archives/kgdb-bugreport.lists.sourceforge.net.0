Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A0E1D70C6
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 18 May 2020 08:20:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jaZ8O-0004Qa-E5
	for lists+kgdb-bugreport@lfdr.de; Mon, 18 May 2020 06:20:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jaZ8M-0004QR-8s
 for kgdb-bugreport@lists.sourceforge.net; Mon, 18 May 2020 06:20:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BSTNIXQj3Q6OdZ9siyJsFnsk+u2QPmFZetayBVXeQvY=; b=bkwsrBYaRiz6Js7zp5z+WSl4JY
 M7/wWWsrtKSMN+YfA8QbardkDOfBE/ZCst79wVx2fVxuZnMC6Ro95Qm2KjylyyDuH4HTGEp/nquMN
 wEf3teGof36KyxNQDluklLrGcBfOUj+aYANPGF/XCbyT2Upds60vhSgsgF1f/5d+XNhA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BSTNIXQj3Q6OdZ9siyJsFnsk+u2QPmFZetayBVXeQvY=; b=Zv9zAVC5yVTAoBZX0IA4zHkaOA
 qLe7SggO/Xh7tMBbNZvodkPoqeDkWXe9emmgzq9GByZz5QF6gsPIZ9uzoV5zEKu/z+kUSWw8z+Pcr
 iBdshz6SvvtJzPZTX6ZwF9u3mSlimFZ1Jd6v9cvYFV3AzC+2boSsDmlXmy5N2PVf7yNo=;
Received: from mail-lj1-f193.google.com ([209.85.208.193])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jaZ8I-00DLRe-KZ
 for kgdb-bugreport@lists.sourceforge.net; Mon, 18 May 2020 06:20:18 +0000
Received: by mail-lj1-f193.google.com with SMTP id w10so8525291ljo.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sun, 17 May 2020 23:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BSTNIXQj3Q6OdZ9siyJsFnsk+u2QPmFZetayBVXeQvY=;
 b=EHJyWVMQ6k2vq+IZRHKjaplkAjmLfHG/tmXifZxwUamd7/Ur4aVLXl43G00Y/eRhGL
 X2+Aa+vBnge640M3Wc4HOzmi/TpKNo0FDHZrNkxfuCctg+ovNsQVM1ytETx6ptSnc42c
 C6ahPqYKgslXoDAYlawN3SYf0VKqNHg2hwoJIvv9oURU/r5FjESnAlcUFkubYM/KsK9I
 AZYTxM2kBPnMDuObrAHddD1n/dZSJpZvjcrcVKBKkGQJtXt7sI19om9ZV6qckWqIyiCR
 /3MAanWwQ9/pIvZjA6mBuXf8RlQ8+/c5nUDVYjDfqxfTNSe/F3Tu9BOWZpBuNA3FlQNE
 eraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BSTNIXQj3Q6OdZ9siyJsFnsk+u2QPmFZetayBVXeQvY=;
 b=s/T9n7JKbDEWowwaGnIcfvk3d2e2YJMi2JfLtIe7elnTnwC26H/rpw2QIPJLRcQy81
 H/9397tPsAFCbB+mOP9VEiDem0wK19tgulYUCFcskiGYHzKcG1mUIXxlz+yigHIuwhlU
 OrMbZ3KIP3ZbE9zn3CFN8y3eUz3ZIJHzBU+JU2AJ/s34thOx0MIsf4tRp4nNeuGHwMCS
 fXZGwAmn5kIR3sz1i5WN1vuEPPIGvpiGHwPfUMKjMfjt324oQj112tMCWiXpuysGb0bL
 1xXP7Yj9P2Xz/CoWrf1JF1xz19U+DUPe9B61heUQBJA8qcsh3dic04eQMjSpBDa5/vV/
 uJgQ==
X-Gm-Message-State: AOAM532BdQcFAO+7EFcOzpwpISKHfvNf8BX5p3K+aH8nug1sZ9sDjMLB
 bOoKbq7JeKal6N090DWw1KMBZj/RF0JuJZmmP+P3eA==
X-Google-Smtp-Source: ABdhPJyHYyRIXYzdyy/hgEBTWq22/GDXTVVpRIIMAbm3csQAURrxNISE0U2yv9pqCGw+66QGPZMxnrrGqHAd/Z/PIjY=
X-Received: by 2002:a2e:9907:: with SMTP id v7mr366660lji.0.1589782807841;
 Sun, 17 May 2020 23:20:07 -0700 (PDT)
MIME-Version: 1.0
References: <1589273314-12060-1-git-send-email-sumit.garg@linaro.org>
 <20200512142533.ta4uejwmq5gchtlx@holly.lan>
 <CAFA6WYOV7oPbYE=9fXueYMacb5wv0r9T6F8tmECt-Eafe-fctw@mail.gmail.com>
 <20200514084230.GO17734@linux-b0ei>
 <CAFA6WYPSsgdAB-wJC0e2YkVkW0XsqQsu5wrn4iB4M-cwvS7z2g@mail.gmail.com>
 <20200515085021.GS17734@linux-b0ei>
 <20200515103308.GD42471@jagdpanzerIV.localdomain>
 <CAFA6WYOBsimP1j8Fwq4OcePEug4MGoaY3wTTTVydHtTphZ-FTw@mail.gmail.com>
 <20200515163638.GI42471@jagdpanzerIV.localdomain>
 <CAD=FV=XohG8ErL=_fyuA+MXEmfp55aW+SxSunb6YPRYj77bOxQ@mail.gmail.com>
In-Reply-To: <CAD=FV=XohG8ErL=_fyuA+MXEmfp55aW+SxSunb6YPRYj77bOxQ@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 18 May 2020 11:49:55 +0530
Message-ID: <CAFA6WYMK3HKtCVxYcN25L7T5duVmH+jAOSbMQUZrJq3Pr8JBZA@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>, 
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.193 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.193 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jaZ8I-00DLRe-KZ
Subject: Re: [Kgdb-bugreport] [PATCH] printk/kdb: Redirect printk messages
 into kdb in any context
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
 Daniel Thompson <daniel.thompson@linaro.org>,
 John Ogness <john.ogness@linutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, 15 May 2020 at 22:22, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Fri, May 15, 2020 at 9:36 AM Sergey Senozhatsky
> <sergey.senozhatsky@gmail.com> wrote:
> >
> > On (20/05/15 17:32), Sumit Garg wrote:
> > > > Can I please have some context what problem does this solve?
> > >
> > > You can find the problem description here [1] which leads to this fix.
> >
> > [..]
> >
> > > [1] https://lkml.org/lkml/2020/5/12/213
> >
> > Thanks for the link. I'm slightly surprised it took so many years
> > to notice the addition of printk_nmi/printk_safe :)

It's been noticed now since I started playing with NMIs support on
arm64 for kgdb. And that's been only possible with the advent of
pseudo NMIs on arm64 since Linux 5.3 release.

>
> I haven't looked at all the details, but IIUC we don't normally enter
> kgdb on the primary CPU through a NMI context, but the secondary ones
> (on x86) always do.

There's a case for the primary CPU to enter kgdb in NMI context too.
Consider hard-lockup detection based kernel panic. I guess that's
already been working on x86 and should be able to work on arm64 after
this patch [1].

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2020-May/732227.html

-Sumit

>  Most things are run on the primary CPU and I
> think it's relatively unlikely for people to change the primary CPU
> (though it is possible).
>
> Probably things got worse when I changed the way "btc" worked to make
> it common between all architectures.  See commit 9ef50a686b53
> ("UPSTREAM: kdb: Fix stack crawling on 'running' CPUs that aren't the
> master").  Though theoretically someone could have changed masters and
> reproduced the problem with a simple "bt" before my patch, now a
> relatively normal command "btc" would tickle the problem.  I didn't
> notice it because I work almost totally on arm/arm64 machines and they
> don't have NMI (yet).
>
> In general I've always wondered about why (historically) kgdb bugs
> have sometimes gone unnoticed for a period of time.  That does seem to
> be changing, though, and I've seen a few longstanding bugs getting
> fixed recently.  :-)
>
>
> -Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
