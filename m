Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E23950875
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 13 Aug 2024 17:05:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sdt5t-00018I-B5
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 13 Aug 2024 15:05:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mail@florommel.de>) id 1sdt5q-000188-4c
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 13 Aug 2024 15:05:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mGFpxHVp+3tuL20+WZ010v7+YwRPITdaS/EPRDfaNG8=; b=JC9aBk2AGsHMTwHvPVPo7EUSl2
 Uqv7HHu+6phDAmm1Rpjsw2APsDQsUNB5GEMhRLoHXtCJ7MvMXXPz97Oz8P3W1M0Uhq9QlDARETJTn
 uhxlbA6AuIw2P4hUfRrW5WOEla7GHhHV/QGZH/gN5DPCLsnYYhExoJHbLxR1orXYKT/k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mGFpxHVp+3tuL20+WZ010v7+YwRPITdaS/EPRDfaNG8=; b=aKogI6F1DPVCsz9vA+Mz8PSaV5
 vBWjcKbKFJJJHrerht02iO1Vq3rhBoQ7f6RroYNwGpoD43nKEDGRCvBDsT/OxEUg51ioDeIaKIC1Z
 TZHEFRfydkmovuzbgvoNUbGjEs+ayqyv/qhamYxLD2WHfJW0Y4MvXU/bi9XDORS7YorQ=;
Received: from read.uberspace.de ([185.26.156.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sdt5o-0004pl-0U for kgdb-bugreport@lists.sourceforge.net;
 Tue, 13 Aug 2024 15:05:50 +0000
Received: (qmail 30973 invoked by uid 990); 13 Aug 2024 15:05:40 -0000
Authentication-Results: read.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
 by read.uberspace.de (Haraka/3.0.1) with ESMTPSA;
 Tue, 13 Aug 2024 17:05:40 +0200
Message-ID: <01b5b729ba11141dc6a8b67ac50ca4c63d332d18.camel@florommel.de>
From: Florian Rommel <mail@florommel.de>
To: Thomas Gleixner <tglx@linutronix.de>
Date: Tue, 13 Aug 2024 17:05:40 +0200
In-Reply-To: <871q2tsbaq.ffs@tglx>
References: <20240812174338.363838-1-mail@florommel.de>
 <20240812174338.363838-3-mail@florommel.de> <871q2tsbaq.ffs@tglx>
User-Agent: Evolution 3.52.4 
MIME-Version: 1.0
X-Rspamd-Bar: /
X-Rspamd-Report: SUSPICIOUS_RECIPS(1.5) BAYES_HAM(-1.721587) MIME_GOOD(-0.1)
X-Rspamd-Score: -0.321587
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=florommel.de; s=uberspace; h=from:to:cc:subject:date;
 bh=m9Ol9Yb/7VyMaWM/asi6Gi7gvnVmClqrjV4U3r/cfqc=;
 b=xIUTiziMd6AwHegrIz+5rqbCU6SzPNWjSR8G6Kr/I3SRgl4wxmMopIEsAx5BYvpDOV3BPWVC6Z
 peTShtIT4+dqJyqRogaqBy9O5A8V8oCznxYf2LDu5RG21qRZklQCJA0r2Lrq0vg6vWpNH08/xtNl
 tyED5grLdCSMecvMAoDvDcH5DJzT27XuzqD3ps0uArMpEZkP7CUfqXkaQjRbB/PVkmqy8KORZLCq
 xgOL1bpjs25q84eU3oOYeVybrnOGsZpbw5dfLxGegFQMo4jE1+k8+4LHPMC3sCYk+7juX4fuO+QD
 kZUS3gdn4hjSoctxhsH04ii6H+6gSaFsObje2V92E3ctu95q+tYX9oB8fVR/B0jKnOtl/odBfGvx
 DRv1wyG32WvForgosZ+u73y0NfbFRPwOQ56gae1cb37nDaXnieND55h+DW6WiUUO0XBah1vo012O
 5CciU6BhzVZUGo/UwhcOo/KDu7khn0ntjZrB64Z5DPpfgEf5GxCcsRM06dmmAWn730K2QNEat2Xc
 Ezmu8lm4CAqjlb+BZQ/G2akm/1qOfk1y+Ecs2dqsnqSEHXccLO16hVwdM5rfhQD5c5IX9EQznzo2
 AJv+X8xCklZNDWbdcov257tUw6FT1oqY/grcVjCiP5AVBkrcwqyALimlQPrf82KhBLQV1eq7h1E3
 Y=
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Thomas, Thanks for the feedback. On Mon, 2024-08-12 at
 23:04 +0200, Thomas Gleixner wrote: > Either you know it or not. Speculation
 is reserved for CPUs. 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: florommel.de]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [185.26.156.133 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sdt5o-0004pl-0U
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
Cc: x86@kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>, "H . Peter Anvin" <hpa@zytor.com>,
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

Hi Thomas,

Thanks for the feedback.

On Mon, 2024-08-12 at 23:04 +0200, Thomas Gleixner wrote:
> Either you know it or not. Speculation is reserved for CPUs.

I have now checked it, it is always the static_key patching mechanism
when I reproduce the issue (in QEMU with a varying number of CPUs), but
we can skip this statement.


> 
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

Ok, ok, looks much better. My intention was to keep the changes in the
generic debug core minimal, especially since efficiency is not
important here.. but I see, it should be done right.




Best regards,
Flo



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
