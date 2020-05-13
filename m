Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E27991D22C7
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 14 May 2020 01:12:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jZ0YD-0005aj-Od
	for lists+kgdb-bugreport@lfdr.de; Wed, 13 May 2020 23:12:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jZ0YC-0005aU-7F
 for kgdb-bugreport@lists.sourceforge.net; Wed, 13 May 2020 23:12:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NzQVGwBy98yyKuXlmBNvWD4o+eLGqCxtgVxPgKw63Do=; b=W9NSPL36rSGwrAfwySWyoMbY62
 DEXbNj9hKHj1WKGx1Wtyx3Z+V3a8k/CTAjJOBFrUB6Ty/z2zTmFYdR3uDM61AeDF9a7sOoJj6XfqP
 EooB1rrsVJlVCC8lSWmvueXLWBuBfgVAITsi7Srz4gKV07tN2TVQyu2wNUJn+kpzbfiw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NzQVGwBy98yyKuXlmBNvWD4o+eLGqCxtgVxPgKw63Do=; b=VXi+jsuMdFHCP9RlHiUEFvsK/9
 f9hKeapEe+wPBnjyLLDAwGrgCpFx7hJ/y146O1BvXHonppVlBhPFfYT0YI/utG2TGQMfTWzUZliXw
 /SQA/VpFI7EII0kthI+1KtZRPatqBmem2/n4npFYoxOZg0I3kQQs5nGYhX4lZXPaaxZ4=;
Received: from mail-vs1-f68.google.com ([209.85.217.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jZ0YA-009ADg-DW
 for kgdb-bugreport@lists.sourceforge.net; Wed, 13 May 2020 23:12:32 +0000
Received: by mail-vs1-f68.google.com with SMTP id z1so839437vsn.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 13 May 2020 16:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NzQVGwBy98yyKuXlmBNvWD4o+eLGqCxtgVxPgKw63Do=;
 b=d91N+o6UMzxTsz1St1Hu66m8IAaS2jE1/WCro4T3FXi2sc/4AHW4ODcGwfEnvDzHjj
 /PKKX5txh+2AdFLEuJtnkNNG0IRWzECKUG3SGfFwrIcEdqW19nhO2jFicMOUMvz6T+C1
 tNR/mldiveHPbJerAbyvqheERVBHSeb8Q1lg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NzQVGwBy98yyKuXlmBNvWD4o+eLGqCxtgVxPgKw63Do=;
 b=jW4tGHAw3MlzXBIFcSUI2zRbxgAZDeH3s1qwn0o/GJJ321vJk/OOWcOOTsW6gT4LCq
 rjPGlUWyqHHpKOLrSDOmAG4JhzN9o+bO5EkYoBFIs4ulGJAe+U7o3KNlnf3UTWy6eygg
 cpfVOZNxm+9DWPtWctI6KX4uP9uysq4jUFb4YZots7GEzQlwk0c0oiJD/dHVxrl2RCpw
 JYAy+04JAingFQFTHCv+o6kaCCzH3yPmB+Wstrc4IQLiHFb8q+ViyI4oU7Xl/dlUdSkv
 vnyBGpdzXOL7snWyJRFiZJY0Q8hzLG5x790BdhoA7oFYmvivSIuuBQG4utQkCHXPVds0
 jjSg==
X-Gm-Message-State: AOAM533V7hagtyoPTjeDGeyOg5d6krBWKe88mGvRsD5h3WQBgqod/iJv
 yCSwGgaq/lUev51R8/9+gZejfLbJO1U=
X-Google-Smtp-Source: ABdhPJyIj2p2oPcdUWJCOVWoX6flB/vRSm5WDtU7k0WH4NpQ9TnIaOKMteN1oYB0riJVHlTVHIcPvw==
X-Received: by 2002:a67:e9d9:: with SMTP id q25mr1292275vso.27.1589411544241; 
 Wed, 13 May 2020 16:12:24 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com.
 [209.85.217.43])
 by smtp.gmail.com with ESMTPSA id m18sm316326vsq.0.2020.05.13.16.12.22
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2020 16:12:23 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id m24so850422vsq.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 13 May 2020 16:12:22 -0700 (PDT)
X-Received: by 2002:a67:bd07:: with SMTP id y7mr1357400vsq.109.1589411542393; 
 Wed, 13 May 2020 16:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200507200850.60646-1-dianders@chromium.org>
 <20200507130644.v4.5.I22067ad43e77ddfd4b64c2d49030628480f9e8d9@changeid>
In-Reply-To: <20200507130644.v4.5.I22067ad43e77ddfd4b64c2d49030628480f9e8d9@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 13 May 2020 16:12:11 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wq1bnaMnUa09GZzQq5rZeQHUM9WAmxED3foc_Rjdsg2A@mail.gmail.com>
Message-ID: <CAD=FV=Wq1bnaMnUa09GZzQq5rZeQHUM9WAmxED3foc_Rjdsg2A@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.68 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.68 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jZ0YA-009ADg-DW
Subject: Re: [Kgdb-bugreport] [PATCH v4 05/12] arm64: Add call_break_hook()
 to early_brk64() for early kgdb
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 jinho lim <jordan.lim@samsung.com>, Andy Gross <agross@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-serial@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, Dave Martin <Dave.Martin@arm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Jiri Slaby <jslaby@suse.com>,
 Alexios Zavras <alexios.zavras@intel.com>, bp@alien8.de,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Allison Randal <allison@lohutok.net>, LKML <linux-kernel@vger.kernel.org>,
 James Morse <james.morse@arm.com>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Enrico Weigelt <info@metux.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Thu, May 7, 2020 at 1:09 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> In order to make early kgdb work properly we need early_brk64() to be
> able to call into it.  This is as easy as adding a call into
> call_break_hook() just like we do later in the normal brk_handler().
>
> Once we do this we can let kgdb know that it can break into the
> debugger a little earlier (specifically when parsing early_param's).
>
> NOTE: without this patch it turns out that arm64 can't do breakpoints
> even at dbg_late_init(), so if we decide something about this patch is
> wrong we might need to move dbg_late_init() a little later.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>
> Changes in v4:
> - Add "if KGDB" to "select ARCH_HAS_EARLY_DEBUG" in Kconfig.
>
> Changes in v3:
> - Change boolean weak function to KConfig.
>
> Changes in v2: None
>
>  arch/arm64/Kconfig                      | 1 +
>  arch/arm64/include/asm/debug-monitors.h | 2 ++
>  arch/arm64/kernel/debug-monitors.c      | 2 +-
>  arch/arm64/kernel/traps.c               | 3 +++
>  4 files changed, 7 insertions(+), 1 deletion(-)

As discussed in the replies to the v3 version of this patch [1], I
have posted a replacement patch for this one [2].  After the cut in
the replacement patch I talk about different ways it could land.
Hopefully that's not too confusing.  I can also re-spam everyone with
a v5 of the whole series if that makes it clearer.

[1] https://lore.kernel.org/r/20200428141218.v3.5.I22067ad43e77ddfd4b64c2d49030628480f9e8d9@changeid
[2] https://lore.kernel.org/r/20200513160501.1.I0b5edf030cc6ebef6ab4829f8867cdaea42485d8@changeid

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
