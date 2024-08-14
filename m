Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E2E95110E
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 14 Aug 2024 02:33:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1se1xM-0004cv-Rq
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 14 Aug 2024 00:33:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mail@florommel.de>) id 1se1xK-0004cn-PF
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 14 Aug 2024 00:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+Ycj0yGxUE2XPlmp3FEdF3w2hLPJnIihR4vsD0HmzrU=; b=SO8d+SPFyP9BtmsJR8lLGN/adI
 I8r2ySy7+0+XWSUrBSBplmXTzMyS5Yu3pxgkNk4UvpTlvsoyR+BN/a/kqJyyeEENxwjVLr6806vp+
 1GpmdCymbRB6zJurfa+atzKr+SPXZoxNxJhktVFevkBlK0JLdwrNzjDMT4sBGiet+X6Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+Ycj0yGxUE2XPlmp3FEdF3w2hLPJnIihR4vsD0HmzrU=; b=H96FENB+AagBVAah04DSGBxS6z
 LPdh/IM09PjJmi/Euec46Y1tHN2kDrYxh20P/vGeepVuZjICnPEsi6m2gyZZlbcraErJjZ9ZZ4rhQ
 LGi1/h/ObdM0y0XHGK9R2aEILtlWX+V2pGN/BxrminJoG1FbY2k/JJZaADUqW4yCvQWc=;
Received: from read.uberspace.de ([185.26.156.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1se1xI-0006ne-Oo for kgdb-bugreport@lists.sourceforge.net;
 Wed, 14 Aug 2024 00:33:38 +0000
Received: (qmail 6617 invoked by uid 990); 14 Aug 2024 00:33:29 -0000
Authentication-Results: read.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
 by read.uberspace.de (Haraka/3.0.1) with ESMTPSA;
 Wed, 14 Aug 2024 02:33:29 +0200
Message-ID: <d5c8fdfbdfa096c9c1215a2ccd1cabefc63f1ec8.camel@florommel.de>
From: Florian Rommel <mail@florommel.de>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Wed, 14 Aug 2024 02:33:29 +0200
In-Reply-To: <20240813171055.f8805c1db539dfa18e80026b@linux-foundation.org>
References: <20240811232208.234261-1-mail@florommel.de>
 <20240813171055.f8805c1db539dfa18e80026b@linux-foundation.org>
User-Agent: Evolution 3.52.4 
MIME-Version: 1.0
X-Rspamd-Bar: +
X-Rspamd-Report: SUSPICIOUS_RECIPS(1.5) BAYES_HAM(-0.138129) MIME_GOOD(-0.1)
X-Rspamd-Score: 1.26187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=florommel.de; s=uberspace; h=from:to:cc:subject:date;
 bh=mZxBMSBOXUjPtNMzQYsC/w4amo62xoxfgDzla/4sRKo=;
 b=gRFugSD/tFere1sDgEeavx+9foLS7dCf39ZuQyBbk24KBMq0GPAaDRviGhNNPNOf/tmQR8NVBS
 yEPWObIrPYUHPIwSBkTG6qi7uEg9/sGe5nCNsPCg5+EMypljVKsHiLU1tExSECKFDv5DMOHVB/Gj
 xV712O5dIx1V9i86TrdMDqw+z+Fg2P0Lgib740/zYXAC/LDSquElO2jaZMaPo9xhW3WMAkkHxFUG
 3zFRVtkJxlUhUYDrv/l3Vlt+xE0TLoCZtxepeV8+wUJH/JvaM+jisIG2Hcfp26CGAatyQ2fD3KGy
 DBf951Q5cTmuh+EZKOya/Oc4WH4Vuy4RS/8VqRYFybcOY9aJWSqNn7X8lY9jdi06bwBstMDJ22Fb
 i7KKLjfHKujr6MwkTaIWSCDrDkKKsc6iJ30/wZpDtYfpmEhoHr6k/jiWdeNL06ekJ/EJwFmNkyO8
 CpVkPPYipmzVJczFD2EDfNt3VKjGFe6s27dGRsutnGMNcVaRg/iTf3FM8sqlCZsta7KZ3Am7lSzt
 AW1E6DFHBsHIL2MLCTnow+n9lH3HAB6nP0U9dAiqOZgCwO8Kb5QDMsVBbtPRPIjAJH4WmisHz4d+
 IdkBh0+P9JuJ5t/gIS/eNGUAPy5b5s1d8dzMAX7VOJUaD8Kfe6wsOhcpGmCtmvOIKw4aEieg10gZ
 o=
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, 2024-08-13 at 17:10 -0700, Andrew Morton wrote: >
 On Mon, 12 Aug 2024 01:22:06 +0200 Florian Rommel <mail@florommel.de> wrote:
 > > > This series fixes two problems with KGDB on x86 concerning [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
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
X-Headers-End: 1se1xI-0006ne-Oo
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

On Tue, 2024-08-13 at 17:10 -0700, Andrew Morton wrote:
> On Mon, 12 Aug 2024 01:22:06 +0200 Florian Rommel <mail@florommel.de> wrote:
> 
> > This series fixes two problems with KGDB on x86 concerning the removal
> > of breakpoints, causing the kernel to hang.  Note that breakpoint
> > removal is not only performed when explicitly deleting a breakpoint,
> > but also happens before continuing execution or single stepping.
> 
> Neat.  It would be nice to fix earlier kernels; for that it is
> desirable to identify a Fixes: target.  From a quick look it appears
> this issue is more than a decade old, in which case I don't believe a
> Fixes: is needed - our request becomes "please backport to everything".
> 

Thanks. There is already a v2 (due to my negligence on the details) and
a bit of discussion:
https://lore.kernel.org/all/20240812174338.363838-1-mail@florommel.de/

Rgeards,
Florian



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
