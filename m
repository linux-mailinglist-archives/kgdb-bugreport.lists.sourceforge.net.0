Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A6E1DEE59
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 22 May 2020 19:34:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jcBZ0-0000r5-HK
	for lists+kgdb-bugreport@lfdr.de; Fri, 22 May 2020 17:34:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <peterz@infradead.org>) id 1jcBYz-0000qx-AD
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 May 2020 17:34:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wI/8yAenaDAQU5DV7y4CbiIHIuujya3ynkD2vjkagqs=; b=XHyTNSP2LXmU6pHO2VrFs1jtk8
 DP4BJZ50ErnTa7G9E7Vi3XB+L0UyYTZLH1PgCXpDL7SES5/hnBBO7D4E/+CFXGcHm76HBzwWNGDJk
 wteNsc+3o8oaOo4ThOfiec2u+BkeIseaywaPE6sZj8dgs00T+Sa5EaXlZPn6TCdYJXDY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wI/8yAenaDAQU5DV7y4CbiIHIuujya3ynkD2vjkagqs=; b=l/zP3Q6Bypb8VDXeU7tZDakILe
 OkJwKErZnY3O6pquft7Bj3j0B1H+z+Wqr0si2i/G8xgPZbWSukiUT2WqI0dbYPaOM6O6tmMDfJ1cu
 iHcsBXqcNyg8pVyhFucRKfXWxNJk4nnKVvYY2M8NPMfJvthEV8fZBLt8m5Ajj2Nqhc2o=;
Received: from merlin.infradead.org ([205.233.59.134])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jcBYw-00DC38-P1
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 May 2020 17:34:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=wI/8yAenaDAQU5DV7y4CbiIHIuujya3ynkD2vjkagqs=; b=nMZvLC6fLSante1sWCqNxhJUD1
 GSiy6bd/m+oLFuoZpwlaUTwT24yM+MwWbdD1XFr9FtVj3Yvf/NxbVutHbSs/VZh+Zjq/g+y9TOEIk
 SKIy+cDisaTdZbfUQejVOt/x/CYD3GkgsWoTylE3LujM/nrxNJsqFPJ5NUpilmay//m3FxsSgbPO9
 zk0U5gmLhqbwRZ6Mb7XO4DHmVY091Y1ZBHY/Yx4beCE1uM8kwMTumt2JNZRbalTmsZlblKXaHUaI7
 MPa3ptw0XCzTix/4vwPBTwOn39SWuGsD5QjaHYbKA/UHeDF1yQl/24wa3eydhcegjYnQirSPWQ2X6
 /uZnMzPw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcAVV-00061K-5c; Fri, 22 May 2020 16:26:49 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 62512301EFB;
 Fri, 22 May 2020 18:26:47 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 4CC9620B5D17E; Fri, 22 May 2020 18:26:47 +0200 (CEST)
Date: Fri, 22 May 2020 18:26:47 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <20200522162647.GW317569@hirez.programming.kicks-ass.net>
References: <20200522145510.2109799-1-daniel.thompson@linaro.org>
 <20200522145510.2109799-2-daniel.thompson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200522145510.2109799-2-daniel.thompson@linaro.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [205.233.59.134 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jcBYw-00DC38-P1
Subject: Re: [Kgdb-bugreport] [RFC PATCH 1/2] debug: Convert dbg_slave_lock
 to an atomic
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
Cc: pmladek@suse.com, patches@linaro.org, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, sergey.senozhatsky@gmail.com,
 Ingo Molnar <mingo@redhat.com>, jason.wessel@windriver.com,
 Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, May 22, 2020 at 03:55:09PM +0100, Daniel Thompson wrote:

> +static atomic_t			slaves_must_spin;

> +			if (!atomic_read(&slaves_must_spin))

> +		atomic_set(&slaves_must_spin, 1);

> +		atomic_set(&slaves_must_spin, 0);

There is no atomic operation there; this is pointless use of atomic_t.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
