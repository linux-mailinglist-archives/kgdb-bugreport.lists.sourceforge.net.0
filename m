Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA1020EDE6
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 30 Jun 2020 07:56:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jq9Fk-0008WI-Jz
	for lists+kgdb-bugreport@lfdr.de; Tue, 30 Jun 2020 05:56:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jq9Fj-0008WB-N5
 for kgdb-bugreport@lists.sourceforge.net; Tue, 30 Jun 2020 05:56:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E8oezB9J+U2+aZrUcRMbQ+boDcYTf1u5GevKkRgvGQw=; b=lVoHycNv3hBs99DKfoV0ee++9k
 IdTRZWyJVJ1HL3nv9DOqBPow7U2/IQ0y5R9z2wFEq9uEqpM5S4Nj0TnIS9ZtJCoOy7Qm8YJgnJUd5
 CnwAZCT0FPa9g2QRhvtM++eWIa5ssruUwge2RHECD2yjpp+2iF4bM3qn0gkiu25nJavc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E8oezB9J+U2+aZrUcRMbQ+boDcYTf1u5GevKkRgvGQw=; b=B01pQWqO0FNtD0fvAVINGCRRIG
 6m1uxMxxKOQjC5f/c94k2w/jkyz114VrtHsU8UqpggkmLTQC4wZH7A6SQj/EVrm9OIGQhxjKb0k86
 TEIusNv8X3ADuzLS4928SX8tBnkYfeCiv6/sj+Jrlqp4Ha0WQG1M/76ZHVGOSKQiihw0=;
Received: from mail-lf1-f68.google.com ([209.85.167.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jq9Ff-005dph-NS
 for kgdb-bugreport@lists.sourceforge.net; Tue, 30 Jun 2020 05:56:19 +0000
Received: by mail-lf1-f68.google.com with SMTP id g139so10610138lfd.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 29 Jun 2020 22:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E8oezB9J+U2+aZrUcRMbQ+boDcYTf1u5GevKkRgvGQw=;
 b=zSmqHNR70DhHngHAc93WqKm7thBFYc0NMoZjyG8cNG+2dSEHnyy64EwZa7TL7HbTZA
 c6MEmS/8BraTkUJw5+J7TddJrCqndBVNXlSvpYRjQoUlfKz9PBfSfcnIgPUcvMDf8GJM
 yhkygfhOD5qrOUgdkyPst+0hJ0YvtoIhuKl6Dm0RpHACAt5HZvyI3Pgaa5vodgD7KaOU
 wY3cZJdTj9KJveD3cuqSPqZDiLI3/l+ORputDKpC6c8ebcFaCRU2TwxmMl6TLHtdkmAD
 PQkY6p5wU/uw+vAo2oovVe1ZXp3bukO/q4m0BEmh/gb4VeifPP+3jBYv6aT+mnjxWa4G
 rxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E8oezB9J+U2+aZrUcRMbQ+boDcYTf1u5GevKkRgvGQw=;
 b=KK8/0Ohif+LbVZZXTSTimBHpHTpCs2QqjQ2fH0SSnIHF/ZzuEjBy7mMAxUlus14/Jj
 jIXbGv9D75Ugh31zGhkdKNY2fsy7RtubeHT2swsJ41BcZmjaQIZh7HyCvSV4wLCveriW
 8GHcJ37gS02YKA0NDzqMbrQpd/f7BXWG6XLeJA0DFR0BJv6NduZJ83uVhaBGLdBKY5Ni
 Z8LeZbOMclA0jsg2VWpzPYUkVGv/RHnOASmKiDqfNqK/NG1YIk2/nTu1cgdP62C/osbF
 iYG9E47oIkfTUqypPZJLp1WMOHUKe23RcIu3++VTtjdL8FVmaj/xxEaD9HxGpKRK+3AO
 uBQw==
X-Gm-Message-State: AOAM530dPDiumpiSsU0iy8+Dn+yWJCQHgpdMtZH53yWxuqwG1r30uyQw
 B6BDwEWGpQEv91+rhWjJ/rOQgcSaUSHC4KOcHqwjSQ==
X-Google-Smtp-Source: ABdhPJwEQrcbY9Xpo6fvWx9CWHmTT5YtDnz0CtwCEmEVFhnk47jEhTH2dtMXCRsKU7sJrtbuCkCuLWiVOfyaOWzMBlw=
X-Received: by 2002:a19:8c09:: with SMTP id o9mr11283562lfd.160.1593496569051; 
 Mon, 29 Jun 2020 22:56:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200629135923.14912-1-cengiz@kernel.wtf>
 <20200629145020.GL6156@alley>
 <20200629153756.cxg74nec3repa4lu@holly.lan>
In-Reply-To: <20200629153756.cxg74nec3repa4lu@holly.lan>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 30 Jun 2020 11:25:57 +0530
Message-ID: <CAFA6WYNpCG2xPERd=NeKf+EthbX+1R4iieOL52kWnBp8y_+Nbw@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>,
 Petr Mladek <pmladek@suse.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: kernel.wtf]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jq9Ff-005dph-NS
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: prevent possible null deref in
 kdb_msg_write
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, Cengiz Can <cengiz@kernel.wtf>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, 29 Jun 2020 at 21:07, Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Mon, Jun 29, 2020 at 04:50:20PM +0200, Petr Mladek wrote:
> > On Mon 2020-06-29 16:59:24, Cengiz Can wrote:
> > > `kdb_msg_write` operates on a global `struct kgdb_io *` called
> > > `dbg_io_ops`.
> > >
> > > Although it is initialized in `debug_core.c`, there's a null check in
> > > `kdb_msg_write` which implies that it can be null whenever we dereference
> > > it in this function call.
> > >
> > > Coverity scanner caught this as CID 1465042.
> > >
> > > I have modified the function to bail out if `dbg_io_ops` is not properly
> > > initialized.
> > >
> > > Signed-off-by: Cengiz Can <cengiz@kernel.wtf>
> > > ---
> > >  kernel/debug/kdb/kdb_io.c | 15 ++++++++-------
> > >  1 file changed, 8 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> > > index 683a799618ad..85e579812458 100644
> > > --- a/kernel/debug/kdb/kdb_io.c
> > > +++ b/kernel/debug/kdb/kdb_io.c
> > > @@ -549,14 +549,15 @@ static void kdb_msg_write(const char *msg, int msg_len)
> > >     if (msg_len == 0)
> > >             return;
> > >
> > > -   if (dbg_io_ops) {
> > > -           const char *cp = msg;
> > > -           int len = msg_len;
> > > +   if (!dbg_io_ops)
> > > +           return;
> >
> > This looks wrong. The message should be printed to the consoles
> > even when dbg_io_ops is NULL. I mean that the for_each_console(c)
> > cycle should always get called.
> >
> > Well, the code really looks racy. dbg_io_ops is set under
> > kgdb_registration_lock. IMHO, it should also get accessed under this lock.
> >
> > It seems that the race is possible. kdb_msg_write() is called from
> > vkdb_printf(). This function is serialized on more CPUs using
> > kdb_printf_cpu lock. But it is not serialized with
> > kgdb_register_io_module() and kgdb_unregister_io_module() calls.
>
> We can't take the lock from the trap handler itself since we cannot
> have spinlocks contended between regular threads and the debug trap
> (which could be an NMI).
>
> Instead, the call to kgdb_unregister_callbacks() at the beginning
> of kgdb_unregister_io_module() should render kdb_msg_write()
> unreachable prior to dbg_io_ops becoming NULL.
>
> As it happens I am starting to believe there is a race in this area but
> the race is between register/unregister calls rather than against the
> trap handler (if there were register/unregister races then the trap
> handler is be a potential victim of the race though).
>
>
> > But I might miss something. dbg_io_ops is dereferenced on many other
> > locations without any check.
>
> There is already a paranoid "just in case there are bugs" check in
> kgdb_io_ready() so in any case I think the check in kdb_msg_write() can
> simply be removed.
>
> As I said in my other post, if dbg_io_ops were ever NULL then the
> system is completely hosed anyway: we can never receive the keystroke
> needed to leave the debugger... and may not be able to tell anybody
> why.
>
>
> > >
> > > -           while (len--) {
> > > -                   dbg_io_ops->write_char(*cp);
> > > -                   cp++;
> > > -           }
> > > +   const char *cp = msg;
> > > +   int len = msg_len;
> > > +
> > > +   while (len--) {
> > > +           dbg_io_ops->write_char(*cp);
> > > +           cp++;
> > >     }
> > >
> > >     for_each_console(c) {
> >
> > You probably got confused by this new code:
> >
> >               if (c == dbg_io_ops->cons)
> >                       continue;
> >
> > It dereferences dbg_io_ops without NULL check. It should probably
> > get replaced by:
> >
> >               if (dbg_io_ops && c == dbg_io_ops->cons)
> >                       continue;
> >
> > Daniel, Sumit, could you please put some light on this?
>
> As above, I think the NULL check that confuses coverity can simply be
> removed.
>

+1

-Sumit

>
> Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
