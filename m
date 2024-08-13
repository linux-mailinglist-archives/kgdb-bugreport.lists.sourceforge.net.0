Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DB30A950A08
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 13 Aug 2024 18:21:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sduH0-0002Z6-VP
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 13 Aug 2024 16:21:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tglx@linutronix.de>) id 1sduGy-0002Yw-Fg
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 13 Aug 2024 16:21:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HAKPHQsZux3wxh3xmm9uAGYbZH+n0Hgy3pKz2mw64e8=; b=dmnmvZ33w/hMC4j9ghv0oHHDyr
 3/4yzWqJr1MtOpgAnI3QB54V79LPqF80iE0+DzY3/grrqXrVQEVXaqo0RH4fgs0Mwca1RnNX+M8xr
 JP5/OXngxBmWBQqY8TmxCQKSlP/cOjyK3qcCGYmfj9S1YVFSe5q5wgqx0t4W41+9fkxs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HAKPHQsZux3wxh3xmm9uAGYbZH+n0Hgy3pKz2mw64e8=; b=HsY0oTUohJuZKBJNktovOkFCCx
 ItoyHXf11pvN8EWpkJuwzhwfh5aDsQ3vei/DHHUclvSUnfqp9W5O0LXgLReJPfdmyEe6ThUwSTcuI
 uF05rMmEh3M/opBcA99EVWR7z64lnZfTWG5YiaGtDI5KdY2DEhrMxAcZ5MgxeRKkcidk=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sduGx-0000VS-WF for kgdb-bugreport@lists.sourceforge.net;
 Tue, 13 Aug 2024 16:21:25 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1723566077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HAKPHQsZux3wxh3xmm9uAGYbZH+n0Hgy3pKz2mw64e8=;
 b=Mh1M55+iPTITmaz0wpIGxowXK8eNbjXOy/FeL6nSbilYCTBL79iHv5fitogHZ19EycP1Nh
 Wb97+9vDO/bBHwqLd4izptTTXnx47hAfsXHp+Df4OgC9MoO22kqnYI43mkcg4MnUJOREkm
 A9Nm5/3XNYja5HXx+lVxvZ7o6dmBsZSRABvwxz1MjU1niaU9hzil8ETw6QVpTFg+xTdFMH
 5uFGiJGhYAxDdw36suwo8RIMC+flOl9SSbHfgBH/zCdc1DGxSHFS6TrYdYhWpCnGTu4RNX
 4VTrPmk22P358fkhIByixsnUVcDbAUbZ9RZ+SpBccOsP5iih30GyHkPy1IbLGQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1723566077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HAKPHQsZux3wxh3xmm9uAGYbZH+n0Hgy3pKz2mw64e8=;
 b=tqRyrMntA5wH1A86GziXKM1W3AY6SIzu+8ps+KhvIFX/xVcRaaZ8DD4xtE3ji+32KDJSeE
 i0yQCzJL9ESY1PAA==
To: Daniel Thompson <daniel.thompson@linaro.org>
In-Reply-To: <20240813113147.GA6016@aspen.lan>
References: <20240812174338.363838-1-mail@florommel.de>
 <20240812174338.363838-3-mail@florommel.de> <871q2tsbaq.ffs@tglx>
 <20240813113147.GA6016@aspen.lan>
Date: Tue, 13 Aug 2024 18:21:16 +0200
Message-ID: <87wmkkpf5v.ffs@tglx>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Daniel! On Tue, Aug 13 2024 at 12:31, Daniel Thompson wrote:
 > On Mon, Aug 12, 2024 at 11:04:13PM +0200, Thomas Gleixner wrote: >> Btw,
 kgdb_skipexception() is a gross nisnomer because it rewinds the >> instr
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [193.142.43.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sduGx-0000VS-WF
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
 Lorena Kretzschmar <qy15sije@cip.cs.fau.de>, Kees Cook <kees@kernel.org>,
 Florian Rommel <mail@florommel.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Masami Hiramatsu <mhiramat@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Andrew Morton <akpm@linux-foundation.org>,
 Stefan Saecherl <stefan.saecherl@fau.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Daniel!

On Tue, Aug 13 2024 at 12:31, Daniel Thompson wrote:
> On Mon, Aug 12, 2024 at 11:04:13PM +0200, Thomas Gleixner wrote:
>> Btw, kgdb_skipexception() is a gross nisnomer because it rewinds the
>> instruction pointer to the exception address and does not skip anything,
>> but that's an orthogonal issue though it could be cleaned up along the
>> way...
>
> kgdb_skipexception() is not a directive from debug core to architecture.
> It is a question to the archictecture: should the debug core skip normal
> debug exception handling and resume immediately?.

Ah. This code is so exceptionally intuitive ....

> It allows an architecture to direct the debug core to ignore a spurious
> trap that, according to the comments, can occur on some
> (micro)architectures when we have already restored the original
> not-a-breakpoint instruction.

Potentially due to the lack of sync_core() after the copy.

And of course the removal can fail as Florian discussed.

> Florian's patch changes things so that we will also skip debug exception
> handling if we can successfully poke to the text section. I don't think
> it is sufficient on its own since the text_mutex could be owned by the
> core that is stuck trapping on the int3 that we can't remove.

I was asking exactly that:

>  What guarantees the release of text mutex?

:)

>> Aside of that the same problem exists on PowerPC.  So you can move the
>> attempt to remove the breakpoint into the generic code, no?
>
> Getting the debug core to track breakpoints that are stuck on would be a
> good improvement.
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

The interrupted owner of text_mutex might be in the middle of modifying
the poking_mm page tables or in the worst case modifying the code which
kgdb wants to play with.

Dragons are guaranteed.

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

So there are no other locks involved. The PTE lock is not strictly
required because the access to poking_mm is fully serialized.

You'd need to add a separate kgdb_poking_mm and kgdb_poking_addr. Now
make __text_poke() take a @mm and @pokeaddr argument and let it operate
on them. But that solves only part of the problem:

   1) A concurrent modification of the same code will result in
      undefined behaviour. Not sure whether that's actually an issue,
      but I would not bet on it.

   2) switch_mm() and the related code are not reentrancy safe either

   3) TLB flushing. That can't use tlb_flush_mm_range() simply because
      that's not reentrant.

Which makes me wonder about #2. As this stuff can run in NMI context,
then even if text_mutex is uncontended, then tlb_flush_mm_range() might
be what had been interrupted, so reentrancy would be fatal. 

That's all a horrorshow as you can't play with CR0.WP either at least
not when CR4.CET is set.

So if you can force disable CET when KGDB is enabled, then you might get
away with:

     bp->code = *p;
     clear_cr0_wp();
     *p = int3;
     set_cr0_wp();

Though the hardening people might not be really happy about this.

But let's take a step back. Installing a breakpoint is done by the
debugger. The debugger knows the original code, right?

So why cant the debugger provide a trampoline:

   ORIG_OP		// with fixed up displacements
   JMP NEXT_INSN

Now you stick that into a trampoline page slot and then patch the INT3
in. Now on removal can be a two stage approach:

    bp->state = INACTIVE;
    kick_breakpoint_gc();

breakpoint_gc() removes the breakpoint and invalidates the trampoline
from a safe context and up to that point kgdb_skipexception() can do:

bool kgdb_skip_exception(int exception, struct pt_regs *regs)
{
	  struct kgdb_bkpt *bp;

	  if (exception != 3)
		  return false;

	  bp = kgdb_get_inactive_breakpoint(--regs->ip, BP_BREAKPOINT);
	  if (bp)
                    regs->ip = bp->trampoline;
          return true;
}

Hmm?

Thanks,

        tglx


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
