Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5D0185B4
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  9 May 2019 09:03:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hOd5u-0005MU-1s
	for lists+kgdb-bugreport@lfdr.de; Thu, 09 May 2019 07:03:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <Wenlin.Kang@windriver.com>) id 1hOd5s-0005MH-Tp
 for kgdb-bugreport@lists.sourceforge.net; Thu, 09 May 2019 07:03:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Si2KOTfckft8jFqQjbj7a8ctTLTriInyUmF/NTDHRIc=; b=fNOIlycu7k8tZ02mhjlvWNyzUz
 miFDqshmLfQtv2JPS68wTXh7LM/uuA1vFNHjREB+x1iCDfOiG0eeeToIMpMqTroy/Pq/hxcMMX3K6
 RhFL4OO8Z443eGO2SNqkoGx9EL3SXtalDk7HGw2jn4e9Noh8l++HgaLwDWOJ0Zw2w6yE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Si2KOTfckft8jFqQjbj7a8ctTLTriInyUmF/NTDHRIc=; b=FLPre+hsK0L7U04/w+decYitFH
 RKxJaFBu2DQcx3t0VUJNaENEHamCizNmgD1UroDhU/T3V0+9LPp4r66DUahnzobWbDSd4OEqoMlIs
 3QMJDkDPiTu2KpLDCg5mF/qnzlM/y+m8vY59kjqiXg/CFlQn8goQdpokJlVJLQbof1YU=;
Received: from mail1.windriver.com ([147.11.146.13])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.1:ECDHE-RSA-AES256-SHA:256) (Exim 4.90_1) id 1hOd5r-00AgN2-4H
 for kgdb-bugreport@lists.sourceforge.net; Thu, 09 May 2019 07:03:52 +0000
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
 by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x492u8Vk004135
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Wed, 8 May 2019 19:56:08 -0700 (PDT)
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
 Wed, 8 May 2019 19:56:07 -0700
To: Daniel Thompson <daniel.thompson@linaro.org>
References: <1557280359-202637-1-git-send-email-wenlin.kang@windriver.com>
 <20190508081640.tvtnazr4tf5jijh7@holly.lan>
From: Wenlin Kang <wenlin.kang@windriver.com>
Message-ID: <ac8af42c-e69d-6fd0-1d76-73a37e8a672c@windriver.com>
Date: Thu, 9 May 2019 10:56:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190508081640.tvtnazr4tf5jijh7@holly.lan>
Content-Language: en-US
X-Originating-IP: [128.224.162.183]
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: windriver.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hOd5r-00AgN2-4H
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

On 5/8/19 4:16 PM, Daniel Thompson wrote:
> On Wed, May 08, 2019 at 09:52:39AM +0800, Wenlin Kang wrote:
>> The strncpy() function may leave the destination string buffer
>> unterminated, better use strlcpy() instead.
>>
>> This fixes the following warning with gcc 8.2:
>>
>> kernel/debug/kdb/kdb_io.c: In function 'kdb_getstr':
>> kernel/debug/kdb/kdb_io.c:449:3: warning: 'strncpy' specified bound 256 equals destination size [-Wstringop-truncation]
>>     strncpy(kdb_prompt_str, prompt, CMD_BUFLEN);
>>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
>> ---
>>   kernel/debug/kdb/kdb_io.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
>> index 6a4b414..7fd4513 100644
>> --- a/kernel/debug/kdb/kdb_io.c
>> +++ b/kernel/debug/kdb/kdb_io.c
>> @@ -446,7 +446,7 @@ static char *kdb_read(char *buffer, size_t bufsize)
>>   char *kdb_getstr(char *buffer, size_t bufsize, const char *prompt)
>>   {
>>   	if (prompt && kdb_prompt_str != prompt)
>> -		strncpy(kdb_prompt_str, prompt, CMD_BUFLEN);
>> +		strlcpy(kdb_prompt_str, prompt, CMD_BUFLEN);
> Shouldn't that be strscpy?


Hi Daniel

I thought about strscpy, but I think strlcpy is better, because it only 
copy the real number of characters if src string less than that size.


>
>
> Daniel.
>
>>   	kdb_printf(kdb_prompt_str);
>>   	kdb_nextline = 1;	/* Prompt and input resets line number */
>>   	return kdb_read(buffer, bufsize);
>> -- 
>> 1.9.1
>>

-- 
Thanks,
Wenlin Kang



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
