Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCC0951107
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 14 Aug 2024 02:28:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1se1sm-0007gM-9U
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 14 Aug 2024 00:28:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <akpm@linux-foundation.org>) id 1se1sl-0007gE-Ey
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 14 Aug 2024 00:28:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version
 :References:In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YsebQo1cZKRplbBhc9NTORJ9iC9DHFnOV4ie7i5c6FQ=; b=OsSSpmSijqT7hFTxRFGXYFzPTi
 dP+8RiP12wO9MXOTSvv8tMF4m0vJC3Ou7LzmbkgEwj0skyYpS2HcNdyhlOyWHcrEfYCnAlSCOUomc
 oQnhN4QpH7t8NMW0bIOhCJ1CBA5Hy3H21lWa+Nbg0g4k00RXHz8c5udQByZYLvm8cDPE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YsebQo1cZKRplbBhc9NTORJ9iC9DHFnOV4ie7i5c6FQ=; b=bS9T5fBEsA1JUBxKK4o9ARTDmb
 VZiTNFoYWFiFVlpjSesk6w4YbAah+o9olLQcDIqg1Qdx3LTZA4nX029M9fV3m/2Jah/h8d5JPYRPu
 0XFp2+MYSsF1SKssfftBelf4Kgjz03BW34lXBRo4pSNbVU/wab6URoAeVuW3SLD4cpqA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1se1sl-0006ZG-Gu for kgdb-bugreport@lists.sourceforge.net;
 Wed, 14 Aug 2024 00:28:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3E1E2618DB;
 Wed, 14 Aug 2024 00:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5883BC32782;
 Wed, 14 Aug 2024 00:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1723594256;
 bh=c7r5OUmvaJQiZogtT5yLK0btcxbn7sNq/ZTe8Wov/6c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IHoY/9ZrpQJOK/DT41cyEvhebsBWlOij3Ygq4bBZKodxAgT6oUW2b/vDDa6zk8qOu
 fpQPKjnhIQqiK1cGtDaHVQkhmBjQ5foFuCgAj3UTUFsQED4ojiCah5e3uI7salS6O9
 Jw0iF3qWL7RATbT07B0ik4z4oV4DCHcA79KmX8fE=
Date: Tue, 13 Aug 2024 17:10:55 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Florian Rommel <mail@florommel.de>
Message-Id: <20240813171055.f8805c1db539dfa18e80026b@linux-foundation.org>
In-Reply-To: <20240811232208.234261-1-mail@florommel.de>
References: <20240811232208.234261-1-mail@florommel.de>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon,
 12 Aug 2024 01:22:06 +0200 Florian Rommel <mail@florommel.de>
 wrote: > This series fixes two problems with KGDB on x86 concerning the
 removal
 > of breakpoints, causing the kernel to hang. Note that breakpoint > removal
 is not only performed when explicitly deleting a b [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux-foundation.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.3 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1se1sl-0006ZG-Gu
Subject: Re: [Kgdb-bugreport] [PATCH 0/2] kgdb: x86: fix breakpoint removal
 problems
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
 Thomas Gleixner <tglx@linutronix.de>, Stefan Saecherl <stefan.saecherl@fau.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, 12 Aug 2024 01:22:06 +0200 Florian Rommel <mail@florommel.de> wrote:

> This series fixes two problems with KGDB on x86 concerning the removal
> of breakpoints, causing the kernel to hang.  Note that breakpoint
> removal is not only performed when explicitly deleting a breakpoint,
> but also happens before continuing execution or single stepping.

Neat.  It would be nice to fix earlier kernels; for that it is
desirable to identify a Fixes: target.  From a quick look it appears
this issue is more than a decade old, in which case I don't believe a
Fixes: is needed - our request becomes "please backport to everything".



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
