Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0271DEE5A
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 22 May 2020 19:34:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jcBZL-0001SJ-5s
	for lists+kgdb-bugreport@lfdr.de; Fri, 22 May 2020 17:34:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <peterz@infradead.org>) id 1jcBZJ-0001S0-Gw
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 May 2020 17:34:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yorX4qD+MAY7UFaM6AiNcUEHYEEJIru/3ydP8+Kx9yI=; b=XLC7vLTGIEGVvzoleDEtWmqHLv
 sr4DXhifHDBWuB81jHvHcaJJOuLEShHTeFeAT57/3TonBa0jd/j8DFtUz8l1ePZdJqHMjYROmq34c
 Bt5IALWMzAIt/FdXpe43CQAezNTI3QayR2U4R60wwWHtXz0DjNgTYx7ED8G0lKyYQeU8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yorX4qD+MAY7UFaM6AiNcUEHYEEJIru/3ydP8+Kx9yI=; b=kGqrgiH/orsxAh9BcD63CmM1ZR
 m3XMARr38az/gXWFzaGFegXrBCr486Cgnof1/MEkxOGDnwfZ2PZxYic31fzQvQsNfKMSVlf4jT2kj
 rsTV91yzjQef2mxYFavM9nv1KvllzsRMHxqixE6mFpiMkbEdVgV1cnpHnZ6M+7VuJlpA=;
Received: from merlin.infradead.org ([205.233.59.134])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jcBZG-002aXv-SM
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 May 2020 17:34:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=yorX4qD+MAY7UFaM6AiNcUEHYEEJIru/3ydP8+Kx9yI=; b=tAUIgGL/baSjJdIjHLfWRowaxD
 dYNL3guBgj/n3sIzew9mHyCrcUTVm4DIUYpIH+ycSG1Qpw7ZWZhu5kQ08TQdp95Uy97HEElrtIw2b
 QqySyUP4sSBdmR0U4piBy1/cTpCg6j8GDwBdiu03qpOqELZ3e2PF0B2UiqXVf7fu2Eakt/FT9dJ7I
 PpXnFnS7jfwaQeUj7M6DHrxXEhbB/J/IuFO70z12PmUUCN+hd4Bxvhdj0IRGcb8xQK/K0vPlDMug7
 Gnwpn7/+bDV3DAJq1Kr5B8ppkLByuxgw8HuoQ99zvqMSkH/dFd7sq4gyzit8pnrYWFFtFboR3pRus
 C6qk6DcA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcAdW-0006DM-Dt; Fri, 22 May 2020 16:35:06 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id EC50E306368;
 Fri, 22 May 2020 18:35:04 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id C75A520B5D17E; Fri, 22 May 2020 18:35:04 +0200 (CEST)
Date: Fri, 22 May 2020 18:35:04 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <20200522163504.GX317569@hirez.programming.kicks-ass.net>
References: <20200522145510.2109799-1-daniel.thompson@linaro.org>
 <20200522145510.2109799-3-daniel.thompson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200522145510.2109799-3-daniel.thompson@linaro.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [205.233.59.134 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jcBZG-002aXv-SM
Subject: Re: [Kgdb-bugreport] [RFC PATCH 2/2] locking/spinlock/debug: Add
 checks for kgdb trap safety
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
Cc: pmladek@suse.com, patches@linaro.org, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, sergey.senozhatsky@gmail.com,
 Ingo Molnar <mingo@redhat.com>, jason.wessel@windriver.com,
 Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, May 22, 2020 at 03:55:10PM +0100, Daniel Thompson wrote:
> In general it is not safe to call spin_lock() whilst executing in the
> kgdb trap handler. The trap can be entered from all sorts of execution
> context (NMI, IRQ, irqs disabled, etc) and the kgdb/kdb needs to be
> as resillient as possible.
> 
> Currently it is difficult to spot mistakes in the kgdb/kdb logic
> (especially so for kdb because it uses more kernel features than
> pure-kgdb). Let's provide a means to bring attention to deadlock
> risks in the debug code.

I really dislike this thing. Also, commit:

  f6f48e180404 ("lockdep: Teach lockdep about "USED" <- "IN-NMI" inversions")

should be able to trigger here when the kgdb traps are marked as NMI.
x86 will soon have that.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
