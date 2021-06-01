Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2F7397C74
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  2 Jun 2021 00:34:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1loCxb-0007Cb-TY
	for lists+kgdb-bugreport@lfdr.de; Tue, 01 Jun 2021 22:34:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <gustavo@embeddedor.com>) id 1loCxa-0007CT-Dh
 for kgdb-bugreport@lists.sourceforge.net; Tue, 01 Jun 2021 22:34:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gQRWjLhpoAcL1f0UUsLAbLVdyvmjcaGwSmImCIMpK8g=; b=NAyItlrRsIhBZa5NtQDCENwCPR
 tCTii7Cx5suzUnLjXdXXuY6b+aFbHmHK5uWi9d3kU5IHnbcT474Kx46xDP/I+tysdpc2/gj9s6GTQ
 iKeGYHSagKH6NTVHlKIJTOGQh9Ly5q4Fg/RbMbC7D1XPFMEs7cCgC98JMjSoZPy94+tg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gQRWjLhpoAcL1f0UUsLAbLVdyvmjcaGwSmImCIMpK8g=; b=YZl12IfPjwI4sOYenrF8VOd/bn
 Aqf6nWjo5bQC07UZ72EAYx7g2HxmQWfdPlCbldBPZ6sTzlTdi+qnHSBkHolzgPmqZ1wRwK4dkHwpv
 Tx/zd+qtcYTsvFPbij6QKQec1vx7mhWm37qMjFT2iYjyV9pZDUKgnsXoqQIrAY7plIac=;
Received: from gateway32.websitewelcome.com ([192.185.145.178])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1loCxR-006OaJ-N6
 for kgdb-bugreport@lists.sourceforge.net; Tue, 01 Jun 2021 22:34:07 +0000
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
 by gateway32.websitewelcome.com (Postfix) with ESMTP id EEF141612CD
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue,  1 Jun 2021 17:12:41 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id oCcrlJLkcx8DpoCcrl3Ku2; Tue, 01 Jun 2021 17:12:41 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gQRWjLhpoAcL1f0UUsLAbLVdyvmjcaGwSmImCIMpK8g=; b=bMNcVIOdSbAXlFOIuKZBAlQgHb
 rizHEbtPx/wzzA8zqcRapvlU8ysBb7UK1JtNxmi9ml0UM3aWv2vx56T2J6VDzc9qm9xnsicW6cPub
 wCWYuhcSS0L4MR/0nu+MH1rJ8KNNWRDQZba/bygsG2AVLOwhqdh0oJFFpMd9o5XRSrSqFMPMEoBHs
 9Eycf2roWWXoQh436c20ZAonzOD6Dff1+OIQK/bdOQYuXJmaM3D8Dj2tQXEwxBZxBKCJLdeJal2Kx
 DBPDf7EnoxQyV365tcr0fc7lC7Q6+OAvSioS5JvoAErfDv+s5bNk5+LxyYo50rrDXoNxXtDKzCtmI
 JKx47Xbg==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:52568
 helo=[192.168.15.8])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <gustavo@embeddedor.com>)
 id 1loCco-000BPJ-Fv; Tue, 01 Jun 2021 17:12:38 -0500
To: Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
References: <20210528200222.GA39201@embeddedor>
 <202106011220.AA0C1482@keescook>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <0d53a68c-b445-1df6-43a9-eff1a54f8fce@embeddedor.com>
Date: Tue, 1 Jun 2021 17:13:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <202106011220.AA0C1482@keescook>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.sourceforge.net
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1loCco-000BPJ-Fv
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8])
 [187.162.31.110]:52568
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 12
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [192.185.145.178 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.6 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1loCxR-006OaJ-N6
Subject: Re: [Kgdb-bugreport] [PATCH][next] kgdb: Fix fall-through warning
 for Clang
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net



On 6/1/21 14:20, Kees Cook wrote:
> On Fri, May 28, 2021 at 03:02:22PM -0500, Gustavo A. R. Silva wrote:
>> In preparation to enable -Wimplicit-fallthrough for Clang, fix a
>> fall-through warning by explicitly adding a goto statement instead
>> of letting the code fall through to the next case.
>>
>> Link: https://github.com/KSPP/linux/issues/115
>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>> ---
>> JFYI: We had thousands of these sorts of warnings and now we are down
>>       to just 25 in linux-next. This is one of those last remaining
>>       warnings.
> 
> So close! :)

Almost there!

> Reviewed-by: Kees Cook <keescook@chromium.org>

Thanks

--
Gustavo

> 
> -Kees
> 
>>
>>  kernel/debug/debug_core.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
>> index 4708aec492df..431749dd9ab6 100644
>> --- a/kernel/debug/debug_core.c
>> +++ b/kernel/debug/debug_core.c
>> @@ -1038,6 +1038,7 @@ dbg_notify_reboot(struct notifier_block *this, unsigned long code, void *x)
>>  	switch (kgdbreboot) {
>>  	case 1:
>>  		kgdb_breakpoint();
>> +		goto done;
>>  	case -1:
>>  		goto done;
>>  	}
>> -- 
>> 2.27.0
>>
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
