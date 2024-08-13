Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B037B95087A
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 13 Aug 2024 17:06:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sdt6t-00065u-PS
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 13 Aug 2024 15:06:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mail@florommel.de>) id 1sdt6r-00065l-N3
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 13 Aug 2024 15:06:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4fGYV36j7y/8IcRsGF1quz9/AeX1Kw6Hwn0BeLMpZQs=; b=kkCWCsF+OKd31kbt/qP2+vND7p
 zk+ASjN5X4eChMYXWSOF8ney7LAfJNL0qHkhAz43ezFuWfRlEQ8qwMC+aicG7aswCfBAL687/gmkV
 h+xgZGS3YJbsHvZ7s4BJ+USmY20u9lVDIUFL+PFmgscA24w9SCPRWr98pq0FElXgYgX4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4fGYV36j7y/8IcRsGF1quz9/AeX1Kw6Hwn0BeLMpZQs=; b=bT92y4n0buDVlAYC1blQkINEEC
 BUEd4ZdoyN+44/gKXEskEurHF/gbloLq/NjcHUYPaMbyz+Ol7RR1LKBmFWNGsYtsveNnf8GW1DRZL
 wlxzFLJjCZl0g053ALMCN76Hy8PN/jkZyapNP6cXB1XthamCJIzPaHEVuzRTsIGaABTM=;
Received: from read.uberspace.de ([185.26.156.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sdt6r-0004u3-0c for kgdb-bugreport@lists.sourceforge.net;
 Tue, 13 Aug 2024 15:06:54 +0000
Received: (qmail 31801 invoked by uid 990); 13 Aug 2024 15:06:46 -0000
Authentication-Results: read.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
 by read.uberspace.de (Haraka/3.0.1) with ESMTPSA;
 Tue, 13 Aug 2024 17:06:46 +0200
Message-ID: <383e12bebba34afc3779aad14deb3a43e9cbb5d9.camel@florommel.de>
From: Florian Rommel <mail@florommel.de>
To: Daniel Thompson <daniel.thompson@linaro.org>, Thomas Gleixner
 <tglx@linutronix.de>
Date: Tue, 13 Aug 2024 17:06:45 +0200
In-Reply-To: <20240813113147.GA6016@aspen.lan>
References: <20240812174338.363838-1-mail@florommel.de>
 <20240812174338.363838-3-mail@florommel.de> <871q2tsbaq.ffs@tglx>
 <20240813113147.GA6016@aspen.lan>
User-Agent: Evolution 3.52.4 
MIME-Version: 1.0
X-Rspamd-Bar: /
X-Rspamd-Report: SUSPICIOUS_RECIPS(1.5) BAYES_HAM(-1.123945) MIME_GOOD(-0.1)
X-Rspamd-Score: 0.276054
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=florommel.de; s=uberspace; h=from:to:cc:subject:date;
 bh=7oVMNAQNgViWNsPL1cgzaH4HZVMUnsvRm5s/wW0i3Lw=;
 b=nvbjBgxyMU1Ry9M+9UPzsbxAMPK/OzhU97UlQysIcbtzpuZ0R0RHbf2wPQaUtksNlUjcDjzrkL
 g23BvlbylgXcqELhITbQvEgNUcOgMyOQzzBEBOXRnXilDL7haC8xlGMLHP+luoo16vGKDiLFKFp5
 KGZyeKe5gNe8DVwVgazxipA4Wh2/26M4FqlW6SQBHr9oalPgh7/LqImhxgpG9vLCTTFOt0lrklBA
 3RBOSw39nCRTufLPQphmEebtRZ5bqHM4riTRzF5KtfT/INtsvqF27DnuDACdhobQPSLrCDvfKmkC
 qxeOPNqwv22a51rWPB3WMIxn5Mhny47j/lT8nJYxfgA14P1CwZyVprUdqjGPDqJdV6hQiW+T8xwM
 k1QLgg5Uv0b0uwASL7+crFRvWWdn7wKEmWVAtGjTx1l1cTjSUiqjdF+UuJpAAsD91OgLNRlBpEOs
 09l96SVnoMzulCO77i6gRJPV8uHWH4u/pv5TD3m23lyur6O03hUnbHmgpqvOuAAXRsMyW6y/oVHJ
 qlIoYBK89UYDTPSDUTm6UJeA2Ki0YX6+uYIuo8D+sBmXGOFBuv+3IT4JeNkz/R2VjonGMR1b5q9t
 m2NGwCNRJb2w5wFwb9/nEprAoJaaoszaj5ChaRASK0hIeuObONQ/4rVeh/gvU2622uHWcE3YPbWe
 0=
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, 2024-08-13 at 12:31 +0100, Daniel Thompson wrote:
 > On Mon, Aug 12, 2024 at 11:04:13PM +0200, Thomas Gleixner wrote: > > > >
 > Btw, kgdb_skipexception() is a gross nisnomer because it rewinds [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [185.26.156.133 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: florommel.de]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sdt6r-0004u3-0c
Subject: Re: [Kgdb-bugreport] [PATCH v2 2/2] x86/kgdb: fix hang on failed
 breakpoint removal
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
Cc: x86@kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, linux-kernel@vger.kernel.org,
 Lorena Kretzschmar <qy15sije@cip.cs.fau.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Masami Hiramatsu <mhiramat@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Andrew Morton <akpm@linux-foundation.org>,
 Stefan Saecherl <stefan.saecherl@fau.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, 2024-08-13 at 12:31 +0100, Daniel Thompson wrote:
> On Mon, Aug 12, 2024 at 11:04:13PM +0200, Thomas Gleixner wrote:
> 
> > 
> > Btw, kgdb_skipexception() is a gross nisnomer because it rewinds the
> > instruction pointer to the exception address and does not skip anything,
> > but that's an orthogonal issue though it could be cleaned up along the
> > way...
> 
> kgdb_skipexception() is not a directive from debug core to architecture.
> It is a question to the archictecture: should the debug core skip normal
> debug exception handling and resume immediately?.
> 
> It allows an architecture to direct the debug core to ignore a spurious
> trap that, according to the comments, can occur on some
> (micro)architectures when we have already restored the original
> not-a-breakpoint instruction.
> 
> Florian's patch changes things so that we will also skip debug exception
> handling if we can successfully poke to the text section. I don't think
> it is sufficient on its own since the text_mutex could be owned by the
> core that is stuck trapping on the int3 that we can't remove.

Yes, if the text_mutex is owned by the trapping core, that's a inherent
problem. This won't be solved by my patch. But this will probably be
difficult to be solved at all..

The patch only adds an removal attempt, without changing the result of
kgdb_skipexception(). It was thought as a best-effort solution: Better
try removing the breakpoint than getting stuck in the int3 loop for
sure. Of course, there is no guarantee for this being successful.

> 
> 
> > >  {
> > >  	if (exception == 3 && kgdb_isremovedbreak(regs->ip - 1)) {
> > > +		struct kgdb_bkpt *bpt;
> > > +		int i, error;
> > > +
> > >  		regs->ip -= 1;
> > > +
> > > +		/*
> > > +		 * Try to remove the spurious int3 instruction.
> > > +		 * These int3s can result from failed breakpoint removals
> > > +		 * in kgdb_arch_remove_breakpoint.
> > > +		 */
> > > +		for (bpt = NULL, i = 0; i < KGDB_MAX_BREAKPOINTS; i++) {
> > > +			if (kgdb_break[i].bpt_addr == regs->ip &&
> > > +			    kgdb_break[i].state == BP_REMOVED &&
> > > +			    (kgdb_break[i].type == BP_BREAKPOINT ||
> > > +			     kgdb_break[i].type == BP_POKE_BREAKPOINT)) {
> > > +				bpt = &kgdb_break[i];
> > > +				break;
> > > +			}
> > > +		}
> > 
> > Seriously? The KGBD core already walked that array in
> > kgdb_isremovedbreak() just so you can walk it again here.
> > 
> > struct kkgdb_bkpt *kgdb_get_removed_breakpoint(unsigned long addr)
> > {
> >         struct kgdb_bkpt *bp = kgdb_break;
> > 
> > 	for (int i = 0; i < KGDB_MAX_BREAKPOINTS; i++, bp++) {
> > 		if (bp>.state == BP_REMOVED && bp->kgdb_bpt_addr == addr)
> > 			return bp;
> > 	}
> > 	return NULL;
> > }
> > 
> > bool kgdb_isremovedbreak(unsigned long addr)
> > {
> >         return !!kgdb_get_removed_breakpoint(addr);
> > }
> > 
> > bool kgdb_rewind_exception(int exception, struct pt_regs *regs)
> > {
> >         struct kgdb_bkpt *bp;
> > 
> > 	if (exception != 3)
> >         	return false;
> > 
> >         bp = kgdb_get_removed_breakpoint(--regs->ip);
> >         if (!bp || !bp->type == BP_BREAKPOINT)
> >         	return false;
> > 
> > Hmm?
> > 
> > > +		error = kgdb_arch_remove_breakpoint(bpt);
> > > +		if (error)
> > > +			pr_err("skipexception: breakpoint remove failed: %lx\n",
> > > +			       bpt->bpt_addr);
> > 
> > Lacks curly brackets. See Documentation.
> > 
> > 	return !error;
> > 
> > Aside of that the same problem exists on PowerPC.  So you can move the
> > attempt to remove the breakpoint into the generic code, no?
> 
> Getting the debug core to track breakpoints that are stuck on would be a
> good improvement.

Do you mean tracking failed removals with an extra kgdb_bptype variant?

> 
> We would be able to use that logic to retry the removal of stuck
> breakpoint once other SMP cores are running again. That would be great
> for architectures like arm64 that use spin-with-irqsave locking in their
> noinstr text_poke() machinery.
> 
> However it won't solve the problem for x86 since it uses mutex locking.
> 
> A partial solution might be to get kgdb_arch_remove_breakpoint() to
> disregard the text_mutex completely if kdb_continue_catastrophic is set
> (and adding stuck breakpoints to the reasons to inhibit a continue).
> This is a partial solution in the sense that it is not safe: we will
> simply tell the kernel dev driving the debugger that they are
> responsible for the safety of the continue and then disable the safety
> rails.
> 
> I haven't yet come up with a full fix that doesn't require
> text_poke_kgdb() to not require text_mutex to be free. I did note that
> comment in __text_poke() that says calling get_locked_pte() "is not
> really needed, but this allows to avoid open-coding" but I got a bit lost
> trying to figure out other locks and nesting concerns.
> 

This is a bit off-topic, but isn't setting software breakpoints in
combination with other text modifications unsafe anyway? If we remove a
breakpoint in a code location that has been modified in the meantime,
we would restore an outdated saved_instr. What am I missing here?

Best regards,
Flo



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
