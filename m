Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD0B4AF736
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  9 Feb 2022 17:50:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nHqAZ-00038G-2b
	for lists+kgdb-bugreport@lfdr.de; Wed, 09 Feb 2022 16:50:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mbenes@suse.cz>) id 1nHp7e-0008F8-Bx
 for kgdb-bugreport@lists.sourceforge.net; Wed, 09 Feb 2022 15:43:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:Message-ID:
 In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cPanT84froBQDy0fnPPljPjc/sJJc6UFVNaQtZQNyJo=; b=RIdNV5KKzcmWuo8ChVlcNJ4eD4
 8NyMBuzwgSgou9sAAzT1VyAJDmKiVCUw04De9ibKC7f5dsxlwWNaZt448tI96HDZOTuodmM84/7Cs
 MPwaLoK3miqYY72BysPNJyOsVRcExbMA8Bt+lY7c5Oporqw/9y6mNK1DIsoLRhEQYE/M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:Message-ID:In-Reply-To:Subject:cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cPanT84froBQDy0fnPPljPjc/sJJc6UFVNaQtZQNyJo=; b=ZNhZy+TU/83+63eLNM1Ko38wDD
 z/TGa+tSXIvIH1TPESFO9Va9lC3af+j9GMa4lom5MWvYh7khrk/MD3l5bbEC1i6HAO8eAphF3sp89
 MIUAFdotWccTAOmEGy6iTuM8mTmpz4sAu143eAc7+8UH4HAECjcQK35ECpJ6dOJ9srSU=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nHp7Y-00BnKO-Td
 for kgdb-bugreport@lists.sourceforge.net; Wed, 09 Feb 2022 15:43:08 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 7205821106;
 Wed,  9 Feb 2022 15:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1644421375; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cPanT84froBQDy0fnPPljPjc/sJJc6UFVNaQtZQNyJo=;
 b=SdlN6/o0bkHJLdF7/rqstxANEqRu2FGQdADvtFm36FXgWN7qy8cv5E9FmMIqemtYqj5JCx
 jcFKtYvkxRDAXyWddaU5BJQjRCKUXa8uB96+IfTENqG3s4IjsNq2JfIo9n1aVAoh4vUxkN
 ye8z9cU4lRKUrZHOL79VeCmsS2uUcBg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1644421375;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cPanT84froBQDy0fnPPljPjc/sJJc6UFVNaQtZQNyJo=;
 b=0X+aVbHtAO76L1P2h7Y2RgH4e7i5tXnnZmX6Tcr6MKy1WuACuL/CGsKG7z3DXWtcr4kHZJ
 FFE4oGuZFBJRVUCA==
Received: from pobox.suse.cz (pobox.suse.cz [10.100.2.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 5BFF8A3B88;
 Wed,  9 Feb 2022 15:42:55 +0000 (UTC)
Date: Wed, 9 Feb 2022 16:42:55 +0100 (CET)
From: Miroslav Benes <mbenes@suse.cz>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1643282353.git.christophe.leroy@csgroup.eu>
Message-ID: <alpine.LSU.2.21.2202091639491.32090@pobox.suse.cz>
References: <cover.1643282353.git.christophe.leroy@csgroup.eu>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 27 Jan 2022, Christophe Leroy wrote: > This series
 allow architectures to request having modules data in > vmalloc area instead
 of module area. > > This is required on powerpc book3s/32 in order to set
 data non > executable, because it i [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [195.135.220.28 listed in list.dnswl.org]
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
X-Headers-End: 1nHp7Y-00BnKO-Td
X-Mailman-Approved-At: Wed, 09 Feb 2022 16:50:12 +0000
Subject: Re: [Kgdb-bugreport] [PATCH v2 0/5] Allocate module text and data
 separately
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
 "kgdb-bugreport@lists.sourceforge.net"
 <kgdb-bugreport@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, 27 Jan 2022, Christophe Leroy wrote:

> This series allow architectures to request having modules data in
> vmalloc area instead of module area.
> 
> This is required on powerpc book3s/32 in order to set data non
> executable, because it is not possible to set executability on page
> basis, this is done per 256 Mbytes segments. The module area has exec
> right, vmalloc area has noexec. Without this change module data
> remains executable regardless of CONFIG_STRICT_MODULES_RWX.
> 
> This can also be useful on other powerpc/32 in order to maximize the
> chance of code being close enough to kernel core to avoid branch
> trampolines.
> 
> Changes in v2:
> - Dropped first two patches which are not necessary. They may be added back later as a follow-up series.
> - Fixed the printks in GDB
> 
> Christophe Leroy (5):
>   modules: Always have struct mod_tree_root
>   modules: Prepare for handling several RB trees
>   modules: Introduce data_layout
>   modules: Add CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
>   powerpc: Select ARCH_WANTS_MODULES_DATA_IN_VMALLOC on book3s/32 and
>     8xx
> 
>  arch/Kconfig                |   6 ++
>  arch/powerpc/Kconfig        |   1 +
>  include/linux/module.h      |   8 ++
>  kernel/debug/kdb/kdb_main.c |  10 +-
>  kernel/module.c             | 193 +++++++++++++++++++++++++-----------
>  5 files changed, 156 insertions(+), 62 deletions(-)

Looks good to me apart from the typo I mentioned at v1. I will review 
again once it is rebased on Aaron's patch set.

Regards,
Miroslav


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
