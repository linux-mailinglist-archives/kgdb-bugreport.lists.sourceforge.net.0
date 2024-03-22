Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B7F8867A5
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 22 Mar 2024 08:52:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rnZhJ-0004bY-RK
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 22 Mar 2024 07:52:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liu.yeC@h3c.com>) id 1rnZhH-0004bI-Uh
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 22 Mar 2024 07:52:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JcawjuQzj2kIp/tXe59hsACPJPeGZetDdjNA++lcYhg=; b=PC+GH5GqKPdRUW19DBALjPC27U
 obhj5ddBA9TgOcRz4Iqp+zg9eaFL0bPkU7DW5mAbzOloJx/Eg4eCCfG6E0KeBXwe6nWq5jgol/MQ4
 qEIZoyVPLzVTTbpKOToQRc8CII4CwQjRUIYc1lwHhQ2IjNS9WTC77cS4TtJMkANOW3w8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JcawjuQzj2kIp/tXe59hsACPJPeGZetDdjNA++lcYhg=; b=EUHksnYn0i/jDZq2vqXloDBPJl
 +sVrvVlEurGyJ4ABsQtXaw+qy57yLON4YrC4oD5wymHNndmxQBiDskErueurA932/trAttk7Jhjt7
 jaf3yvlf/87SDxNAN+XJNOLCgfNwQX9KhAIqiQeQtCkycQ/Kscp98oUnwnp3Lg8EVB0U=;
Received: from smtp.h3c.com ([60.191.123.50] helo=h3cspam02-ex.h3c.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rnZhE-0006mL-0w for kgdb-bugreport@lists.sourceforge.net;
 Fri, 22 Mar 2024 07:52:16 +0000
Received: from mail.maildlp.com ([172.25.15.154])
 by h3cspam02-ex.h3c.com with ESMTP id 42M7oqLk000733;
 Fri, 22 Mar 2024 15:50:52 +0800 (GMT-8)
 (envelope-from liu.yeC@h3c.com)
Received: from DAG6EX05-IMDC.srv.huawei-3com.com (unknown [10.62.14.14])
 by mail.maildlp.com (Postfix) with ESMTP id 09A1D2004BB9;
 Fri, 22 Mar 2024 15:52:36 +0800 (CST)
Received: from DAG6EX02-IMDC.srv.huawei-3com.com (10.62.14.11) by
 DAG6EX05-IMDC.srv.huawei-3com.com (10.62.14.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.27; Fri, 22 Mar 2024 15:50:54 +0800
Received: from DAG6EX02-IMDC.srv.huawei-3com.com ([fe80::4c21:7c89:4f9d:e4c4])
 by DAG6EX02-IMDC.srv.huawei-3com.com
 ([fe80::4c21:7c89:4f9d:e4c4%16]) with
 mapi id 15.02.1258.027; Fri, 22 Mar 2024 15:50:54 +0800
From: Liuye <liu.yeC@h3c.com>
To: Jiri Slaby <jirislaby@kernel.org>, "daniel.thompson@linaro.org"
 <daniel.thompson@linaro.org>
Thread-Topic: [PATCH V4] kdb: Fix the deadlock issue in KDB debugging.
Thread-Index: AQHae4X3OBfEt+YG5U6iGFBuJcoLGLFCznkAgACVJ+A=
Date: Fri, 22 Mar 2024 07:50:54 +0000
Message-ID: <5649fa8bfbdb43ea914850794afc6cac@h3c.com>
References: <20240321110407.GB7342@aspen.lan>
 <20240321115017.2879691-1-liu.yec@h3c.com>
 <d3b77177-7c00-4459-9515-37afe741e9dd@kernel.org>
In-Reply-To: <d3b77177-7c00-4459-9515-37afe741e9dd@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.114.188.68]
x-sender-location: DAG2
MIME-Version: 1.0
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: h3cspam02-ex.h3c.com 42M7oqLk000733
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  >On 21. 03. 24, 12:50, liu.yec@h3c.com wrote: >> From: LiuYe
 <liu.yeC@h3c.com> >> >> Currently, if CONFIG_KDB_KEYBOARD is enabled, then
 kgdboc will attempt >> to use schedule_work() to provoke a keybo [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1rnZhE-0006mL-0w
Subject: [Kgdb-bugreport] =?utf-8?b?562U5aSNOiBbUEFUQ0ggVjRdIGtkYjogRml4?=
 =?utf-8?q?_the_deadlock_issue_in_KDB_debugging=2E?=
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
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

>On 21. 03. 24, 12:50, liu.yec@h3c.com wrote:
>> From: LiuYe <liu.yeC@h3c.com>
>> 
>> Currently, if CONFIG_KDB_KEYBOARD is enabled, then kgdboc will attempt 
>> to use schedule_work() to provoke a keyboard reset when transitioning 
>> out of the debugger and back to normal operation.
>> This can cause deadlock because schedule_work() is not NMI-safe.
>> 
>> The stack trace below shows an example of the problem. In this case 
>> the master cpu is not running from NMI but it has parked the slave 
>> CPUs using an NMI and the parked CPUs is holding spinlocks needed by 
>> schedule_work().
>
>I am missing here an explanation (perhaps because I cannot find any docs for irq_work) why irq_work works in this case.

Just need to postpone schedule_work to the slave CPU exiting the NMI context, and there will be no deadlock problem. 
irq_work will only respond to handle schedule_work after master cpu exiting the current interrupt context. 
When the master CPU exits the interrupt context, other CPUs will naturally exit the NMI context, so there will be no deadlock.

>And why you need to schedule another work in the irq_work and not do the job directly.

In the function kgdboc_restore_input_helper , use mutex_lock for protection. The mutex lock cannot be used in interrupt context.
Guess that the process needs to run in the context of the process. Therefore, call schedule_work in irq_work. Keep the original flow unchanged.

_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
