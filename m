Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C69291BCEC6
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 28 Apr 2020 23:33:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jTXqz-0005MR-Jk
	for lists+kgdb-bugreport@lfdr.de; Tue, 28 Apr 2020 21:33:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jTXqy-0005MH-0g
 for kgdb-bugreport@lists.sourceforge.net; Tue, 28 Apr 2020 21:33:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=De9un6BJ2p4x3KGWjUlROhvJ0MQt7eKKFJEAHbkYVKo=; b=J1eZyTzuWDIJxacfp+B592hN8r
 TPc4CYGnHG3OuRM+Ndor1lgBcMmtEMSFpoBysYpAdttspnKJfLnz2CTFiMZ0G7Zsr2BFqX8wfLLML
 qAzmdK0mHPgkg2ET1Y48s3riw7US1cXixBoxb//wXfB5f9Vk1TGrdXInU134jVYHFYCk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=De9un6BJ2p4x3KGWjUlROhvJ0MQt7eKKFJEAHbkYVKo=; b=QJIx8gwfAe4l08DmYQk3pmcNR3
 707H84zHSz6DPM+RddYY37wziHQ1bFtYZ+RRaginJYcvPSaJoflO9vl1Pth/OdvN+QhquWKnkKN0t
 dqmy6V5+/8I9U7lkRwcsKnmugwhgzjuKVOoC7m6oTZrT5D0znScXFNzZLfq2A1fIcMEw=;
Received: from mail-ua1-f66.google.com ([209.85.222.66])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jTXqv-001YU2-Q2
 for kgdb-bugreport@lists.sourceforge.net; Tue, 28 Apr 2020 21:33:19 +0000
Received: by mail-ua1-f66.google.com with SMTP id y10so97625uao.8
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 28 Apr 2020 14:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=De9un6BJ2p4x3KGWjUlROhvJ0MQt7eKKFJEAHbkYVKo=;
 b=Q164BEzQpMCO+yXR5UTZKVBBSmsRxOmAyN/KrF3t7TxsTwMmrQgCsqsuZL+BeMJL03
 XecUGYvDtMil6cTU9seGNu+kDsVffn8AP7rW5uFNrhocyNYZybOPErY5sXsUxUhf0DiW
 9pUAv3ehkC7LHPm8Cfr3GXeTslc09VpGfVEKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=De9un6BJ2p4x3KGWjUlROhvJ0MQt7eKKFJEAHbkYVKo=;
 b=Antuzsze+R11zA21xZVeMy8sypwLM7463XVjYOjt4i0oGIrLiqkqF5Xid5s+zLBvgu
 0VHM/5hfqk3R4edzJAJ2VlIIMyqIZRA0Wy5GCEHws5t6YJLoxkr2x7iQcHY8vbmP1FMK
 PZp5/bqVT+S8Qhjp9ucpEPZM3FeHMbDxYJCgmN7sHa3922cLsWt+GEtGGZinFWwfIfsz
 JmSkgpdlZY/A7X5hcSUCsNe0bDY97iXTaCjpsSyHpJJLvThCRPBP1Cp2JF4R1GIzXIV+
 1it+40BtV+rhJKBTvs601VKBN7OkyzVi9zRVc5qHqoGaYZuq6VXAi/glkJ3QoQTsESUA
 FBow==
X-Gm-Message-State: AGi0PuaqT4tGVsDPGd7Ghlk3agQyIF+QRnHJrJzvXTVTjxoPXyX+HzkE
 6Q/GmHL+ecXGD9Vfbst0b02N4XeTrf4=
X-Google-Smtp-Source: APiQypKK3T8dM1JPnVlcqSh2GdgqLFwRduMeSNUk4XeE8wEdwSok4gZ6N5MaYyph5+80XzhTaE0AEQ==
X-Received: by 2002:ab0:624b:: with SMTP id p11mr22282485uao.94.1588109591517; 
 Tue, 28 Apr 2020 14:33:11 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com.
 [209.85.222.45])
 by smtp.gmail.com with ESMTPSA id h15sm4628763vsq.26.2020.04.28.14.33.09
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Apr 2020 14:33:10 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id i5so137077uaq.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 28 Apr 2020 14:33:09 -0700 (PDT)
X-Received: by 2002:a67:c40c:: with SMTP id c12mr23285523vsk.106.1588109589393; 
 Tue, 28 Apr 2020 14:33:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200421211447.193860-1-dianders@chromium.org>
 <20200421141234.v2.7.I7d5eb42c6180c831d47aef1af44d0b8be3fac559@changeid>
 <20200427164619.kw4mihmoxmxzjk66@holly.lan>
In-Reply-To: <20200427164619.kw4mihmoxmxzjk66@holly.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 28 Apr 2020 14:32:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W9nZKOB8powEuSecnwkDA01YR0c2uNY87+nV8+5jZZug@mail.gmail.com>
Message-ID: <CAD=FV=W9nZKOB8powEuSecnwkDA01YR0c2uNY87+nV8+5jZZug@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jTXqv-001YU2-Q2
Subject: Re: [Kgdb-bugreport] [PATCH v2 7/9] Documentation: kgdboc: Document
 new earlycon_kgdboc parameter
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
Cc: linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Andy Gross <agross@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, linux-serial@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, Borislav Petkov <bp@suse.de>,
 Jiri Slaby <jslaby@suse.com>, bp@alien8.de,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Juergen Gross <jgross@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Mon, Apr 27, 2020 at 9:46 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Tue, Apr 21, 2020 at 02:14:45PM -0700, Douglas Anderson wrote:
> > The recent patch ("kgdboc: Add earlycon_kgdboc to support early kgdb
> > using boot consoles") adds a new kernel command line parameter.
> > Document it.
> >
> > Note that the patch adding the feature does some comparing/contrasting
> > of "earlycon_kgdboc" vs. the existing "ekgdboc".  See that patch for
> > more details, but briefly "ekgdboc" can be used _instead_ of "kgdboc"
> > and just makes "kgdboc" do its normal initialization early (only works
> > if your tty driver is already ready).  The new "earlycon_kgdboc" works
> > in combination with "kgdboc" and is backed by boot consoles.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v2: None
> >
> >  .../admin-guide/kernel-parameters.txt         | 20 +++++++++++++++++++
> >  Documentation/dev-tools/kgdb.rst              | 14 +++++++++++++
> >  2 files changed, 34 insertions(+)
> >
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > index f2a93c8679e8..588625ec2993 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -1132,6 +1132,22 @@
> >                       address must be provided, and the serial port must
> >                       already be setup and configured.
> >
> > +     earlycon_kgdboc=        [KGDB,HW]
> > +                     If the boot console provides the ability to read
> > +                     characters and can work in polling mode, you can use
> > +                     this parameter to tell kgdb to use it as a backend
> > +                     until the normal console is registered. Intended to
> > +                     be used together with the kgdboc parameter which
> > +                     specifies the normal console to transition to.
> > +
> > +                     The the name of the early console should be specified
> > +                     as the value of this parameter. Note that the name of
> > +                     the early console might be different than the tty
> > +                     name passed to kgdboc. If only one boot console with
> > +                     a read() function is enabled it's OK to leave the
> > +                     value blank and the first boot console that implements
> > +                     read() will be picked.
>
> There's no need for the "If only one boot console with a read()
> funcuiton is enabled" here,
>
> Seeing this in alphabetic order in this patch it also crosses my mind
> that kgdboc_earlycon might be a better name so that is sorts closer
> to the other kgdb options. This is a kgdboc feature that uses earlycon
> not an earlycon feature that uses kgdboc.

OK.  'git format-patch', sed, and 'git am' for the win.


> > +
> >       earlyprintk=    [X86,SH,ARM,M68k,S390]
> >                       earlyprintk=vga
> >                       earlyprintk=sclp
> > @@ -1190,6 +1206,10 @@
> >                       This is designed to be used in conjunction with
> >                       the boot argument: earlyprintk=vga
> >
> > +                     This parameter works in place of the kgdboc parameter
> > +                     but can only be used if the backing tty is available
> > +                     very early in the boot process.
> > +
>
> I wonder if pragmatic advice is more useful:
>
>   For early debugging via a serial port see earlycon_kgdboc instead.

Done.


> >       edd=            [EDD]
> >                       Format: {"off" | "on" | "skip[mbr]"}
> >
> > diff --git a/Documentation/dev-tools/kgdb.rst b/Documentation/dev-tools/kgdb.rst
> > index d38be58f872a..c0b321403d9a 100644
> > --- a/Documentation/dev-tools/kgdb.rst
> > +++ b/Documentation/dev-tools/kgdb.rst
> > @@ -274,6 +274,20 @@ don't like this are to hack gdb to send the :kbd:`SysRq-G` for you as well as
> >  on the initial connect, or to use a debugger proxy that allows an
> >  unmodified gdb to do the debugging.
> >
> > +Kernel parameter: ``earlycon_kgdboc``
> > +-------------------------------------
> > +
> > +If you specify the kernel parameter ``earlycon_kgdboc`` and your serial
> > +driver registers a boot console that supports polling (doesn't need
> > +interrupts and implements a nonblocking read() function) kgdb will attempt
> > +to work using the boot console until it can transition to the regular
> > +tty driver specified by the ``kgdboc`` parameter.
> > +
> > +Normally there is only one boot console (especially that implements the
> > +read() function) so just adding ``earlycon_kgdboc`` on its own is
> > +sufficient to make this work.  If you have more than one boot console you
> > +can add the boot console's name to differentiate.
> > +
>
> I think we need an example here. The example in the patch header for
> the previous patch was useful (at least for me).

Done.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
