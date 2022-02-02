Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7460E4A7BC7
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  3 Feb 2022 00:36:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nFPBC-00058g-93
	for lists+kgdb-bugreport@lfdr.de; Wed, 02 Feb 2022 23:36:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mcgrof@infradead.org>) id 1nFPBA-00058Z-Kj
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Feb 2022 23:36:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sKMSro+nqi3+TRaInDh/r5jt9h3R6I+1JvbqLUuQ9zw=; b=AmnfjksDcTpOtFJHcIN+XUzFIB
 +kBvcsrDXDmqNYIHU2JMiJ1PsuQoXAasxVa/Ox353Sw/QN+py+tMzeKLVlaqy/++fwGZNPMF1pnWq
 KZBXoyqWpRm6UXyAK2xn87myc5Cd9h9+WdBA3yjB+69YGaWSu1r+Fi3/f/1Ev2+TwoeU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sKMSro+nqi3+TRaInDh/r5jt9h3R6I+1JvbqLUuQ9zw=; b=jeryERB8uIJPm+T8HIOFo/fbPV
 OHamKXfoTYi9D4+PrpvA6DtDE5XcHnNHLKJ23LC/8UiGmqwze5n9VAzAyoNVlIbO40dgdOK03xz0v
 B/6F+Mx/Ek+wTfbm8BRyVGkXgIgnIjj0gxdwOGMnf0o7lWvq1Z5F2yhftdNdn/X79p2s=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nFPB8-00E5C4-Pu
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Feb 2022 23:36:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=sKMSro+nqi3+TRaInDh/r5jt9h3R6I+1JvbqLUuQ9zw=; b=EQFB7AmHjcEOog2AgXpabrhNbq
 eb+nIuW++r278MsQm+yo6BJLgWEi7DgA0z/LlXygv3QszEhUFbTZTYEd7tnQF95I9q+HDvddpS0dr
 ZT4oOJqpMyq2CEFRDI9sNR/0008KH9VEFO6SEXb/UlghtmM1nhzbpJM/5gNt8d05BRv4D8tQ5GrZW
 fpzQ8SgxsTS6vdNOuRec1F/wQ5pWQ0g4+NAL2ajplTSo5BZ+1fnALWGrFPMSPAfHFWRnsxJ/WmIg1
 N3Sh1ZVZn6t5DVK/fZ6Xax5LywKa/tBa8o8JoZbW2WIGkbbwfyxz0e9MK78JgVYWCcygyNJY3ImiP
 uQFa5xkw==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1nFPAz-00H4rN-PB; Wed, 02 Feb 2022 23:36:37 +0000
Date: Wed, 2 Feb 2022 15:36:37 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <YfsVhcpVTW0+YCl5@bombadil.infradead.org>
References: <cover.1643282353.git.christophe.leroy@csgroup.eu>
 <a20285472ad0a0a13a1d93c4707180be5b4fa092.1643282353.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a20285472ad0a0a13a1d93c4707180be5b4fa092.1643282353.git.christophe.leroy@csgroup.eu>
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 27, 2022 at 11:28:12AM +0000, Christophe Leroy
 wrote: > book3s/32 and 8xx have a separate area for allocating modules, >
 defined by MODULES_VADDR / MODULES_END. > > On book3s/32, it is not [...]
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nFPB8-00E5C4-Pu
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
 Michael Ellerman <mpe@ellerman.id.au>, Jessica Yu <jeyu@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Jan 27, 2022 at 11:28:12AM +0000, Christophe Leroy wrote:
> book3s/32 and 8xx have a separate area for allocating modules,
> defined by MODULES_VADDR / MODULES_END.
> 
> On book3s/32, it is not possible to protect against execution
> on a page basis. A full 256M segment is either Exec or NoExec.
> The module area is in an Exec segment while vmalloc area is
> in a NoExec segment.
> 
> In order to protect module data against execution, select
> ARCH_WANTS_MODULES_DATA_IN_VMALLOC.
> 
> For the 8xx (and possibly other 32 bits platform in the future),
> there is no such constraint on Exec/NoExec protection, however
> there is a critical distance between kernel functions and callers
> that needs to remain below 32Mbytes in order to avoid costly
> trampolines. By allocating data outside of module area, we
> increase the chance for module text to remain within acceptable
> distance from kernel core text.
> 
> So select ARCH_WANTS_MODULES_DATA_IN_VMALLOC for 8xx as well.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>

Cc list first and then the SOB.

  Luis


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
