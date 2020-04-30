Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F1D1C02A9
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 30 Apr 2020 18:36:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jUCAM-0004Oc-6r
	for lists+kgdb-bugreport@lfdr.de; Thu, 30 Apr 2020 16:36:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jUCAL-0004OB-31
 for kgdb-bugreport@lists.sourceforge.net; Thu, 30 Apr 2020 16:36:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JHOM9ScIACBAlj+EOQQZskvxADzU4dEs6BpxOZoTWCg=; b=G0EUX/dHMIC8kQDCLXSsHGRe7+
 MUop/quG5mKRpelHD9KNakijmJ+3dp2s3Y4vs66t7rYNfqCzTOfTlv0p9572+14+NGkRIxO25Yo0Q
 FFrN7aMx/4OPOX46Moe7MyXl+30snJ08tjLpSGzpfN1SLYJbGcM6nx88mtVYiJqeXD8U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JHOM9ScIACBAlj+EOQQZskvxADzU4dEs6BpxOZoTWCg=; b=QjzadZpYvXafizwOKldz1kbBzk
 RMcpzm7R9W5NMk3N6NeaqQWVMcaQw9J9r8OEZnTcanb0gKFZnLqMgMQGWJyl73HWLXddOzMvYP6rL
 mwyP/KkqnkMdwJ46Phe3Lz4Q7VeL9xHEAw8HJuyOKMWPDaqWvAdg/X78DJy9CGCJ9AaY=;
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jUCAH-00HTTo-Lo
 for kgdb-bugreport@lists.sourceforge.net; Thu, 30 Apr 2020 16:36:01 +0000
Received: by mail-io1-f65.google.com with SMTP id c2so2144882iow.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 30 Apr 2020 09:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JHOM9ScIACBAlj+EOQQZskvxADzU4dEs6BpxOZoTWCg=;
 b=DKOnI1/+M5kE4JIw2Yp+nF/RAd2KxfFdck3bIvzB9AlctHyy+RL1/A4oFRifDlFDEi
 0HGkvP4KvdCdEiWI0FOxU1i/5oaMPU9AQ604Ft4OEZSfP6sSdZMBMFR3ppk0v8YSwefO
 lOIJjZR+alCUq3QcUCj+hoKzU3y8Oq/vJ6riI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JHOM9ScIACBAlj+EOQQZskvxADzU4dEs6BpxOZoTWCg=;
 b=KoUEmlfdeZO85MX3zZp2AE3LqD2/OeF4AFINALDiRjMy8dfjUl9BxjPwn1btL19kSI
 QdzPbjWxlpdlnOQxr4mrGCNbv+WZ0S2okmKA2YxJ9oc5US6x6KJ5VhxuS/7IzEFbOlGu
 XCovPysuH0ntOWpSJIt37MFxy/fUCXx6Tcm+5EryZZt6mf7haWzBenrl59gHiy9w+15B
 35K0RJpHboMjpflJ8+5a0N5OX0SpA1E5Cy0AbtD8/WOhtbQm48TdZcwKlzW9gDdJ1i/t
 eLKU7Vb++qnTqSRg54+k0il82ruWmUycUK/zqqQZ0YIym/iG0u4Ntpjn1p9/tmappyd6
 8sKA==
X-Gm-Message-State: AGi0PuYpxzqR9Hne/9mHHEMUZyqpRO4kYze2lIfR1vNuYcQhUKoC5HT8
 fLDQ58lq6tKcX1LXESp/m955k/WPCDI=
X-Google-Smtp-Source: APiQypLVY50J6kBh/i0AdP7pGVcWHtJ56abRQodWj7n7J4fbKSawUQzgqoihiYfqLuOfQAcJhRIKQg==
X-Received: by 2002:a02:a60b:: with SMTP id c11mr2549985jam.45.1588264551242; 
 Thu, 30 Apr 2020 09:35:51 -0700 (PDT)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com.
 [209.85.166.180])
 by smtp.gmail.com with ESMTPSA id k13sm106944ils.62.2020.04.30.09.35.49
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 09:35:50 -0700 (PDT)
Received: by mail-il1-f180.google.com with SMTP id c18so1959066ile.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 30 Apr 2020 09:35:49 -0700 (PDT)
X-Received: by 2002:a92:ca81:: with SMTP id t1mr2769977ilo.187.1588264549492; 
 Thu, 30 Apr 2020 09:35:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200428211351.85055-1-dianders@chromium.org>
 <20200428141218.v3.4.I3113aea1b08d8ce36dc3720209392ae8b815201b@changeid>
 <20200430154927.vhkhoffqwirb2fmm@holly.lan>
In-Reply-To: <20200430154927.vhkhoffqwirb2fmm@holly.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2020 09:35:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Ut7kHr+V_+Yyk=+NC5qBrKEQ+O6Ra4HRHs5XoAHFcWeA@mail.gmail.com>
Message-ID: <CAD=FV=Ut7kHr+V_+Yyk=+NC5qBrKEQ+O6Ra4HRHs5XoAHFcWeA@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jUCAH-00HTTo-Lo
Subject: Re: [Kgdb-bugreport] [PATCH v3 04/11] kgdb: Delay "kgdbwait" to
 dbg_late_init() by default
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
Cc: x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, "H. Peter Anvin" <hpa@zytor.com>,
 LKML <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 bp@alien8.de, linux-serial@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Thu, Apr 30, 2020 at 8:49 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Tue, Apr 28, 2020 at 02:13:44PM -0700, Douglas Anderson wrote:
> > Using kgdb requires at least some level of architecture-level
> > initialization.  If nothing else, it relies on the architecture to
> > pass breakpoints / crashes onto kgdb.
> >
> > On some architectures this all works super early, specifically it
> > starts working at some point in time before Linux parses
> > early_params's.  On other architectures it doesn't.  A survey of a few
> > platforms:
> >
> > a) x86: Presumably it all works early since "ekgdboc" is documented to
> >    work here.
> > b) arm64: Catching crashes works; with a simple patch breakpoints can
> >    also be made to work.
> > c) arm: Nothing in kgdb works until
> >    paging_init() -> devicemaps_init() -> early_trap_init()
> >
> > Let's be conservative and, by default, process "kgdbwait" (which tells
> > the kernel to drop into the debugger ASAP at boot) a bit later at
> > dbg_late_init() time.  If an architecture has tested it and wants to
> > re-enable super early debugging, they can select the
> > ARCH_HAS_EARLY_DEBUG KConfig option.  We'll do this for x86 to start.
> > It should be noted that dbg_late_init() is still called quite early in
> > the system.
> >
> > Note that this patch doesn't affect when kgdb runs its init.  If kgdb
> > is set to initialize early it will still initialize when parsing
> > early_param's.  This patch _only_ inhibits the initial breakpoint from
> > "kgdbwait".  This means:
> >
> > * Without any extra patches arm64 platforms will at least catch
> >   crashes after kgdb inits.
> > * arm platforms will catch crashes (and could handle a hardcoded
> >   kgdb_breakpoint()) any time after early_trap_init() runs, even
> >   before dbg_late_init().
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Ingo Molnar <mingo@redhat.com>
> > Cc: Borislav Petkov <bp@alien8.de>
> > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
> It looks like this patch is triggering some warnings from the existing
> defconfigs (both x86 and arm64). It looks like this:
>
> ---
> wychelm$ make defconfig
>   GEN     Makefile
> *** Default configuration is based on 'x86_64_defconfig'
>
> WARNING: unmet direct dependencies detected for ARCH_HAS_EARLY_DEBUG
>   Depends on [n]: KGDB [=n]
>   Selected by [y]:
>   - X86 [=y]
>
> WARNING: unmet direct dependencies detected for ARCH_HAS_EARLY_DEBUG
>   Depends on [n]: KGDB [=n]
>   Selected by [y]:
>   - X86 [=y]

Ah, thanks!  I hadn't noticed those.  I think it'd be easy to just
change the relevant patches to just "select ARCH_HAS_EARLY_DEBUG if
KGDB".  If you agree that's a good fix and are willing, I'd be happy
if you just added it to the relevant patches when applying.  If not, I
can post a v4.

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
