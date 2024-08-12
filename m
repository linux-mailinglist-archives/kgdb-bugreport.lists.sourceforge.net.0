Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A0F94F8B7
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 12 Aug 2024 23:04:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sdcDI-00019t-MD
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 12 Aug 2024 21:04:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tglx@linutronix.de>) id 1sdcDG-00019j-O6
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 12 Aug 2024 21:04:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qylMb/PJkxVqMp/MGQvYyYmuKfeQ8u7apULPzaVdPjE=; b=YxsgXgqp/rhF6XweHOri+RTQB9
 hbTBI3qLZ3MpqrY/dRgwkWmZ/1yI3yBk9nf1zzgGLtUeRqh0IowmPYy0hsf73gMq1QtlQnOzYpSXD
 9qC272K34vbXhyWcd+b4iUpgdKyXeyMqtQYynYGG/Qj8CKXz7R+VigR+Upeqaxs7EPyI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qylMb/PJkxVqMp/MGQvYyYmuKfeQ8u7apULPzaVdPjE=; b=g5zVI85M7NnvVjm0NFpqQSc5zn
 roUbCUaAv/D6zUsDBtkg0QVeTjQU+JPVtYuWeTkLtrxxMf84r5nDX8nzVK2pwU2S+haTLZD+DgJvS
 OHhR/lvHIULfvG5rGETVuZhK16bFMBqj0rHeOXCNx43gUWrd+AaO9XPh32cUsicqjXRE=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sdcDF-00051x-09 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 12 Aug 2024 21:04:22 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1723496654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qylMb/PJkxVqMp/MGQvYyYmuKfeQ8u7apULPzaVdPjE=;
 b=BF/DHPz1665DNXQxD7RN8QeXgEozpA3Whb0j7fUIruRdOdsQKtz+BLo9Lqtn7VEmZHkiw3
 jWjoNl6wJj2HKMDgkeD4k3/3kr6BgHtKUmuwkmCdhRE2o6sxbeJid8+ExjT4XndManOfYK
 vVDPQ8SKf0yXo4MQwW5ewxO0UDww8SU8+naQne6EYxOYt9xv7pJOIOeGHp1Hb6BH4y0jXW
 ejb23OoQGlpqQ135FLd4Q4a9lJwfZyiwsLQzjKM5jJrfBgmx4IXf/lYRB7pQGK+Qy/SyK9
 oiBU0S50+JHCC40+WrnpfEE7hfSOTm0dK1dokhqm9fu6o1XjqZZNUBeaINJxWg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1723496654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qylMb/PJkxVqMp/MGQvYyYmuKfeQ8u7apULPzaVdPjE=;
 b=FlzVR/M4e8/rj1AZCr8+Bf76B5Tg+3KX6NSPWf8k3JBSTWC9GUBr3JJReb1cQ5AqmsXTzv
 MbvF7G0jVf+fl0Aw==
To: Florian Rommel <mail@florommel.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Jason Wessel
 <jason.wessel@windriver.com>, Daniel Thompson
 <daniel.thompson@linaro.org>, Douglas Anderson <dianders@chromium.org>,
 Lorena Kretzschmar <qy15sije@cip.cs.fau.de>, Stefan Saecherl
 <stefan.saecherl@fau.de>, Peter Zijlstra <peterz@infradead.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Randy Dunlap
 <rdunlap@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Geert Uytterhoeven
 <geert+renesas@glider.be>, kgdb-bugreport@lists.sourceforge.net,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240812174338.363838-3-mail@florommel.de>
References: <20240812174338.363838-1-mail@florommel.de>
 <20240812174338.363838-3-mail@florommel.de>
Date: Mon, 12 Aug 2024 23:04:13 +0200
Message-ID: <871q2tsbaq.ffs@tglx>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Florian! On Mon, Aug 12 2024 at 19:43, Florian Rommel wrote:
 > On x86, occasionally, the removal of a breakpoint (i.e., removal of > the
 int3 instruction) fails because the text_mutex is taken by another > CPU
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linutronix.de]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [193.142.43.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sdcDF-00051x-09
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
Cc: Florian Rommel <mail@florommel.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Florian!

On Mon, Aug 12 2024 at 19:43, Florian Rommel wrote:
> On x86, occasionally, the removal of a breakpoint (i.e., removal of
> the int3 instruction) fails because the text_mutex is taken by another
> CPU (mainly due to the static_key mechanism, I think).

Either you know it or not. Speculation is reserved for CPUs.

> The function kgdb_skipexception catches exceptions from these spurious
> int3 instructions, bails out of KGDB, and continues execution from the
> previous PC address.
>
> However, this led to an endless loop between the int3 instruction and
> kgdb_skipexception since the int3 instruction (being still present)
> triggered again.  This effectively caused the system to hang.
>
> With this patch, we try to remove the concerned spurious int3
> instruction in kgdb_skipexception before continuing execution.  This
> may take a few attempts until the concurrent holders of the text_mutex
> have released it, but eventually succeeds and the kernel can continue.

What guarantees the release of text mutex?

> Signed-off-by: Florian Rommel <mail@florommel.de>
> ---
>  arch/x86/kernel/kgdb.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/arch/x86/kernel/kgdb.c b/arch/x86/kernel/kgdb.c
> index 64c332151af7..585a7a72af74 100644
> --- a/arch/x86/kernel/kgdb.c
> +++ b/arch/x86/kernel/kgdb.c
> @@ -723,7 +723,31 @@ void kgdb_arch_exit(void)
>  int kgdb_skipexception(int exception, struct pt_regs *regs)

Btw, kgdb_skipexception() is a gross nisnomer because it rewinds the
instruction pointer to the exception address and does not skip anything,
but that's an orthogonal issue though it could be cleaned up along the
way...

>  {
>  	if (exception == 3 && kgdb_isremovedbreak(regs->ip - 1)) {
> +		struct kgdb_bkpt *bpt;
> +		int i, error;
> +
>  		regs->ip -= 1;
> +
> +		/*
> +		 * Try to remove the spurious int3 instruction.
> +		 * These int3s can result from failed breakpoint removals
> +		 * in kgdb_arch_remove_breakpoint.
> +		 */
> +		for (bpt = NULL, i = 0; i < KGDB_MAX_BREAKPOINTS; i++) {
> +			if (kgdb_break[i].bpt_addr == regs->ip &&
> +			    kgdb_break[i].state == BP_REMOVED &&
> +			    (kgdb_break[i].type == BP_BREAKPOINT ||
> +			     kgdb_break[i].type == BP_POKE_BREAKPOINT)) {
> +				bpt = &kgdb_break[i];
> +				break;
> +			}
> +		}

Seriously? The KGBD core already walked that array in
kgdb_isremovedbreak() just so you can walk it again here.

struct kkgdb_bkpt *kgdb_get_removed_breakpoint(unsigned long addr)
{
        struct kgdb_bkpt *bp = kgdb_break;
       
	for (int i = 0; i < KGDB_MAX_BREAKPOINTS; i++, bp++) {
		if (bp>.state == BP_REMOVED && bp->kgdb_bpt_addr == addr)
			return bp;
	}
	return NULL;
}

bool kgdb_isremovedbreak(unsigned long addr)
{
        return !!kgdb_get_removed_breakpoint(addr);
}

bool kgdb_rewind_exception(int exception, struct pt_regs *regs)
{
        struct kgdb_bkpt *bp;

	if (exception != 3)
        	return false;

        bp = kgdb_get_removed_breakpoint(--regs->ip);
        if (!bp || !bp->type == BP_BREAKPOINT)
        	return false;

Hmm?

> +		error = kgdb_arch_remove_breakpoint(bpt);
> +		if (error)
> +			pr_err("skipexception: breakpoint remove failed: %lx\n",
> +			       bpt->bpt_addr);

Lacks curly brackets. See Documentation.

	return !error;

Aside of that the same problem exists on PowerPC. So you can move the
attempt to remove the breakpoint into the generic code, no?

Thanks,

        tglx




_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
