Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A39C1F768D
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 12 Jun 2020 12:14:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jjghR-0008Dj-RU
	for lists+kgdb-bugreport@lfdr.de; Fri, 12 Jun 2020 10:14:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mhiramat@kernel.org>) id 1jjghI-0008CH-OG
 for kgdb-bugreport@lists.sourceforge.net; Fri, 12 Jun 2020 10:14:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version
 :References:In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mWk3P4ErV5Sg1IYt3/Ls6J+tXvKYKeUv/vV36YH0pWA=; b=FqWXs+rZ2lyfvos/zugHiTpipc
 iFzinOCJDdjfnyXCv9H7mc8mMG7FWcEzDjZg8HZDfRbf/XxT3Efv7n/8cBdySKyBl7h7+CLqZRhj3
 qnlQEcEVE8rjRV6dwofX1kHs2ZaaRoB0dgwkbtQEuO8Kw6BkmKepywLkuSQOJ3CLe1b8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mWk3P4ErV5Sg1IYt3/Ls6J+tXvKYKeUv/vV36YH0pWA=; b=ja2RGsaKUwag2ZPT5hRQEdZL1y
 K64GbC+dATq59JTWxfe4ETPpremxk+dx46G2WbAM0v5y6BnU7CQ8OhabX/QpSpMg/AxPSpi6n8Yaj
 4KqDAprYiZXd/doEQTAwGVKCOawvxYvkowExW13Ow/vFltUugA6O0pxI2/zB16Cx/XI8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jjghE-002zjU-UG
 for kgdb-bugreport@lists.sourceforge.net; Fri, 12 Jun 2020 10:14:02 +0000
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0FBD7206A4;
 Fri, 12 Jun 2020 10:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591956834;
 bh=YGVdRMoIliwKOkYP14E5HqGygD3q1LI9VS07IqWiP3s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=if0NuucfwA+mq3EfP/vzlyDR6OgV9i4KX/XR0T7Ui1Xgub1qExH70Dcjge+qMS21A
 OLa1ExtFXbpiiJ+wq9fH/5uSg3jeEbYOmt5e82h+W0UUaMUas6PmJQ1ChWxCd+nft8
 51CZx9o+aNA4gQHkcgNVPGX5a0gluBvck9jKjKak=
Date: Fri, 12 Jun 2020 19:13:49 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Message-Id: <20200612191349.9774d101681b9f8e7ada0200@kernel.org>
In-Reply-To: <20200611143240.u77kxdbhepaazx3j@holly.lan>
References: <20200605132130.1411255-1-daniel.thompson@linaro.org>
 <20200605142953.GP2750@hirez.programming.kicks-ass.net>
 <20200611214209.bd8fcd290d745ae50d898e69@kernel.org>
 <20200611143240.u77kxdbhepaazx3j@holly.lan>
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
X-Headers-End: 1jjghE-002zjU-UG
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
Cc: pmladek@suse.com, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net, patches@linaro.org,
 linux-kernel@vger.kernel.org, sergey.senozhatsky@gmail.com,
 Jason Wessel <jason.wessel@windriver.com>, will@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, 11 Jun 2020 15:32:40 +0100
Daniel Thompson <daniel.thompson@linaro.org> wrote:

> On Thu, Jun 11, 2020 at 09:42:09PM +0900, Masami Hiramatsu wrote:
> > On Fri, 5 Jun 2020 16:29:53 +0200
> > Peter Zijlstra <peterz@infradead.org> wrote:
> > 
> > > On Fri, Jun 05, 2020 at 02:21:26PM +0100, Daniel Thompson wrote:
> > > > kgdb has traditionally adopted a no safety rails approach to breakpoint
> > > > placement. If the debugger is commanded to place a breakpoint at an
> > > > address then it will do so even if that breakpoint results in kgdb
> > > > becoming inoperable.
> > > > 
> > > > A stop-the-world debugger with memory peek/poke does intrinsically
> > > > provide its operator with the means to hose their system in all manner
> > > > of exciting ways (not least because stopping-the-world is already a DoS
> > > > attack ;-) ) but the current no safety rail approach is not easy to
> > > > defend, especially given kprobes provides us with plenty of machinery to
> > > > mark parts of the kernel where breakpointing is discouraged.
> > > > 
> > > > This patchset introduces some safety rails by using the existing
> > > > kprobes infrastructure. It does not cover all locations where
> > > > breakpoints can cause trouble but it will definitely block off several
> > > > avenues, including the architecture specific parts that are handled by
> > > > arch_within_kprobe_blacklist().
> > > > 
> > > > This patch is an RFC because:
> > > > 
> > > > 1. My workstation is still chugging through the compile testing.
> > > > 
> > > > 2. Patch 4 needs more runtime testing.
> > > > 
> > > > 3. The code to extract the kprobe blacklist code (patch 4 again) needs
> > > >    more review especially for its impact on arch specific code.
> > > > 
> > > > To be clear I do plan to do the detailed review of the kprobe blacklist
> > > > stuff but would like to check the direction of travel first since the
> > > > change is already surprisingly big and maybe there's a better way to
> > > > organise things.
> > > 
> > > Thanks for doing these patches, esp 1-3 look very good to me.
> > > 
> > > I've taken the liberty to bounce the entire set to Masami-San, who is
> > > the kprobes maintainer for comments as well.
> > 
> > Thanks Peter to Cc me.
> > 
> > Reusing kprobe blacklist is good to me as far as it doesn't expand it
> > only for kgdb. For example, if a function which can cause a recursive
> > trap issue only when the kgdb puts a breakpoint, it should be covered
> > by kgdb blacklist, or we should make a "noinstr-list" including
> > both :)
> 
> Recursion is what focuses the mind but I don't think we'd need
> recursion for there to be problems.
> 
> For example taking a kprobe trap whilst executing the kgdb trap handler
> (or vice versa) is already likely to be fragile and is almost certainly
> untested on most or all architectures.

Ah, OK. Actually, on x86 that is not a problem (it can handle recursive int3
if software handles it correctly), but other arch may not accept it.
Hmm, then using NOKPROBE_SYMBOL() is reasonable.

> Further if I understood Peter's
> original nudge correctly then, in addition, x86 plans to explicitly
> prohibit this anyway.
> 
> On other words I think there will only be one blacklist.

Agreed.

> > Thus, Nack for PATCH 4/4, that seems a bit selfish change. If kgdb wants
> > to use the "kprobes blacklist", we should make CONFIG_KGDB depending on
> > CONFIG_KPROBES.
> 
> Some of the architectures currently have kgdb support but do not have
> kprobes...

"depends on KPROBES if HAVE_KPROBES" ? :-)

(Anyway, it is a good chance to port kprobe on such arch...)

Thank you,

-- 
Masami Hiramatsu <mhiramat@kernel.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
