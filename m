Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DF43F71F9A0
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  2 Jun 2023 07:19:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q4xCN-0001YB-0c
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 02 Jun 2023 05:19:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sumit.garg@linaro.org>) id 1q4xCJ-0001Y5-W3
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 02 Jun 2023 05:19:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cgn8PW+lCtxxCCTeMx5u+Sc8A20TKMpJWMc7H1tivLQ=; b=Q35eWtfcdMGg8Pdx7Rmt+EhY+J
 ZbWtfgEvkm8EXIMmo0nKX1wj7IlShWQvTtRQBL7UaeJEHHMCnVuqkVDQ6fT+U6MsnrbJ2kB9/yOOd
 XGFJcKHs5Fa5Wt/cB6zP7Br6+rkr+RBiqXBdpFP1YhjkjUBoN1E+gGGxG4f4DgvjLu/s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Cgn8PW+lCtxxCCTeMx5u+Sc8A20TKMpJWMc7H1tivLQ=; b=Ybd7qspOS9KzvWxy9V6bYF4Ncc
 We9DJfkUO41/DbAWZiZBu6t3qNsrLRRZShq42EhXMr5XVtsT31CHRMcoEQIB6LjbLZ4F5NKSScEOj
 qpjvqRWEY3cOtgWp0fNGzY6FBk9cr/pIF77+uTyhk5Z/R9LxwlbvwXghqiG+7OsJnMb8=;
Received: from mail-qt1-f182.google.com ([209.85.160.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q4xCD-0007Vl-KX for kgdb-bugreport@lists.sourceforge.net;
 Fri, 02 Jun 2023 05:19:36 +0000
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-3f8177f9a7bso15393301cf.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 01 Jun 2023 22:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685683164; x=1688275164;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Cgn8PW+lCtxxCCTeMx5u+Sc8A20TKMpJWMc7H1tivLQ=;
 b=goyJbV+k8ZDKjx5UP87VtW2qDfzW2th2S9s3LONil/75+ZdNAefUeZzW/GeeLO/J6b
 djP+bt2+EwGXwubLGRlF2Eg9HaF1SAw705dSVETBr0UezW1Kp2O2plkx7zmlYf2eVB7o
 0UUYOIDCTEhOZi3E62zEgE1hG3Abzvzsna96nOyC1TmeIJ8+ZZNU3kGu3OrmO+lvYgKC
 tg7M53VUauyUBaxkusvEktOPY7kkxr6P66hLxK5DfVNv0iwdN7XEUW9/XVMvmcrewkYi
 hap84qFhpBWH2H3kTRYYGIkUdLe3JvxUu42zEVpONzXCCNvOM1HZI6AYFDGqD3UgC1Ur
 R9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685683164; x=1688275164;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cgn8PW+lCtxxCCTeMx5u+Sc8A20TKMpJWMc7H1tivLQ=;
 b=K814ERDWJqOXM4XbzDxOi51zCKJbLtrDI4Rj9cxFjfF5ZB776OXn/RYli3ga8jDZZO
 tWDtCYZumQa7aP0h8fJoRkXhQwEYyExHTvgbmcAi0jriKCWKeagVMoqDyx/oQsy3rz14
 QLw6g8rOLXVj3LR9Eph12R8kHQJG4UMMgVKv79b6Zbel381MsJyRdhtkvHRPRfSitJzT
 JagfhwbVRvBSnAXlDQSAZPni7Kbg1ew90onI8dXXFatt9re9A3RiPl15fjokWBLJgOCj
 wIBd2VzpoagjueQTcKJjC4i9d1an82rm4iGdAWm+I3jJ14cgh2Icvda49dV8NYyUATYI
 D8Ow==
X-Gm-Message-State: AC+VfDyeo8TwhMG9qU2Se2LZO/o4F1X5IZ0bg8zDVzrfKaE7l+p0gYL2
 ZBhySWtqRn8VjOik8pzdtiRvJCJTvJJnXXWf7586gQ==
X-Google-Smtp-Source: ACHHUZ7hxeFd4p3Vb0f2BnoHsB8raEXkauuS5wAkuzImHWRJBMnDmk3UJTywWEbxRNWJlKcCLXh6nuh69+hsoHACs1g=
X-Received: by 2002:a05:622a:8e:b0:3f5:2582:65d9 with SMTP id
 o14-20020a05622a008e00b003f5258265d9mr14935822qtw.26.1685683163680; Thu, 01
 Jun 2023 22:19:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230601213440.2488667-1-dianders@chromium.org>
In-Reply-To: <20230601213440.2488667-1-dianders@chromium.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 2 Jun 2023 10:49:12 +0530
Message-ID: <CAFA6WYNEuZK9OCchj1Na-yZ08ahQe+B=iGCuytqXz5XhUie=gA@mail.gmail.com>
To: Douglas Anderson <dianders@chromium.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Doug, On Fri, 2 Jun 2023 at 03:07,
 Douglas Anderson <dianders@chromium.org>
 wrote: > > This is an attempt to resurrect Sumit's old patch series [1] that
 > allowed us to use the arm64 pseudo-NMI to get backt [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.182 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.182 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1q4xCD-0007Vl-KX
Subject: Re: [Kgdb-bugreport] [PATCH v9 0/7] arm64: Add debug IPI for
 backtraces / kgdb; try to use NMI for it
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
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Ard Biesheuvel <ardb@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 kgdb-bugreport@lists.sourceforge.net, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Wei Li <liwei391@huawei.com>, Frederic Weisbecker <frederic@kernel.org>,
 Valentin Schneider <vschneid@redhat.com>, Stephen Boyd <swboyd@chromium.org>,
 Ben Dooks <ben-linux@fluff.org>, Thomas Gleixner <tglx@linutronix.de>,
 Josh Poimboeuf <jpoimboe@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Andrey Konovalov <andreyknvl@gmail.com>, ito-yuichi@fujitsu.com,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 "Gautham R. Shenoy" <gautham.shenoy@amd.com>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Doug,

On Fri, 2 Jun 2023 at 03:07, Douglas Anderson <dianders@chromium.org> wrote:
>
> This is an attempt to resurrect Sumit's old patch series [1] that
> allowed us to use the arm64 pseudo-NMI to get backtraces of CPUs and
> also to round up CPUs in kdb/kgdb. The last post from Sumit that I
> could find was v7, so I started my series at v8. I haven't copied all
> of his old changelongs here, but you can find them from the link.
>
> I'm really looking for a way to land this patch series. In response to
> v8, Mark Rutland indicated [2] that he was worried about the soundness
> of pseudo NMI. Those definitely need to get fixed, but IMO this patch
> series could still land in the meantime. That would at least let
> people test with it.

+1

>
> Request for anyone reading this: please help indicate your support of
> this patch series landing by replying, even if you don't have the
> background for a full review. My suspicion is that there are a lot of
> people who agree that this would be super useful to get landed.
>

You can ofcourse count me in here. This will certainly bring NMI
debugging capabilities to arm64 and I have been advocating for that
since the advent of pseudo NMIs on arm64.

> Since v8, I have cleaned up this patch series by integrating the 10th
> patch from v8 [3] into the whole series. As part of this, I renamed
> the "NMI IPI" to the "debug IPI" since it could now be backed by a
> regular IPI in the case that pseudo NMIs weren't available. With the
> fallback, this allowed me to drop some extra patches from the
> series. This feels (to me) to be pretty clean and hopefully others
> agree. Any patch I touched significantly I removed Masayoshi and
> Chen-Yu's tags from.
>
> ...also in v8, I reorderd the patches a bit in a way that seemed a
> little cleaner to me.

This cleanup looks good to me.

-Sumit

>
> Since v7, I have:
> * Addressed the small amount of feedback that was there for v7.
> * Rebased.
> * Added a new patch that prevents us from spamming the logs with idle
>   tasks.
> * Added an extra patch to gracefully fall back to regular IPIs if
>   pseudo-NMIs aren't there.
>
> It can be noted that this patch series works very well with the recent
> "hardlockup" patches that have landed through Andrew Morton's tree and
> are currently in linuxnext. It works especially well with the "buddy"
> lockup detector.
>
> [1] https://lore.kernel.org/linux-arm-kernel/1604317487-14543-1-git-send-email-sumit.garg@linaro.org/
> [2] https://lore.kernel.org/lkml/ZFvGqD%2F%2Fpm%2FlZb+p@FVFF77S0Q05N.cambridge.arm.com/
> [3] https://lore.kernel.org/r/20230419155341.v8.10.Ic3659997d6243139d0522fc3afcdfd88d7a5f030@changeid/
>
> Changes in v9:
> - Add a warning if we don't have enough IPIs for the NMI IPI
> - Added comments that we might not be using NMI always.
> - Added missing "inline"
> - Added to commit message that this doesn't catch all cases.
> - Fold in v8 patch #10 ("Fallback to a regular IPI if NMI isn't enabled")
> - Moved header file out of "include" since it didn't need to be there.
> - Remove arm64_supports_nmi()
> - Remove fallback for when debug IPI isn't available.
> - Renamed "NMI IPI" to "debug IPI" since it might not be backed by NMI.
> - Update commit description
> - arch_trigger_cpumask_backtrace() no longer returns bool
>
> Changes in v8:
> - "Provide a stub kgdb_nmicallback() if !CONFIG_KGDB" new for v8
> - "Tag the arm64 idle functions as __cpuidle" new for v8
> - Removed "#ifdef CONFIG_SMP" since arm64 is always SMP
> - debug_ipi_setup() and debug_ipi_teardown() no longer take cpu param
>
> Douglas Anderson (2):
>   arm64: idle: Tag the arm64 idle functions as __cpuidle
>   kgdb: Provide a stub kgdb_nmicallback() if !CONFIG_KGDB
>
> Sumit Garg (5):
>   irqchip/gic-v3: Enable support for SGIs to act as NMIs
>   arm64: Add framework for a debug IPI
>   arm64: smp: Assign and setup the debug IPI
>   arm64: ipi_debug: Add support for backtrace using the debug IPI
>   arm64: kgdb: Roundup cpus using the debug IPI
>
>  arch/arm64/include/asm/irq.h  |   3 +
>  arch/arm64/kernel/Makefile    |   2 +-
>  arch/arm64/kernel/idle.c      |   4 +-
>  arch/arm64/kernel/ipi_debug.c | 102 ++++++++++++++++++++++++++++++++++
>  arch/arm64/kernel/ipi_debug.h |  13 +++++
>  arch/arm64/kernel/kgdb.c      |  14 +++++
>  arch/arm64/kernel/smp.c       |  11 ++++
>  drivers/irqchip/irq-gic-v3.c  |  29 +++++++---
>  include/linux/kgdb.h          |   1 +
>  9 files changed, 168 insertions(+), 11 deletions(-)
>  create mode 100644 arch/arm64/kernel/ipi_debug.c
>  create mode 100644 arch/arm64/kernel/ipi_debug.h
>
> --
> 2.41.0.rc2.161.g9c6817b8e7-goog
>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
