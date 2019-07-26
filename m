Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AAA75D06
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 26 Jul 2019 04:33:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hqq2x-0001r3-Pu
	for lists+kgdb-bugreport@lfdr.de; Fri, 26 Jul 2019 02:33:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <xywang.sjtu@sjtu.edu.cn>) id 1hqq2w-0001qw-0q
 for kgdb-bugreport@lists.sourceforge.net; Fri, 26 Jul 2019 02:33:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9Fwpk2P0HOGFdp+ufmRfwxVSO+EJBbOzABBOhyqRU48=; b=S1jLW4qrXDoG61x0cJnfhrew2j
 aKR+fmauZZhb+Q3550ZX+E9xYZvrQSms7Unp/dJRbMj9hLSgmpLD5m0p78+G5L2dsdOjyrZbBQyM9
 57fbEdGxixcLvgSHb34OOvv1DR+bvaiVKWdkEYaQOSeNrHIvOPy/LFQjmkbNrrmtlz1A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
 In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9Fwpk2P0HOGFdp+ufmRfwxVSO+EJBbOzABBOhyqRU48=; b=hEadrPJwm7gBEcYk8WDiy8JZUb
 EytqPlYyxlWe4CELNDHFbvJb7cvTdLZj8trF00nb/VOv2ULoYKS4zspn55WAc134oaFxmQekGU348
 l5x/VzxCR7M4hzxpM5IxGQIGNG1KWWUcJiMP1Tjr6kMgZksBpDElNOuLitwVKRRbB4tg=;
Received: from smtp180.sjtu.edu.cn ([202.120.2.180])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hqq2t-00GSCn-Cr
 for kgdb-bugreport@lists.sourceforge.net; Fri, 26 Jul 2019 02:33:25 +0000
Received: from mta03.sjtu.edu.cn (mta03.sjtu.edu.cn [202.121.179.7])
 by smtp180.sjtu.edu.cn (Postfix) with ESMTPS id DC6C31008CBC4;
 Fri, 26 Jul 2019 10:33:11 +0800 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mta03.sjtu.edu.cn (Postfix) with ESMTP id D145810DC32;
 Fri, 26 Jul 2019 10:33:11 +0800 (CST)
X-Virus-Scanned: amavisd-new at 
Received: from mta03.sjtu.edu.cn ([127.0.0.1])
 by localhost (mta03.sjtu.edu.cn [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id G4BIiibZPy1P; Fri, 26 Jul 2019 10:33:11 +0800 (CST)
Received: from mailstore19.sjtu.edu.cn (mailstore19.sjtu.edu.cn
 [202.121.179.19])
 by mta03.sjtu.edu.cn (Postfix) with ESMTP id B288910DA56;
 Fri, 26 Jul 2019 10:33:11 +0800 (CST)
Date: Fri, 26 Jul 2019 10:33:11 +0800 (CST)
From: Wang Xiayang <xywang.sjtu@sjtu.edu.cn>
To: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <98781891.5464954.1564108391163.JavaMail.zimbra@sjtu.edu.cn>
In-Reply-To: <20190725131114.buxcipgyr2d45bfi@holly.lan>
References: <20190725053345.5888-1-xywang.sjtu@sjtu.edu.cn>
 <20190725094401.zve4urozmdxtxulx@holly.lan>
 <919772995.4681005.1564056633580.JavaMail.zimbra@sjtu.edu.cn>
 <20190725131114.buxcipgyr2d45bfi@holly.lan>
MIME-Version: 1.0
X-Originating-IP: [202.120.40.82]
X-Mailer: Zimbra 8.8.9_GA_3798 (ZimbraWebClient - GC73 (Linux)/8.8.9_GA_3744)
Thread-Topic: replace snprintf with strscpy
Thread-Index: Dl+oYoLhlBqFO4Zt9ed77O4HEY98NQ==
X-Spam-Score: 1.5 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.5 RCVD_IN_SORBS_WEB      RBL: SORBS: sender is an abusable web server
 [202.120.40.82 listed in dnsbl.sorbs.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [202.120.2.180 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hqq2t-00GSCn-Cr
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: replace snprintf with strscpy
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
Cc: kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>,
 jason wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net



----- On Jul 25, 2019, at 9:11 PM, Daniel Thompson daniel.thompson@linaro.org wrote:

> On Thu, Jul 25, 2019 at 08:10:33PM +0800, Wang Xiayang wrote:
>> 
>> ----- On Jul 25, 2019, at 5:44 PM, Daniel Thompson daniel.thompson@linaro.org
>> wrote:
>> 
>> > On Thu, Jul 25, 2019 at 01:33:45PM +0800, Wang Xiayang wrote:
>> >> As commit a86028f8e3ee ("staging: most: sound: replace snprintf
>> >> with strscpy") suggested, using snprintf without a format
>> >> specifier is potentially risky if the PROMPT environment
>> >> variable contains any format specifier. The variable can be set
>> >> via kdb_set() though by default it contains no format specifier.
>> >> 
>> >> Using strscpy is conservatively safe for any mistakenly
>> >> environment variable setting that leads to crash.
>> > 
>> > This will result in a broken prompt on SMP machines. The default
>> > prompt on an SMP machine includes the CPU number of the core that
>> > is currently being debugged.
>> > 
>> > 
>> 
>> Well, this patch only changes the line compiled for UP so it does not
>> break the prompt on SMP.
> 
> Understood, but fixing the issue exclusively for UP machines isn't
> really worth it.
> 
> 
>> Anyway, do you think the patch should be
>> revised to actually sanitize the format string instead of
>> conservatively ignoring them?
> 
> You mean adding a special case to kdb_set() to special case the setting
> of PROMPT. Certainly possible although it might be simpler just to
> forbid setting the prompt if KDB_ENABLE_MEM_READ isn't set.
> 

OK. I will just drop this patch. Thank you.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
