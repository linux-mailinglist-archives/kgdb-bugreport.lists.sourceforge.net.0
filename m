Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9302E1C3D69
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  4 May 2020 16:43:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jVcJW-000408-Cd
	for lists+kgdb-bugreport@lfdr.de; Mon, 04 May 2020 14:43:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jVcJV-000400-86
 for kgdb-bugreport@lists.sourceforge.net; Mon, 04 May 2020 14:43:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IRCeHkqSilUjU3FHunFBHRyW1Y2SXfHm0MWEUqYs4/A=; b=SSmjdVIiICjuWBNZShwvQ+qp96
 YukzHTnuUsvCVc/JVb+y6p41kChw6GMPCM+rKMiWqloxTuGwNlNhQDxCSSdlkAfGcQZAt/3vLyaVr
 qU7KBRQMxhh6jO7aWI4HQnYixugA8tQKnBt+cbpCNQUPDqu/48KUHzUkokDi6E2liq2I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IRCeHkqSilUjU3FHunFBHRyW1Y2SXfHm0MWEUqYs4/A=; b=hJznPRWyrEU7Z4JE9AUaJkuEHx
 HPNp1TnAVgSwO1CjEgPKqjWypgp6BetesbucTpmj+AmuxQTR+BmorCFZPnEwzjeReI5LDrd1sjFCG
 Y9ldoB8r33p4SJYQcXGutHjJjurYTwyVkhx0uBzCceEzAhOVZc0DgAxjyIGAlDscOTfU=;
Received: from mail-wr1-f67.google.com ([209.85.221.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jVcJP-006wpa-Pz
 for kgdb-bugreport@lists.sourceforge.net; Mon, 04 May 2020 14:43:21 +0000
Received: by mail-wr1-f67.google.com with SMTP id s8so10960603wrt.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 04 May 2020 07:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IRCeHkqSilUjU3FHunFBHRyW1Y2SXfHm0MWEUqYs4/A=;
 b=xcitaMAX9gw+29GendB+8mdnWfteLl6Rm11E72yMhQbVlvTkMInBBYhb4kQT/E0Ee2
 RpgEOuBQ9xT8A4YL7gTNTKJ5zh+TWrGPNuLh64057pVrkt7H7DWcmVQrKFXjQeDH3Z1G
 YCFsMQC8kQ9CMB/oF2OxkJCUhr8/5PDqbAhJ4ks+5YxBltonIWm/PSuzLJD4lbO5C8/X
 IVOJFT4D78B16tVPI1OguBr0sC8OyIjijzRgZWEz0zkNTW/iglAwowEqku4oyIjAVbwL
 ownV/fwyJUskK7lI4VXncd03/fUtqP6ly+MFZn69UW2qU+OO761P5e16fgXuwmKiQawd
 5f1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IRCeHkqSilUjU3FHunFBHRyW1Y2SXfHm0MWEUqYs4/A=;
 b=glBtlwLqKVDeTqA5phQ7GEewf3JQ0ph9RcBltgJ032D6qiVBuInk/xzq+XFGhIp5oF
 qw9ZLOnmLLDqz7rrg0Rqsm0Xy1JZ4xd2PPUKdLxGBstLMhpyeNT/WSPga9ZwGgHgoKsc
 Z/C+raHSGp3UyL6GZeKEllWSoqC5ItYQVJk6m0SQtFF6uiorM41fKecAylDWdv+T8LVI
 dpLTI6Gggh18t+MPfy9ZaHWccwgcD54/RHvPDh8cb65wC7H6k+m48OxIpMcuxGyM/mnr
 ws8Q0AE7b0zOvhsrhx9ulBvCbrZiGJudAyWKR/oaWV2Zto50LbHVW2KZfzAnEp4gQvv6
 6pwg==
X-Gm-Message-State: AGi0PuaaSyJVYLfkOTmm5CKAjI7fdrSAUMNadtGEO4+h7Z/SjzuHPs6q
 kTAQBrszak/5mLWFeA3YGnBeIg==
X-Google-Smtp-Source: APiQypI9FXPMW4DbDRyPEO7LTd72jUgL9qg/5tOovENDnJ/SlF3XQVeCCTh4GFIUY0luJFYiAVo+KA==
X-Received: by 2002:a5d:658c:: with SMTP id q12mr21086345wru.128.1588603388730; 
 Mon, 04 May 2020 07:43:08 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id t17sm18896607wro.2.2020.05.04.07.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 07:43:08 -0700 (PDT)
Date: Mon, 4 May 2020 15:43:06 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20200504144306.zwac2jdlltvhekqm@holly.lan>
References: <20200428211351.85055-1-dianders@chromium.org>
 <20200428141218.v3.4.I3113aea1b08d8ce36dc3720209392ae8b815201b@changeid>
 <20200430154927.vhkhoffqwirb2fmm@holly.lan>
 <CAD=FV=Ut7kHr+V_+Yyk=+NC5qBrKEQ+O6Ra4HRHs5XoAHFcWeA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=Ut7kHr+V_+Yyk=+NC5qBrKEQ+O6Ra4HRHs5XoAHFcWeA@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jVcJP-006wpa-Pz
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
Cc: "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>,
 kgdb-bugreport@lists.sourceforge.net, x86@kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jason Wessel <jason.wessel@windriver.com>, Ingo Molnar <mingo@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Gross <agross@kernel.org>, bp@alien8.de, linux-serial@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Jiri Slaby <jslaby@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Apr 30, 2020 at 09:35:30AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Thu, Apr 30, 2020 at 8:49 AM Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> >
> > On Tue, Apr 28, 2020 at 02:13:44PM -0700, Douglas Anderson wrote:
> > > Using kgdb requires at least some level of architecture-level
> > > initialization.  If nothing else, it relies on the architecture to
> > > pass breakpoints / crashes onto kgdb.
> > >
> > > On some architectures this all works super early, specifically it
> > > starts working at some point in time before Linux parses
> > > early_params's.  On other architectures it doesn't.  A survey of a few
> > > platforms:
> > >
> > > a) x86: Presumably it all works early since "ekgdboc" is documented to
> > >    work here.
> > > b) arm64: Catching crashes works; with a simple patch breakpoints can
> > >    also be made to work.
> > > c) arm: Nothing in kgdb works until
> > >    paging_init() -> devicemaps_init() -> early_trap_init()
> > >
> > > Let's be conservative and, by default, process "kgdbwait" (which tells
> > > the kernel to drop into the debugger ASAP at boot) a bit later at
> > > dbg_late_init() time.  If an architecture has tested it and wants to
> > > re-enable super early debugging, they can select the
> > > ARCH_HAS_EARLY_DEBUG KConfig option.  We'll do this for x86 to start.
> > > It should be noted that dbg_late_init() is still called quite early in
> > > the system.
> > >
> > > Note that this patch doesn't affect when kgdb runs its init.  If kgdb
> > > is set to initialize early it will still initialize when parsing
> > > early_param's.  This patch _only_ inhibits the initial breakpoint from
> > > "kgdbwait".  This means:
> > >
> > > * Without any extra patches arm64 platforms will at least catch
> > >   crashes after kgdb inits.
> > > * arm platforms will catch crashes (and could handle a hardcoded
> > >   kgdb_breakpoint()) any time after early_trap_init() runs, even
> > >   before dbg_late_init().
> > >
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > Cc: Thomas Gleixner <tglx@linutronix.de>
> > > Cc: Ingo Molnar <mingo@redhat.com>
> > > Cc: Borislav Petkov <bp@alien8.de>
> > > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >
> > It looks like this patch is triggering some warnings from the existing
> > defconfigs (both x86 and arm64). It looks like this:
> >
> > ---
> > wychelm$ make defconfig
> >   GEN     Makefile
> > *** Default configuration is based on 'x86_64_defconfig'
> >
> > WARNING: unmet direct dependencies detected for ARCH_HAS_EARLY_DEBUG
> >   Depends on [n]: KGDB [=n]
> >   Selected by [y]:
> >   - X86 [=y]
> >
> > WARNING: unmet direct dependencies detected for ARCH_HAS_EARLY_DEBUG
> >   Depends on [n]: KGDB [=n]
> >   Selected by [y]:
> >   - X86 [=y]
> 
> Ah, thanks!  I hadn't noticed those.  I think it'd be easy to just
> change the relevant patches to just "select ARCH_HAS_EARLY_DEBUG if
> KGDB".  If you agree that's a good fix and are willing, I'd be happy
> if you just added it to the relevant patches when applying.  If not, I
> can post a v4.

Happy with the approach to fix this.

Given the follow on discussion from the end of last week I suspect there
probably needs to be a v4 anyway so perhaps the last question is
applying a fix up is moot at this point?


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
