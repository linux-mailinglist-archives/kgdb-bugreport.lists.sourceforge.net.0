Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8404A7C41
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  3 Feb 2022 01:05:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nFPdA-0000me-Pp
	for lists+kgdb-bugreport@lfdr.de; Thu, 03 Feb 2022 00:05:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mcgrof@infradead.org>) id 1nFPd9-0000mS-Lv
 for kgdb-bugreport@lists.sourceforge.net; Thu, 03 Feb 2022 00:05:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xQooU1SeAas1UxR3X3UmWtN5zzl8oAjoZoNwYOADmzQ=; b=F2g3KPZ0SXopsRH05bMlst+tnd
 +xEB5NKeKo4j/m+wY7UMM7qohSDqnsdTuC9IQo4x2Gg2xR2h8AlSgShaKsoRhGBG7tUt5bG6a8/9A
 vrfRRqGFVzUs6R5NYtbw0noZM6RH+9kkUWNmgLJAMA9ZK+m7j22o7VVmih3iVdadQupQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xQooU1SeAas1UxR3X3UmWtN5zzl8oAjoZoNwYOADmzQ=; b=S1iGLThQq2sZUXphGFSYrt1OM1
 oRxCu/Vr1cu5ZF3REQsmW6or7QzDtaH8AyIfWhs8iYsNYIXWahH3tR/pEn7vasRqfCBrKRzlbKogf
 cQBgb4HcljcOB35hZskiIqjYMj2q4gCOjLBsEMi7qjmPCrOEF0tG43FGmQO9/Rk61fRg=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nFPd6-0000L7-Qh
 for kgdb-bugreport@lists.sourceforge.net; Thu, 03 Feb 2022 00:05:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=xQooU1SeAas1UxR3X3UmWtN5zzl8oAjoZoNwYOADmzQ=; b=0tFyjfZigtDVzKO8NKFpEoPnFT
 +BCli90uB8dnN9Zb3T7haQ6WAVu9sc6f+G7578f6V+Ed7sq0Cjjc49k/pzlpBvQ2AIereclmGEPDp
 ON5m/YH0TmOLFNw8nDW0zc0VzUNFsfpDuhwNgjgmnGdkTPKnVx0HsdMG4TpsddoUk6Oc2Rhr8PlgS
 T9Se5iyhiWEbWWL6h4rbGDsFYCfK5t9NDYSf5hnBO2g+lA6lpIcMDGwHHhG2XV6ksmXUVKGwsRsiP
 V02pOQjQdh3QBDPMCF3VRYFQyMJVOfRTh0KfBezd9cKBgnMqC0/KCgCvhcdI2i173NI43neERYj8I
 mdDf5KHg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1nFPcx-00H7nP-G0; Thu, 03 Feb 2022 00:05:31 +0000
Date: Wed, 2 Feb 2022 16:05:31 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Aaron Tomlin <atomlin@redhat.com>
Message-ID: <YfscSzltd4UcZSCO@bombadil.infradead.org>
References: <cover.1643475473.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1643475473.git.christophe.leroy@csgroup.eu>
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Jan 29, 2022 at 05:02:03PM +0000, Christophe Leroy
 wrote: > This series allow architectures to request having modules data in
 > vmalloc area instead of module area. > > This is required on pow [...] 
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
X-Headers-End: 1nFPd6-0000L7-Qh
Subject: Re: [Kgdb-bugreport] [PATCH v3 0/6] Allocate module text and data
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
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jessica Yu <jeyu@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Sat, Jan 29, 2022 at 05:02:03PM +0000, Christophe Leroy wrote:
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

This looks good, however I'd like to see Aaron's changes go in first,
and then yours. Aaron's changes still need to be tested by 0-day and I
need to finish review, but that's the order of how I'd prefer to see
changes merged / tested. I'll try to review his changes, dump them to
modules-next and then I'd like to trouble you to rebase ontop of that.

We should get all this tested early for the next release.

  Luis


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
