Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8F9951C43
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 14 Aug 2024 15:52:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1seEQm-0006kh-A1
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 14 Aug 2024 13:52:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tglx@linutronix.de>) id 1seEQk-0006kY-AA
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 14 Aug 2024 13:52:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p3lH/zrHs0dZEgDAAuKDMA+VDNtH0jYEhkmkzFIeHGM=; b=lxTaMGdoWvXza+zaed9YJERRiu
 RO936co9SG5RRjWa28jo1m8RhaP0gTj0J1T66ZAdl5gNuGWyaA7XFnIaoSs2agXQXJMcx6z3WJ7bk
 PsbTBh7cW96BSAo1CUvvQSPZ0yveMaaDIdLNyI82PiZH/BIvx/FQigP5lO9Uj8yjkH/w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=p3lH/zrHs0dZEgDAAuKDMA+VDNtH0jYEhkmkzFIeHGM=; b=BuQAoCRuFInSUF8v1CbXUT/8cA
 bHCkcWXiCl6mbheQnPON0hb3S4Nj+zThOpAYmDWr8dU1PxjZOkFk3PQc2HINL2kPffgQUCFwsk0QS
 vZktO5ip6clapE89UQ87KJk3ipGJ7H1XA4xRDEeaOKddJMQki8u57cRDkTK0FFwYN5pM=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1seEQj-0002Sb-Fe for kgdb-bugreport@lists.sourceforge.net;
 Wed, 14 Aug 2024 13:52:50 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1723643557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p3lH/zrHs0dZEgDAAuKDMA+VDNtH0jYEhkmkzFIeHGM=;
 b=WW4OID71h1exgfhXYQJkPer2JXYa9fFEtzzg/DYAHG7C2XTBoJc3OoiAhxthhUHlzXCHSi
 x7Sk1mXRJqpCDz3izZygQ56yErhOYy8k4gImTG4N1+JfNMduM9kQZYpzX8v+xCmlsL7IFr
 +XsiEnrYtvtPCswQN60nKz+kmcxiWqviT6GOaQIHZgZvBj39elj2VQgygdNprE7rgvsvZE
 BvQQ6U7UAwczfVMF6Vq+t08Fl4GJw54DJhd2DYVaJwANiIDDiOZ2b2pDgpBSjHKu3q08s4
 Jlku8Y0l2cwYWuBKbiDBdII7bTkGqOGzHRJzkCbtwbUaxpsfR8iOlnvaOIbf9A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1723643557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p3lH/zrHs0dZEgDAAuKDMA+VDNtH0jYEhkmkzFIeHGM=;
 b=i0MXXTrTgNyIZt6j6BIJmSszP+iQ+uS2rGFugQJwZq+rOSCN8qn78zDSnpflJ4P8c4CrZS
 CnzJGuXs5JSYirDw==
To: Daniel Thompson <daniel.thompson@linaro.org>, Florian Rommel
 <mail@florommel.de>
In-Reply-To: <20240814102940.GB6016@aspen.lan>
References: <87wmkkpf5v.ffs@tglx> <20240814085141.171564-1-mail@florommel.de>
 <20240814102940.GB6016@aspen.lan>
Date: Wed, 14 Aug 2024 15:52:36 +0200
Message-ID: <87zfpfnrdn.ffs@tglx>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Aug 14 2024 at 11:29, Daniel Thompson wrote: > On
 Wed, Aug 14, 2024 at 10:51:41AM +0200, Florian Rommel wrote: > That's enough
 to eventuallyremove the int3 instructions but it relies > on ente [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [193.142.43.55 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [193.142.43.55 listed in sa-trusted.bondedsender.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linutronix.de]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1seEQj-0002Sb-Fe
Subject: Re: [Kgdb-bugreport] [PATCH WIP] x86/kgdb: trampolines for shadowed
 instructions
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
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Andrew Morton <akpm@linux-foundation.org>,
 Stefan Saecherl <stefan.saecherl@fau.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Aug 14 2024 at 11:29, Daniel Thompson wrote:
> On Wed, Aug 14, 2024 at 10:51:41AM +0200, Florian Rommel wrote:
> That's enough to eventuallyremove the int3 instructions but it relies
> on entering the debug trap handler and there's no limit on how long
> could take before that happens. For that reason I think the core should
> also attempt to transition BP_REMOVE_PENDING breakpoints to BP_REMOVE
> after kgdb_skipexception() returns true. That means if we keep trapping
> on a disabled breakpoint eventually we will hit a window where the
> text_mutex is free and clean things up.

Even when text_mutex is uncontended then text_poke_kgdb() is completely
broken in the KGDB NMI context when the NMI hit into anything related to
mm switching and tlb flushing, which is utilized in __text_poke().

The same problem is obviously true for installing a breakpoint from that
context.

I'm starting to be more convinced that the only sane solution for all of
this is to disable CET when KGDB is on and use CRO.WP to work around all
of this.

Thanks,

        tglx







_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
