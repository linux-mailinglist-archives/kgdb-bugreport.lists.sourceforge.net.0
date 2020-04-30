Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4401C00C2
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 30 Apr 2020 17:49:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jUBRY-0003VU-8C
	for lists+kgdb-bugreport@lfdr.de; Thu, 30 Apr 2020 15:49:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jUBRX-0003VD-8Z
 for kgdb-bugreport@lists.sourceforge.net; Thu, 30 Apr 2020 15:49:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oHm4fy+ZLxCbZPoPq94eRdgDSA3Nknytuwe8uJsLdF4=; b=MXdErF2f3uwUHKxfyXMs/Yv8LM
 zvSX3hv7GUe96ZFG1a+fOroNZX5pzV10ngYhKIZVy3EzdZ0HRbxm7TEIAtAUvhvzP3m0npf/wYsc4
 3q7swueJb6ZQPGXwRhCjUe6h4yEmvktp+A8Qjrlxr++HZDh4WZkrHBPM54tIOz19XRmY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oHm4fy+ZLxCbZPoPq94eRdgDSA3Nknytuwe8uJsLdF4=; b=moCdZ1spHMxiCgJt2yFRGsh3gj
 aGT3+fktgjai3xLQpTWLjnqTb0gL/kwte99O3kaVkXLaQJm4vZS4RUrgJ7KuF+Hz4DENI/2+Hl0GN
 X5yvtmpEAY36E4zS47G4b0q2R03jLDpXJBkbtS/5nWj+zdfas1sJMnA6fCkAe2upYz/k=;
Received: from mail-wr1-f65.google.com ([209.85.221.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jUBRQ-005PuO-T2
 for kgdb-bugreport@lists.sourceforge.net; Thu, 30 Apr 2020 15:49:43 +0000
Received: by mail-wr1-f65.google.com with SMTP id j1so7572223wrt.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 30 Apr 2020 08:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oHm4fy+ZLxCbZPoPq94eRdgDSA3Nknytuwe8uJsLdF4=;
 b=r2IC0BMdrvMLmTNIhoRFaohj8rE6ROROD/SI++ZHKsfJR3Lu3kPJeMzseq5zrHq4zj
 f1rTFV/TxBz1Hnd8sQ4SoPrU07rZLHYJsIpaYUBXeXHDED5MDd/dnq0i0vczTX4PvSkN
 9QrzKN2h5+ay4/p64uU8reoTjvy1ylOJRU5S4uMLf0jY5zPEpCw+RpjMJCr0kCtH8Cvx
 1krTbR8+gGMp0Rxl41DXFgmpBxQDOkJEGDiSHT5Q82OHkzMglPmCdJHdHc+IET5gukwU
 cw+G7SOi3PiNrKInWUsfQjAN5cFB8ywZLgmseYzOC+PjLWLYM8z0FTtk9fKYnPXuLN5w
 drqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oHm4fy+ZLxCbZPoPq94eRdgDSA3Nknytuwe8uJsLdF4=;
 b=WkF4287hPJtU9dH+ivIzeofChnYgQU9rGFT4VsP5Mo2LrAoJNEkbm+9PPABqg4xfLo
 fEz9Xd2jNBTP+yRE8IM+EjH4FaX5ZU1qKn1pcJ0UKLgth3FHcOEJJgp1ZnWzquiX4+1W
 G3B6lyI03NsEq2qIfjluv8a4RfACdQte8u9/3vATA3Tgs2S6CTEbO7Zk552A8RC2JxEF
 lHjOpvS9TyPpMyAviusvmL7jNNZuR35xWtHJ4k+49c2syopO30UddGnRAmMv1n3lDGoJ
 blRjmuxo8/ZQUJm2o4MsTDywaIFzcZj1uitjaA2BTNlrJrCsmV+FOuc5WZu+sM1aasis
 N++g==
X-Gm-Message-State: AGi0PuZCPXWTYB9y8D+DI4ezzULxQtYCCH5wVFa+pRTaAOXkKlPuP/c/
 24XPcEPALXO56KhoPsHD5UQnnw==
X-Google-Smtp-Source: APiQypJ6SlONxAl2VrCyPqK4l53N1/WMOfY1UxFBIXSI9NOt7yIOGJ1RUif8f1WEZ9tX9jts4JOv0Q==
X-Received: by 2002:a5d:688f:: with SMTP id h15mr4706411wru.352.1588261770336; 
 Thu, 30 Apr 2020 08:49:30 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id f2sm177209wro.59.2020.04.30.08.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 08:49:29 -0700 (PDT)
Date: Thu, 30 Apr 2020 16:49:27 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20200430154927.vhkhoffqwirb2fmm@holly.lan>
References: <20200428211351.85055-1-dianders@chromium.org>
 <20200428141218.v3.4.I3113aea1b08d8ce36dc3720209392ae8b815201b@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428141218.v3.4.I3113aea1b08d8ce36dc3720209392ae8b815201b@changeid>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.65 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.65 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jUBRQ-005PuO-T2
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
Cc: x86@kernel.org, catalin.marinas@arm.com,
 Andrew Morton <akpm@linux-foundation.org>, corbet@lwn.net,
 kgdb-bugreport@lists.sourceforge.net, jason.wessel@windriver.com,
 hpa@zytor.com, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, bjorn.andersson@linaro.org,
 agross@kernel.org, bp@alien8.de, linux-serial@vger.kernel.org,
 gregkh@linuxfoundation.org, jslaby@suse.com, tglx@linutronix.de,
 will@kernel.org, mingo@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, Apr 28, 2020 at 02:13:44PM -0700, Douglas Anderson wrote:
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
> re-enable super early debugging, they can select the
> ARCH_HAS_EARLY_DEBUG KConfig option.  We'll do this for x86 to start.
> It should be noted that dbg_late_init() is still called quite early in
> the system.
> 
> Note that this patch doesn't affect when kgdb runs its init.  If kgdb
> is set to initialize early it will still initialize when parsing
> early_param's.  This patch _only_ inhibits the initial breakpoint from
> "kgdbwait".  This means:
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
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

It looks like this patch is triggering some warnings from the existing
defconfigs (both x86 and arm64). It looks like this:

---
wychelm$ make defconfig
  GEN     Makefile
*** Default configuration is based on 'x86_64_defconfig'

WARNING: unmet direct dependencies detected for ARCH_HAS_EARLY_DEBUG
  Depends on [n]: KGDB [=n]
  Selected by [y]:
  - X86 [=y]

WARNING: unmet direct dependencies detected for ARCH_HAS_EARLY_DEBUG
  Depends on [n]: KGDB [=n]
  Selected by [y]:
  - X86 [=y]
#
# No change to .config
#
---


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
