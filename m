Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 375594E4506
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 22 Mar 2022 18:25:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nWi7j-0005jx-19
	for lists+kgdb-bugreport@lfdr.de; Tue, 22 Mar 2022 17:24:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mcgrof@infradead.org>) id 1nWi7h-0005jk-V7
 for kgdb-bugreport@lists.sourceforge.net; Tue, 22 Mar 2022 17:24:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qYXsicOZSjgl5ohKK5E1ZuJbpsruLDa/pvOZWrwipTE=; b=SMCGeJpMuNufsDgCLbVPu8/bUQ
 OFfHKbVnTf1V6YslcokIGBxfaAzo0BKj0RHEf6xMnH0wtOZAU1dpW7yhjykFyP7xfYKfGNrHUIGKc
 8FsH13VYd5VUnjnmsSq+XN3Vn0rcangZ3HM8OEyH36/2raIQsvwsW8tvIVtqiReBg2ws=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qYXsicOZSjgl5ohKK5E1ZuJbpsruLDa/pvOZWrwipTE=; b=LEh3vR2NGACbFtFJ4hiZYY+apu
 zNzR4NUgcvoZtsZf7N1DWT2LT7dXnnPdZUQDsHSoz3ZbEpdtO71bZZryrnikYSy4f50Uig6Nr4acM
 oSYF0lSfCsDueWndh9yDFH/mmwxeIZAPIWyJPERjVwdvSVuarseo4PgJllClHi2Af0b0=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nWiFX-008kMK-2K
 for kgdb-bugreport@lists.sourceforge.net; Tue, 22 Mar 2022 17:24:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=qYXsicOZSjgl5ohKK5E1ZuJbpsruLDa/pvOZWrwipTE=; b=DyoOoVdYB6oYCjvrmtRIcgoUpQ
 T0Yvuslgm/EFQM/MuVZIuvEkWDKsaM+yRLbFKOZk8LJHYbSvGyN+zIW6SZGGtlDD+hDQMYnMp/6Zl
 sGSB+zc5HOzQplv+CTNGd6c8cdpHQBZuf0LsnW80ej1BPbVDaOXGJH+jwULH0JeubiUt+nnUszlqc
 9MJlM/YypEag2SAgnF/9LLh83QovEebxI5d4NhK5Zgcl+GfQhA5QTWZpgFco3II6sqPt2Jyc1JwG0
 tT1F8rK5k/UVQPCosWt56otYcw+Y+/11PJTtrfdIX0beKIrO7r0lgRKrD8+e0WqgB/w9UMCits73u
 BqRShRWQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1nWiFF-00BinQ-3R; Tue, 22 Mar 2022 17:24:33 +0000
Date: Tue, 22 Mar 2022 10:24:33 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <YjoGUfHa1WgYWiR1@bombadil.infradead.org>
References: <cover.1645607143.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1645607143.git.christophe.leroy@csgroup.eu>
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Feb 23, 2022 at 01:02:10PM +0100, Christophe Leroy
 wrote: > This series applies on top of my series "miscellanuous cleanups"
 v4. Queued onto modules-testing! BTW I just had to rebase the change with
 the kdb changes, it was a trivial change. 
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1nWiFX-008kMK-2K
Subject: Re: [Kgdb-bugreport] [PATCH v6 0/6] Allocate module text and data
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
Cc: linux-arch@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Aaron Tomlin <atomlin@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 linux-modules@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Feb 23, 2022 at 01:02:10PM +0100, Christophe Leroy wrote:
> This series applies on top of my series "miscellanuous cleanups" v4.

Queued onto modules-testing! BTW I just had to rebase the change
with the kdb changes, it was a trivial change.

  Luis


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
