Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6271D8B5A
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 19 May 2020 01:04:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jaooK-0002Cq-P2
	for lists+kgdb-bugreport@lfdr.de; Mon, 18 May 2020 23:04:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <will@kernel.org>) id 1jaooJ-0002CZ-2P
 for kgdb-bugreport@lists.sourceforge.net; Mon, 18 May 2020 23:04:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bnphSAGifjXmfPeYoXi66a8/xXPkyYYmrjEgpMICBZA=; b=nAazi1AJnSd6mNdQ1YPXjf2zX5
 OudK55tOTjEIVr/dl3BqLddlDCTpwuFhzZrETji6fspgainGC1dk5IA/9zoCUL0Ipn+sPCMHszTCi
 pBnYfAsfxoTLNpsid153vrO0xevSm1GBpTdI+8Z1GTQoiF30tDP3FJVtlUmyheMxIeu8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bnphSAGifjXmfPeYoXi66a8/xXPkyYYmrjEgpMICBZA=; b=mdac//HE4TEp2Pws3y7k3bXTXl
 xRiGoGSTdNU8ifpUIt4OoJxhpgtYpkb+jgtodC3wICVMr2U8FuknOkS1CF/PMW/EybmIU/YfNIhFe
 g1z/Ov1l6xVZH35eZW7gfBbuKE66+FvbrvxeRlWvEDFh58ntCKi7gADPzpGAt2FX7xDk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jaooH-00HX2O-Qf
 for kgdb-bugreport@lists.sourceforge.net; Mon, 18 May 2020 23:04:39 +0000
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 97D012081A;
 Mon, 18 May 2020 23:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589843060;
 bh=FivWSGA5nKr+8BVNRlfId66BwqKvfngHdf0PvsDY1Gk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VHXwzWPUne9lNRLze2eVuRdHvkAB3cprbaBFfewEjJY46dL74bSD6c43meXBwefFz
 8Ff13vNT0YVAVYK6ZuLCiCBb/hKd8p1jjr5DR7uackt2nEf7mrkdz1hmvgIJkixlww
 eBns6vIZvKw6GHKnaVdx54+jKGUPcy+BwXaxDiHs=
From: Will Deacon <will@kernel.org>
To: Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Jason Wessel <jason.wessel@windriver.com>
Date: Tue, 19 May 2020 00:04:04 +0100
Message-Id: <158982068109.260335.5582031208894337234.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200513160501.1.I0b5edf030cc6ebef6ab4829f8867cdaea42485d8@changeid>
References: <20200513160501.1.I0b5edf030cc6ebef6ab4829f8867cdaea42485d8@changeid>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: arm64.dev]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jaooH-00HX2O-Qf
Subject: Re: [Kgdb-bugreport] [PATCH] arm64: Call debug_traps_init() from
 trap_init() to help early kgdb
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
Cc: Mark Rutland <mark.rutland@arm.com>, liwei391@huawei.com,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Alexios Zavras <alexios.zavras@intel.com>, Enrico Weigelt <info@metux.net>,
 catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 jinho lim <jordan.lim@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 James Morse <james.morse@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 kgdb-bugreport@lists.sourceforge.net, Zenghui Yu <yuzenghui@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Dave Martin <Dave.Martin@arm.com>, Allison Randal <allison@lohutok.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, 13 May 2020 16:06:37 -0700, Douglas Anderson wrote:
> A new kgdb feature will soon land (kgdb_earlycon) that lets us run
> kgdb much earlier.  In order for everything to work properly it's
> important that the break hook is setup by the time we process
> "kgdbwait".
> 
> Right now the break hook is setup in debug_traps_init() and that's
> called from arch_initcall().  That's a bit too late since
> kgdb_earlycon really needs things to be setup by the time the system
> calls dbg_late_init().
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: Call debug_traps_init() from trap_init() to help early kgdb
      https://git.kernel.org/arm64/c/b322c65f8ca3

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
