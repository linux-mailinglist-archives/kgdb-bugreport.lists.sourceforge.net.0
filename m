Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BAF397D40
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  2 Jun 2021 01:54:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1loEDo-0003ZC-G8
	for lists+kgdb-bugreport@lfdr.de; Tue, 01 Jun 2021 23:54:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mhiramat@kernel.org>) id 1loEDn-0003Yy-3W
 for kgdb-bugreport@lists.sourceforge.net; Tue, 01 Jun 2021 23:54:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version
 :References:In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5KfrA9gzd8lvy3NgQoqC+DWKUpV/vDRaeK0gZ/7i3Ew=; b=ZOrF8jU9LkW0NHnnbgZeon9LqC
 zVZwXVsCkkJPPN+7Qk9prtstZ3wktPjsRwmDPZn7Lwr9wdeFpTQTA2FN7UFsXSrwZIuhzDl/Gj1rw
 X318aKh9uH2s9S/gBuM6Bq100xG4TdjTGx9Er5XZ3lpFtLoeTum+Y3JVkJDXYfmRufhU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5KfrA9gzd8lvy3NgQoqC+DWKUpV/vDRaeK0gZ/7i3Ew=; b=EH9u4e5OYKsW+fjgsNwlp6BzpZ
 4sp6Rief4YmAu35i1/yjdjuIor867BoFgUJ7hum6Mv3PaHMXsb5dKRV2FL34Cks2V/K2hnxY3T2iG
 ysDrWBIYTpKcGXs6j9tKnyj3D1TksObvdEZJXaYh1sQO0CvEjdVdOjJPQhMaUhnBArys=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1loEDj-0007x7-0q
 for kgdb-bugreport@lists.sourceforge.net; Tue, 01 Jun 2021 23:54:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 68B9D61167;
 Tue,  1 Jun 2021 23:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622591679;
 bh=jiyCehCLO829F6OKGhd/MkEJDDNUeXwesyXS4WzMpFA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QLYXdKbA96urLnwb0KA5Pkwu6brrP+fVjZOZ6gXjseEpPy4bQ8nVEwCBW0r01239W
 4sTn+s0whEDqQXvyTTG6IhbBrhPA8UxmuUEuVWOSOOy/cvYXk0yjdOL1euKxWx5Ao7
 /whdp2MpLv+1WfGIVRc9adHT08WbA2XFGQ1gPLUnzly+SH95GwUNRNOKhAcZn0Os3l
 4ieZoqbnu6Ct5y7frj9n95ylgMgF6vVyC5yr4U84/PKXeCSd8trScLQZbrO5iraR75
 IIMcGH/Gag5EAZnBLv7nAykwVMfxYFACbCgWpyQeY3zn92fM7TKen8PEAj5Y0wgPoH
 smOUfaDRcelSQ==
Date: Wed, 2 Jun 2021 08:54:31 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Message-Id: <20210602085431.a4c2f3eb92f020ed50775eda@kernel.org>
In-Reply-To: <20210529110305.9446-2-thunder.leizhen@huawei.com>
References: <20210529110305.9446-1-thunder.leizhen@huawei.com>
 <20210529110305.9446-2-thunder.leizhen@huawei.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Spam-Score: -1.1 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.6 NICE_REPLY_A           Looks like a legit reply (A)
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1loEDj-0007x7-0q
Subject: Re: [Kgdb-bugreport] [PATCH v2 1/4] kprobes: Fix spelling mistakes
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>,
 Balbir Singh <bsingharora@gmail.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Daniel Jordan <daniel.m.jordan@oracle.com>, Ingo Molnar <mingo@redhat.com>,
 "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
 Darren Hart <dvhart@infradead.org>,
 linux-crypto <linux-crypto@vger.kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 John Stultz <john.stultz@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Barry Song <song.bao.hua@hisilicon.com>, Stephen Boyd <sboyd@kernel.org>,
 kexec <kexec@lists.infradead.org>, Oleg Nesterov <oleg@redhat.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Eric Biederman <ebiederm@xmission.com>,
 Jessica Yu <jeyu@kernel.org>, Tejun Heo <tj@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Sat, 29 May 2021 19:03:02 +0800
Zhen Lei <thunder.leizhen@huawei.com> wrote:

> Fix some spelling mistakes in comments:
> decrese ==> decrease
> immmediately ==> immediately

This looks good to me.

Acked-by: Masami Hiramatsu <mhiramat@kernel.org>

Thanks!

> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  include/linux/freelist.h | 2 +-
>  kernel/kprobes.c         | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/freelist.h b/include/linux/freelist.h
> index fc1842b96469..1811c1f3f8cb 100644
> --- a/include/linux/freelist.h
> +++ b/include/linux/freelist.h
> @@ -39,7 +39,7 @@ static inline void __freelist_add(struct freelist_node *node, struct freelist_he
>  	 * and a refcount increment of a node in try_get, then back up to
>  	 * something non-zero, then the refcount increment is done by the other
>  	 * thread) -- so if the CAS to add the node to the actual list fails,
> -	 * decrese the refcount and leave the add operation to the next thread
> +	 * decrease the refcount and leave the add operation to the next thread
>  	 * who puts the refcount back to zero (which could be us, hence the
>  	 * loop).
>  	 */
> diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> index 8c0a6fdef771..d4156082d5a5 100644
> --- a/kernel/kprobes.c
> +++ b/kernel/kprobes.c
> @@ -641,7 +641,7 @@ void wait_for_kprobe_optimizer(void)
>  	while (!list_empty(&optimizing_list) || !list_empty(&unoptimizing_list)) {
>  		mutex_unlock(&kprobe_mutex);
>  
> -		/* this will also make optimizing_work execute immmediately */
> +		/* this will also make optimizing_work execute immediately */
>  		flush_delayed_work(&optimizing_work);
>  		/* @optimizing_work might not have been queued yet, relax */
>  		cpu_relax();
> -- 
> 2.25.1
> 
> 


-- 
Masami Hiramatsu <mhiramat@kernel.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
