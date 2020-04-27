Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0B31BA83A
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 27 Apr 2020 17:42:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jT5tf-0000hg-T2
	for lists+kgdb-bugreport@lfdr.de; Mon, 27 Apr 2020 15:42:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jT5te-0000hY-HH
 for kgdb-bugreport@lists.sourceforge.net; Mon, 27 Apr 2020 15:42:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lLZ7XRRaI1Gpl8c1cQLS2hZAOx8Bn/MZHFlY/EiF3y4=; b=Ib47NQg2Mwv31oWU1OFGmhsG1E
 9ZP4AY88ug8IJWx86J/hWC378KTJ6QesyFPpzgVCszWFb1r8GJwUburMNeNFaSQGLuHALFQgKcTrI
 D7i8MmpaiKsNrH+xF/RS21tkFyR+InPNhAMd6gog4o2ZhD501MgJ4JV54xUaoyyeM8VA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lLZ7XRRaI1Gpl8c1cQLS2hZAOx8Bn/MZHFlY/EiF3y4=; b=NFf5VEho6mixxbbWhGxjQfB7uB
 qOcli2IYrqTntyuUS8jivnM/kDW3JhxcV4yY1uAnAJ1mDPjJqB1uuKuhNjJCBWZvH5nd6QGFvPSvR
 xWRUt1Jn/U/3cq9f80P4rYZyZjxObBLMzvDdzcJ71GYLcPhTpEap5EVBWK4pypVAuU+Q=;
Received: from mail-wm1-f65.google.com ([209.85.128.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jT5ta-00GazF-BN
 for kgdb-bugreport@lists.sourceforge.net; Mon, 27 Apr 2020 15:42:14 +0000
Received: by mail-wm1-f65.google.com with SMTP id 188so127517wmc.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 27 Apr 2020 08:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lLZ7XRRaI1Gpl8c1cQLS2hZAOx8Bn/MZHFlY/EiF3y4=;
 b=zVyMRiMlwP+4cneNlBaaoQ92zIOVybC9w7sTqGp6acGraFBBzMNx47ZgVM0VG2/3EG
 NEPiBNjfdPgG4SDKj+0hZXH+JyVsqJmkXwHbH2YpKeWHODUK0z6FvTCLldhQr293Uflb
 v4gpmbFCPThW6+4w69f4HLq/2UwEkekOwNsS7TSBvs+QcpQtPe9usGuV5mRmPQGJthFY
 l2R0uRiURvPiQYByEuK2PWbtckwm3lDBYJPbjAHVmyfrI47bGJOozdGn8vxxHkK72v98
 SUV2DbWN4hTXtML0aeXUJ2ebaeinIsvIAqYBBhocdaABi06WiZ7LFXLH1YH7itElAiXH
 k5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lLZ7XRRaI1Gpl8c1cQLS2hZAOx8Bn/MZHFlY/EiF3y4=;
 b=HkBDdjZCrS2tuf21o3rpB3GtJcvMdpK2cL8aORdRrWQEcKhb2J1G/30uX8H9dX8479
 pyRpZeZIiBK8g8DV8at3mn1ZjNDKiPMnI70C4+G7DwKK0Q0+Ld8XCtmcuRCm1XqR5V8n
 UXtsUKx3fmlhao+W5jT0ofp3MwbuzJcsAmykQcBqbSPgm2jvvbbQloEt6NpSr0skMKl8
 COjdUYubMmtGGGbOl0jw6EfXB8ZWeMH13Tvo6d0aKF2wZBVXxvyWE1973i20dIUxbypQ
 cOXLd+fjJZ0yPRuCiIMvqbz/XQpFgztpb5n+4CsAekFQxLWid0V2f9FarOoc0CqUQAN5
 QoXA==
X-Gm-Message-State: AGi0Pub32lGztDWgPKugP1C5C3TtlnyFuRtYkm+oysoU3waW73G3EwJO
 N1y/Wwt1kbRKRomq8UI2z8nInQ==
X-Google-Smtp-Source: APiQypJenGZpAvaB6iFtn3C1GjiCaFZUmaBJg7GJrDEvUU4GsYWVxuZ3cD66dGyGhTicTC8AaKBCkA==
X-Received: by 2002:a1c:9a81:: with SMTP id c123mr52891wme.115.1588002123816; 
 Mon, 27 Apr 2020 08:42:03 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id w10sm22463339wrg.52.2020.04.27.08.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 08:42:03 -0700 (PDT)
Date: Mon, 27 Apr 2020 16:42:01 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20200427154201.dxkoctjxta22u7hz@holly.lan>
References: <20200421211447.193860-1-dianders@chromium.org>
 <20200421141234.v2.4.I3113aea1b08d8ce36dc3720209392ae8b815201b@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421141234.v2.4.I3113aea1b08d8ce36dc3720209392ae8b815201b@changeid>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jT5ta-00GazF-BN
Subject: Re: [Kgdb-bugreport] [PATCH v2 4/9] kgdb: Delay "kgdbwait" to
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
Cc: Matt Mullins <mmullins@fb.com>, Nadav Amit <namit@vmware.com>,
 x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 hpa@zytor.com, agross@kernel.org, bjorn.andersson@linaro.org,
 jason.wessel@windriver.com, mingo@redhat.com, bp@alien8.de,
 linux-serial@vger.kernel.org, gregkh@linuxfoundation.org, jslaby@suse.com,
 tglx@linutronix.de, Rick Edgecombe <rick.p.edgecombe@intel.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, Apr 21, 2020 at 02:14:42PM -0700, Douglas Anderson wrote:
> Using kgdb requires at least some level of architecture-level
> initialization.  If nothing else, it relies on the architecture to
> pass breakpoints / crashes onto kgdb.
> 
> On some architectures this all works super early, specifically it
> starts working at some point in time before Linux parses
> early_params's.  On other architectures it doesn't.  A survey of a few
> platforms:
> 
> a) x86: Presumably it all works early since "ekgdboc" is documented to
>    work here.
> b) arm64: Catching crashes works; with a simple patch breakpoints can
>    also be made to work.
> c) arm: Nothing in kgdb works until
>    paging_init() -> devicemaps_init() -> early_trap_init()
> 
> Let's be conservative and, by default, process "kgdbwait" (which tells
> the kernel to drop into the debugger ASAP at boot) a bit later at
> dbg_late_init() time.  If an architecture has tested it and wants to
> re-enable super early debugging, they can implement the weak function
> kgdb_arch_can_debug_early() to return true.  We'll do this for x86 to
> start.  It should be noted that dbg_late_init() is still called quite
> early in the system.
> 
> Note that this patch doesn't affect when kgdb runs its init.  If kgdb
> is set to initialize early it will still initialize when parsing
> early_params's.  This patch _only_ inhibits the initial breakpoint
> from "kgdbwait".  This means:
> 
> * Without any extra patches arm64 platforms will at least catch
>   crashes after kgdb inits.
> * arm platforms will catch crashes (and could handle a hardcoded
>   kgdb_breakpoint()) any time after early_trap_init() runs, even
>   before dbg_late_init().
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>

Overall this looks good but there is a small quibble below...


> diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> index b072aeb1fd78..7371517aeacc 100644
> --- a/include/linux/kgdb.h
> +++ b/include/linux/kgdb.h
> @@ -226,6 +226,28 @@ extern int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt);
>   */
>  extern void kgdb_arch_late(void);
>  
> +/**
> + *	kgdb_arch_can_debug_early - Check if OK to break before dbg_late_init()
> + *
> + *	If an architecture can definitely handle entering the debugger when
> + *	early_param's are parsed then it can override this function to return
> + *	true.  Otherwise if "kgdbwait" is passed on the kernel command line it
> + *	won't actually be processed until dbg_late_init() just after the call
> + *	to kgdb_arch_late() is made.
> + *
> + *	NOTE: Even if this returns false we will still try to register kgdb to
> + *	handle breakpoints and crashes when early_params's are parsed, we just
> + *	won't act on the "kgdbwait" parameter until dbg_late_init().  If you
> + *	get a crash and try to drop into kgdb somewhere between these two
> + *	places you might or might not end up being able to use kgdb depending
> + *	on exactly how far along the architecture has initted.
> + *
> + *	ALSO: dbg_late_init() is actually still fairly early in the system
> + *	boot process.
> + *
> + *	Return: true if platform can handle kgdb early.
> + */
> +extern bool kgdb_arch_can_debug_early(void);

Does this need to be a function? It looks like all implementations are
either return true or return false (e.g. CONFIG_ARCH_HAVE_EARLY_DEBUG
would do the same thing).


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
