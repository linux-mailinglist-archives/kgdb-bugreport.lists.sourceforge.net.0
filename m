Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6691F6913
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 11 Jun 2020 15:36:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jjNNR-0001pF-IZ
	for lists+kgdb-bugreport@lfdr.de; Thu, 11 Jun 2020 13:36:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mhiramat@kernel.org>) id 1jjMXK-0002up-2g
 for kgdb-bugreport@lists.sourceforge.net; Thu, 11 Jun 2020 12:42:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version
 :References:In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+zeM3Oa5YshOQJlhh0gbMDQik8B5nMd+SL3ECvE4IhY=; b=VOxu9sQD0SDFwfUxFUMOGA2WxV
 OeMOnXyiGYLiM/7r6EGACHW1vD4t1eu9T55Ep12RwCBWvEeDRNjk1f0I1n1InuUyQ0ZLvlmkPLNt9
 fFyTmDiqLDEFfDPUMTr9n6k5/4PD1GrGgLrtS4rmqW0/OAOG5vHwXKAUeoOPMJUzjRKg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+zeM3Oa5YshOQJlhh0gbMDQik8B5nMd+SL3ECvE4IhY=; b=juTgKEG77SiAP/S9YE3YcVKig/
 eLmfZUdmUM3m1dYSXpR3l6tVwqJ7g0LjbSGPEHvL9EJQqdLGLrEC9SnYR5ey+OoMwqDmVY8Gi10uJ
 n/S4TWz53o07PxifkMEZTdcX0t2PzeNPfhKiWpWHwZmRxvYBNGF32onsrbmvfoaurNKU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jjMXF-002287-Dv
 for kgdb-bugreport@lists.sourceforge.net; Thu, 11 Jun 2020 12:42:26 +0000
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1AD26207ED;
 Thu, 11 Jun 2020 12:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591879335;
 bh=L1QAzfDIJTaNMjeS4vXX3SCcFVvZ5SmhAVMUgbEjC8o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Vd5VoEajxjyibQSKqnM6tQFSKLeW7GNkcleAtFqB5TFOxQ2UXahssgIjrDl5vtJZJ
 pWaCzciklLlMcaWlioEEWcwh5tialB3j69uKlcwmh4LdPceYM/93Mkd+ErcLt/tzvM
 aVjsDMB2NZT0WR9RBDB5vCoMcLcya5cg9hsXn29g=
Date: Thu, 11 Jun 2020 21:42:09 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Message-Id: <20200611214209.bd8fcd290d745ae50d898e69@kernel.org>
In-Reply-To: <20200605142953.GP2750@hirez.programming.kicks-ass.net>
References: <20200605132130.1411255-1-daniel.thompson@linaro.org>
 <20200605142953.GP2750@hirez.programming.kicks-ass.net>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jjMXF-002287-Dv
X-Mailman-Approved-At: Thu, 11 Jun 2020 13:36:15 +0000
Subject: Re: [Kgdb-bugreport] [RFC PATCH 0/4] kgdb: Honour the kprobe
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, pmladek@suse.com,
 kgdb-bugreport@lists.sourceforge.net, patches@linaro.org,
 linux-kernel@vger.kernel.org, sergey.senozhatsky@gmail.com,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, will@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, 5 Jun 2020 16:29:53 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> On Fri, Jun 05, 2020 at 02:21:26PM +0100, Daniel Thompson wrote:
> > kgdb has traditionally adopted a no safety rails approach to breakpoint
> > placement. If the debugger is commanded to place a breakpoint at an
> > address then it will do so even if that breakpoint results in kgdb
> > becoming inoperable.
> > 
> > A stop-the-world debugger with memory peek/poke does intrinsically
> > provide its operator with the means to hose their system in all manner
> > of exciting ways (not least because stopping-the-world is already a DoS
> > attack ;-) ) but the current no safety rail approach is not easy to
> > defend, especially given kprobes provides us with plenty of machinery to
> > mark parts of the kernel where breakpointing is discouraged.
> > 
> > This patchset introduces some safety rails by using the existing
> > kprobes infrastructure. It does not cover all locations where
> > breakpoints can cause trouble but it will definitely block off several
> > avenues, including the architecture specific parts that are handled by
> > arch_within_kprobe_blacklist().
> > 
> > This patch is an RFC because:
> > 
> > 1. My workstation is still chugging through the compile testing.
> > 
> > 2. Patch 4 needs more runtime testing.
> > 
> > 3. The code to extract the kprobe blacklist code (patch 4 again) needs
> >    more review especially for its impact on arch specific code.
> > 
> > To be clear I do plan to do the detailed review of the kprobe blacklist
> > stuff but would like to check the direction of travel first since the
> > change is already surprisingly big and maybe there's a better way to
> > organise things.
> 
> Thanks for doing these patches, esp 1-3 look very good to me.
> 
> I've taken the liberty to bounce the entire set to Masami-San, who is
> the kprobes maintainer for comments as well.

Thanks Peter to Cc me.

Reusing kprobe blacklist is good to me as far as it doesn't expand it
only for kgdb. For example, if a function which can cause a recursive
trap issue only when the kgdb puts a breakpoint, it should be covered
by kgdb blacklist, or we should make a "noinstr-list" including
both :)

Thus, Nack for PATCH 4/4, that seems a bit selfish change. If kgdb wants
to use the "kprobes blacklist", we should make CONFIG_KGDB depending on
CONFIG_KPROBES. Or, (as I pointed) we should make independent "noinstr-list"
and use it from both.

Thank you,

-- 
Masami Hiramatsu <mhiramat@kernel.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
