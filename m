Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C22BE62A
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 25 Sep 2019 22:10:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iDDc1-0004EY-QP
	for lists+kgdb-bugreport@lfdr.de; Wed, 25 Sep 2019 20:10:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jason.wessel@windriver.com>) id 1iDDbz-0004ER-SQ
 for kgdb-bugreport@lists.sourceforge.net; Wed, 25 Sep 2019 20:10:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p0DnIVLUXYBYtzAA14wqxwWjbamn0I1WDSlyyMttzVg=; b=GKXKhRnsWmz64+TyTh1IcDeZ7X
 kfnV0/nsgdUw2UE7vihfQle/bLUUhmLkCSgvmvYFag2QesnStGUBL4y+QFVUsnZWb2GmB9ubI6aZ3
 cU6Jhx7PSKrlCORzR3hnF+15nO00KCi8xWzGmQg+9HPJ4n1V084ZUnJopHqMYheu1pn8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=p0DnIVLUXYBYtzAA14wqxwWjbamn0I1WDSlyyMttzVg=; b=VlqO33lt/vU10ZSCb0uvdszbIT
 B8j4L7mgGF+lf5//w0vTQK7qXk1uBJq5DJKh4RqBAPImdzsr8JUg47ghIprplWpmW6wwXFN6idIuN
 v3RKiLvZ4kOa7DsF2XKkxT4KtbQ38JPl9tQSmbvojgK15rOH4YGBE5UaiiBoE+YJDhgg=;
Received: from mail5.windriver.com ([192.103.53.11] helo=mail5.wrs.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iDDbt-008tfS-3R
 for kgdb-bugreport@lists.sourceforge.net; Wed, 25 Sep 2019 20:10:07 +0000
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
 [147.11.189.40])
 by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8PK8Mci005202
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Wed, 25 Sep 2019 13:08:32 -0700
Received: from [192.168.10.15] (172.25.59.210) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.468.0; Wed, 25 Sep 2019
 13:08:12 -0700
To: Douglas Anderson <dianders@chromium.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Daniel Thompson
 <daniel.thompson@linaro.org>
References: <20190925200220.157670-1-dianders@chromium.org>
 <20190925125811.v3.1.I31ab239a765022d9402c38f8a12d9f7bae76b770@changeid>
From: Jason Wessel <jason.wessel@windriver.com>
Message-ID: <9a8b84cb-938b-d468-335b-27bbd963c6d0@windriver.com>
Date: Wed, 25 Sep 2019 15:08:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190925125811.v3.1.I31ab239a765022d9402c38f8a12d9f7bae76b770@changeid>
Content-Language: en-US
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iDDbt-008tfS-3R
Subject: Re: [Kgdb-bugreport] [PATCH v3 1/4] kgdb: Remove unused DCPU_SSTEP
 definition
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 9/25/19 3:02 PM, Douglas Anderson wrote:
>  From doing a 'git log --patch kernel/debug', it looks as if DCPU_SSTEP
> has never been used.  Presumably it used to be used back when kgdb was
> out of tree and nobody thought to delete the definition when the usage
> went away.  Delete.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

The history on this one is that it was part of the logic for the soft stepping on ARM v5 cores.   The code was never merged to the mainline for doing this, so the .h definition can certainly go.

Acked-by: Jason Wessel <jason.wessel@windriver.com>

> ---
> 
> Changes in v3:
> - Patch ("Remove unused DCPU_SSTEP definition") new for v3.
> 
> Changes in v2: None
> 
>   kernel/debug/debug_core.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/kernel/debug/debug_core.h b/kernel/debug/debug_core.h
> index b4a7c326d546..804b0fe5a0ba 100644
> --- a/kernel/debug/debug_core.h
> +++ b/kernel/debug/debug_core.h
> @@ -33,7 +33,6 @@ struct kgdb_state {
>   #define DCPU_WANT_MASTER 0x1 /* Waiting to become a master kgdb cpu */
>   #define DCPU_NEXT_MASTER 0x2 /* Transition from one master cpu to another */
>   #define DCPU_IS_SLAVE    0x4 /* Slave cpu enter exception */
> -#define DCPU_SSTEP       0x8 /* CPU is single stepping */
>   
>   struct debuggerinfo_struct {
>   	void			*debuggerinfo;
> 



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
