Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A87F49C6F9
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 26 Jan 2022 11:00:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nCf64-0003lY-B4
	for lists+kgdb-bugreport@lfdr.de; Wed, 26 Jan 2022 10:00:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mcgrof@infradead.org>) id 1nCT5F-0004d9-LJ
 for kgdb-bugreport@lists.sourceforge.net; Tue, 25 Jan 2022 21:10:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9sBIA+4FUEiJsQc79gzBYm8TOBmdFpT74KXdSSubq6E=; b=U1KU9m72pb7DaQrUUEpvbw/2X
 hNs8Wl9erWKqnThhy9AiOLxcuLtP4Jw8D6S70vc3AX6UCHEsfDeNbFR/9EytB4AbZfoD2I2tnB6Eg
 Xiuz6vr8NFmRJZEuSPfbqOACwS4rRomI85EEcJ7NBveSe5BpUAzBu+DzA51PJCEDxOv1I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9sBIA+4FUEiJsQc79gzBYm8TOBmdFpT74KXdSSubq6E=; b=K898SwStRxwSsV/p51ofHugsZ5
 usIx6GkHLWvPsuh93JeNWSRAQr3Dh7zmQzjLRRH5xKKLsZ/EPhaNP01oqC7z9xs9+HWO41uYzmbWh
 YdaSeBmWsvovd6e0cwDjw6S/p/rG1YDMPBUlMDCyLQ6RUzFrRg2OSFX524+4gFP3svVc=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1nCT59-0004Bg-5l
 for kgdb-bugreport@lists.sourceforge.net; Tue, 25 Jan 2022 21:10:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=9sBIA+4FUEiJsQc79gzBYm8TOBmdFpT74KXdSSubq6E=; b=eSKbIlnsv6RWgx7nwqgpkPqt5q
 EeCKatmP3k8DXITTemQLP53mSBz51qcd/VQGIhMSObhR+bTW5Cj8VBAXKYwj2Lil106cEWpZw88L5
 +VhQL/T1F4csdtkaIllFtvH3ArdQr7c4PoGbqaIhGAfeWq2WmnYyVpaPy8AjAzIvTGt65X/nxKURK
 ILINrwlO+ff2g782ZKFNBQPDrt2Zn6A5rwafsEW3/ImsPmPhBxFpMZIjNpgQnXxed6MX6D9hAABLV
 86OBLVcWGuI5Uf68fz1pNxiLkn30JJ+zWGrL+0m5BMhMRpysm1FMtgSq4nkKQDLiF9ZhIviZ3vNhP
 SiSkuCfg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1nCT4w-009ZLT-9v; Tue, 25 Jan 2022 21:10:14 +0000
Date: Tue, 25 Jan 2022 13:10:14 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <YfBnNuXpR2l2AuCP@bombadil.infradead.org>
References: <cover.1643015752.git.christophe.leroy@csgroup.eu>
 <848d857871f457f4df37e80fad468d615b237c24.1643015752.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <848d857871f457f4df37e80fad468d615b237c24.1643015752.git.christophe.leroy@csgroup.eu>
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 24, 2022 at 09:22:34AM +0000, Christophe Leroy
 wrote: > This can also be useful on other powerpc/32 in order to maximize
 the > chance of code being close enough to kernel core to avoid bra [...]
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1nCT59-0004Bg-5l
X-Mailman-Approved-At: Wed, 26 Jan 2022 10:00:09 +0000
Subject: Re: [Kgdb-bugreport] [PATCH 6/7] modules: Add
 CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>,
 Jason Wessel <jason.wessel@windriver.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jessica Yu <jeyu@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Jan 24, 2022 at 09:22:34AM +0000, Christophe Leroy wrote:
> This can also be useful on other powerpc/32 in order to maximize the
> chance of code being close enough to kernel core to avoid branch
> trampolines.

Curious about all this branch trampoline talk. Do you have data to show
negative impact with things as-is?

Also, was powerpc/32 broken then without this? The commit log seems to
suggest so, but I don't think that's the case. How was this issue noticed?

Are there other future CPU families being planned where this is all true for
as well? Are they goin to be 32-bit as well?

  Luis


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
