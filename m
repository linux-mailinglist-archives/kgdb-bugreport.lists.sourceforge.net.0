Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA604A7BC3
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  3 Feb 2022 00:34:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nFP90-00056B-W1
	for lists+kgdb-bugreport@lfdr.de; Wed, 02 Feb 2022 23:34:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mcgrof@infradead.org>) id 1nFP8z-000565-Fp
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Feb 2022 23:34:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jh/EL1diuD4J1JZYZhhqdPKhDKb1uRzo1pLWpqiNQQs=; b=FGB6g+bxBXiCCf8cM4JsTj9V68
 UutB8MPg3D2VRsqc7ZjMpxX9mIGEJUbiYKz3sA6bDl3J6YXsf0RIRAT6DBu9x3GXcthAnDX2IfhLR
 BF1rpTJElvV7FQKq/ERJ0WwPzaqc7Yk3BI3yPnDeNyCQXsBpN7tS+XDlo1Aij88FotwY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Jh/EL1diuD4J1JZYZhhqdPKhDKb1uRzo1pLWpqiNQQs=; b=OHZ4BH+6jdXy8WRbMCOyUZsn+u
 YAEG0ZMSp7C+rbtcE24nH9vx0Y0JAnbpq91dNlMRkCr3BpsLWvDc0gl6olq5mgvxveaDP3+JEy5k6
 QTczLLjsW4XXWPVT2/PkXWgQTPGG9my1+m5OPLyZNQwz8I/CkDgxrIpLdetjcrEJ5j2o=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nFP8w-00E55S-5a
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Feb 2022 23:34:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description;
 bh=Jh/EL1diuD4J1JZYZhhqdPKhDKb1uRzo1pLWpqiNQQs=; b=bbPsm2Rw+E4ZQJ3Gw3fUrZTGnO
 k4tL7MeTqglU0jb/1hlbW+xa+BanJ470QCRr4yvg9ENXOU2gryoa8LYF82kJSVm7rsgG66ol4IQIB
 4/NUNG9bTcqBoUNlRLR79ulXI5LQ8DO9tyJXr2y/Fv9KrPLoBlvZA1cDIJzUHMsFE1Fey8aLqAfOf
 VTd/zevfqWmzF29UOcxH+pTAcxesxVHVrFq84jSfiqdsVaDkC7y8br5ZVE6/lkN20W8qroOQ3Ky4N
 jJcXiP+owiRm5ttbkmMnRJD/ijuNsP/Yey+trKKLUNXCQgLLs692qSL3uR1aCH1A4SvHMLK+Dystg
 kSCXI3vw==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1nFP8h-00H4m1-Uf; Wed, 02 Feb 2022 23:34:15 +0000
Date: Wed, 2 Feb 2022 15:34:15 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <YfsU9wuMKr4awYce@bombadil.infradead.org>
References: <cover.1643015752.git.christophe.leroy@csgroup.eu>
 <848d857871f457f4df37e80fad468d615b237c24.1643015752.git.christophe.leroy@csgroup.eu>
 <YfBnNuXpR2l2AuCP@bombadil.infradead.org>
 <b49235ef-1fc3-7b8f-7e23-79f461d83e18@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b49235ef-1fc3-7b8f-7e23-79f461d83e18@csgroup.eu>
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Wed, Jan 26, 2022 at 06:38:30AM +0000, Christophe Leroy
    wrote: > > > Le 25/01/2022 à 22:10, Luis Chamberlain a écrit : > > On Mon,
    Jan 24, 2022 at 09:22:34AM +0000, Christophe Leroy wrote: > >> Thi [...] 
 
 Content analysis details:   (-2.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [198.137.202.133 listed in list.dnswl.org]
  0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
                             mail domains are different
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1nFP8w-00E55S-5a
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Jan 26, 2022 at 06:38:30AM +0000, Christophe Leroy wrote:
> =

> =

> Le 25/01/2022 =E0 22:10, Luis Chamberlain a =E9crit=A0:
> > On Mon, Jan 24, 2022 at 09:22:34AM +0000, Christophe Leroy wrote:
> >> This can also be useful on other powerpc/32 in order to maximize the
> >> chance of code being close enough to kernel core to avoid branch
> >> trampolines.
> > =

> > Curious about all this branch trampoline talk. Do you have data to show
> > negative impact with things as-is?
> =

> See =

> https://github.com/linuxppc/linux/commit/2ec13df167040cd153c25c4d96d0ffc5=
73ac4c40
> =

> Or =

> https://github.com/linuxppc/linux/commit/7d485f647c1f4a6976264c90447fb0db=
f07b111d


This was useful and fun to read, thanks.

> > Also, was powerpc/32 broken then without this? The commit log seems to
> > suggest so, but I don't think that's the case. How was this issue notic=
ed?
> =

> =

> Your question is related to the trampoline topic or the exec/noexec =

> flagging ?
> =

> Regarding trampoline, everything is working OK. That's just cherry on =

> the cake, when putting data away you can have more code closer to the =

> kernel. But that would not have been a reason in itself for this series.
> =

> Regarding the exec/noexec discussion, it's a real issue. powerpc/32 =

> doesn't honor page exec flag, so when you select STRICT_MODULES_RWX and =

> flag module data as no-exec, it remains executable. That's because =

> powerpc/32 MMU doesn't have a per page exec flag but only a per =

> 256Mbytes segment exec flag.
> =

> Typical PPC32 layount:
> 0xf0000000-0xffffffff : VMALLOC AREA =3D=3D> NO EXEC
> 0xc0000000-0xefffffff : Linear kernel memory mapping
> 0xb0000000-0xbfffffff : MODULES AREA =3D=3D> EXEC
> 0x00000000-0xafffffff : User space =3D=3D> EXEC
> =

> So STRICT_MODULES_RWX is broken on some powerpc/32

You know, this is the sort of information that I think would be
very useful for the commit log. Can you ammend?

> > =

> > Are there other future CPU families being planned where this is all tru=
e for
> > as well? Are they goin to be 32-bit as well?
> =

> Future I don't know.
> =

> Regarding the trampoline stuff, I see at least the following existing =

> architectures with a similar constraint:
> =

> ARM:
> =

> https://elixir.bootlin.com/linux/v5.16/source/arch/arm/include/asm/memory=
.h#L55
> =

> ARM even has a config item to allow trampolines or not. I might add the =

> same to powerpc to reduce number of pages used by modules.
> =

> https://elixir.bootlin.com/linux/v5.16/source/arch/arm/Kconfig#L1514
> =

> NDS32 has the constraint
> =

> https://elixir.bootlin.com/linux/v5.16/source/arch/nds32/include/asm/memo=
ry.h#L41
> =

> NIOS2 has the constraint, allthough they handled it in a different way:
> =

> https://elixir.bootlin.com/linux/v5.16/source/arch/nios2/kernel/module.c#=
L30
> =

> =

> =

> Even ARM64 benefits from modules closer to kernel:
> =

> https://elixir.bootlin.com/linux/v5.16/source/arch/arm64/Kconfig#L1848
> =

> =

> Another future opportunity with the ability to allocate module parts =

> separately is the possibility to then use huge vmalloc mappings.
> =

> Today huge vmalloc mappings cannot be used for modules, see recent =

> discussion at =

> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20211227145903.18=
7152-4-wangkefeng.wang@huawei.com/

Alrighty, this is sufficient information, thanks!

  Luis


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
