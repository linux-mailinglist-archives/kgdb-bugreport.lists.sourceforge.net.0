Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A418AA81A
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 19 Apr 2024 07:56:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rxhEK-0003hS-HI
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 19 Apr 2024 05:56:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liu.yeC@h3c.com>) id 1rxhEI-0003h8-Co
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 Apr 2024 05:56:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6yzIPDNpMLVX9Xz8Pzth7r6bTTRxdck5HIFzebwGR88=; b=PDRY041s+U8AtXh38hyBt/PIn0
 jvxSlucn9FGoyav9F7rT4zZAbeP9zD5sVfWgJZtsKJyb8+J7mxcUjvhQbNfaR41m6bMIjPv6cmFzE
 ZCiIQlesSajXSWy7o9C1PZUZOmR9ngKTeNGIyuF2YLD0gsvKoTti9HjBTYRMRbg7JQYU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=6yzIPDNpMLVX9Xz8Pzth7r6bTTRxdck5HIFzebwGR88=; b=V
 5/VHTxeigbege2JOj3EcQ+w+uhqQ0MGz6BOSlQADTSzn7MK/g1U4cxoRPJG5lJ1P7ToFm/qayuPTn
 kVO/znXkXDOG7N1G/vQtzel0xbsJvCycN8rt8eqtixAH3IQgdgUlIYo4vlYCw61Z3qrkWcDMO0ta5
 ju1bnfka/Wyfzr9M=;
Received: from smtp.h3c.com ([60.191.123.50] helo=h3cspam02-ex.h3c.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rxhEH-0002DF-Lm for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 Apr 2024 05:56:11 +0000
Received: from mail.maildlp.com ([172.25.15.154])
 by h3cspam02-ex.h3c.com with ESMTP id 43J5svZE030934;
 Fri, 19 Apr 2024 13:54:57 +0800 (GMT-8)
 (envelope-from liu.yeC@h3c.com)
Received: from DAG6EX10-BJD.srv.huawei-3com.com (unknown [10.153.34.12])
 by mail.maildlp.com (Postfix) with ESMTP id 59B962004BD6;
 Fri, 19 Apr 2024 13:57:19 +0800 (CST)
Received: from DAG6EX02-IMDC.srv.huawei-3com.com (10.62.14.11) by
 DAG6EX10-BJD.srv.huawei-3com.com (10.153.34.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.27; Fri, 19 Apr 2024 13:54:58 +0800
Received: from DAG6EX02-IMDC.srv.huawei-3com.com ([fe80::4c21:7c89:4f9d:e4c4])
 by DAG6EX02-IMDC.srv.huawei-3com.com
 ([fe80::4c21:7c89:4f9d:e4c4%16]) with
 mapi id 15.02.1258.027; Fri, 19 Apr 2024 13:54:58 +0800
From: Liuye <liu.yeC@h3c.com>
To: Greg KH <gregkh@linuxfoundation.org>, "daniel.thompson@linaro.org"
 <daniel.thompson@linaro.org>
Thread-Topic: =?utf-8?B?UmU6IFJl77yaW1BBVENIIFYxMV0ga2RiOiBGaXggdGhlIGRlYWRsb2NrIGlz?=
 =?utf-8?Q?sue_in_KDB_debugging.?=
Thread-Index: AdqSHaw21DgRgJC5RcSP9pEIk8krFg==
Date: Fri, 19 Apr 2024 05:54:58 +0000
Message-ID: <ac27269989394d8dac859763bc7578d6@h3c.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.114.188.68]
x-sender-location: DAG2
MIME-Version: 1.0
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: h3cspam02-ex.h3c.com 43J5svZE030934
X-Spam-Score: -5.0 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  >On Wed, Apr 17, 2024 at 11:01:56AM +0000, Liuye wrote: >>
 >--- >> >V10 -> V11: Revert to V9 >> >V9 -> V10 : Add Signed-off-by of Greg
 KH and Andy Shevchenko, Acked >> > by of Daniel Thompson >> >V8 - [...] 
 Content analysis details:   (-5.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [60.191.123.50 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1rxhEH-0002DF-Lm
Subject: Re: [Kgdb-bugreport] 
 =?utf-8?b?UmXvvJpbUEFUQ0ggVjExXSBrZGI6IEZpeCB0?=
 =?utf-8?q?he_deadlock_issue_in_KDB_debugging=2E?=
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
Cc: "kgdb-bugreport@lists.sourceforge.net"
 <kgdb-bugreport@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "jason.wessel@windriver.com" <jason.wessel@windriver.com>,
 "jirislaby@kernel.org" <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

>On Wed, Apr 17, 2024 at 11:01:56AM +0000, Liuye wrote:
>> >---
>> >V10 -> V11: Revert to V9
>> >V9 -> V10 : Add Signed-off-by of Greg KH and Andy Shevchenko, Acked
>> >            by of Daniel Thompson
>> >V8 -> V9: Modify call trace format and move irq_work.h before module.h
>> >V7 -> V8: Update the description information and comments in the code.
>> >	   : Submit this patch based on version linux-6.9-rc2.
>> >V6 -> V7: Add comments in the code.
>> >V5 -> V6: Replace with a more professional and accurate answer.
>> >V4 -> V5: Answer why schedule another work in the irq_work and not do
>> >          the job directly.
>> >V3 -> V4: Add changelogs
>> >V2 -> V3: Add description information
>> >V1 -> V2: using irq_work to solve this properly.
>> >---
>>
>> What is the current status of PATCH V11? Are there any additional
>> modifications needed?
>
>I understood that is blocked pending outcome of the legal matters
>raised by v10...  and that this is why you were asked not to post
>v11 until they had been resolved.
>
>To be honest given that [I wrote all of the C code][1] for the most
>recent version of the patch and that I'd like to see the bug fixed,
>then I will probably have to give up on co-authorship. Instead I can
>post my code with a new comment and patch description and credit you
>with a Reported-by:. That should take the pressure off in terms of
>landing this bug fix.

@Daniel

Yes, you can do it this way. To fix this bug as soon as possible, follow what you said. I agree.

>However, the legal issues do still need to be resolved or there is a
>risk that other upstream contributions from your company will be
>delayed.

@Greg KH

This issue still needs to be resolved, but I don't know how to do it. 
Please tell me an effective strategy. How should feedback be given to make it effective for you? 
There is already an approval process for external emails in the current company. 
And a review mechanism has been added within the team. And internal training is provided.
The previous mentioned has been completed. What else needs to be done?

Thanks
Liu Ye

_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
