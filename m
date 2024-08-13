Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3745A95043E
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 13 Aug 2024 13:55:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sdq7e-0008UG-9l
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 13 Aug 2024 11:55:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1sdq7d-0008U8-2M
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 13 Aug 2024 11:55:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gs9stsBHW0oE3faAYAhWRtfdBQIXzmozHZWQfxW+8lc=; b=Dd2zSlbRcix142ttgf+SW5Q04v
 K7imPtUw1LxDNMw5lKZRN6UE4XL5Tk6UiBibOZjzykHKHX26/DTxXHzx6jj4pBOBusrzGs37ICCHt
 TbX58orM5LxnjsJMF6Nc+dMeEdwq5rY9nigpSdCUoj2NrXwMPzcUohgGhT5mKRSheg9I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Gs9stsBHW0oE3faAYAhWRtfdBQIXzmozHZWQfxW+8lc=; b=fz9elFf4XUZ/5R7f9cnI4q2eHw
 ghRERDhmpq7vJhBHsxB6PKJDIeca+V2bmjbvba0BHo9MyR2N5nrw6zQh/hvFOz+fyn59KA4m2NID8
 tHv4IuU/7kdVrAdIDMEwES9Ji0IdIQjf0y+V8ysk+Jh7z8rto/PyqAAtHz1cj6iFx2ek=;
Received: from mail-wm1-f46.google.com ([209.85.128.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sdq7c-0008Nh-Uk for kgdb-bugreport@lists.sourceforge.net;
 Tue, 13 Aug 2024 11:55:29 +0000
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4281c164408so40089485e9.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 13 Aug 2024 04:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723550117; x=1724154917; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Gs9stsBHW0oE3faAYAhWRtfdBQIXzmozHZWQfxW+8lc=;
 b=TYauSHRM7Fi1LEvbGDRt5TCDi8R1vbwYSDU+btuU0E7Mm7PIy3N3NeCIjvTL8N7EO+
 RU1xd5nnCAmeciKDgXrxdLM37PrIkrdykkez2szt5EDaOh6kdUCx8nKbBXQH4gZNB0hJ
 2ohONprV5TiXjEscTtoObw7QlMrLKjjA9eR2RZbKdl3gVVD5IMaXH6UQKPfa7416qXFZ
 Bu6vnEsldbmQvAW6GfEBzzUgazo9tpO93pnhbCIPu+Ahik4bWVPYvtYY5EvE8GUaZwkS
 uL/AWmDXSPk3xlrxNHT4LNGP31toxh3o4Aeyc7H7rc1FNac5YLbFIsUv9VyGvM65kn9J
 p2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723550117; x=1724154917;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gs9stsBHW0oE3faAYAhWRtfdBQIXzmozHZWQfxW+8lc=;
 b=b1AYPtU99oxhYROX0oMirJhwX1QFDM4RC2pvjwXKOlEBz+vYJD1D/7N1J96nXouopL
 KjUabJTdeHmIJKGoyd3I2Qkt6ghkG7NWU8uZendltYMSblTaEjyMLai+pm7L/zmNilDM
 F6Gt/jo/ljhICq2kuomBHskbWE6Yh+bk86xvcOmRyJ3oWv3xz+57s3RUAhWHfrjFAxKX
 EDa9uvKLLn4OzREDKFKwZRykZdld9w8zhERJ1qLgPGPLV58GxbQD6t5CVU35EqIwFW9u
 0BMRYF/0w69hFdgA1Z7SgB6SfcAMPdWiqA6F46PGMzlFSZlnOIwtKrYen+xDJYk4UiIp
 eJug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdS3th54eGjfmUCKR8oKR0Sn4AiiFBHDeT+Tp1KJySCrvYrAFAlUx4T7fwb0JpGRmTwpv2aWqXhGanGraOMIsnpmhWY9X4z9Cb4dnoVJWeMaH57nw=
X-Gm-Message-State: AOJu0Yxm+ZDlYKuYMSJ+Pci9auKx3qhq5Zox6GDZ5cfNFUqQYMVCqJ0s
 9ZNX3uhTf2MPTfsQOuEASI71TrVYEog++/DLUeG8UEDAbIltsjdb51oAiRRAl1SpBcR9o002dcl
 IN/U=
X-Google-Smtp-Source: AGHT+IHQlvfEGqaODA7diW4pLtkWS6mwQ+sPk5IQb2adhJT6xoj7fDrXZBIaRH1x9Ak/K+6DiUFhRA==
X-Received: by 2002:a05:600c:3b8f:b0:426:5b29:b5c8 with SMTP id
 5b1f17b1804b1-429d486e809mr25229855e9.28.1723548710225; 
 Tue, 13 Aug 2024 04:31:50 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4293e41496dsm199444885e9.23.2024.08.13.04.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2024 04:31:49 -0700 (PDT)
Date: Tue, 13 Aug 2024 12:31:47 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <20240813113147.GA6016@aspen.lan>
References: <20240812174338.363838-1-mail@florommel.de>
 <20240812174338.363838-3-mail@florommel.de> <871q2tsbaq.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <871q2tsbaq.ffs@tglx>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Aug 12, 2024 at 11:04:13PM +0200, Thomas Gleixner
 wrote: > Florian! > > On Mon, Aug 12 2024 at 19:43, Florian Rommel wrote:
 > > On x86, occasionally, the removal of a breakpoint (i.e., removal [...]
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.128.46 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.46 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sdq7c-0008Nh-Uk
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
 Lorena Kretzschmar <qy15sije@cip.cs.fau.de>,
 Florian Rommel <mail@florommel.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Masami Hiramatsu <mhiramat@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Andrew Morton <akpm@linux-foundation.org>,
 Stefan Saecherl <stefan.saecherl@fau.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Aug 12, 2024 at 11:04:13PM +0200, Thomas Gleixner wrote:
> Florian!
>
> On Mon, Aug 12 2024 at 19:43, Florian Rommel wrote:
> > On x86, occasionally, the removal of a breakpoint (i.e., removal of
> > the int3 instruction) fails because the text_mutex is taken by another
> > CPU (mainly due to the static_key mechanism, I think).
>
> Either you know it or not. Speculation is reserved for CPUs.
>
> > The function kgdb_skipexception catches exceptions from these spurious
> > int3 instructions, bails out of KGDB, and continues execution from the
> > previous PC address.
> >
> > However, this led to an endless loop between the int3 instruction and
> > kgdb_skipexception since the int3 instruction (being still present)
> > triggered again.  This effectively caused the system to hang.
> >
> > With this patch, we try to remove the concerned spurious int3
> > instruction in kgdb_skipexception before continuing execution.  This
> > may take a few attempts until the concurrent holders of the text_mutex
> > have released it, but eventually succeeds and the kernel can continue.
>
> What guarantees the release of text mutex?
>
> > Signed-off-by: Florian Rommel <mail@florommel.de>
> > ---
> >  arch/x86/kernel/kgdb.c | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/arch/x86/kernel/kgdb.c b/arch/x86/kernel/kgdb.c
> > index 64c332151af7..585a7a72af74 100644
> > --- a/arch/x86/kernel/kgdb.c
> > +++ b/arch/x86/kernel/kgdb.c
> > @@ -723,7 +723,31 @@ void kgdb_arch_exit(void)
> >  int kgdb_skipexception(int exception, struct pt_regs *regs)
>
> Btw, kgdb_skipexception() is a gross nisnomer because it rewinds the
> instruction pointer to the exception address and does not skip anything,
> but that's an orthogonal issue though it could be cleaned up along the
> way...

kgdb_skipexception() is not a directive from debug core to architecture.
It is a question to the archictecture: should the debug core skip normal
debug exception handling and resume immediately?.

It allows an architecture to direct the debug core to ignore a spurious
trap that, according to the comments, can occur on some
(micro)architectures when we have already restored the original
not-a-breakpoint instruction.

Florian's patch changes things so that we will also skip debug exception
handling if we can successfully poke to the text section. I don't think
it is sufficient on its own since the text_mutex could be owned by the
core that is stuck trapping on the int3 that we can't remove.


> >  {
> >  	if (exception == 3 && kgdb_isremovedbreak(regs->ip - 1)) {
> > +		struct kgdb_bkpt *bpt;
> > +		int i, error;
> > +
> >  		regs->ip -= 1;
> > +
> > +		/*
> > +		 * Try to remove the spurious int3 instruction.
> > +		 * These int3s can result from failed breakpoint removals
> > +		 * in kgdb_arch_remove_breakpoint.
> > +		 */
> > +		for (bpt = NULL, i = 0; i < KGDB_MAX_BREAKPOINTS; i++) {
> > +			if (kgdb_break[i].bpt_addr == regs->ip &&
> > +			    kgdb_break[i].state == BP_REMOVED &&
> > +			    (kgdb_break[i].type == BP_BREAKPOINT ||
> > +			     kgdb_break[i].type == BP_POKE_BREAKPOINT)) {
> > +				bpt = &kgdb_break[i];
> > +				break;
> > +			}
> > +		}
>
> Seriously? The KGBD core already walked that array in
> kgdb_isremovedbreak() just so you can walk it again here.
>
> struct kkgdb_bkpt *kgdb_get_removed_breakpoint(unsigned long addr)
> {
>         struct kgdb_bkpt *bp = kgdb_break;
>
> 	for (int i = 0; i < KGDB_MAX_BREAKPOINTS; i++, bp++) {
> 		if (bp>.state == BP_REMOVED && bp->kgdb_bpt_addr == addr)
> 			return bp;
> 	}
> 	return NULL;
> }
>
> bool kgdb_isremovedbreak(unsigned long addr)
> {
>         return !!kgdb_get_removed_breakpoint(addr);
> }
>
> bool kgdb_rewind_exception(int exception, struct pt_regs *regs)
> {
>         struct kgdb_bkpt *bp;
>
> 	if (exception != 3)
>         	return false;
>
>         bp = kgdb_get_removed_breakpoint(--regs->ip);
>         if (!bp || !bp->type == BP_BREAKPOINT)
>         	return false;
>
> Hmm?
>
> > +		error = kgdb_arch_remove_breakpoint(bpt);
> > +		if (error)
> > +			pr_err("skipexception: breakpoint remove failed: %lx\n",
> > +			       bpt->bpt_addr);
>
> Lacks curly brackets. See Documentation.
>
> 	return !error;
>
> Aside of that the same problem exists on PowerPC.  So you can move the
> attempt to remove the breakpoint into the generic code, no?

Getting the debug core to track breakpoints that are stuck on would be a
good improvement.

We would be able to use that logic to retry the removal of stuck
breakpoint once other SMP cores are running again. That would be great
for architectures like arm64 that use spin-with-irqsave locking in their
noinstr text_poke() machinery.

However it won't solve the problem for x86 since it uses mutex locking.

A partial solution might be to get kgdb_arch_remove_breakpoint() to
disregard the text_mutex completely if kdb_continue_catastrophic is set
(and adding stuck breakpoints to the reasons to inhibit a continue).
This is a partial solution in the sense that it is not safe: we will
simply tell the kernel dev driving the debugger that they are
responsible for the safety of the continue and then disable the safety
rails.

I haven't yet come up with a full fix that doesn't require
text_poke_kgdb() to not require text_mutex to be free. I did note that
comment in __text_poke() that says calling get_locked_pte() "is not
really needed, but this allows to avoid open-coding" but I got a bit lost
trying to figure out other locks and nesting concerns.


Daniel.


[1] I try to avoid calling them "users" because


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
