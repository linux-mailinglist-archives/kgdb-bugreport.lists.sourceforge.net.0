Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D814A7F32
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  3 Feb 2022 06:57:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nFV7g-0004YT-Uu
	for lists+kgdb-bugreport@lfdr.de; Thu, 03 Feb 2022 05:57:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mpe@ellerman.id.au>) id 1nFV7g-0004YN-AI
 for kgdb-bugreport@lists.sourceforge.net; Thu, 03 Feb 2022 05:57:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5ypoksyewD1/1A0wIikcTAQpbuRBIVCFLpLku2DM1UQ=; b=dLVOYu9QfCxcCL2DPrt0nuLaN7
 j8vhRxMtKbxUtn8M2edzgq8owe9P8DiYt72zPt5eQXpvTTvX6eM07qgOSQYmfLjCw5UOjaJifKYhH
 L4tZRcfRuI0h8P9GshKc/H1Wfpq2YkMGqxLZCXSz5Ws2su0PhOa8O3Zx2i799/eI8n7s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5ypoksyewD1/1A0wIikcTAQpbuRBIVCFLpLku2DM1UQ=; b=MMlCappUOOY/OWdaj/0P9CpfxF
 Nv7IQ8Rm/vE98NWojk0CYnsvzfwg8v2kx2UWygSh3lk6nf2e5E8a1g3mHkeb7Nq2+g3oNVRS81H7E
 sLJWR1s17VBjbQKVU+3SeWcCS61G95PlfSkvs1DAlPLI+Osvo0yFd9yWvRz8yolqz9tg=;
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nFV7Y-00EQLc-QY
 for kgdb-bugreport@lists.sourceforge.net; Thu, 03 Feb 2022 05:57:34 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Jq6sz71xZz4xmk;
 Thu,  3 Feb 2022 16:39:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1643866745;
 bh=5ypoksyewD1/1A0wIikcTAQpbuRBIVCFLpLku2DM1UQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=rMj6cjmEUS8Wn69koaMHGmWtpyj6ZO2nAuoyXA+oWiHfj2yhSyVXHPcjxkz5zmpZD
 WdOsbHhM5IN8Sxx+y5AE3lyjCEc+r5KfaNZza81P6gEszI/6eIqJvUMkHlMNrCqRMu
 MD3TSoNfM8O0TEuisU+c7WgVCaJ0RpIOaxUzrqSEcepCdb37tklQLk/xwJqw3N68Zc
 ulZFnLmU1XaXdjsexrU4b+S2Ms2cXvBTRrkylee8pfYCCllBETW7Tbn5AerQ5uFqCQ
 6bgj65lt4gPCXOpWLgub/FKbqZZkFeTJz7NSunJt46xMtkybfJYQqzJUkDijOk7idk
 3YDBVgFFETn3w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Luis Chamberlain <mcgrof@kernel.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
In-Reply-To: <YfsVhcpVTW0+YCl5@bombadil.infradead.org>
References: <cover.1643282353.git.christophe.leroy@csgroup.eu>
 <a20285472ad0a0a13a1d93c4707180be5b4fa092.1643282353.git.christophe.leroy@csgroup.eu>
 <YfsVhcpVTW0+YCl5@bombadil.infradead.org>
Date: Thu, 03 Feb 2022 16:39:02 +1100
Message-ID: <87h79gmrux.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Luis Chamberlain <mcgrof@kernel.org> writes: > On Thu, Jan
 27, 2022 at 11:28:12AM +0000, Christophe Leroy wrote: >> book3s/32 and 8xx
 have a separate area for allocating modules, >> defined by MODULES [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nFV7Y-00EQLc-QY
Subject: Re: [Kgdb-bugreport] [PATCH v2 5/5] powerpc: Select
 ARCH_WANTS_MODULES_DATA_IN_VMALLOC on book3s/32 and 8xx
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
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 "kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 Jessica Yu <jeyu@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Luis Chamberlain <mcgrof@kernel.org> writes:
> On Thu, Jan 27, 2022 at 11:28:12AM +0000, Christophe Leroy wrote:
>> book3s/32 and 8xx have a separate area for allocating modules,
>> defined by MODULES_VADDR / MODULES_END.
>> 
>> On book3s/32, it is not possible to protect against execution
>> on a page basis. A full 256M segment is either Exec or NoExec.
>> The module area is in an Exec segment while vmalloc area is
>> in a NoExec segment.
>> 
>> In order to protect module data against execution, select
>> ARCH_WANTS_MODULES_DATA_IN_VMALLOC.
>> 
>> For the 8xx (and possibly other 32 bits platform in the future),
>> there is no such constraint on Exec/NoExec protection, however
>> there is a critical distance between kernel functions and callers
>> that needs to remain below 32Mbytes in order to avoid costly
>> trampolines. By allocating data outside of module area, we
>> increase the chance for module text to remain within acceptable
>> distance from kernel core text.
>> 
>> So select ARCH_WANTS_MODULES_DATA_IN_VMALLOC for 8xx as well.
>> 
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> Cc: Paul Mackerras <paulus@samba.org>
>
> Cc list first and then the SOB.

Just delete the Cc: list, it's meaningless.

cheers


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
