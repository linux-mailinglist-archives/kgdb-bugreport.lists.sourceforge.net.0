Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 028DC94F76C
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 12 Aug 2024 21:19:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sdaZm-0008B5-Pu
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 12 Aug 2024 19:19:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tglx@linutronix.de>) id 1sdaZl-0008Ar-8a
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 12 Aug 2024 19:19:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VKheiafekWqvzoP2A7I39jBITIJIx9AtOzfe+CfzLkM=; b=hQFbN9eNBpSGEIMMIXoJg1aK2b
 bYa2rlzJjjBb7YlvCY3G1ChYr4awqpIpAKdjzYKUjmt2FrzV5ST7Zb9w7PfJeKjofMKGPF0lFfIL8
 heYVLeqLtnfLnCTK0BKZtEdcE135ps8nxMYGsMAmSww8/kVLc0qnUMD4cvsWUPLGz6q4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VKheiafekWqvzoP2A7I39jBITIJIx9AtOzfe+CfzLkM=; b=UkSbuKQkBIPhi63KJwnBr0Vt40
 FR2Sw9uDeEC9qGdEU9fDRm7JpeoMcu7/5quXLy7NMfqO0TPlyaQhCg+P2ufYAXot7/zCOP0PAw6+c
 X3dEPbaPz1svlChsToeSbvNHAraLur5Ki7HmEAGWcww1NtQExXPSjUC7yADr02/k4uAo=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sdaZk-0006xn-9a for kgdb-bugreport@lists.sourceforge.net;
 Mon, 12 Aug 2024 19:19:29 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1723488857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VKheiafekWqvzoP2A7I39jBITIJIx9AtOzfe+CfzLkM=;
 b=p6phT4ey6VI7q581GMc/Y+nbmHWnGiquvMhljM7kArCxXMcI9E9e+h0XKJGU2Ndje5CtPW
 kEwz0+1jy3wMuFUrfsXqQT0BwHoP/FHNIfLUC3YoloCZ49qovlPcjh9vbYVVaBd8xvyiAb
 GlNYl1f5LO6zq3ZgtN9Nq9fnrwbhQsUOOuNvVqh0Yicgr0+0n6HbiTZSzPKFIW37/BuwX6
 ibkV1IHJrkbRR+mV8Ds9T5C874393ocyR5BuRA+C1TiL/4+Ml1a1R8TI0gSau/3lChyLoF
 pDNXcI8T/YtJK+Zz9B+QdmkqzX/lWIXHeVeaUYdr5pog2lMeRPEL+/7YYaP26Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1723488857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VKheiafekWqvzoP2A7I39jBITIJIx9AtOzfe+CfzLkM=;
 b=aFwpJmNcv0ZZdM9D4PyHkp2DwcHyMDn4tU9LWRe6Th1fLNYvURcB+uYKCcZXyHVkqPc099
 J4LN8cM746kHbkAw==
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
In-Reply-To: <20240812174338.363838-2-mail@florommel.de>
References: <20240812174338.363838-1-mail@florommel.de>
 <20240812174338.363838-2-mail@florommel.de>
Date: Mon, 12 Aug 2024 20:54:16 +0200
Message-ID: <874j7pshbb.ffs@tglx>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Florian! On Mon, Aug 12 2024 at 19:43, Florian Rommel wrote:
 > On x86, after booting, the kernel text is read-only. Then, KGDB has to
 > use the text_poke mechanism to install software breakpoints. KGDB > uses
 [...] Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [193.142.43.55 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linutronix.de]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sdaZk-0006xn-9a
Subject: Re: [Kgdb-bugreport] [PATCH v2 1/2] x86/kgdb: convert early
 breakpoints to poke breakpoints
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
> On x86, after booting, the kernel text is read-only.  Then, KGDB has to
> use the text_poke mechanism to install software breakpoints.  KGDB
> uses a special (x86-specific) breakpoint type for these kinds of
> breakpoints (BP_POKE_BREAKPOINT).  When removing a breakpoint, KGDB
> always adheres to the breakpoint's original installment method, which is
> determined by its type.
>
> Before this fix, early (non-"poke") breakpoints could not be removed
> after the kernel text was set as read-only since the original code
> patching mechanism was no longer allowed to remove the breakpoints.
> Eventually, this even caused the kernel to hang (loop between int3
> instruction and the function kgdb_skipexception).
>
> With this patch, we convert early breakpoints to "poke" breakpoints
> after the kernel text has been made read-only.  This makes them
> removable later.

Please check Documentation/process/ including maintainers.tip for change
log rules.

But aside of that why having this BP_TYPE dance in the first place?

kgdb_arch_set_breakpoint(...)
{
        if (system_state == SYSTEM_BOOTING) {
        	text_poke_early(...);
                return;
        }
        if (mutex_is_locked(&text_mutex))
        	return -EBUSY;
	text_poke_kgdb(...);
}

See? No breakpoint type, no magic post readonly fixup, nothing.

Similar for arch_remove_breakpoint(). I reply to that gem on the other
patch.

Thanks,

        tglx


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
