Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CA90E3B5ADC
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 28 Jun 2021 11:05:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lxnCf-0006H6-EA
	for lists+kgdb-bugreport@lfdr.de; Mon, 28 Jun 2021 09:05:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <peterz@infradead.org>) id 1lxnCe-0006Gv-If
 for kgdb-bugreport@lists.sourceforge.net; Mon, 28 Jun 2021 09:05:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4O7oM3SBQR22JHShBZf1Kb5mO1kV53EtQa54+DkOWHM=; b=CHDc2yps3DJ5gMMHHwXqmKKozh
 Nsw45f9OIadZcNzGDaAWdauXlB5A/AZ/F0LJVbFs6okdwh8BjZLdEUll3Cd4im/knnFtsgNjR9+SU
 c4rCbwVDdDD+FKHhC26CMihpZiW+6c6eGzgohd9xUNohCvQcKyPfw1fYcQ6CqgaVNcgI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4O7oM3SBQR22JHShBZf1Kb5mO1kV53EtQa54+DkOWHM=; b=l0/OE82qwtmvB8kYlQEZKbPhaT
 vxQ3fxOAqLPq/q8wmujUG/afNW3qlVaiq/G8lsRfb0JjY4ciJhWx0pDvd3zmVnifARlC0EDhsIrpO
 vFqAl7PDgQUZR3KpIKEtx9hU3nzwNNwdZufiGb9l1fZF1WhpUW04dabNHBaJ7RCs23Wc=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lxnCZ-0000B5-Nz
 for kgdb-bugreport@lists.sourceforge.net; Mon, 28 Jun 2021 09:05:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=4O7oM3SBQR22JHShBZf1Kb5mO1kV53EtQa54+DkOWHM=; b=GvW6oPtJ0KdtlrRkX6FKJ7P+Ae
 SvFTjf7ZVu7khfiLZp+KfZYsRlWAxATHNTwNicwiiq4Kcw0jc7y9UR5XDEW8XuunqkcP7WaeqwqJA
 ecPkCFymxFIGK5CqGD3TVgbANG00KbRViJRypgweueJi9ShQVV2ZLP8n+RfY821XnKCI7Lr6EEJUH
 yFaCNEGLtwnDHaVcBcmSTTjyeCsuAxs/nwOA71bbs3fl19CXw/Mc+ZSCG7a/0808FJsgK1sFRcxoR
 uVXGmwp8c4VoJw2kLcBRCdcQToxNANiCU1kM5TuHFxHf55OPnxSzjEU9xQobsN3GFrUDltpL3dEcj
 jo6HCY3w==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxnBX-002lke-Fb; Mon, 28 Jun 2021 09:04:19 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id D3208300204;
 Mon, 28 Jun 2021 11:04:06 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 9A8A72C78D004; Mon, 28 Jun 2021 11:04:06 +0200 (CEST)
Date: Mon, 28 Jun 2021 11:04:06 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <YNmQhiGrg1XWvAZ6@hirez.programming.kicks-ass.net>
References: <YNWtNFCWBsCjKm3i@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YNWtNFCWBsCjKm3i@mwanda>
X-Spam-Score: 3.5 (+++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 3.6 RCVD_IN_SBL_CSS        RBL: Received via a relay in Spamhaus SBL-CSS
 [24.132.217.100 listed in zen.spamhaus.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lxnCZ-0000B5-Nz
Subject: Re: [Kgdb-bugreport] [bug report] sched: Change task_struct::state
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
Cc: kgdb-bugreport@lists.sourceforge.net, daniel.thompson@linaro.org,
 mpe@ellerman.id.au
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, Jun 25, 2021 at 01:17:24PM +0300, Dan Carpenter wrote:
> Hello Peter Zijlstra,
> 
> The patch 2f064a59a11f: "sched: Change task_struct::state" from Jun
> 11, 2021, leads to the following static checker warning:
> 
> 	kernel/debug/kdb/kdb_support.c:624 kdb_task_state_char()
> 	warn: unsigned 'p_state' is never less than zero.

Pre-existing fail that.. but yes that code (and it's carbon copy in
arch/powerpc/xmon/xmon.c) are clearly bogus and have been for a long
time afaict.

Ideally someone that cares about this code can replace it with
get_task_state() or something.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
