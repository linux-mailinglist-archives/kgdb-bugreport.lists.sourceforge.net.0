Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1717B1EFB6F
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  5 Jun 2020 16:30:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jhDMP-0006ev-T4
	for lists+kgdb-bugreport@lfdr.de; Fri, 05 Jun 2020 14:30:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <peterz@infradead.org>) id 1jhDMO-0006en-Nm
 for kgdb-bugreport@lists.sourceforge.net; Fri, 05 Jun 2020 14:30:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dQozpauM+B1HUAZG/afzEGekuT2pBrCyXAH6b1RYzE4=; b=P2Xji11BxulGhvVjBkHTEGQ46T
 uhsOyEN2eM0XlR1GnEe548TPRNQARwCTXMD30Dtt8oycNyHiOM+P3Z+pYTYx/cYcBklmGtQ7/GtVV
 E5po0+niX1asm+JZ5En8xHo56iED4hbub98Xsp9SN8tZoy2SGx92oho8nHgpIJGQfzg0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dQozpauM+B1HUAZG/afzEGekuT2pBrCyXAH6b1RYzE4=; b=aWAINf6ZpbBVgVrTE3EXudgGw0
 wqiUkokBli1a4+6BIkcTINMT6xzQ/9kwKvE6PsBaRDggydAuk1Q9S8mHbkzsXY/jrrjcBcjcVVePZ
 rUgv5lU/hwFvVSbASrrg/hXvdqsfEpEfaB00NzMg2yXwFx2XREuykryqDg+VyujQK0aQ=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jhDMN-0070Jg-FA
 for kgdb-bugreport@lists.sourceforge.net; Fri, 05 Jun 2020 14:30:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=dQozpauM+B1HUAZG/afzEGekuT2pBrCyXAH6b1RYzE4=; b=blC/DwwD+vyB/QngYMRyJPdJ8C
 V/5m7Ky94t+nyRbIDIUeFa8RemAN6Mv0NKXuzcOm12jCNeumPX6PkLdSHeSP/NPKSPbnFV9EX1baf
 I72TSiScqkQ9b9vjFRdJpJT6f5YNVARLIhUOBFxffwVktD3uuTWKh5RuI1Q38xM4adem6gu3oR5h7
 RhlAwEXeObcvsurFcBwrW//vfTvnYtor7Ynf0pPc+WpHe7WXyZ5RCIQMIN+HnMVPDIfHEoUCRvMNA
 qikHKMuyXY6kzMnKyvtPZpClw+6YTt2EkljoptEuZtzZ0FyxFx2aUJSHprjZMfl+pus1CxJ7FR7En
 9CQA/zgA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jhDM2-0001lD-Vx; Fri, 05 Jun 2020 14:29:55 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 2E14E304BDF;
 Fri,  5 Jun 2020 16:29:53 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 0FD4621A74B3C; Fri,  5 Jun 2020 16:29:53 +0200 (CEST)
Date: Fri, 5 Jun 2020 16:29:53 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <20200605142953.GP2750@hirez.programming.kicks-ass.net>
References: <20200605132130.1411255-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200605132130.1411255-1-daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jhDMN-0070Jg-FA
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
Cc: pmladek@suse.com, kgdb-bugreport@lists.sourceforge.net, patches@linaro.org,
 linux-kernel@vger.kernel.org, sergey.senozhatsky@gmail.com,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, will@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, Jun 05, 2020 at 02:21:26PM +0100, Daniel Thompson wrote:
> kgdb has traditionally adopted a no safety rails approach to breakpoint
> placement. If the debugger is commanded to place a breakpoint at an
> address then it will do so even if that breakpoint results in kgdb
> becoming inoperable.
> 
> A stop-the-world debugger with memory peek/poke does intrinsically
> provide its operator with the means to hose their system in all manner
> of exciting ways (not least because stopping-the-world is already a DoS
> attack ;-) ) but the current no safety rail approach is not easy to
> defend, especially given kprobes provides us with plenty of machinery to
> mark parts of the kernel where breakpointing is discouraged.
> 
> This patchset introduces some safety rails by using the existing
> kprobes infrastructure. It does not cover all locations where
> breakpoints can cause trouble but it will definitely block off several
> avenues, including the architecture specific parts that are handled by
> arch_within_kprobe_blacklist().
> 
> This patch is an RFC because:
> 
> 1. My workstation is still chugging through the compile testing.
> 
> 2. Patch 4 needs more runtime testing.
> 
> 3. The code to extract the kprobe blacklist code (patch 4 again) needs
>    more review especially for its impact on arch specific code.
> 
> To be clear I do plan to do the detailed review of the kprobe blacklist
> stuff but would like to check the direction of travel first since the
> change is already surprisingly big and maybe there's a better way to
> organise things.

Thanks for doing these patches, esp 1-3 look very good to me.

I've taken the liberty to bounce the entire set to Masami-San, who is
the kprobes maintainer for comments as well.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
