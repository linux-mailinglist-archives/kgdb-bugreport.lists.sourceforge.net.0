Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCBD223D41
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 17 Jul 2020 15:48:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jwQj9-0003lD-UN
	for lists+kgdb-bugreport@lfdr.de; Fri, 17 Jul 2020 13:48:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mhiramat@kernel.org>) id 1jwQj8-0003ks-Lq
 for kgdb-bugreport@lists.sourceforge.net; Fri, 17 Jul 2020 13:48:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version
 :References:In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nmgd3X8IKkqnqgWbk79VWuQr/9KqRpLi3HiDwSh54Sk=; b=LvnNjmx45CpGZ3ZfZh+dxs20Ul
 4nuVrcTnlrkl8F6tfEGhZS81LlQ0cGBxPpBdsLLWb7lhRGFHFF4LpX80xKet03gW7stD+rHmyaP7m
 T7uB/D/qBE9S32edyx56ktn4LgCplmOp+tky2kJAbIWV5TB9Bb1btwFZ9HenJFQnrmWM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nmgd3X8IKkqnqgWbk79VWuQr/9KqRpLi3HiDwSh54Sk=; b=Bwpy45hhrUhh+59KG/ombmNB4D
 KVhdNLK+eFCbVF1AA3nHql2Eqm75w1jxdTY8POvQBpIEYBHA2FcUoKPag450MGWJqTQkWZfnlbzh9
 n+oBzzeEh2fFbVPpUJJu2McOF4KTSSFX2+csV6wmslBh3e5R/D6JKHHW2WoEK4ITSws8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jwQj7-007T8z-HJ
 for kgdb-bugreport@lists.sourceforge.net; Fri, 17 Jul 2020 13:48:38 +0000
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 07E9E2076A;
 Fri, 17 Jul 2020 13:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594993712;
 bh=A/hm+ncUzrilRPL6Iq4RL68tleP0XF+QknAVyixwc1g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CvOlz5oabVzstaOLVZA61byXNbjnvEktZKypAf7I3zp3ssUX3umwgbYI67tlmWbpr
 26D6NXncecHSsTC2cJ8rycyhNySsKMgBDS+r3DJr201xopxc69WB7rL2dsdtv9wOQP
 4DdCDro/S8Hbq2zGvJ8lIAccd2ZW/vts0mBz4DzQ=
Date: Fri, 17 Jul 2020 22:48:26 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Message-Id: <20200717224826.80f8353e5dfdfaab22421385@kernel.org>
In-Reply-To: <20200716151943.2167652-1-daniel.thompson@linaro.org>
References: <20200716151943.2167652-1-daniel.thompson@linaro.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jwQj7-007T8z-HJ
Subject: Re: [Kgdb-bugreport] [PATCH v2 0/3] kgdb: Honour the kprobe
 blacklist when setting breakpoints
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
Cc: pmladek@suse.com, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net, patches@linaro.org,
 linux-kernel@vger.kernel.org, sergey.senozhatsky@gmail.com,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, will@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Daniel,

On Thu, 16 Jul 2020 16:19:40 +0100
Daniel Thompson <daniel.thompson@linaro.org> wrote:

> kgdb has traditionally adopted a no safety rails approach to breakpoint
> placement. If the debugger is commanded to place a breakpoint at an
> address then it will do so even if that breakpoint results in kgdb
> becoming inoperable.
> 
> A stop-the-world debugger with memory peek/poke intrinsically provides
> its operator with the means to hose their system in all manner of
> exciting ways (not least because stopping-the-world is already a DoS
> attack ;-) ). Nevertheless the current no safety rail approach is
> difficult to defend, especially given kprobes can provide us with plenty
> of machinery to mark the parts of the kernel where breakpointing is
> discouraged.
> 
> This patchset introduces some safety rails by using the existing kprobes
> infrastructure and ensures this will be enabled by default on
> architectures that implement kprobes. At present it does not cover
> absolutely all locations where breakpoints can cause trouble but it will
> block off several avenues, including the architecture specific parts
> that are handled by arch_within_kprobe_blacklist().

This series looks good to me.

Acked-by: Masami Hiramatsu <mhiramat@kernel.org>

To fix the build error with ipw2x00 driver, please feel free to
include my fix patch.

Thank you,

> 
> 
> Daniel Thompson (3):
>   kgdb: Honour the kprobe blocklist when setting breakpoints
>   kgdb: Use the kprobe blocklist to limit single stepping
>   kgdb: Add NOKPROBE labels on the trap handler functions
> 
>  include/linux/kgdb.h        | 19 +++++++++++++++++++
>  kernel/debug/debug_core.c   | 25 +++++++++++++++++++++++++
>  kernel/debug/gdbstub.c      | 10 +++++++++-
>  kernel/debug/kdb/kdb_bp.c   | 17 +++++++++++------
>  kernel/debug/kdb/kdb_main.c | 10 ++++++++--
>  lib/Kconfig.kgdb            | 14 ++++++++++++++
>  6 files changed, 86 insertions(+), 9 deletions(-)
> 
> --
> 2.25.4
> 


-- 
Masami Hiramatsu <mhiramat@kernel.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
