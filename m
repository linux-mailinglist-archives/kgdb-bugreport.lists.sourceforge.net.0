Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8914D7ADD9A
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 25 Sep 2023 19:10:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qkp6U-0001rU-Mf
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 25 Sep 2023 17:10:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cmarinas@kernel.org>) id 1qkp6M-0001rM-FD
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 25 Sep 2023 17:10:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5wuk4zNSiC0WmvmR12B/Ncvchj1fybtne0NNKDVwwdg=; b=LatRe8MpQiRJzn5pHrEEfUe2mN
 9Hw+CYpDBLQjpv3ensiOt8WLmBI6Ywaq2522LzRBa98fLHFh/6+kJgfLL8UqHLac5PPRlkko1WTCX
 CSiYmXm4KCPzNGqRXPa7jmwVDrNTkHYUNeI4qAGdQyRapnctVqIXJNu92K8k8lV7ZuLY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5wuk4zNSiC0WmvmR12B/Ncvchj1fybtne0NNKDVwwdg=; b=brbMIXOoz9thWzT9g8e7icZLOR
 W7HgKPyyFNo5xzsP3ltuoClN+INROJbHknG7cBIwtLqLBbEeIXYmK668fVpQ5/y0itBoRScmL+NL1
 fT4S5HBweWv+N50ZI3Tr1XadeSbFR0FWCWoFI6pdCRjsjI/kRmeu7IBesGSMmaI83N5c=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qkp6F-0004Pk-QV for kgdb-bugreport@lists.sourceforge.net;
 Mon, 25 Sep 2023 17:10:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3F843611D4;
 Mon, 25 Sep 2023 17:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8A0FC433C8;
 Mon, 25 Sep 2023 17:10:12 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Douglas Anderson <dianders@chromium.org>
Date: Mon, 25 Sep 2023 18:10:10 +0100
Message-Id: <169566180517.219167.12779213618569283316.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230906160505.2431857-1-dianders@chromium.org>
References: <20230906160505.2431857-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -4.8 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, 06 Sep 2023 09:02:55 -0700, Douglas Anderson wrote:
 > This is an attempt to resurrect Sumit's old patch series [1] that > allowed
 us to use the arm64 pseudo-NMI to get backtraces of CPUs and > [...] 
 Content analysis details:   (-4.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1qkp6F-0004Pk-QV
Subject: Re: [Kgdb-bugreport] [PATCH v13 0/7] arm64: Add IPI for backtraces
 / kgdb; try to use NMI for some IPIs
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
Cc: Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Stephane Eranian <eranian@google.com>, mingo@kernel.org, vschneid@redhat.com,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Ard Biesheuvel <ardb@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 samitolvanen@google.com, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 keescook@chromium.org, Stephen Boyd <swboyd@chromium.org>,
 Tomohiro Misono <misono.tomohiro@fujitsu.com>,
 Thomas Gleixner <tglx@linutronix.de>, jpoimboe@kernel.org,
 linux-arm-kernel@lists.infradead.org, scott@os.amperecomputing.com,
 philmd@linaro.org, ito-yuichi@fujitsu.com, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, gautham.shenoy@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, 06 Sep 2023 09:02:55 -0700, Douglas Anderson wrote:
> This is an attempt to resurrect Sumit's old patch series [1] that
> allowed us to use the arm64 pseudo-NMI to get backtraces of CPUs and
> also to round up CPUs in kdb/kgdb. The last post from Sumit that I
> could find was v7, so I started my series at v8. I haven't copied all
> of his old changelongs here, but you can find them from the link.
> 
> This patch series targets v6.6. Specifically it can't land in v6.5
> since it depends on commit 8d539b84f1e3 ("nmi_backtrace: allow
> excluding an arbitrary CPU").
> 
> [...]

Applied to arm64 (for-next/backtrace-ipi), thanks!

[1/7] irqchip/gic-v3: Enable support for SGIs to act as NMIs
      https://git.kernel.org/arm64/c/a02026bf9da1
[2/7] arm64: idle: Tag the arm64 idle functions as __cpuidle
      https://git.kernel.org/arm64/c/d0c14a7d36f0
[3/7] arm64: smp: Remove dedicated wakeup IPI
      https://git.kernel.org/arm64/c/2b2d0a7a96ab
[4/7] arm64: smp: Add arch support for backtrace using pseudo-NMI
      https://git.kernel.org/arm64/c/331a1b3a836c
[5/7] arm64: smp: IPI_CPU_STOP and IPI_CPU_CRASH_STOP should try for NMI
      https://git.kernel.org/arm64/c/d7402513c935
[6/7] arm64: kgdb: Implement kgdb_roundup_cpus() to enable pseudo-NMI roundup
      https://git.kernel.org/arm64/c/2f5cd0c7ffde
[7/7] arm64: smp: Mark IPI globals as __ro_after_init
      https://git.kernel.org/arm64/c/62817d5ba25d

-- 
Catalin



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
