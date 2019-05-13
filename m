Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5B51AF2D
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 13 May 2019 05:40:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hQ1or-0005vq-3u
	for lists+kgdb-bugreport@lfdr.de; Mon, 13 May 2019 03:40:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <Wenlin.Kang@windriver.com>) id 1hQ1oq-0005vi-94
 for kgdb-bugreport@lists.sourceforge.net; Mon, 13 May 2019 03:40:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O9JzjCqVyPTyHcFgbFrSswWze5hRTqNUC69es5DVy1E=; b=ZGBqccQ0n4ix1lbAGynk+Nw72j
 OyNnpw0V3FfEJzXUjxguXARNvU6JSBZxn8MjxWQnjozRtKDAlWwEYdYrRLcg6uZ6ZaboD0ybmrbwA
 KrXs2myGNfEtdqQbS+1YZwX5k+JoITtae0+aom+RvWzsz3g0hZmKrXTHLhxTLzHXe60w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O9JzjCqVyPTyHcFgbFrSswWze5hRTqNUC69es5DVy1E=; b=BVY1zKMLbgO/AXiPL8lCI7hbG9
 +RlfAbrI6a/SO3uDeN/lx+rNOSQdIarBk9jNxntMyjzbhJ6RAZnsHN/LFjpNKpBgC4KNTRL90RD2E
 eOmgPdts6F0PY8+hld0x9Ty/hvqAHCHMzEXiRgoRFTgPK0i1+U1KiaYs/U5ckwADpbwU=;
Received: from mail.windriver.com ([147.11.1.11])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.1:ECDHE-RSA-AES256-SHA:256) (Exim 4.90_1) id 1hQ1ol-00EvKi-Pe
 for kgdb-bugreport@lists.sourceforge.net; Mon, 13 May 2019 03:40:04 +0000
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
 by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4D3doEo017640
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Sun, 12 May 2019 20:39:51 -0700 (PDT)
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
 Sun, 12 May 2019 20:39:50 -0700
To: Daniel Thompson <daniel.thompson@linaro.org>
References: <1557280359-202637-1-git-send-email-wenlin.kang@windriver.com>
 <20190508081640.tvtnazr4tf5jijh7@holly.lan>
 <ac8af42c-e69d-6fd0-1d76-73a37e8a672c@windriver.com>
 <20190512090003.de52davu55rrg7kn@wychelm.lan>
From: Wenlin Kang <wenlin.kang@windriver.com>
Message-ID: <0c5121f7-645c-3651-cccc-2ae836d415b6@windriver.com>
Date: Mon, 13 May 2019 11:39:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190512090003.de52davu55rrg7kn@wychelm.lan>
Content-Language: en-US
X-Originating-IP: [128.224.162.183]
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hQ1ol-00EvKi-Pe
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Fix bound check compiler warning
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
Cc: prarit@redhat.com, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, jason.wessel@windriver.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 5/12/19 5:00 PM, Daniel Thompson wrote:
> On Thu, May 09, 2019 at 10:56:03AM +0800, Wenlin Kang wrote:
>> On 5/8/19 4:16 PM, Daniel Thompson wrote:
>>> On Wed, May 08, 2019 at 09:52:39AM +0800, Wenlin Kang wrote:
>>>> The strncpy() function may leave the destination string buffer
>>>> unterminated, better use strlcpy() instead.
>>>>
>>>> This fixes the following warning with gcc 8.2:
>>>>
>>>> kernel/debug/kdb/kdb_io.c: In function 'kdb_getstr':
>>>> kernel/debug/kdb/kdb_io.c:449:3: warning: 'strncpy' specified bound 256 equals destination size [-Wstringop-truncation]
>>>>      strncpy(kdb_prompt_str, prompt, CMD_BUFLEN);
>>>>      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>
>>>> Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
>>>> ---
>>>>    kernel/debug/kdb/kdb_io.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
>>>> index 6a4b414..7fd4513 100644
>>>> --- a/kernel/debug/kdb/kdb_io.c
>>>> +++ b/kernel/debug/kdb/kdb_io.c
>>>> @@ -446,7 +446,7 @@ static char *kdb_read(char *buffer, size_t bufsize)
>>>>    char *kdb_getstr(char *buffer, size_t bufsize, const char *prompt)
>>>>    {
>>>>    	if (prompt && kdb_prompt_str != prompt)
>>>> -		strncpy(kdb_prompt_str, prompt, CMD_BUFLEN);
>>>> +		strlcpy(kdb_prompt_str, prompt, CMD_BUFLEN);
>>> Shouldn't that be strscpy?
>>
>> Hi Daniel
>>
>> I thought about strscpy, but I think strlcpy is better, because it only copy
>> the real number of characters if src string less than that size.
> Sorry, I'm confused by this. What behavior does strscpy() have that you
> consider undesirable in this case?


Hi Daniel

I checked strscpy() again, and think either is fine to me, if you think 
strscpy() is better, I can change it to this, and send v2, thanks for 
your review.


>
> Daniel.
>

-- 
Thanks,
Wenlin Kang



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
