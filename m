Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CE01E08ED
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 25 May 2020 10:36:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jd8ay-00030w-J0
	for lists+kgdb-bugreport@lfdr.de; Mon, 25 May 2020 08:36:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <peterz@infradead.org>) id 1jd8aw-00030m-NS
 for kgdb-bugreport@lists.sourceforge.net; Mon, 25 May 2020 08:36:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RTpKspGxVJJJi40+OUi0+PfMkju25wl6tiprFTvOugk=; b=mrLb/zck6rQu8ZBB+LG0T8IEBV
 KZumGXLTCmb5bEdc45lqy5EzQVn2wO1caf/MCq0ZTajRmfslJ7BvA6deSVVEMSoBRMlEmh+zx0B2U
 ZHfrXy5OFzPqpNu5bds8aGhMUPRk/CRN5j0plkxTNIWtFYjs4iVMJ2BZGyScy/R1K4pk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=RTpKspGxVJJJi40+OUi0+PfMkju25wl6tiprFTvOugk=; b=R
 Q5VlwI46eGHJ6ARLHl9r5GwXhnawZnbabtyoQqsHdh0+56XfpuD1czJlqQI5gOF6jKkLsG+8UumHe
 qJaUjlVN6inJn5HHMgUOX/uiWNpzQBfk+Jr6XSVhDP8W72bDoPRNMsVhCTSOBB520LzDSgQ9U29qA
 ZukcCJasjDd/vqb0=;
Received: from merlin.infradead.org ([205.233.59.134])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jd8au-004LZv-Ln
 for kgdb-bugreport@lists.sourceforge.net; Mon, 25 May 2020 08:36:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=RTpKspGxVJJJi40+OUi0+PfMkju25wl6tiprFTvOugk=; b=VNwvzhjBBZXZ2K2tL7OAJ5w6oz
 ax0hT+LSYqqSAmwOkTkkfqSESGiRuf8XMC9qd7lSg2frS2RrrEW2GiSLeOCfaiFhpPIfFngr1medj
 oYaxzNhOJd0KIRhVPNdWKBSBdiInxW/QbkEsSwgmDIO3ahbfcUuVj/YbxwhBFzFGv7L8TkgOLbFgK
 inS01PxZV0sIzL5o1bdLN8zWkVBChNR+XRwkDI1Mra6jHEKGiSuzgxjY4EXaEhWTT/HvEalOCKfq0
 UeliyZYl2fMcLHPoMt1bZvilzCGaYzcoXg7t+/9s6DhrNvEApFN/gIb4d7ZSi9FY2sjd0RRTHokLL
 rkeDP5qg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jd8ad-0001w8-Kw; Mon, 25 May 2020 08:36:07 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 277353011E6;
 Mon, 25 May 2020 10:36:05 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 0D13721462C5D; Mon, 25 May 2020 10:36:05 +0200 (CEST)
Date: Mon, 25 May 2020 10:36:05 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: daniel.thompson@linaro.org, x86@kernel.org
Message-ID: <20200525083605.GB317569@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [205.233.59.134 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jd8au-004LZv-Ln
Subject: [Kgdb-bugreport] x86/entry vs kgdb
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
Cc: pmladek@suse.com, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, sergey.senozhatsky@gmail.com,
 jason.wessel@windriver.com, will@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi!

Since you seem to care about kgdb, I figured you might want to fix this
before I mark it broken on x86 (we've been considering doing that for a
while).

AFAICT the whole debugreg usage of kgdb-x86_64 is completely hosed; it
doesn't respsect the normal exclusion zones as per arch_build_bp_info().

That is, breakpoints must never be in:

  - in the cpu_entry_area
  - in .entry.text
  - in .noinstr.text
  - in anything else marked NOKPROBE

by not respecting these constraints it is trivial to completely and
utterly hose the machine. The entry rework that is current underway will
explicitly not deal with #DB triggering in any of those places.



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
