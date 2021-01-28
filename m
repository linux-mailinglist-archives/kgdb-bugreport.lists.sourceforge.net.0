Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 521AC306CFB
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 28 Jan 2021 06:34:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l4zxI-0003CU-V4
	for lists+kgdb-bugreport@lfdr.de; Thu, 28 Jan 2021 05:34:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1l4zxH-0003CM-Kp
 for kgdb-bugreport@lists.sourceforge.net; Thu, 28 Jan 2021 05:34:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yz4dvbWilv+59+sGvg7GlreEXmLYHQWRQqY4rHmQdj8=; b=djMLc4bpWXErqo/1se3DwHN/45
 Ie93Q0lLtEMuArM+R06HLvt1BQP3a7R4hsYF10qWC8iq9fjMWxXQW4HoFhBz9V/AWtG2yHFlghRzB
 YPsg74iKq3teLn6M1UhakQfLxXh7HrMfhZjDXa+lQyQvWK8maBUzB+RQWvp9GYmfAvls=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Yz4dvbWilv+59+sGvg7GlreEXmLYHQWRQqY4rHmQdj8=; b=fDDC0T8mcXazpL/I6ISzsAC3Go
 XRu3O/jHT/T0nLLBtJQfvVZLlMKzitB+W5ILzfxak39kHeDchx+NNZYttjc9GFohpXawe0YsTlJC+
 I8VT6z3Z+UntNHt+Mr6K0hhJgxwS9ochYD+f9WfUBL6iSM2t7e6GvIvQRbUjCn51j0S8=;
Received: from mail-ej1-f49.google.com ([209.85.218.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1l4zx6-00075d-3o
 for kgdb-bugreport@lists.sourceforge.net; Thu, 28 Jan 2021 05:34:55 +0000
Received: by mail-ej1-f49.google.com with SMTP id w1so5936490ejf.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 27 Jan 2021 21:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yz4dvbWilv+59+sGvg7GlreEXmLYHQWRQqY4rHmQdj8=;
 b=DA1aho4knu8EGzj179+534CVs3VecnJZBpLja6mPhWG/xBuAx9rDxzXSUifoEgPTs5
 Ph9OLQDunZxUpZO6gnUjM2AdExHmh4vrgf1Zet00XwJMirfurIp9uZQvjp2wc/d6UkrU
 Z38rRoKRhyo3jsNYTk3f8PQadKp3/Rh9TiuPKJFJUea2i5UF4/ZRtMkqohBsvYR4mLBJ
 A3H0xXUdHCEcTqkDnJ4gfzj9bOX+d4Hf+An/guf1uSx+cv89bkGXnvgKBln8/N3sL+TU
 4OI51WtZfUYE/g99NT1XeiM7s1d/ZqgQLJVMUUZPvN3EelapRn7aNrKjze/PVaDacAaI
 VtZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yz4dvbWilv+59+sGvg7GlreEXmLYHQWRQqY4rHmQdj8=;
 b=ijeipImAkoOkkCA+0nI+tPhjbxZ2UhNQOD0P8a/Ifv0wnCsHNojDDofyKpRNXuEiVO
 l6/UGEQwjzHCVQocoreoQ9Sv4JKbhYciwOCgnu+uBNupsajf9ukrHQ8TH0Z8V6rAELBQ
 qiI+Q+Sz6dTvlQm04lM8eiM0BR3jK7EQPn2WL90OrGx5pX/+5lcb267Y9fumrooTzd0C
 4Df8Rv64xWq/KrNZCghLk4gGpahXn2k1RRHZpCQw6kvVHjvnW/0tdxnP9bLkNaT7A0tV
 6nJoPP1nmLl7NIsof5DxtbTe6mVovroe+dLXrQ0cjYn7SdNsNY6i4qeYBrAQUW2Toqza
 y1RA==
X-Gm-Message-State: AOAM532rNm8WhHLwTjuX/fAx5h5dRHKnRC29wxPu1OBYTe/lSYxc9xup
 aht/Ud1jkd5cXeRXOdz0L3KSFLlwBrX2RRrL1HVq1Lu27GBqsw==
X-Google-Smtp-Source: ABdhPJx1h6w8r4GuWW2pMTFX/gJji2VtuNCQtzxOgmz9AZ9wjQFJUaHAmSpPueSwlFMNk5huWj533XG+GxZ9oZbGbsY=
X-Received: by 2002:a2e:97cc:: with SMTP id m12mr7313826ljj.343.1611810684701; 
 Wed, 27 Jan 2021 21:11:24 -0800 (PST)
MIME-Version: 1.0
References: <1611313556-4004-1-git-send-email-sumit.garg@linaro.org>
 <CAD=FV=V8HwhdhpCoiZx4XbTMWug0CAxhsnPR+5V9rB0W7QXFTQ@mail.gmail.com>
 <20210125081855.gfq3n6urcmght3ef@maple.lan>
In-Reply-To: <20210125081855.gfq3n6urcmght3ef@maple.lan>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 28 Jan 2021 10:41:12 +0530
Message-ID: <CAFA6WYN8dOScFg8txFFis+kTm9qLU95XO4JO6uqZ4o=SfZeJGg@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.218.49 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.49 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1l4zx6-00075d-3o
Subject: Re: [Kgdb-bugreport] [PATCH v3] kdb: Make memory allocations more
 robust
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
Cc: kgdb-bugreport@lists.sourceforge.net, "# 4.0+" <stable@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, 25 Jan 2021 at 13:48, Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Fri, Jan 22, 2021 at 09:25:44AM -0800, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, Jan 22, 2021 at 3:06 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> > >
> > > Currently kdb uses in_interrupt() to determine whether its library
> > > code has been called from the kgdb trap handler or from a saner calling
> > > context such as driver init.  This approach is broken because
> > > in_interrupt() alone isn't able to determine kgdb trap handler entry from
> > > normal task context. This can happen during normal use of basic features
> > > such as breakpoints and can also be trivially reproduced using:
> > > echo g > /proc/sysrq-trigger
> >
> > I guess an alternative to your patch is to fully eliminate GFP_KDB.
> > It always strikes me as a sub-optimal design to choose between
> > GFP_ATOMIC and GFP_KERNEL like this.  Presumably others must agree
> > because otherwise I'd expect that the overall kernel would have
> > something like "GFP_AUTOMATIC"?
> >
> > It doesn't feel like it'd be that hard to do something more explicit.
> > From a quick glance:
> >
> > * I think kdb_defcmd() and kdb_defcmd2() are always called in response
> > to a user typing something on the kdb command line.  Those should
> > always be GFP_ATOMIC, right?
>
> No. I'm afraid not. The kdb parser is also used to execute
> kernel/debug/kdb/kdb_cmds as part of the kdb initialization. This
> initialization happens from the init calls rather than from the kgdb
> trap handler code.
>
> When I first looked at Sumit's patch I had a similar reaction to you
> but, whilst it is clearly it's not impossible to pass flags into the
> kdb parser and all its subcommands, I concluded that GFP_KDB is a
> better approach.
>
> BTW the reason I insisted on getting rid of the in_atomic() was to make
> it clear that GFP_KDB discriminates between exactly two calling contexts
> (normal and kgdb trap handler). I was didn't want any hints that imply
> GFP_KDB is a (broken) implementation of something like GFP_AUTOMATIC!
>

Ah, I see the reasoning to keep GFP_KDB. So we don't need any further
refactoring and can go ahead with this patch only.

-Sumit

>
> Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
