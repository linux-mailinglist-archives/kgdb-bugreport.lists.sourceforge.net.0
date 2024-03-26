Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E9688B650
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 26 Mar 2024 01:48:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rouyr-0004sJ-JK
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 26 Mar 2024 00:47:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liu.yeC@h3c.com>) id 1rouyq-0004sD-Hu
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 26 Mar 2024 00:47:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QkZ6aHYMcf61HU6Zd5zYZ/ekW8uMmtly18b1BNH24nc=; b=JDtw3IX+pbrSNWS9njTz8KOxW0
 9xPAQLcYJJczcfqJFytNcc7ZQgGjQeJfhA749ImXzgBY/ry4RW+iQzNym/0QxbfVAoFEMPJD3uFwn
 3AAquXn/X2MySFvP9WDg153my+XqXbF8fcnYm7RHF4343bWgi84k81fjVz7jZWKuiYmo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QkZ6aHYMcf61HU6Zd5zYZ/ekW8uMmtly18b1BNH24nc=; b=dKV/QLmCerOmKTsBF9NYXAiwEx
 yz60YEqco6y3fxcwlzYLU3vlbI16UE5MMd3pbH7PT1cwv4A0hFmY1FV2H77AH2BObClK2Yhqn/OuB
 k9PyQ+quPWk4BumgGC4aYaEb1CFxV3bd05i7kk5C/b0X/dRXZDWjouwqTQY/Qb0roeJQ=;
Received: from smtp.h3c.com ([60.191.123.50] helo=h3cspam02-ex.h3c.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rouyo-00075H-5K for kgdb-bugreport@lists.sourceforge.net;
 Tue, 26 Mar 2024 00:47:56 +0000
Received: from mail.maildlp.com ([172.25.15.154])
 by h3cspam02-ex.h3c.com with ESMTP id 42Q0l5q3009474;
 Tue, 26 Mar 2024 08:47:05 +0800 (GMT-8)
 (envelope-from liu.yeC@h3c.com)
Received: from DAG6EX07-IMDC.srv.huawei-3com.com (unknown [10.62.14.16])
 by mail.maildlp.com (Postfix) with ESMTP id 974262004BBF;
 Tue, 26 Mar 2024 08:48:52 +0800 (CST)
Received: from DAG6EX02-IMDC.srv.huawei-3com.com (10.62.14.11) by
 DAG6EX07-IMDC.srv.huawei-3com.com (10.62.14.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.27; Tue, 26 Mar 2024 08:47:05 +0800
Received: from DAG6EX02-IMDC.srv.huawei-3com.com ([fe80::4c21:7c89:4f9d:e4c4])
 by DAG6EX02-IMDC.srv.huawei-3com.com
 ([fe80::4c21:7c89:4f9d:e4c4%16]) with
 mapi id 15.02.1258.027; Tue, 26 Mar 2024 08:47:05 +0800
From: Liuye <liu.yeC@h3c.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Thread-Topic: [PATCH V5] kdb: Fix the deadlock issue in KDB debugging.
Thread-Index: AQHafMNGp110DpezqUCtEXSIKJEqHbFIKpkAgAEGDzA=
Date: Tue, 26 Mar 2024 00:47:05 +0000
Message-ID: <284dbaad75574bbaaab803b471e8ca6c@h3c.com>
References: <20240322155818.GD7342@aspen.lan>
 <20240323014141.3621738-1-liu.yec@h3c.com>
 <20240325165436.GA485978@aspen.lan>
In-Reply-To: <20240325165436.GA485978@aspen.lan>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.114.188.68]
x-sender-location: DAG2
MIME-Version: 1.0
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: h3cspam02-ex.h3c.com 42Q0l5q3009474
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: >> Just need to postpone schedule_work to the slave CPU
 exiting
 the NMI context. >> >> irq_work will only respond to handle schedule_work
 after exiting the current interrupt context. >> >> When the ma [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1rouyo-00075H-5K
Subject: [Kgdb-bugreport] =?gb2312?b?tPC4tDogW1BBVENIIFY1XSBrZGI6IEZpeCB0?=
 =?gb2312?b?aGUgZGVhZGxvY2sgaXNzdWUgaW4gS0RCIGRlYnVnZ2luZy4=?=
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
 "jason.wessel@windriver.com" <jason.wessel@windriver.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "jirislaby@kernel.org" <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

>> Just need to postpone schedule_work to the slave CPU exiting the NMI context.
>>
>> irq_work will only respond to handle schedule_work after exiting the current interrupt context.
>>
>> When the master CPU exits the interrupt context, other CPUs will naturally exit the NMI context, so there will be no deadlock.
>>
>> It is the call to input_register_handler() that forces us not to do the work from irq_work's hardirq callback.
>>
>> Therefore schedule another work in the irq_work and not do the job directly.
>
>This looks like it was copy and pasted from the e-mail thread without any editing to make it make any sense. It not even formatted correctly (where are the line breaks?).
>
>How about:
>
>We fix the problem by using irq_work to call schedule_work() instead of calling it directly. irq_work is an NMI-safe deferred work framework that performs the requested work from a hardirq context (usually an IPI but it can be timer interrupt on some architectures).
>
>Note that we still need to  a workqueue since we cannot resync the keyboard state from the hardirq context provided by irq_work.
>That must be done from task context for the calls into the input subystem. Hence we must defer the work twice. First to safely switch from the debug trap (NMI-like context) to hardirq and then, secondly, to get from hardirq to the system workqueue.

I apologize for my poor writing skills, your answer is more professional and accurate. I will replace this part with your description in the V6.



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
